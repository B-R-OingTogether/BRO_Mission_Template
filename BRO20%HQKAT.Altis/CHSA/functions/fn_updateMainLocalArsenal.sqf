_specIndex = _this select 0;
_specItems = _this select 1;
_arsenalType = _this select 2;

_itemsArray = _specItems select _specIndex;

_arsenalArray = [BRO_Arsenal_0, BRO_Arsenal_1, BRO_Arsenal_2, BRO_Arsenal_3, BRO_Arsenal_4, BRO_Arsenal_5, BRO_Arsenal_6, BRO_Arsenal_7, BRO_Arsenal_8, BRO_Arsenal_9, BRO_Arsenal_10];

{
	removeAllActions _x;
	_x addAction ["<img image='\A3\Ui_f\data\Logos\a_64_ca.paa' width='64' height='64' /> " + localize "STR_A3_Arsenal", "[BRO_Arsenal_0, player] call ace_arsenal_fnc_openBox;"];
} forEach _arsenalArray;
[_arsenalArray select 0, _itemsArray] call ace_arsenal_fnc_addVirtualItems;	