// MCA_fn_deleteMovableObjectFromPlayer.sqf.

params ["_player", "_objectToDelete"];

private ["_oldListOfObjects", "_newListOfObjects"];
_oldListOfObjects = _player getVariable MCA_CargoManagerVarName_movableObjects;
_newListOfObjects = [];

{
    if (_x != _objectToDelete) then
    {
        _newListOfObjects pushBack _x;
    };
} forEach _oldListOfObjects;

_player setVariable [MCA_CargoManagerVarName_movableObjects, _newListOfObjects];
