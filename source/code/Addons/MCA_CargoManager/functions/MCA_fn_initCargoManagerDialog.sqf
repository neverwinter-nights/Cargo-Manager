// MCA_fn_initCargoManagerDialog.sqf.

params ["_callerPlayer", "_dialog", "_nearestVehicle"];

// Set the Target Vehicle Name in Dialog.
private ["_ctrlVehicleText", "_nearestVehicleDisplayName"];
_ctrlVehicleText = _dialog displayCtrl MCA_CargoManagerDialogCtrlId_TargetVehicle;
_nearestVehicleDisplayName = _nearestVehicle call MCA_fn_getObjectDisplayName;
_ctrlVehicleText ctrlSetText _nearestVehicleDisplayName;

// Get vehicle cargo objects.
private ["_vehicleCargoObjects"];
_vehicleCargoObjects = getVehicleCargo _nearestVehicle;

// Get nearest objects available for loading.
private ["_possibleObjects"];
_possibleObjects = _nearestVehicle call MCA_fn_getNearestObjectsForLoading;

// Save the data inside the caller (player).
[_callerPlayer, _nearestVehicle, _vehicleCargoObjects, _possibleObjects] call MCA_fn_savePlayerData;

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

// Fill the doors list.
private ["_ctrlDoorsList", "_doorAnimes"];
_doorAnimes = _nearestVehicle call MCA_fn_getVehicleDoorAnimes;
_ctrlDoorsList = _dialog displayCtrl MCA_CargoManagerDialogCtrlId_DoorsList;
lbClear _ctrlDoorsList;
{
	_ctrlDoorsList lbAdd _x;
} forEach _doorAnimes;
