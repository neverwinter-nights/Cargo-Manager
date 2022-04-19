// MCA_fn_getVehicleDoorAnimes.sqf.

// This function tries to get animations of vehicle's doors.
// Unfortunately, addon makers do not follow the naming style used by BIS.
// AFAIK, BIS developers name their door animations with "door_" prefix, 
// which seems very convenient. So, here we just try to guess what other 
// developers have done and try to make less chaos and bring some order.

params ["_veh"];

private ["_vehClassName", "_animeNames", "_doorAnimes", "_ok", "_classPaths", "_source", "_xl"];
_vehClassName = typeOf _veh;
_classPaths = "true" configClasses (configFile >> "CfgVehicles" >> _vehClassName >> "AnimationSources");
_animeNames = [];
{
	_animeNames pushBack (configName (_x));
} forEach _classPaths;

// This function shows wrong animation names !
//_animeNames = animationNames _veh;
// Bohemia Interactive Studios, what have you been doing all this time since 
// release of the Operation Flashpoint game ?
_doorAnimes = [];

{
	_xl = toLower _x;
	
	// Find the doors made by BIS.
	_ok = [_xl, "door_"] call MCA_fn_strHasPrefix;
	
	// Such words ar "door", "dver", "ramp" and "hatch" have been seen used 
	// in CUP addon vehicles. For some reason CUP addon developers use these 
	// words not only for doors, but also for some invisible features and 
	// special abilities. So, some of the found doors may be wrong doors or 
	// even not at all doors as we think. There is no simple way to fix this 
	// until third party developers make an agreement about a common door 
	// naming style.
	// TODO: Add RHS.
	if (_ok or (_xl find ["door", 0] >= 0) or (_xl find ["ramp", 0] >= 0) or (_xl find ["dver", 0] >= 0) or (_xl find ["hatch", 0] >= 0)) then
	{
		
		_source = getText (configFile >> "CfgVehicles" >> _vehClassName >> "AnimationSources" >> _x >> "source");
		// BIS is known to use the "door" source for doors.
		// CUP is known to use the "user" source for some of the doors.
		// TODO: Add RHS.
		if ((_source == "door") or (_source == "user")) then 
		{
			_doorAnimes pushBack _x;
			continue;
		};
	};
} forEach _animeNames;

_doorAnimes
