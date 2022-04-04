// MCA_fn_getNearestStationaryVehicle.sqf.

params ["_callerPlayer"];

// This function tries to find the nearest stationary vehicle available for loading.
// This function returns an array with following elements:
//  - [0] is success flag, true if vehicle is found;
//  - [1] is vehicle object, non-null on success;
//  - [2] is error text if error occurs.

// Get the nearest vehicle.
private ["_nearestObjects"];
_nearestObjects = [_callerPlayer] call MCA_fn_getNearestVehiclesForCargoManagement;

// If there are no vehicles nearby, exit.
if (count _nearestObjects < 1) exitWith { [false, nil, "No vehicle is nearby"] };

private ["_nearestVehicle"];
_nearestVehicle = _nearestObjects select 0;

// Vehicle must be stationary.
if (speed _nearestVehicle > MCA_inaccuracyForFloatSpeed) exitWith { [false, nil, "Vehicle is not stationary"] };

// Return.
[true, _nearestVehicle, ""]
