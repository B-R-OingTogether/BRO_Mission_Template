/*
Script by Thunderbolt (chrisone4)

Example: Add the follow to init to set as repair bay
Eden:	[this, 10, 300] execVM "actions\echo\supplies\refuel_tanker_base.sqf";
Zeus:	[this, 10, 300] execVM "actions\echo\supplies\refuel_tanker_base.sqf";
[
	_tanker, // Object that contains an interior tank that can be refueled.
	10, // Range
	300 // How much each barrel should refuel to
] execVM "actions\echo\supplies\refuel_tanker_base.sqf";

DOES NOT delete the refuel source.
*/

params [
	["_tanker", objNull, [objNull]],
	["_range", 10, [0]],
	["_refuelAmount", 0, [0]]
];

if (_range < 5) then { _range = 5; };
if (_range > 20) then { _range = 20; };

if (isNil "BRO_fnc_ListOfRefuelTanks_large" || isNil "BRO_fnc_refuelTanker_large") then {
	BRO_fnc_ListOfRefuelTanks_large = {
		params ["_tanker", "", "_this"];
		params ["_range", "_refuelAmount"];
	
		private _nearObjects = nearestObjects [_tanker, ["StorageBladder_01_fuel_forest_F", "StorageBladder_01_fuel_sand_F"], _range];
		private _refuelTankerChild = [];
		
		{
			private _class = typeOf _x;
			private _name = getText (configfile >> "CfgVehicles" >> _class >> "displayName");
				
			_refuelTankerChild pushBack [[
				"BRO_refuelTanker_large",
				"Refuel from fuel depot",
				"\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa", //Change images
				{_this call BRO_fnc_refuelTanker_large},
				{true},
				{},
				[_x, _tanker, _refuelAmount]
			] call ace_interact_menu_fnc_createAction, [], 1];
			_refuelTankerChild;
		} forEach _nearObjects;
	};
	
	BRO_fnc_refuelTanker_large = {
		(_this select 2) params ["_fuelSource", "_tanker", "_refuelAmount", "_this"];
	
		_refuelTankerTimer = 60;
		private _animation = getText (ConfigFile >> "ACE_Repair" >> "Actions" >> "MiscRepair" >> "animationCaller");
		player playMoveNow _animation;
		
		[
			_refuelTankerTimer, [_fuelSource, _tanker, _refuelAmount], {
				(_this select 0) params ["_fuelSource", "_tanker", "_refuelAmount"];
				
				player switchMove '';
				
				[_tanker, _refuelAmount] call ace_refuel_fnc_setFuel;
			},
			{
				player switchMove '';
			},
			format ["Refueling...", _name]
		] call ace_common_fnc_progressBar;
	}; 
};

private _refuelTanker_large = [
	"BRO_refuelTanker_Option_large",
	"Full Refuel", //Get name of classID
	"\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa", //Change images
	{},
	{true},
	{_this call BRO_fnc_ListOfRefuelTanks_large},
	[_range, _refuelAmount]
] call ace_interact_menu_fnc_createAction;

[_tanker, 0, ["ACE_MainActions"], _refuelTanker_large] call ace_interact_menu_fnc_addActionToObject;
