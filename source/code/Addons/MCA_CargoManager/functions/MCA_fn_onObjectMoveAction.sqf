// MCA_fn_onObjectMoveAction.sqf.

params ["_target", "_caller", "_actionId"];

private ["_object", "_user", "_mustExit"];
_object = _target;
_user = _object getVariable MCA_CargoManagerVarName_objectUser;
_mustExit = false;
if (_user != _caller) then
{
    systemChat format ["Illegal action call. Target=%1, Caller=%2, ActionId=%3, User=%4", _target, _caller, _actionId, _user]; //DEBUG.
    _mustExit = true;
};
if (_mustExit) exitWith {};

// Because 'Pause' action is stored in user, when this action fired we need a way to get the object.
// So, we need to store current object inside the user.
_user setVariable [MCA_CargoManagerVarName_currentObject, _object];

// Delete 'Move' action from object.
_object removeAction _actionId;

// Add a 'Pause' action to the user.
// This action is added to user instead of object, because Arma's engine is so ugly
// that it does not show actions when object is attached to player !
private ["_actionIdForPause"];
_actionIdForPause = _user addAction
[
    MCA_PauseMovingObjectActionText,
    {
        params ["_target", "_caller", "_actionId", "_arguments"];

        [_target, _caller, _actionId] call MCA_fn_onObjectPauseMovingAction;
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
// While we have no access to all actions, we "invent a wheel" here.
_user setVariable [MCA_CargoManagerVarName_actionIdForPause, _actionIdForPause];

// Add a 'Stop' action to the object.
_object addAction
[
    MCA_StopMovingObjectActionText,
    {
        params ["_target", "_caller", "_actionId", "_arguments"];

        [_target, _caller, _actionId] call MCA_fn_onObjectStopMovingAction;
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

_object attachTo [_user];
