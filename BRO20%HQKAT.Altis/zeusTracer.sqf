//Made by 417 (Coder) and Adrihado (Idea) Zeus Tracer Script 1.0.7 Experimental

//If the machine has no interface (Dedicated server or Headless client) then exit
if !(hasInterface) exitWith {};

//Total Projectiles
//Ensure total Projectiles = Total Tracers + TotalGrenades
TotalProjectiles = 60;
//Total Tracers
TotalTracers = 60;
//Total Grenades
TotalGrenades = 12;

addMissionEventHandler ["Draw3D", {
	//Exit with Zeus interface is not detected
    if (isNull findDisplay 312) exitWith {};
	//Exit if variable is false. This variable is toggled by hotkey.
	if !(missionNameSpace getVariable ["FOS_DrawZeusTracer",false]) exitWith {};
    private _projectiles = missionNamespace getVariable ["FOS_Tracers", []];
    private _projectilesNew = [];
	private _grenades = missionNamespace getVariable ["FOS_Grenades", []];
	private _grenadesNew = [];

    // Draw projectiles if there are any
    if (count _projectiles > 0) then
    {
        // Go through all projectiles and draw their path
        {
            private _projectile = _x param [0, objNull, [objNull]];
            private _segments = _x param [1, [], [[]]];

            if (_projectile distance getPosATl curatorCamera < 500) then {
                // Projectile may be null at this point, if so ignore
                // This will also prevent it's data from being added to next frame
                if (!isNull _projectile) then
                {
                    // Calculate color depending on projectile speed
                    private _speed = vectorMagnitude velocity _projectile;
                    private _newColor = switch (true) do
                    {
                        case (_speed < 250) : {[0,0,1,1]};
                        case (_speed < 500) : {[0,1,0,1]};
                        default {[1,0,0,1]};
                    };

                    // Store new segment
                    _segments pushBack [getPosVisual _projectile, _newColor];

                    // Clamp number of projectiles to be drawn
                    if (count _segments > TotalProjectiles) then
                    {
                        reverse _segments;
                        _segments resize TotalProjectiles;
                        reverse _segments;
                    };

                    // Go through all projectile segments and draw them
                    {
                        private _nextSegmentIndex = _forEachIndex + 1;

                        if (count _segments > _nextSegmentIndex) then
                        {
                            private _locOld = _x select 0;
                            private _colorOld = _x select 1;

                            private _locNew = (_segments select _nextSegmentIndex) select 0;
                            private _colorNew = (_segments select _nextSegmentIndex) select 1;

                            drawLine3D [_locOld, _locNew, _colorNew];
                        };
                    }
                    forEach _segments;
    				// Store projectile data for next frame
                    _projectilesNew pushBack [_projectile, _segments];
                };
            };
        }
        forEach _projectiles;
    };
	// Draw grenades if there are any
	if (count _grenades > 0) then
	{
		{
			private _grenade = _x param [0, objNull, [objNull]];
            if (_grenade distance getPosATl curatorCamera < 500) then {
    			// Grenade may be null at this point, if so ignore
    			// This will also prevent it's data from being added to next frame
    			if (!isNull _grenade) then
    			{
    				// The grenade velocity
    				private _grenadeVelocity = velocity _grenade;
    				private _grenadeVelocityMagnitude = vectorMagnitude _grenadeVelocity;

    				// The icon angle
    				private _iconAngle = if (_grenadeVelocityMagnitude > 0) then {time * 100 * _grenadeVelocityMagnitude} else {0};

    				// Draw grenade
    				drawIcon3D ["A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_connect_ca.paa", [1,0,0,1], getPosVisual _grenade, 0.6, 0.6, _iconAngle, "", 0, 0.05, "TahomaB"];

    				// Store grenade for next frame
    				_grenadesNew pushBack _grenade;
    			};
            };
		}
		forEach _grenades;
	};
	missionNamespace setVariable ["FOS_Grenades", _grenadesNew];
    missionNamespace setVariable ["FOS_Tracers", _projectilesNew];
}];

[] spawn {
	while {!isNull player} do {
		{
			//If no FOS_TracerEventHandler variable is detected on the unit
			if (_x getVariable ["FOS_TracerEventHandler",-1] == -1) then {
				_x addEventHandler ["FiredMan", {
					params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
					//Exit if there is no projectile to even register
					if (isNull _projectile) exitWith {};
					//Assign the unit a variable so that we know he has the event handler
					_unit setVariable ["FOS_TracerEventHandler",_thisEventHandler];
					//Get current variables
				    private _projectiles = missionNamespace getVariable ["FOS_Tracers", []];
					private _grenades = missionNamespace getVariable ["FOS_Grenades", []];
					//Check if this is a grenade or a bullet
					if (_weapon == "Throw") then {
						//If there are already TotalGrenades grenades, delete trajectory for one
						if (count _grenades > TotalGrenades) then {_grenades deleteAt 0};
						_grenades pushBack _projectile;
						missionNamespace setVariable ["FOS_Grenades", _grenades];
					} else {
						//If there are already TotalTracers projectiles, delete tracer for one
						if (count _projectiles > TotalTracers) then {_projectiles deleteAt 0};
						//Push this projectile fired into the array
					    _projectiles pushBack [_projectile, [[getPosVisual _projectile, [1,0,0,0]]]];
						//Set FOS_Tracer with new array
					    missionNamespace setVariable ["FOS_Tracers", _projectiles];
					};
				}]
			};
		} forEach allUnits;
		//Check every 10 seconds.
		sleep 10;
	};
};

[] spawn {
	//Loop and check if player exists
	while {sleep 1;!isNull player} do {
		//Wait until Zeus detected
		waitUntil {!(displayNull isEqualTo findDisplay 312)};
		//If T is pressed (20 = t) then activate tracer drawing
		(findDisplay 312) displayAddEventHandler ["KeyDown", "
			if ((_this # 1) isEqualTo 20) then {
				if (missionNameSpace getVariable ['FOS_DrawZeusTracer',true]) then {
					missionNameSpace setVariable ['FOS_DrawZeusTracer',false]
				} else {
					missionNameSpace setVariable ['FOS_DrawZeusTracer',true]
				};
			};
		"];
		//Wait until Zeus no longer exists before looping
		waitUntil {displayNull isEqualTo findDisplay 312};
	};
};
