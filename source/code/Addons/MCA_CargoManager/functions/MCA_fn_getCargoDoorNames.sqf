// MCA_fn_getCargoDoorNames.sqf.

// This function tries to get the names of the cargo doors of the vehicle.
// If vehicle has no cargo doors, an empty array is returned.
// Some of the door sets are hard-coded here, some doors are searched by the
// script which tries to guess.

params ["_vehicle"];

private ["_vehClassName", "_cargoDoors"];
_vehClassName = typeOf _vehicle;
_cargoDoors = [];

switch (_vehClassName) do
{
	// Vanilla vehicles.
	case "B_T_VTOL_01_armed_F":				{ _cargoDoors = ["Door_1_source"]; }; // Door is working, but cargo is disabled.
	case "B_T_VTOL_01_infantry_F":			{ _cargoDoors = ["Door_1_source"]; }; // Door is working, but cargo is disabled.
	case "B_T_VTOL_01_vehicle_F":			{ _cargoDoors = ["Door_1_source"]; }; // Door is working, cargo is enabled.
	// N.B.: For some reason the cargo version of the vanilla CH-67 has no usable doors.
	
	// CUP vehicles.
	case "CUP_B_MK10_GB":					{ _cargoDoors = ["FrontRamp", "rearRamp"]; };
	case "CUP_B_LCU1600_HIL":				{ _cargoDoors = ["ramp_front", "ramp_rear"]; };
	case "CUP_B_LCU1600_USMC":				{ _cargoDoors = ["ramp_front", "ramp_rear"]; };
	case "CUP_I_LCU1600_RACS":				{ _cargoDoors = ["ramp_front", "ramp_rear"]; };
		
	// RHS vehicles.
	// ...
};

if (count _cargoDoors > 0) exitWith { _cargoDoors };

// If the vehicle is unknown, we try to guess the cargo door names.
private ["_doorNames", "_xl"];
_doorNames = _vehicle call MCA_fn_getVehicleDoorAnimes;

// Get the list of all doors.
if (count _doorNames == 0) exitWith { _cargoDoors };

// Try to sort out the cargo doors in this mess.
{
	_xl = toLower _x;
	
	if ((_xl find ["rear", 0] >= 0) or (_xl find ["ramp", 0] >= 0)) then 
	{
		_cargoDoors pushBack _x;
	};
} forEach _doorNames;

_cargoDoors
