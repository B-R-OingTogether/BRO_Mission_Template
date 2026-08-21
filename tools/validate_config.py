#!/usr/bin/env python3

"""
Arma 3 Mission Config Validator

Validates:

    *.hpp
    *.ext
    *.cpp

This is intended for Arma 3 mission repositories.

It does NOT attempt to completely implement the Arma
config preprocessor. Its purpose is to catch common
mistakes before they reach the mission.

SQF files are handled separately by SQFLint.
"""

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path


ROOT = Path.cwd().resolve()


CONFIG_EXTENSIONS = {
    ".hpp",
    ".ext",
    ".cpp",
}

CONFIG_FILENAMES = {
    "config.cpp",
    "description.ext",
    "CfgFunctions.hpp",
    "xeh_PreInit_EH.hpp",
    "cfgMRH_SoldierTabData.hpp",
    "cfgMRH_SoldierTabIntelPictures.hpp",
}


class ValidationError:
    def __init__(
        self,
        file: Path,
        line: int,
        message: str,
        warning: bool = False,
    ):
        self.file = file
        self.line = line
        self.message = message
        self.warning = warning

    def report(self):

        try:
            relative = self.file.resolve().relative_to(ROOT)
        except ValueError:
            relative = self.file

        relative = str(relative).replace("\\", "/")

        level = "warning" if self.warning else "error"

        print(
            f"::{level} "
            f"file={relative},"
            f"line={self.line}::"
            f"{self.message}"
        )

        print(
            f"{relative}:{self.line}: "
            f"{self.message}"
        )


errors: list[ValidationError] = []


def add_error(
    file: Path,
    line: int,
    message: str,
    warning: bool = False,
):
    errors.append(
        ValidationError(
            file=file,
            line=line,
            message=message,
            warning=warning,
        )
    )


# ================================================================
# COMMENT REMOVAL
# ================================================================

def remove_comments(text: str) -> str:
    """
    Remove // and /* */ comments while preserving line numbers.
    Strings are preserved.
    """

    result = []

    i = 0
    in_block_comment = False
    in_string = False

    while i < len(text):

        # --------------------------------------------------------
        # Start block comment
        # --------------------------------------------------------
        if not in_string and not in_block_comment:

            if text[i:i + 2] == "/*":

                in_block_comment = True

                result.append("  ")

                i += 2

                continue

        # --------------------------------------------------------
        # Inside block comment
        # --------------------------------------------------------
        if in_block_comment:

            if text[i:i + 2] == "*/":

                in_block_comment = False

                result.append("  ")

                i += 2

            else:

                if text[i] == "\n":
                    result.append("\n")
                else:
                    result.append(" ")

                i += 1

            continue

        # --------------------------------------------------------
        # String
        # --------------------------------------------------------
        if text[i] == '"':

            escaped = (
                i > 0 and
                text[i - 1] == "\\"
            )

            if not escaped:
                in_string = not in_string

            result.append(text[i])

            i += 1

            continue

        # --------------------------------------------------------
        # Single line comment
        # --------------------------------------------------------
        if not in_string and text[i:i + 2] == "//":

            while i < len(text) and text[i] != "\n":

                result.append(" ")

                i += 1

            continue

        result.append(text[i])

        i += 1

    return "".join(result)


# ================================================================
# BALANCED SYMBOLS
# ================================================================

def check_balanced_symbols(
    file: Path,
    text: str,
):

    cleaned = remove_comments(text)

    stack = []

    pairs = {
        "}": "{",
        "]": "[",
        ")": "(",
    }

    closing = {
        "{": "}",
        "[": "]",
        "(": ")",
    }

    lines = cleaned.splitlines()

    in_string = False

    for line_number, line in enumerate(lines, 1):

        i = 0

        while i < len(line):

            char = line[i]

            # ----------------------------------------------------
            # Strings
            # ----------------------------------------------------
            if char == '"':

                escaped = (
                    i > 0 and
                    line[i - 1] == "\\"
                )

                if not escaped:
                    in_string = not in_string

                i += 1

                continue

            if in_string:

                i += 1

                continue

            # ----------------------------------------------------
            # Opening
            # ----------------------------------------------------
            if char in closing:

                stack.append(
                    (
                        char,
                        line_number,
                    )
                )

            # ----------------------------------------------------
            # Closing
            # ----------------------------------------------------
            elif char in pairs:

                if not stack:

                    add_error(
                        file,
                        line_number,
                        f"Unexpected closing '{char}'."
                    )

                elif stack[-1][0] != pairs[char]:

                    expected = closing[
                        stack[-1][0]
                    ]

                    add_error(
                        file,
                        line_number,
                        f"Unexpected '{char}'. "
                        f"Expected '{expected}'."
                    )

                    stack.pop()

                else:

                    stack.pop()

            i += 1

    # ------------------------------------------------------------
    # Anything left on stack is unclosed
    # ------------------------------------------------------------

    for char, line_number in reversed(stack):

        add_error(
            file,
            line_number,
            f"Unclosed '{char}'. "
            f"Expected '{closing[char]}'."
        )


# ================================================================
# CLASS DECLARATIONS
# ================================================================

def check_classes(
    file: Path,
    text: str,
):

    cleaned = remove_comments(text)

    lines = cleaned.splitlines()

    class_pattern = re.compile(
        r"^\s*class\s+"
        r"([A-Za-z_][A-Za-z0-9_]*)"
        r"(?:\s*:\s*"
        r"([A-Za-z_][A-Za-z0-9_]*))?"
        r"\s*(.*)$"
    )

    for line_number, line in enumerate(lines, 1):

        match = class_pattern.match(line)

        if not match:
            continue

        class_name = match.group(1)

        parent = match.group(2)

        remainder = match.group(3).strip()

        # --------------------------------------------------------
        # Forward declaration
        # --------------------------------------------------------

        if remainder == ";":
            continue

        # --------------------------------------------------------
        # Empty class
        # --------------------------------------------------------

        if remainder in {
            "{}",
            "{};",
        }:
            continue

        # --------------------------------------------------------
        # Class body
        # --------------------------------------------------------

        if remainder in {
            "",
            "{",
        }:
            continue

        if remainder.startswith("{"):

            continue

        # --------------------------------------------------------
        # Anything else is suspicious
        # --------------------------------------------------------

        inheritance = ""

        if parent:
            inheritance = (
                f" inheriting from '{parent}'"
            )

        add_error(
            file,
            line_number,
            f"Malformed class declaration "
            f"'{class_name}'{inheritance}."
        )


# ================================================================
# ASSIGNMENT CHECKING
# ================================================================

def check_assignments(
    file: Path,
    text: str,
):

    cleaned = remove_comments(text)

    lines = cleaned.splitlines()

    array_depth = 0

    for line_number, line in enumerate(lines, 1):

        stripped = line.strip()

        if not stripped:
            continue

        # --------------------------------------------------------
        # Preprocessor directives
        # --------------------------------------------------------

        if stripped.startswith("#"):
            continue

        # --------------------------------------------------------
        # Standalone braces
        # --------------------------------------------------------

        if stripped in {
            "{",
            "}",
            "};",
            "{}",
            "{};",
        }:
            continue

        # --------------------------------------------------------
        # Multiline arrays
        # --------------------------------------------------------

        if array_depth > 0:

            array_depth += stripped.count("{")
            array_depth -= stripped.count("}")

            if array_depth <= 0:
                array_depth = 0

            continue

        # --------------------------------------------------------
        # Array assignment
        # --------------------------------------------------------

        if re.search(
            r"\[\]\s*=\s*\{",
            stripped,
        ):

            array_depth += (
                stripped.count("{")
                - stripped.count("}")
            )

            continue

        # --------------------------------------------------------
        # Simple config assignment
        # --------------------------------------------------------

        assignment = re.match(
            r"^[A-Za-z_][A-Za-z0-9_]*\s*=",
            stripped,
        )

        if not assignment:
            continue

        # --------------------------------------------------------
        # Assignment must terminate with ;
        # --------------------------------------------------------

        if stripped.endswith(";"):
            continue

        # --------------------------------------------------------
        # Multiline expressions
        # --------------------------------------------------------

        if stripped.endswith(
            (
                "{",
                "[",
                "(",
                ",",
            )
        ):
            continue

        add_error(
            file,
            line_number,
            "Possible missing semicolon after assignment."
        )


# ================================================================
# INCLUDE CHECKING
# ================================================================

def check_includes(
    file: Path,
    text: str,
):

    lines = text.splitlines()

    include_pattern = re.compile(
        r'^\s*#include\s+["<]([^">]+)[">]'
    )

    for line_number, line in enumerate(lines, 1):

        match = include_pattern.match(line)

        if not match:
            continue

        include_name = match.group(1)

        # --------------------------------------------------------
        # Absolute paths are not expected in mission configs.
        # --------------------------------------------------------

        include_path = Path(include_name)

        if include_path.is_absolute():

            add_error(
                file,
                line_number,
                f"Absolute #include path is not supported: "
                f"{include_name}"
            )

            continue

        # --------------------------------------------------------
        # Resolve relative to including file.
        # --------------------------------------------------------

        resolved = (
            file.parent /
            include_path
        ).resolve()

        if resolved.exists():
            continue

        # --------------------------------------------------------
        # Also try repository root.
        # --------------------------------------------------------

        root_resolved = (
            ROOT /
            include_path
        ).resolve()

        if root_resolved.exists():
            continue

        add_error(
            file,
            line_number,
            f"#include file not found: "
            f"{include_name}"
        )


# ================================================================
# PREPROCESSOR CHECKS
# ================================================================

def check_preprocessor(
    file: Path,
    text: str,
):

    lines = text.splitlines()

    for line_number, line in enumerate(lines, 1):

        stripped = line.strip()

        # --------------------------------------------------------
        # #include
        # --------------------------------------------------------

        if stripped.startswith("#include"):

            if not re.match(
                r'^#include\s+["<][^">]+[">]\s*$',
                stripped,
            ):

                add_error(
                    file,
                    line_number,
                    "Malformed #include directive."
                )

        # --------------------------------------------------------
        # #define
        # --------------------------------------------------------

        elif stripped.startswith("#define"):

            if not re.match(
                r"^#define\s+"
                r"[A-Za-z_][A-Za-z0-9_]*",
                stripped,
            ):

                add_error(
                    file,
                    line_number,
                    "Malformed #define directive."
                )

        # --------------------------------------------------------
        # #ifdef / #ifndef / #if
        # --------------------------------------------------------

        elif stripped.startswith("#ifdef"):

            if not re.match(
                r"^#ifdef\s+"
                r"[A-Za-z_][A-Za-z0-9_]*$",
                stripped,
            ):

                add_error(
                    file,
                    line_number,
                    "Malformed #ifdef directive."
                )

        elif stripped.startswith("#ifndef"):

            if not re.match(
                r"^#ifndef\s+"
                r"[A-Za-z_][A-Za-z0-9_]*$",
                stripped,
            ):

                add_error(
                    file,
                    line_number,
                    "Malformed #ifndef directive."
                )


# ================================================================
# FILE VALIDATION
# ================================================================

def validate_file(file: Path):

    try:

        text = file.read_text(
            encoding="utf-8",
            errors="replace",
        )

    except Exception as exc:

        add_error(
            file,
            1,
            f"Unable to read file: {exc}"
        )

        return

    print(
        f"Checking "
        f"{file.relative_to(ROOT)}"
    )

    check_balanced_symbols(
        file,
        text,
    )

    check_classes(
        file,
        text,
    )

    check_assignments(
        file,
        text,
    )

    check_includes(
        file,
        text,
    )

    check_preprocessor(
        file,
        text,
    )


# ================================================================
# FIND CONFIG FILES
# ================================================================

def find_all_config_files():

    files = []

    for path in ROOT.rglob("*"):

        if not path.is_file():
            continue

        if ".git" in path.parts:
            continue

        if (
            path.suffix.lower()
            in CONFIG_EXTENSIONS
        ):
            files.append(path)

            continue

        if (
            path.name.lower()
            in CONFIG_FILENAMES
        ):
            files.append(path)

    return sorted(files)


# ================================================================
# FILE LIST MODE
# ================================================================

def load_file_list(
    filename: str,
):

    result = []

    list_file = Path(filename)

    if not list_file.exists():

        print(
            f"File list does not exist: "
            f"{filename}"
        )

        return result

    for line in list_file.read_text(
        encoding="utf-8",
        errors="replace",
    ).splitlines():

        line = line.strip()

        if not line:
            continue

        path = Path(line)

        if not path.is_absolute():

            path = ROOT / path

        if not path.exists():

            # A file may have been deleted in the PR.
            # That is not an error here.

            continue

        if not path.is_file():
            continue

        if (
            path.suffix.lower()
            in CONFIG_EXTENSIONS
            or
            path.name.lower()
            in CONFIG_FILENAMES
        ):

            result.append(
                path.resolve()
            )

    return sorted(
        set(result)
    )


# ================================================================
# MAIN
# ================================================================

def main():

    parser = argparse.ArgumentParser(description='Validate Arma 3 mission configuration files')
    parser.add_argument('--file-list', required=False, help=('Path to file containing list of files to validate'))

    args = parser.parse_args()

    print(
        "========================================"
    )

    print(
        " Arma 3 Mission Config Validation"
    )

    print(
        "========================================"
    )

    # ------------------------------------------------------------
    # Determine files
    # ------------------------------------------------------------

    if args.file_list:

        files = load_file_list(
            args.file_list
        )

    else:

        files = find_all_config_files()

    print(
        f"Found {len(files)} "
        f"config file(s)."
    )

    print()

    # ------------------------------------------------------------
    # Validate
    # ------------------------------------------------------------

    for file in files:

        validate_file(file)

    print()

    # ------------------------------------------------------------
    # Results
    # ------------------------------------------------------------

    if errors:

        print(
            "========================================"
        )

        print(
            f"VALIDATION FAILED"
        )

        print(
            f"{len(errors)} error(s) found."
        )

        print(
            "========================================"
        )

        print()

        for validation_error in errors:

            validation_error.report()

        return 1

    print(
        "========================================"
    )

    print(
        "VALIDATION PASSED"
    )

    print(
        "========================================"
    )

    print(
        "No configuration errors were found."
    )

    return 0


if __name__ == "__main__":

    sys.exit(
        main()
    )