// MCA_fn_isObjectTypeAllowed.sqf.

params ["_object"];

private ["_res", "_category", "_type"];
_res = _object call BIS_fnc_objectType; // Doc.: https://community.bistudio.com/wiki/BIS_fnc_objectType
_category = _res select 0;
_type = _res select 1;

if (_category == "Vehicle") exitWith { true };
if (_category == "VehicleAutonomous") exitWith { true };

private ["_success"];
_success = false;
if (_category == "Object") then
{
    if (_type == "AmmoBox") then { _success = true };
    if (_type == "Backpack") then { _success = true };
    if (_type == "Mine") then { _success = true };
    if (_type == "Thing") then { _success = true };
    if (_type == "House") then { _success = true };
};
if (_success) exitWith { true };

systemChat format ["Unsupported object. Category is %1, type is %2", _category, _type]; // DEBUG.
if (true) exitWith { false };
