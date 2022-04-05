// MCA_fn_getObjectDiagonal.sqf.

params ["_object"];

private ["_dims", "_diag"];
_dims = _object call MCA_fn_getObjectDimensions;
_diag = sqrt ( ((_dims select 0) ^ 2) + ((_dims select 1) ^ 2) + ((_dims select 2) ^ 2) );
_diag
