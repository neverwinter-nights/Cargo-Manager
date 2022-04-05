// MCA_fn_onObjectPauseMovingAction.sqf.

// 'Pause' action is stored in user, not in object !
// Because Arma's engine is ugly.
params ["_target", "_caller", "_actionId"];

private ["_object", "_user", "_mustExit"];
_user = _caller;
_object = _user getVariable MCA_CargoManagerVarName_currentObject;
_mustExit = false;
if (_user != _caller) then
{
    systemChat format ["Illegal action call. Target=%1, Caller=%2, ActionId=%3, User=%4", _target, _caller, _actionId, _user]; //DEBUG.
    _mustExit = true;
};
if (_mustExit) exitWith {};

// Delete 'Pause' action from user.
_user removeAction _actionId;
_user setVariable [MCA_CargoManagerVarName_actionIdForPause, -1];

// Add a 'Resume' action to the object.
private ["_actionIdForResume"];
_actionIdForResume = _object addAction
[
    MCA_ResumeMovingObjectActionText,
    {
        params ["_target", "_caller", "_actionId", "_arguments"];

        [_target, _caller, _actionId] call MCA_fn_onObjectResumeMovingAction;
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
_object setVariable [MCA_CargoManagerVarName_actionIdForResume, _actionIdForResume];

detach _object;
_object setPosASL getPosASL _object; // https://community.bistudio.com/wiki/attachTo.
_user forceWalk false;

// Clear the current object inside the user.
_user setVariable [MCA_CargoManagerVarName_currentObject, nil];
