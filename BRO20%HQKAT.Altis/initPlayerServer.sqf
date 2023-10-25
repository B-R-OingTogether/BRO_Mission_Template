//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Zues Global Server Settings ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

{
	_x addCuratorEditableObjects [[player],true ];
} forEach AllCurators;

{
	if (!isnull (getassignedcuratorunit _x)) then {
		_unit = getassignedcuratorunit _x;
		if (isnull (getassignedcuratorlogic _unit)) then {
			unassignCurator _x;
			//sleep 1;
			//_unit assignCurator _x;
			[{params["_unit", "_x"]; _unit assignCurator _x;}, [_unit,_x], 1] call CBA_fnc_waitAndExecute;
		};
	};
} foreach allcurators;
