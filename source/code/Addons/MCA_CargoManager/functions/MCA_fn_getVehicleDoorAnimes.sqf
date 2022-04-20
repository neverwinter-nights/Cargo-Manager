// MCA_fn_getVehicleDoorAnimes.sqf.

// This function tries to get animations of vehicle's doors.
// Unfortunately, addon makers do not follow the naming style used by BIS.
// AFAIK, BIS developers name their door animations with "door_" prefix, 
// which seems very convenient. So, here we just try to guess what other 
// developers have done and try to make less chaos and bring some order.

params ["_veh"];

private ["_vehClassName", "_animeNames", "_doorAnimes", "_animes", "_source", "_xl", "_isKeywordFound"];
_vehClassName = typeOf _veh;
_animes = configProperties
[
    (configFile >> "CfgVehicles" >> _vehClassName >> "AnimationSources"),
    "true",
    true
];

_animeNames = [];
{
	_animeNames pushBack (configName (_x));
} forEach _animes;

// This function shows wrong animation names !
//_animeNames = animationNames _veh;
// Bohemia Interactive Studios, what have you been doing all this time since 
// release of the Operation Flashpoint game ?
_doorAnimes = [];

{
	_xl = toLower _x;
	_source = getText (configFile >> "CfgVehicles" >> _vehClassName >> "AnimationSources" >> _x >> "source");

	// It seems that BIS doors and RHS doors use the "source" parameter set to
	// "door" for their doors. CUP add-on does not follow this convention.
	// CUP add-on like anarchy. Let us try to find something in this piece of
	// shit.

	// Such words ar "door", "dver", "ramp" and "hatch" have been seen used in
	// CUP addon vehicles. For some reason CUP addon developers use these
	// words not only for doors, but also for some invisible features and
	// special abilities. So, some of the found doors may be wrong doors or
	// even not at all doors as we think. There is no simple way to fix this
	// until third party developers make an agreement about a common door
	// naming style. RHS addon uses the word "shield".

	_isKeywordFound =  ((_xl find ["door", 0]   >= 0) or
	                    (_xl find ["dver", 0]   >= 0) or
	                    (_xl find ["hatch", 0]  >= 0) or
	                    (_xl find ["ramp", 0]   >= 0) or
	                    (_xl find ["shield", 0] >= 0));

	if ((_source == "door") or (_isKeywordFound)) then
	{
	    _doorAnimes pushBack _x;
	    continue;
	};
} forEach _animeNames;

_doorAnimes
