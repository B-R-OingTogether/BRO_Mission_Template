if (isServer) then {
};


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Echo Presets Compile ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

//fnc_preset_one = compile preprocessFileLineNumbers "actions\engineering\fortify\presets\preset_one.sqf";
//fnc_preset_two = compile preprocessFileLineNumbers "actions\engineering\fortify\presets\preset_two.sqf";
//fnc_preset_three = compile preprocessFileLineNumbers "actions\engineering\fortify\presets\preset_three.sqf";

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Other Compiles ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

if(!isDedicated) then {
	arsenal_config = compile preprocessFileLineNumbers "chsa\config.sqf";
	medical_arsenal_config = compile preprocessFileLineNumbers "chsa\medical_config.sqf";
	ammo_arsenal_config = compile preprocessFileLineNumbers "chsa\ammo_config.sqf";
	//fnc_engiFortify = compile preprocessFileLineNumbers "actions\engineering\fortify\engineeringPresets.sqf";
};

if(hasInterface) then {
	//unconsciousCamera = compile preprocessFileLineNumbers "scripts\toggle_view.sqf";
};