// MCA_fn_refreshCargoManagerDialog.sqf.

params ["_dialog"];

_dialog = ctrlParent _dialog;

// Delete the data from player.
player setVariable [MCA_CargoManagerVarName_managedVehicle, mil];
player setVariable [MCA_CargoManagerVarName_objectsLoaded, nil];
player setVariable [MCA_CargoManagerVarName_objectsNearby, nil];

// Get the nearest vehicle.
private ["_nearestObjects"];
_nearestObjects = [player] call MCA_fn_getNearestVehiclesForCargoManagement;

// If there are no vehicles nearby, exit.
private ["_mustExit"];
_mustExit = false;
if (count _nearestObjects < 1) then
{
	closeDialog 2;
    systemChat format ["No vehicle is nearby."];
    _mustExit = true;
};
if (_mustExit) exitWith {};

// Nearest vehicle is found. Get its name.
private ["_nearestVehicle"];
_nearestVehicle = _nearestObjects select 0;

// Refresh the dialog.
[_dialog, _nearestVehicle] call MCA_fn_initCargoManagerDialog;
