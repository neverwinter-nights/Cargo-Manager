// MCA_fn_alignObjectToGround.sqf.

params ["_obj"];

_obj setVectorUp (surfaceNormal (getPosATL _obj));

private ["_pos"];
_pos = getPosATL _obj;
_obj setPosATL [_pos select 0, _pos select 1, 0.0];
