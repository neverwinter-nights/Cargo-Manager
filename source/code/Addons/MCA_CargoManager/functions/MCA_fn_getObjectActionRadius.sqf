// MCA_fn_getObjectActionRadius.sqf.

params ["_object"];

private ["_actionRadius"];
_actionRadius = (_object call MCA_fn_getObjectDiagonal) + 3.0;
_actionRadius
