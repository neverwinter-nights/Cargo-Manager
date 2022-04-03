// MCA_fn_initCargoManagerDialog.sqf.

params ["_dialog", "_nearestVehicle"];

// Set the Target Vehicle Name.
private ["_ctrlVehicleText"];
_ctrlVehicleText = _dialog displayCtrl MCA_CargoManagerDialogCtrlId_TargetVehicle;

private ["_nearestVehicleDisplayName"];
_nearestVehicleDisplayName = _nearestVehicle call MCA_fn_getObjectDisplayName;
_ctrlVehicleText ctrlSetText _nearestVehicleDisplayName;

// Get vehicle cargo objects.
private ["_vehicleCargoObjects"];
_vehicleCargoObjects = getVehicleCargo _nearestVehicle;

// Get nearest objects available for loading.
private ["_possibleObjects"];
_possibleObjects = _nearestVehicle call MCA_fn_getNearestObjectForLoading;

// Save the data inside the caller (player).
player setVariable [MCA_CargoManagerVarName_managedVehicle, _nearestVehicle];
player setVariable [MCA_CargoManagerVarName_objectsLoaded, _vehicleCargoObjects];
player setVariable [MCA_CargoManagerVarName_objectsNearby, _possibleObjects];

// Put cargo objects to their dialog list.
private ["_ctrlVehicleCargoList"];
_ctrlVehicleCargoList = _dialog displayCtrl MCA_CargoManagerDialogCtrlId_VehicleCargoList;
lbClear _ctrlVehicleCargoList;
{
	_ctrlVehicleCargoList lbAdd (_x call MCA_fn_getObjectDisplayName);
} forEach _vehicleCargoObjects;

// Put nearby objects to their dialog list.
private ["_ctrlNearbyObjectsList"];
_ctrlNearbyObjectsList = _dialog displayCtrl MCA_CargoManagerDialogCtrlId_NearbyObjectsList;
lbClear _ctrlNearbyObjectsList;
{
	_ctrlNearbyObjectsList lbAdd (_x call MCA_fn_getObjectDisplayName);
} forEach _possibleObjects;
