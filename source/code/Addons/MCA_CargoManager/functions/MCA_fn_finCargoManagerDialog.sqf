// MCA_fn_finCargoManagerDialog.sqf.

params ["_dialog"];

// Clear the data inside the caller (player).
player setVariable [MCA_CargoManagerVarName_managedVehicle, mil];
player setVariable [MCA_CargoManagerVarName_objectsLoaded, nil];
player setVariable [MCA_CargoManagerVarName_objectsNearby, nil];
