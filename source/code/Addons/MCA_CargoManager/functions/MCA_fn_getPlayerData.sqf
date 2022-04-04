// MCA_fn_getPlayerData.sqf.

params ["_player"];

// This function tries to get data from player.
// This function returns an array with following elements:
//  - [0] is success flag, true if all data is found;
//  - [1] is the managed vehicle, non-null on success;
//  - [2] is the list of vehicle's cargo, non-null on success;
//  - [3] is the list of nearby objects, non-null on success;
//  - [4] is the list of nearby objects' positions, non-null on success.

private ["_managedVehicle", "_objectsLoaded", "_objectsNearby", "_posObjectsNearby"];

_managedVehicle = _player getVariable MCA_CargoManagerVarName_managedVehicle;
if (isNil "_managedVehicle") exitWith { [false, nil, nil, nil, nil] };

_objectsLoaded = _player getVariable MCA_CargoManagerVarName_loadedObjects;
if (isNil "_objectsLoaded") exitWith { [false, nil, nil, nil, nil] };

_objectsNearby = _player getVariable MCA_CargoManagerVarName_nearbyObjects;
if (isNil "_objectsNearby") exitWith { [false, nil, nil, nil, nil] };

_posObjectsNearby = _player getVariable MCA_CargoManagerVarName_nearbyObjectsPositions;
if (isNil "_posObjectsNearby") exitWith { [false, nil, nil, nil, nil] };

[true, _managedVehicle, _objectsLoaded, _objectsNearby, _posObjectsNearby]
