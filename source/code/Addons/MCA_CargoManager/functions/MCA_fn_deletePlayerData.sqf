// MCA_fn_deletePlayerData.sqf.

params ["_player"];

// Delete the data from player.
_player setVariable [MCA_CargoManagerVarName_managedVehicle, mil];
_player setVariable [MCA_CargoManagerVarName_loadedObjects, nil];
_player setVariable [MCA_CargoManagerVarName_nearbyObjects, nil];
_player setVariable [MCA_CargoManagerVarName_nearbyObjectsPositions, nil];
