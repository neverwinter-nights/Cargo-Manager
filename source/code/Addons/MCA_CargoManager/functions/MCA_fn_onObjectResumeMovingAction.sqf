// MCA_fn_onObjectResumeMovingAction.sqf.

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

_object removeAction _actionId;

private ["_actionIdForPause"];
_actionIdForPause = _object addAction
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
_user setVariable [MCA_CargoManagerVarName_actionIdForResumeOrPause, _actionIdForPause];

_object attachTo [_user];
