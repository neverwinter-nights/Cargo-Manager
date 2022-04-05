// MCA_fn_savePlayerData.sqf.

params ["_player", "_nearestVehicle", "_vehicleCargoObjects", "_possibleObjects"];

// We also store objects' positions to be able to check their "speed".
private ["_possibleObjectsPositions"];
_possibleObjectsPositions = [];
{
    _possibleObjectsPositions pushBack (position _x);
} forEach _possibleObjects;

_player setVariable [MCA_CargoManagerVarName_managedVehicle, _nearestVehicle];
_player setVariable [MCA_CargoManagerVarName_loadedObjects, _vehicleCargoObjects];
_player setVariable [MCA_CargoManagerVarName_nearbyObjects, _possibleObjects];
_player setVariable [MCA_CargoManagerVarName_nearbyObjectsPositions, _possibleObjectsPositions];
