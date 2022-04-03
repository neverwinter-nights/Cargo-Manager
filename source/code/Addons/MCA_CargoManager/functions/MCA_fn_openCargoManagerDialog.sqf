// MCA_fn_openCargoManagerDialog.sqf.

// This function tries to find the nearest vehicle and open cargo management dialog for it.

params ["_callerPlayer"];

// Get the nearest vehicle.
private ["_nearestObjects"];
_nearestObjects = [_callerPlayer] call MCA_fn_getNearestVehiclesForCargoManagement;

// If there are no vehicles nearby, exit.
private ["_mustExit"];
_mustExit = false;
if (count _nearestObjects < 1) then
{
    systemChat format ["No vehicle is nearby."];
    _mustExit = true;
};
if (_mustExit) exitWith {};

// Nearest vehicle is found. Get its name.
private ["_nearestVehicle"];
_nearestVehicle = _nearestObjects select 0;

// Open the dialog.
private ["_dialog"];
_dialog = createDialog ["MCA_CargoManagerDialog", true];
[_dialog, _nearestVehicle] call MCA_fn_initCargoManagerDialog;
