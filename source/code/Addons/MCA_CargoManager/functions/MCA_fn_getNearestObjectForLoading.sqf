// MCA_fn_getNearestObjectForLoading.sqf.

params ["_cargoVehicle"];

private ["_cargoVehicleSize"];
_cargoVehicleSize = _cargoVehicle call MCA_fn_getObjectDimensions;

private ["_nearestObjectsIncludingItself"];
_nearestObjectsIncludingItself = position _cargoVehicle nearObjects MCA_vehSearchRadius;

private ["_objects", "_objectSize", "_ok", "_willFit"];
_objects = [];
{
	// We ignore the cargo vehicle itself.
    if (_x == _cargoVehicle) then { continue };
	
	// We ignore already loaded objects and those object which can not be loaded.
	_willFit = _cargoVehicle canVehicleCargo _x;
	if ((_willFit select 0) == false) then { continue };
	
	_objects pushBack _x;
} forEach _nearestObjectsIncludingItself;

_objects
