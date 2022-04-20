// MCA_fn_areCargoDoorsOpen.sqf.

// This function checks if the cargo doors are open when they are present 
// in the vehicle. If the doors are absent, function returns true.

params ["_vehicle"];

private ["_doors", "_vehClassName"];
_doors = _vehicle call MCA_fn_getCargoDoorNames;
_vehClassName = typeOf _vehicle;

if (count _doors == 0) exitWith { true };

// Let's count the number of opened cargo doors.
private ["_source", "_doorState", "_openedDoorsCount"];
_openedDoorsCount = 0;
{
    _source = getText (configFile >> "CfgVehicles" >> _vehClassName >> "AnimationSources" >> _x >> "source");
    if (_source == "door") then
    {
        _doorState = (_vehicle animationSourcePhase _x) max (_vehicle animationPhase _x);
    };
    if (_source == "user") then
    {
        _doorState = (_vehicle animationSourcePhase _x) max (_vehicle animationPhase _x);
    };

	if (_doorState == 1) then // Opened.
	{
		_openedDoorsCount = _openedDoorsCount + 1;
	};
} forEach _doors;

// Due to the anarchy in the door animations, we do a very simple check.
// If at least one cargo door is opened, cargo doors are opened.
if (_openedDoorsCount >= 1) exitWith { true };
false
