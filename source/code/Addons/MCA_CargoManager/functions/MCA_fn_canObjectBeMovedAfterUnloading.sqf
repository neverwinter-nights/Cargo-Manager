// MCA_fn_canObjectBeMovedAfterUnloading.sqf.

// This function checks whether the movement of an object is possible.
// Returns an array having following items:
//  [0] = result of the check;
//  [1] = reason for restriction, if [0] is false.

params ["_object"];

// Restrict movement for various vehicle kinds.
if (_object isKindOf "LandVehicle") exitWith { [false, MCA_movementRestrictionReason_Vehicle] };
if (_object isKindOf "Ship") exitWith { [false, MCA_movementRestrictionReason_Vehicle] };
if (_object isKindOf "Air") exitWith { [false, MCA_movementRestrictionReason_Vehicle] };

// Restrict movement for large objects.
private ["_objDimensions", "_dimensionsSum"]; // Width, Length, Height.
_objDimensions = _object call MCA_fn_getObjectDimensions;
_dimensionsSum = (_objDimensions select 0)  + (_objDimensions select 1) + (_objDimensions select 2);
if (_dimensionsSum > MCA_maxObjectDimsSumForMovement) exitWith { [false, MCA_movementRestrictionReason_Dimensions] };

// Restrict movement for heavy objects.
private ["_objMass"];
_objMass = getMass _object;
if (_objMass > MCA_maxObjectMassForMovement) exitWith { [false, MCA_movementRestrictionReason_Mass] };

[true, MCA_movementRestrictionReason_None]
