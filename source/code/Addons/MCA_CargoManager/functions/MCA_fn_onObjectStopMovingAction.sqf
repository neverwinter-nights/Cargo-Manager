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

// Delete 'Pause' action from user.
private ["_actionIdForPause"];
_actionIdForPause = _user getVariable MCA_CargoManagerVarName_actionIdForPause;
if (_actionIdForPause != -1) then
{
    _user removeAction _actionIdForPause;
    _user setVariable [MCA_CargoManagerVarName_actionIdForPause, -1];
};

// Delete 'Resume' action from object.
private ["_actionIdForResume"];
_actionIdForResume = _object getVariable MCA_CargoManagerVarName_actionIdForResume;
if (_actionIdForResume != -1) then
{
    _object removeAction _actionIdForResume;
    _object setVariable [MCA_CargoManagerVarName_actionIdForResume, -1];
};

// Delete 'Stop' action from object.
_object removeAction _actionId;

// If the object is not detached, we must detach it.
detach _object;
_object setPosASL getPosASL _object; // https://community.bistudio.com/wiki/attachTo.
_user forceWalk false;

// Unlink the object from the user.
_object setVariable [MCA_CargoManagerVarName_objectUser, nil];
[player, _object] call MCA_fn_deleteMovableObjectFromPlayer;

// Clear the current object inside the user.
_user setVariable [MCA_CargoManagerVarName_currentObject, nil];

// Clear the ActionId variable.
_object setVariable [MCA_CargoManagerVarName_actionIdForResume, nil];
