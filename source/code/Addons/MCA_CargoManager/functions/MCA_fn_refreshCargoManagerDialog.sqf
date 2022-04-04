// MCA_fn_refreshCargoManagerDialog.sqf.

params ["_callerPlayer", "_ctrl"];

// This function is called by the dialog window.
// It refreshes the dialog's contents and the data stored in the player.

//systemChat format ["_callerPlayer=%1, _ctrl=%2.", _callerPlayer, _ctrl]; //DEBUG.

private ["_dialog"];
_dialog = ctrlParent (_ctrl select 0); // For some reason control is passed as an array.

// Delete the data from player.
_callerPlayer call MCA_fn_deletePlayerData;

// Get the nearest stationary vehicle available for loading.
private ["_res", "_mustExit"];
_mustExit = false;
_res = [_callerPlayer] call MCA_fn_getNearestStationaryVehicle;
if ((_res select 0) == false) then
{
    systemChat format ["Error: %1.", _res select 2];
    closeDialog 2;
    _mustExit = true;
};
if (_mustExit) exitWith {};

// Nearest vehicle is found. Get its name.
private ["_nearestVehicle"];
_nearestVehicle = _res select 1;

// Refresh the dialog.
[_callerPlayer, _dialog, _nearestVehicle] call MCA_fn_initCargoManagerDialog;
