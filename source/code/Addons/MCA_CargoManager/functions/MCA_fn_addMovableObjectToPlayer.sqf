// MCA_fn_addMovableObjectToPlayer.sqf.

params ["_player", "_object"];

private ["_tmp"];
_tmp = _player getVariable MCA_CargoManagerVarName_movableObjects;
_tmp pushBack _object;
_player setVariable [MCA_CargoManagerVarName_movableObjects, _tmp];
