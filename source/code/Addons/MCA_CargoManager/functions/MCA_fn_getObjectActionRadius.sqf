// MCA_fn_getObjectActionRadius.sqf.

params ["_object"];

private ["_actionRadius"];
_actionRadius = (_object call MCA_fn_getObjectHorizontalRadius) + 1.5;
_actionRadius
