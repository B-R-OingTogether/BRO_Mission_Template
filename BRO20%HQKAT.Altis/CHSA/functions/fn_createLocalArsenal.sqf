private ["_specIndex"];
_array = _this select 0;

_obj = _array select 0;
_specTypes = _array select 1;;
_specItems = _array select 2;
_arsenalType = _array select 3;

//Finds the correct classname of the player for their particular arsenal
_specIndex = 0;
for "_i" from 0 to (count _specTypes - 1) do {
	_typeArray = _specTypes select _i;
	
	if ((toLower str _typeArray) find (toLower typeOf player) > -1) exitWith {
		_specIndex = _i;
	};
};
[_specIndex, _obj, _specItems, _arsenalType] call CHSA_fnc_updateLocalArsenal;
/*
//_obj setVariable ["CHSA_specItems", _specItems];
if(_arsenalType == "main") then {
	[_specIndex, _specItems, _arsenalType] call CHSA_fn_updateMainLocalArsenal;
} else {
	_obj = _array select 0;
	[_specIndex, _obj, _specItems, _arsenalType] call CHSA_fnc_updateLocalArsenal;
};
*/