// MCA_fn_moveCargo.sqf.

params ["_actionId", "_objectIndex"];

// This function moves the selected object in or out of the vehicle and refreshes the dialog.

// Action IDs:
// 1 = Load, 
// 2 = Unload.

private ["_mustExit"];
_mustExit = false;

if (_objectIndex < 0) then 
{
	_mustExit = true;
	hint "To move cargo, it must be selected in the list.";
};
if (_mustExit) exitWith{};

if ((_actionId != 1) and (_actionId != 2)) then 
{
	_mustExit = true;
	hint "ActionId is corrupted.";
};
if (_mustExit) exitWith{};

// Read the data from the player.
private ["_managedVehicle", "_objectsLoaded", "_objectsNearby"];
_managedVehicle = player getVariable MCA_CargoManagerVarName_managedVehicle;
if (isNil "_managedVehicle") exitWith {};
_objectsLoaded = player getVariable MCA_CargoManagerVarName_objectsLoaded;
if (isNil "_objectsLoaded") exitWith {};
_objectsNearby = player getVariable MCA_CargoManagerVarName_objectsNearby;
if (isNil "_objectsNearby") exitWith {};

// Move the object.
private ["_object", "_result"];
_result = false;

if (_actionId == 1) then
{
	_object = _objectsNearby select _objectIndex;
	
	// Load the object.
	_result = _managedVehicle setVehicleCargo _object;
	if (_result) then {
		systemChat format ["Object has been loaded."];
	};
};

if (_actionId == 2) then
{
	_object = _objectsLoaded select _objectIndex;
	
	// Unload the object.
	_result = objNull setVehicleCargo _object;
	if (_result) then {
		systemChat format ["Cargo has been unloaded."];
	};
};
