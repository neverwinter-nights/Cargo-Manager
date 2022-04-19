// MCA_fn_getDoorAnimationDuration.sqf.

params ["_vehicle", "_door"];

_animPeriod = getNumber (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "AnimationSources" >> _door >> "animPeriod");
_animPeriod
