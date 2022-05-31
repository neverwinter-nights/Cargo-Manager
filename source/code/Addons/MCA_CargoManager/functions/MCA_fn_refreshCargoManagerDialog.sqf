// MCA_fn_refreshCargoManagerDialog.sqf.

params ["_callerPlayer", "_ctrl"];

// This function is called by the dialog window.
// It refreshes the dialog's contents and the data stored in the player.

private ["_dialog"];
_dialog = ctrlParent (_ctrl select 0);

// Get the used vehicle from the player.
private ["_res", "_managedVehicle", "_mustExit", "_errText"];
_res = _callerPlayer call MCA_fn_getPlayerData;
_mustExit = false;
if ((_res select 0) == false) then
{
    _errText = format ["Error getting player data. Player is %1.", _callerPlayer];
    systemChat _errText;
    _mustExit = true;
};
if (_mustExit) exitWith {};
_managedVehicle = _res select 1;

// Delete the data from player.
_callerPlayer call MCA_fn_deletePlayerData;

// Vehicle must be stationary.
_mustExit = false;
if (speed _managedVehicle > MCA_inaccuracyForFloatSpeed) then
{
    _errText = format ["Vehicle is not stationary"];
    systemChat _errText;
    _mustExit = true;
};
if (_mustExit) exitWith {};

// Vehicle must be reachable.
_mustExit = false;
if ((_callerPlayer distance _managedVehicle) > MCA_vehSearchRadius) then
{
    _errText = format ["Vehicle is not reachable"];
    systemChat _errText;
    _mustExit = true;
};
if (_mustExit) exitWith {};

// Refresh the dialog.
[_callerPlayer, _dialog, _managedVehicle] call MCA_fn_initCargoManagerDialog;
