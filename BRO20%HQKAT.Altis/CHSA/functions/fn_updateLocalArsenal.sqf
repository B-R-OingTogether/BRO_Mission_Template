_specIndex = _this select 0;
_obj = _this select 1;
_specItems = _this select 2;
_arsenalType = _this select 3;
//_specItems = _obj getVariable ["CHSA_specItems", []];

_itemsArray = _specItems select _specIndex;

if(_arsenalType == "main") exitWith {
	_arsenalArray = [BRO_Arsenal_0, BRO_Arsenal_1, BRO_Arsenal_2, BRO_Arsenal_3, BRO_Arsenal_4, BRO_Arsenal_5, BRO_Arsenal_6, BRO_Arsenal_7, BRO_Arsenal_8, BRO_Arsenal_9, BRO_Arsenal_10];

	{
		//removeAllActions _x;
		_x addAction ["<img image='\A3\Ui_f\data\Logos\a_64_ca.paa' width='64' height='64' /> " + localize "STR_A3_Arsenal", "[BRO_Arsenal_0, player] call ace_arsenal_fnc_openBox;"];
	} forEach _arsenalArray;
	[_arsenalArray select 0, _itemsArray] call ace_arsenal_fnc_addVirtualItems;	
};

if(_arsenalType == "ammo") exitWith {
	_obj addAction ["<img image='\A3\Ui_f\data\Logos\a_64_ca.paa' width='64' height='64' /> " + localize "STR_A3_Arsenal", "[ammo_arsenaldatabase, player] call ace_arsenal_fnc_openBox;"];
	[ammo_arsenaldatabase, _itemsArray] call ace_arsenal_fnc_addVirtualItems;
};

if(_arsenalType == "medical") exitWith {
	_obj addAction ["<img image='\A3\Ui_f\data\Logos\a_64_ca.paa' width='64' height='64' /> " + localize "STR_A3_Arsenal", "[medical_arsenalDatabase, player] call ace_arsenal_fnc_openBox;"];
	[medical_arsenalDatabase, _itemsArray] call ace_arsenal_fnc_addVirtualItems;
};

if(_arsenalType == "main") exitWith {
	_obj addAction ["<img image='\A3\Ui_f\data\Logos\a_64_ca.paa' width='64' height='64' /> " + localize "STR_A3_Arsenal", "[arsenal_database, player] call ace_arsenal_fnc_openBox;"];
	[arsenal_database, _itemsArray] call ace_arsenal_fnc_addVirtualItems;
};

//call{null = [this] execVM "chsa\config.sqf";}