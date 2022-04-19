// MCA_fn_strHasPrefix.sqf.

params ["_s", "_prefix"];

private ["_prefix_size"];
_prefix_size = count _prefix;
if (_prefix_size == 0) exitWith { false };

private ["_i"];
_i = _s find [_prefix, 0];
if (_i == 0) exitWith { true };
false
