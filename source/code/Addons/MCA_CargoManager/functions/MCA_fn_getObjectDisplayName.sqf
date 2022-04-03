// MCA_fn_getObjectDisplayName.sqf.

params ["_object"];

//systemChat format ["_object=%1", _object]; //DEBUG.

if ((typeName _object) != "OBJECT") exitWith { "Error: Unsupported object type" };

//systemChat format ["typeName=%1", typeName _object]; //DEBUG.

private ["_objectType"];
_objectType = typeof _object;
//systemChat format ["_objectType=%1", _objectType]; //DEBUG.

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

//systemChat format ["_configType=%1", _configType]; //DEBUG.

private ["_objectDisplayName"];
_objectDisplayName = getText (configFile >> _configType >> _objectType >> "displayName");
_objectDisplayName
