// MCA_fn_changeDoorState.sqf.

// Action IDs: 1 = Open, 2 = Close.

params ["_callerPlayer", "_actionId", "_doorName"];

private ["_errText", "_mustExit"];
_errText = "";
_mustExit = false;

// Fool check.
if (_doorName == "") then
{
    _errText = format ["Door is not selected"];
    systemChat _errText;
    _mustExit = true;
};
if (_mustExit) exitWith { false };

// Read the data from the player.
private ["_res", "_managedVehicle"];
_res = _callerPlayer call MCA_fn_getPlayerData;
if ((_res select 0) == false) then
{
    _errText = format ["Error getting player data. Player is %1.", _callerPlayer];
    systemChat _errText;
    _mustExit = true;
};
if (_mustExit) exitWith { false };
_managedVehicle = _res select 1;

// Vehicle must be stationary.
if (speed _managedVehicle > MCA_inaccuracyForFloatSpeed) then
{
    _errText = format ["Vehicle is not stationary"];
    systemChat _errText;
    _mustExit = true;
};
if (_mustExit) exitWith { false };

// Vehicle must be reachable.
if ((_callerPlayer distance _managedVehicle) > MCA_vehSearchRadius) then
{
    _errText = format ["Vehicle is not reachable"];
    systemChat _errText;
    _mustExit = true;
};
if (_mustExit) exitWith { false };

// Manipulate the door.
// Method depends on the animation source.
private ["_newDoorState", "_doorAnimationDuration"];
_newDoorState = -1;
if (_actionId == 1) then { _newDoorState = 1; }; // Open.
if (_actionId == 2) then { _newDoorState = 0; }; // Close.
_doorAnimationDuration = ([_managedVehicle, _doorName] call MCA_fn_getDoorAnimationDuration) + MCA_doorAnimationDurationDelta;

private ["_source", "_vehClassName"];
_vehClassName = typeOf _managedVehicle;
_source = getText (configFile >> "CfgVehicles" >> _vehClassName >> "AnimationSources" >> _doorName >> "source");
if (_source == "door") then
{
   _managedVehicle animateDoor [_doorName, _newDoorState, false];
};
if (_source == "user") then
{
    if ((_vehClassName call MCA_fn_doesVehicleUseOldDoors) == true) then
    {
        _managedVehicle animate [_doorName, _newDoorState];
    }
    else
    {
        _managedVehicle animateSource [_doorName, _newDoorState];
    };
};

if (_doorAnimationDuration < 0) exitWith { true };
if (canSuspend) then
{
    sleep _doorAnimationDuration;
};
true
