// MCA_fn_onObjectStopMovingAction.sqf.

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

// If the object is not detached, we must detach it.
detach _object;
_object setPosASL getPosASL _object; // https://community.bistudio.com/wiki/attachTo.

// Here we must delete an action which has left.
// It is either 'resume' or 'pause'.
// While we have no access to all actions, we "invent a wheel" here.
private ["_actionIdForResumeOrPause"];
_actionIdForResumeOrPause = _user getVariable MCA_CargoManagerVarName_actionIdForResumeOrPause;
_object removeAction _actionIdForResumeOrPause;
_user setVariable [MCA_CargoManagerVarName_actionIdForResumeOrPause, -1];

// Unlink the object from the user.
_object setVariable [MCA_CargoManagerVarName_objectUser, nil];
[player, _object] call MCA_fn_deleteMovableObjectFromPlayer;
