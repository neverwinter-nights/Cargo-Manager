// MCA_fn_moveCargo.sqf.

params ["_actionId", "_objectIndex"];

// This function moves the selected object in or out of the vehicle and refreshes the dialog.

// Action IDs:
// 1 = Load, 
// 2 = Unload.

private ["_mustExit"];
_mustExit = false;

// Fool check.
if (_objectIndex < 0) then 
{
	_mustExit = true;
	hint "To move cargo, it must be selected in the list.";
};
if (_mustExit) exitWith{};

// Hack check.
if ((_actionId != 1) and (_actionId != 2)) then 
{
	_mustExit = true;
	hint "ActionId is corrupted.";
};
if (_mustExit) exitWith{};

// Verify that everything is normal before moving anything.
// On error, close the dialog.
private ["_res", "_mustExit", "_object"];
_mustExit = false;
_res = [player, _actionId, _objectIndex] call MCA_fn_isCargoMovementPossible;
if ((_res select 0) == false) then
{
    systemChat format ["Operation is not possible. %1.", _res select 3];
    closeDialog 2;
    _mustExit = true;
};
if (_mustExit) exitWith {};

// Get the vehicle and the moved object.
private ["_managedVehicle", "_object"];
_managedVehicle = _res select 1;
_object = _res select 2;

// Move the object.
private ["_result"];
_result = false;

// Loading.
if (_actionId == 1) then
{
	// Load the object.
	_result = _managedVehicle setVehicleCargo _object;
	if (_result) then {
		systemChat format ["Object has been loaded."];
	};
};

// Unloading.
if (_actionId == 2) then
{
	// Unload the object.
	_result = objNull setVehicleCargo _object;
	if (_result) then {
		systemChat format ["Cargo has been unloaded."];
	};

    // Movable unloaded object must be "marked" to enable its movement and disallow its loading until it is fixed.
    if ((!(_object isKindOf "LandVehicle")) and (!(_object isKindOf "Ship")) and (!(_object isKindOf "Air"))) then
    {
        // We store the "user" of an object inside the object.
        // We store the "used" object reference inside the player.
        _object setVariable [MCA_CargoManagerVarName_objectUser, player];
        [player, _object] call MCA_fn_addMovableObjectToPlayer;

        _object setVariable [MCA_CargoManagerVarName_actionIdForResume, -1];

	    // Add a 'Move' action to the object.
        _object addAction
        [
            MCA_MoveObjectActionText,
            {
                params ["_target", "_caller", "_actionId", "_arguments"];

                [_target, _caller, _actionId] call MCA_fn_onObjectMoveAction;
            },              // Script.
            nil,            // Arguments.
            0,              // Priority: bigger = higher.
            false,          // ShowWindow.
            false,          // HideOnUse.
            "",             // Shortcut.
            "true",         // Condition.
            _object call MCA_fn_getObjectActionRadius,  // Radius, meters.
            false,          // Unconscious.
            "",             // Selection.
            ""              // MemoryPoint.
        ];
    };
};
