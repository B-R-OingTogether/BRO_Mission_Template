params ["_target", "_caller", "_actionId", "_arguments"];
["ammo", _target] call compile preprocessFileLineNumbers "modules\resupply\spawn_resupply_arsenal.sqf";
