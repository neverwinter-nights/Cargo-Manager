// MCA_fn_getObjectActionRadius.sqf.

params ["_object"];

private ["_actionRadius"];
_actionRadius = (_object call MCA_fn_getObjectDiagonal) + 2;
_actionRadius
