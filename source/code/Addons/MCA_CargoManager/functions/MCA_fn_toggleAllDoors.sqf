// MCA_fn_toggleAllDoors.sqf.

params ["_veh"];

private ["_doorStates", "_maxDoorAnimationDuration", "_animDurHack"];
_doorStates = _veh call MCA_fn_getVehicleDoorStates;

// For some reason animation is bugged and we must manually make it "longer".
_animDurHack = 1; 

_maxDoorAnimationDuration = (_veh call MCA_fn_getMaxDoorAnimationDuration) + _animDurHack;

{
	_veh animateDoor [_x select 0, (_x select 1) call MCA_fn_oppositeState, false];
} forEach _doorStates;

if (_maxDoorAnimationDuration < 0) exitWith {};
if (canSuspend) then
{
    sleep _maxDoorAnimationDuration;
};
