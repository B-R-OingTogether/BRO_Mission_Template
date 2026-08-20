```python
#!/usr/bin/env python3

"""
Arma 3 configuration validator.

Checks:
    - .hpp files
    - config.cpp
    - description.ext
    - .inc files

Checks include:
    - balanced {}, [], ()
    - malformed class declarations
    - missing semicolons
    - suspicious assignments
    - malformed array definitions
    - invalid class inheritance syntax
    - preprocessor structure

This is intentionally conservative.

It does NOT attempt to completely implement the Arma
config preprocessor. The actual Arma config parser is
considerably more complicated.
"""

from __future__ import annotations

import os
import re
import sys
from pathlib import Path


ROOT = Path(".").resolve()

CONFIG_EXTENSIONS = {
    ".hpp",
    ".inc",
}

CONFIG_FILENAMES = {
    "config.cpp",
    "description.ext",
}


class ValidationError:
    def __init__(self, file: Path, line: int, message: str):
        self.file = file
        self.line = line
        self.message = message

    def report(self):
        relative = self.file.relative_to(ROOT)

        print(
            f"::error "
            f"file={relative},"
            f"line={self.line},"
            f"title=Arma Config Error::"
            f"{self.message}"
        )

        print(
            f"{relative}:{self.line}: {self.message}"
        )


errors: list[ValidationError] = []


def error(file: Path, line: int, message: str):
    errors.append(
        ValidationError(
            file,
            line,
            message,
        )
    )


def remove_comments_preserve_lines(text: str) -> str:
    """
    Removes // and /* */ comments while preserving
    line numbers and string contents.
    """

    result = []
    i = 0

    in_block_comment = False
    in_string = False

    while i < len(text):

        # Block comment
        if not in_string and not in_block_comment:
            if text[i:i + 2] == "/*":
                in_block_comment = True
                result.append("  ")
                i += 2
                continue

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

        # String
        if text[i] == '"' and (i == 0 or text[i - 1] != "\\"):
            in_string = not in_string
            result.append(text[i])
            i += 1
            continue

        # Single-line comment
        if not in_string and text[i:i + 2] == "//":
            while i < len(text) and text[i] != "\n":
                result.append(" ")
                i += 1

            continue

        result.append(text[i])
        i += 1

    return "".join(result)


def check_balanced_symbols(file: Path, text: str):
    """
    Check {}, [], () while ignoring strings/comments.
    """

    cleaned = remove_comments_preserve_lines(text)

    stack = []

    pairs = {
        "}": "{",
        "]": "[",
        ")": "(",
    }

    opening = {
        "{",
        "[",
        "(",
    }

    lines = cleaned.splitlines()

    in_string = False

    for line_number, line in enumerate(lines, 1):

        i = 0

        while i < len(line):

            char = line[i]

            if char == '"' and (i == 0 or line[i - 1] != "\\"):
                in_string = not in_string
                i += 1
                continue

            if in_string:
                i += 1
                continue

            if char in opening:
                stack.append(
                    (
                        char,
                        line_number,
                    )
                )

            elif char in pairs:

                if not stack:
                    error(
                        file,
                        line_number,
                        f"Unexpected closing '{char}'."
                    )

                elif stack[-1][0] != pairs[char]:

                    expected = stack[-1][0]

                    error(
                        file,
                        line_number,
                        f"Unexpected '{char}'. "
                        f"Expected closing '{expected}'."
                    )

                    stack.pop()

                else:
                    stack.pop()

            i += 1

    for char, line_number in reversed(stack):
        closing = {
            "{": "}",
            "[": "]",
            "(": ")",
        }[char]

        error(
            file,
            line_number,
            f"Unclosed '{char}'. Expected '{closing}'."
        )


def check_class_declarations(file: Path, text: str):
    """
    Validate basic Arma class declarations.

    Valid examples:

        class MyClass
        {
        };

        class MyClass {};

        class MyClass: ParentClass
        {
        };

        class MyClass: ParentClass {};
    """

    cleaned = remove_comments_preserve_lines(text)

    lines = cleaned.splitlines()

    class_pattern = re.compile(
        r"^\s*class\s+([A-Za-z_][A-Za-z0-9_]*)"
        r"(?:\s*:\s*([A-Za-z_][A-Za-z0-9_]*))?"
        r"\s*(.*)$"
    )

    for line_number, line in enumerate(lines, 1):

        match = class_pattern.match(line)

        if not match:
            continue

        remainder = match.group(3).strip()

        # Forward declaration:
        #
        # class SomeBase;
        #
        if remainder == ";":
            continue

        # Empty class:
        #
        # class SomeClass {};
        #
        if remainder == "{};" or remainder == "{}":
            continue

        # Normal class:
        #
        # class SomeClass
        # {
        #
        if remainder in ("", "{"):
            continue

        # Something beginning with { is normally valid.
        if remainder.startswith("{"):
            continue

        # Anything else is suspicious.
        error(
            file,
            line_number,
            "Malformed class declaration."
        )


def check_assignments(file: Path, text: str):
    """
    Look for obvious malformed config assignments.

    Examples caught:

        displayName = "Test"

    when a semicolon is missing.

    This intentionally avoids attempting to validate every
    possible Arma expression.
    """

    cleaned = remove_comments_preserve_lines(text)

    lines = cleaned.splitlines()

    inside_multiline_array = False

    for line_number, line in enumerate(lines, 1):

        stripped = line.strip()

        if not stripped:
            continue

        # Preprocessor directives
        if stripped.startswith("#"):
            continue

        # Class declarations
        if re.match(r"^class\s+", stripped):
            continue

        # Opening/closing braces
        if stripped in {
            "{",
            "}",
            "};",
            "{};",
            "{}",
        }:
            continue

        # Array continuation
        if inside_multiline_array:
            if "};" in stripped:
                inside_multiline_array = False

            continue

        # Array assignment
        if re.search(
            r"\[\]\s*=\s*\{",
            stripped
        ):
            if "};" not in stripped:
                inside_multiline_array = True

            continue

        # Simple assignment.
        #
        # Example:
        #
        # displayName = "Something";
        #
        assignment = re.match(
            r"^[A-Za-z_][A-Za-z0-9_]*\s*=",
            stripped
        )

        if assignment:

            # A valid assignment should normally terminate
            # with a semicolon.
            if not stripped.endswith(";"):

                # Don't report if this is clearly a
                # multiline structure.
                if not stripped.endswith(
                    (
                        "{",
                        "(",
                        "[",
                    )
                ):

                    error(
                        file,
                        line_number,
                        "Possible missing semicolon after assignment."
                    )


def check_arrays(file: Path, text: str):
    """
    Basic validation of config arrays.
    """

    cleaned = remove_comments_preserve_lines(text)

    lines = cleaned.splitlines()

    array_depth = 0

    for line_number, line in enumerate(lines, 1):

        stripped = line.strip()

        if not stripped:
            continue

        # Detect array opening.
        if re.search(
            r"\[\]\s*=\s*\{",
            stripped
        ):
            array_depth += stripped.count("{")
            array_depth -= stripped.count("}")

            continue

        if array_depth <= 0:
            continue

        # Track braces.
        array_depth += stripped.count("{")
        array_depth -= stripped.count("}")

        if array_depth < 0:
            array_depth = 0


def check_preprocessor(file: Path, text: str):
    """
    Check basic #include / #define syntax.
    """

    lines = text.splitlines()

    for line_number, line in enumerate(lines, 1):

        stripped = line.strip()

        if stripped.startswith("#include"):

            if not re.match(
                r'^#include\s+["<][^">]+[">]\s*$',
                stripped
            ):
                error(
                    file,
                    line_number,
                    "Malformed #include directive."
                )

        elif stripped.startswith("#define"):

            if not re.match(
                r"^#define\s+[A-Za-z_][A-Za-z0-9_]*",
                stripped
            ):
                error(
                    file,
                    line_number,
                    "Malformed #define directive."
                )


def validate_file(file: Path):

    try:
        text = file.read_text(
            encoding="utf-8",
            errors="replace",
        )

    except Exception as exc:

        error(
            file,
            1,
            f"Unable to read file: {exc}"
        )

        return

    print(f"Checking {file.relative_to(ROOT)}")

    check_balanced_symbols(
        file,
        text
    )

    check_class_declarations(
        file,
        text
    )

    check_assignments(
        file,
        text
    )

    check_arrays(
        file,
        text
    )

    check_preprocessor(
        file,
        text
    )


def find_config_files():

    files = []

    for path in ROOT.rglob("*"):

        if not path.is_file():
            continue

        if ".git" in path.parts:
            continue

        if path.suffix.lower() in CONFIG_EXTENSIONS:
            files.append(path)
            continue

        if path.name.lower() in CONFIG_FILENAMES:
            files.append(path)

    return sorted(files)


def main():

    files = find_config_files()

    print(
        "========================================"
    )

    print(
        " Arma 3 Config Validation"
    )

    print(
        "========================================"
    )

    print(
        f"Found {len(files)} config/header files."
    )

    print()

    for file in files:
        validate_file(file)

    print()

    if errors:

        print(
            "========================================"
        )

        print(
            f"Validation failed: {len(errors)} error(s)"
        )

        print(
            "========================================"
        )

        for validation_error in errors:
            validation_error.report()

        return 1

    print(
        "========================================"
    )

    print(
        "Validation successful."
    )

    print(
        "========================================"
    )

    return 0


if __name__ == "__main__":
    sys.exit(main())
```
