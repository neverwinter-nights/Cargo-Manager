// MCA_fn_doesVehicleUseOldDoors.sqf.

params ["_vehClassName"];

{
	if (_vehClassName == _x) exitWith { true };
} forEach MCA_CargoManager_VehicleClassNamesWithOldDoors;
false
