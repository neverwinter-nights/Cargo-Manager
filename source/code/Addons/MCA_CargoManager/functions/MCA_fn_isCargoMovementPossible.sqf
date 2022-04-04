// MCA_fn_isCargoMovementPossible.sqf.

params ["_callerPlayer", "_actionId", "_objectIndex"];

// This function verifies that the vehicle and the cargo are stationary.
// This function returns an array with following items:
//  - [0] is success flag, true if moving is possible;
//  - [1] is the target vehicle, non-null on success;
//  - [2] is the moved object, non-null on success;
//  - [3] is error text, empty on success.

private ["_errText", "_mustExit"];
_errText = "";
_mustExit = false;

// Read the data from the player.
private ["_res", "_managedVehicle", "_objectsLoaded", "_objectsNearby", "_posObjectsNearby"];
_res = _callerPlayer call MCA_fn_getPlayerData;
if ((_res select 0) == false) then
{
    _errText = format ["Error getting player data. Player is %1.", player];
    _mustExit = true;
};
if (_mustExit) exitWith { [false, nil, nil, _errText] };
_managedVehicle = _res select 1;
_objectsLoaded = _res select 2;
_objectsNearby = _res select 3;
_posObjectsNearby = _res select 4;

// Vehicle must be stationary.
if (speed _managedVehicle > MCA_inaccuracyForFloatSpeed) then
{
    _errText = format ["Vehicle is not stationary"];
    _mustExit = true;
};
if (_mustExit) exitWith { [false, nil, nil, _errText] };

// Vehicle must be reachable.
if ((_callerPlayer distance _managedVehicle) > MCA_vehSearchRadius) then
{
    _errText = format ["Vehicle is not reachable"];
    _mustExit = true;
};
if (_mustExit) exitWith { [false, nil, nil, _errText] };

// Possible cargo objects' checks.
private ["_i"];
_i = 0;
{	
	// Object must be stationary.
    if ( ([position _x, _posObjectsNearby select _i] call MCA_fn_arePositionsSame) == false ) then
    {
        _errText = format ["Possible cargo object #%1 (%2) is not stationary", _i + 1, _x call MCA_fn_getObjectDisplayName];
        _mustExit = true;
    };
	if (_mustExit) then { break };
	
	// Next.
    _i = _i + 1;
} forEach _objectsNearby;
if (_mustExit) exitWith { [false, nil, nil, _errText] };

// Get the moved object.
private ["_object"];
if (_actionId == 1) then
{
    _object = _objectsNearby select _objectIndex;
};
if (_actionId == 2) then
{
	_object = _objectsLoaded select _objectIndex;
};

// Return.
[true, _managedVehicle, _object, ""]
