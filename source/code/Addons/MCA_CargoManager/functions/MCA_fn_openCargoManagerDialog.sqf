// MCA_fn_openCargoManagerDialog.sqf.

// This function tries to find the nearest vehicle and open cargo management dialog for it.

params ["_callerPlayer"];

// Get the nearest stationary vehicle available for loading.
private ["_res", "_mustExit"];
_mustExit = false;
_res = [_callerPlayer] call MCA_fn_getNearestStationaryVehicle;
if ((_res select 0) == false) then
{
    systemChat format ["Error: %1.", _res select 2];
    _mustExit = true;
};
if (_mustExit) exitWith {};

// Nearest vehicle is found. Get its name.
private ["_nearestVehicle"];
_nearestVehicle = _res select 1;

// Open the dialog.
private ["_dialog"];
_dialog = createDialog ["MCA_CargoManagerDialog", true];
[_callerPlayer, _dialog, _nearestVehicle] call MCA_fn_initCargoManagerDialog;
