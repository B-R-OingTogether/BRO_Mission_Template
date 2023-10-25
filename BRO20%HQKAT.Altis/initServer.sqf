//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Zeus Global Server Settings ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

["Initialize", [true]] call BIS_fnc_dynamicGroups;

[west, -1] call BIS_fnc_respawnTickets;

if (!isServer) exitWith {};

	//--- Curator settings
	_curator = allcurators select 0;
	_curators = allcurators;
		{
			_x setcuratorcoef ["place",0];
			_x setcuratorcoef ["delete",0];
		} foreach _curators;
		

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Headless Client Blacklist From Vehicles ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//	
// EH to blacklist ai vehicles
["LandVehicle", "InitPost",
{
    params ["_entity"];
    if (!isPlayer(driver _entity) && !isNull driver _entity) then {
        group driver _entity setVariable["zhc_offload_blacklisted", true];
        "ZHC blacklisted!" remoteExec ["systemChat", _entity];
    };

;},
true, [], true] call CBA_fnc_addClassEventHandler;

remoteExec["fnc_engiFortify"]; 