// MCA_fn_getMaxDoorAnimationDuration.sqf.

params ["_vehicle"];

private ["_doorAnimes", "_maxDuration"];
_doorAnimes = _vehicle call MCA_fn_getVehicleDoorAnimes;
_maxDuration = -1;

if ((count _doorAnimes) < 1) exitWith { _maxDuration };

private ["_vehClassName", "_animPeriod"];
_vehClassName = typeOf _vehicle;
{
	_animPeriod = getNumber (configFile >> "CfgVehicles" >> _vehClassName >> "AnimationSources" >> _x >> "animPeriod");
	if (_animPeriod > _maxDuration) then 
	{
		_maxDuration = _animPeriod;
	};
} forEach _doorAnimes;

_maxDuration
