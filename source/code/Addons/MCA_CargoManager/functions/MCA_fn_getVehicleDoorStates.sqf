// MCA_fn_getVehicleDoorStates.sqf.

params ["_veh"];

private ["_doorAnimes", "_doorStates", "_doorPhase"];
_doorAnimes = _veh call MCA_fn_getVehicleDoorAnimes;
_doorStates = [];

{
	//_doorPhase = _veh animationPhase _x;
	_doorPhase = _veh animationSourcePhase _x;
	_doorStates pushBack [_x, _doorPhase];
} forEach _doorAnimes;

_doorStates
