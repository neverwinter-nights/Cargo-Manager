// MCA_fn_getObjectDisplayName.sqf.

params ["_object"];

if ((typeName _object) != "OBJECT") exitWith { "Error: Unsupported object type" };

private ["_className"];
_className = typeof _object;

private ["_configType", "_configTypes"];
_configTypes = ["CfgAmmo", "CfgGlasses", "CfgLights", "CfgMagazines", "CfgVehicles", "CfgWeapons"];
_configType = "";

// Get the config type.
{
	if (isClass (configFile >> _x >> _className)) then 
	{
		_configType = _x;
		break;
	};
} forEach _configTypes;

if (count _configType == 0) exitWith { "Error: Unsupported config type" };

private ["_objectDisplayName"];
_objectDisplayName = getText (configFile >> _configType >> _className >> "displayName");
_objectDisplayName
