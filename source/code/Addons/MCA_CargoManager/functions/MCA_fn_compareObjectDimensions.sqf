// MCA_fn_compareObjectDimensions.sqf.

params ["_object1", "_object2"];

// This function compares dimensions of two objects.
// If the first object is smaller than the second one, it returns true.
// Here the word "smaller" means that it can fit inside without rotation.
// Otherwise it returns false.

if ((_object1 select 0) >= (_object2 select 0)) exitWith { false };
if ((_object1 select 1) >= (_object2 select 1)) exitWith { false };
if ((_object1 select 2) >= (_object2 select 2)) exitWith { false };
true
