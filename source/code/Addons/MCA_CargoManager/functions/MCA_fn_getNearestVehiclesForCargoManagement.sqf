// MCA_fn_getNearestVehiclesForCargoManagement.sqf.

params["_pivotObject"];

private ["_nearestObjectsIncludingItself"];
_nearestObjectsIncludingItself = nearestObjects [_pivotObject, MCA_vehClassNamesToFind, MCA_vehSearchRadius];

private ["_nearestObjectsExcludingItself"];
_nearestObjectsExcludingItself = [];
{
    if (_x != _pivotObject) then {
        _nearestObjectsExcludingItself pushBack _x;
    };
} forEach _nearestObjectsIncludingItself;

_nearestObjectsExcludingItself
