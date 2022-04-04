// MCA_fn_arePositionsSame.sqf.

params ["_pos1", "_pos2"];

// This function compares two positions.
// While coordinates are stored as floats, we can not compare the values simply.
// It returns true if the positions are seem to be the same.

if (abs ((_pos1 select 0) - (_pos2 select 0)) > MCA_inaccuracyForFloatCoordinate) exitWith { false };
if (abs ((_pos1 select 1) - (_pos2 select 1)) > MCA_inaccuracyForFloatCoordinate) exitWith { false };
if (abs ((_pos1 select 2) - (_pos2 select 2)) > MCA_inaccuracyForFloatCoordinate) exitWith { false };

true
