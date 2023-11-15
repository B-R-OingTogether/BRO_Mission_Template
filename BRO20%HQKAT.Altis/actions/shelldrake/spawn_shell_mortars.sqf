#define SPAWN_DISTANCE -3 // Ensure spawn distance is negative if you want the crate to spawn on the correct side of the sign.
#define CRATE_CLASSNAME "Box_NATO_Wps_F"

params ["_target", "_caller", "_actionId", "_arguments"];

// Determine where we should put the crate.
private _spawn_offset = vectorDir _target vectorMultiply SPAWN_DISTANCE;
private _spawn_pos = getPos _target vectorAdd _spawn_offset;

// Spawn the crate at this location.
private _crate = CRATE_CLASSNAME createVehicle _spawn_pos;
if (surfaceIsWater _spawn_pos) then {_crate setPosASL [((getPosASL _target) select 0) + (sizeOf (typeOf _target)),getPosASL _target select 1, getPosASL _target select 2];};

// Remove any items from the crate.
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearBackpackCargo _crate;

// Fill the crate with items.
private _crateItems = [
	["ace_csw_staticMortarCarry", 3],
	["ace_csw_carryMortarBaseplate", 3],
	["UK3CB_BAF_L16_Tripod", 3],
	["UK3CB_BAF_L16", 3],
	["UK3CB_BAF_M6", 3]
];

{_crate addItemCargoGlobal [_x select 0, _x select 1]} forEach _crateItems;

[_crate, true, [0, 2, 1], 0] remoteExec ["ace_dragging_fnc_setCarryable", 0, true];
[_crate, 1] call ace_cargo_fnc_setSize;

// Log the spawn. Just in case someone is trying to crash the server.

[[player, _spawn_pos], {
	diag_log Format["[BRO Spawners Mortars]: %1 spawned %2 at position %3", name (_this select 0), CRATE_CLASSNAME, _this select 1];
}] remoteExec ["call", 2, false];

systemChat "A crate was spawned near you.";
