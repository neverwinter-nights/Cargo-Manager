// MCA_fn_getObjectDisplayName.sqf.

params ["_object"];

if ((typeName _object) != "OBJECT") exitWith { "Error: Unsupported object type" };

private ["_objectType"];
_objectType = typeof _object;

private ["_configType"];
switch (true) do
{
    case(isClass(configFile >> "CfgMagazines" >> _objectType)):
    {
        _configType = "CfgMagazines";
    };

    case(isClass(configFile >> "CfgWeapons" >> _objectType)):
    {
        _configType = "CfgWeapons";
    };

    case(isClass(configFile >> "CfgVehicles" >> _objectType)):
    {
        _configType = "CfgVehicles";
    };

    case(isClass(configFile >> "CfgGlasses" >> _objectType)):
    {
        _configType = "CfgGlasses";
    };
};

private ["_objectDisplayName"];
_objectDisplayName = getText (configFile >> _configType >> _objectType >> "displayName");
_objectDisplayName
