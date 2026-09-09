if (isServer) then {
};

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Compiles ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

if(!isDedicated) then {
	arsenal_config = compile preprocessFileLineNumbers "chsa\config.sqf";
	medical_arsenal_config = compile preprocessFileLineNumbers "chsa\medical_config.sqf";
	ammo_arsenal_config = compile preprocessFileLineNumbers "chsa\ammo_config.sqf";
};

if(hasInterface) then {
	//unconsciousCamera = compile preprocessFileLineNumbers "scripts\toggle_view.sqf";
};