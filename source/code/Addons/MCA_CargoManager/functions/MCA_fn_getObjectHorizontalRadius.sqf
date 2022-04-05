// MCA_fn_getObjectHorizontalRadius.sqf.

params ["_object"];

private ["_dims", "_hd"];
_dims = _object call MCA_fn_getObjectDimensions;
_hd = sqrt (((_dims select 0) ^ 2) + ((_dims select 1) ^ 2)); // Sqrt (x*x + y*y).
_hd / 2
