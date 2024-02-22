if (!hasInterface) exitWith {}; //This is so the scripting doesn't run on a headless client.


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Intel/data Entry At Mission Start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

[] spawn
  {
  	waitUntil {player == player};
  	[player,["dataEntry1"]]call MRH_fnc_MilsimTools_SoldierTab_attributeData;    //This is any data entries/intel that you want visible at the start of the mission that will be visible to everyone. 
  	[player,["pic1"]]call MRH_fnc_MilsimTools_SoldierTab_attributePictures;      //This is any pictures that you want visible at the start of the mission that will be visible to everyone.
  };

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Unconscious Camera Script ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
/*
_toggle = [] execVM "scripts\toggle_view.sqf";
player addEventHandler ["killed", {[false, false, false] call ace_spectator_fnc_setSpectator;}];

["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
*/

["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ View Distance Settings ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

setViewDistance 4000;
setObjectViewDistance 3750;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Curator/Zeus Creation ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

{
	if (!isnull (getassignedcuratorunit _x)) then {
		_unit = getassignedcuratorunit _x;
		if (isnull (getassignedcuratorlogic _unit)) then {
			unassignCurator _x;
			sleep 1;
			_unit assignCurator _x;
		};
	};
} foreach allcurators;

