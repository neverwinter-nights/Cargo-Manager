// MCA_fn_getAnimationDuration.sqf.

params ["_vehicle", "_animation"];

private ["_vehClassName", "_animPeriod"];
_vehClassName = typeOf _vehicle;
_animPeriod = getNumber (configFile >> "CfgVehicles" >> _vehClassName >> "AnimationSources" >> _animation >> "animPeriod");
_animPeriod
