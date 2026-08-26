#define SPAWN_DISTANCE -3
#define MEDICAL_CRATE "ACE_medicalSupplyCrate_advanced"
#define AMMO_CRATE "B_supplyCrate_F"
#define MAIN_CRATE "C_IDAP_supplyCrate_F"

params ["_resupplyName", "_target"];

// Get contents of the arsenal, and the type of crate we will be using
private _resupply = nil;

if (_resupplyName == "medical") exitWith {
	//_resupply = call compile preprocessFileLineNumbers "modules\resupply\resupply_medical.sqf";
	private _spawn_offset = vectorDir _target vectorMultiply SPAWN_DISTANCE;
	private _spawn_pos = getPos _target vectorAdd _spawn_offset;
	//private _crateClass = "ACE_medicalSupplyCrate_advanced";
	
	private _crate = MEDICAL_CRATE createVehicle _spawn_pos;
	if (surfaceIsWater _spawn_pos) then {_crate setPosASL [((getPosASL _target) select 0) + (sizeOf (typeOf _target)),getPosASL _target select 1, getPosASL _target select 2];};
	
	clearWeaponCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	clearMagazineCargoGlobal _crate; 
	clearBackpackCargo _crate;
	
	[_crate, true, [0, 2, 1], 0] remoteExec ["ace_dragging_fnc_setCarryable", 0, true];
	[_crate, 1] call ace_cargo_fnc_setSize;
	
	[[_crate], "chsa\medical_config.sqf"] remoteExec ["execVM", 0, true];
	
	systemChat "A crate was spawned near you.";
};
/*
*/
if (_resupplyName == "ammo") exitWith {
	//_resupply = call compile preprocessFileLineNumbers "modules\resupply\resupply_ammo.sqf";
	private _spawn_offset = vectorDir _target vectorMultiply SPAWN_DISTANCE;
	private _spawn_pos = getPos _target vectorAdd _spawn_offset;
	//private _crateClass = "B_supplyCrate_F";
	
	private _crate = AMMO_CRATE createVehicle _spawn_pos;
	if (surfaceIsWater _spawn_pos) then {_crate setPosASL [((getPosASL _target) select 0) + (sizeOf (typeOf _target)),getPosASL _target select 1, getPosASL _target select 2];};
	
	clearWeaponCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	clearMagazineCargoGlobal _crate; 
	clearBackpackCargo _crate;
	
	[_crate, true, [0, 2, 1], 0] remoteExec ["ace_dragging_fnc_setCarryable", 0, true];
	[_crate, 1] call ace_cargo_fnc_setSize;
	
	[[_crate], "chsa\ammo_config.sqf"] remoteExec ["execVM", 0, true];
	
	systemChat "A crate was spawned near you.";
};
/*
*/
if (_resupplyName == "main") exitWith {
	private _spawn_offset = vectorDir _target vectorMultiply SPAWN_DISTANCE;
	private _spawn_pos = getPos _target vectorAdd _spawn_offset;
	
	private _crate = MAIN_CRATE createVehicle _spawn_pos;
	if (surfaceIsWater _spawn_pos) then {_crate setPosASL [((getPosASL _target) select 0) + (sizeOf (typeOf _target)),getPosASL _target select 1, getPosASL _target select 2];};
	
	clearWeaponCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	clearMagazineCargoGlobal _crate; 
	clearBackpackCargo _crate;
	
	[_crate, true, [0, 2, 1], 0] remoteExec ["ace_dragging_fnc_setCarryable", 0, true];
	[_crate, 1] call ace_cargo_fnc_setSize;
	
	[[_crate], "chsa\config.sqf"] remoteExec ["execVM", 0, true];
	
	systemChat "A crate was spawned near you.";
};