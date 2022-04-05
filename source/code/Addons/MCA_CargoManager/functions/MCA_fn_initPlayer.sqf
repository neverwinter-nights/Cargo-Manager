// MCA_fn_initPlayer.sqf.

// If the computer is not a real player
// (e.g. if it is a dedicated server or a headless client),
// exit the script.
if (!hasInterface) exitWith {};

player addAction
[
    MCA_CargoManagerActionText,
    {
        params ["_target", "_caller", "_actionId", "_arguments"];

        [_caller] call MCA_fn_openCargoManagerDialog;
    },      // Script.
    nil,    // Arguments.
    0,      // Priority: bigger = higher.
    false,  // ShowWindow.
    false,  // HideOnUse.
    "",     // Shortcut.
    "true", // Condition.
    1,      // Radius, meters.
    false,  // Unconscious.
    "",     // Selection.
    ""      // MemoryPoint.
];

player setVariable [MCA_CargoManagerVarName_movableObjects, []];
player setVariable [MCA_CargoManagerVarName_actionIdForPause, -1];

// To keep this action with the player after respawn, we must add this action after each respawn.
player addEventHandler
[
	"Respawn",
	{
		params ["_unit", "_corpse"];

        _unit addAction
        [
            MCA_CargoManagerActionText,
            {
                params ["_target", "_caller", "_actionId", "_arguments"];

                [_caller] call MCA_fn_openCargoManagerDialog;
            },      // Script.
            nil,    // Arguments.
            0,      // Priority: bigger = higher.
            false,  // ShowWindow.
            false,  // HideOnUse.
            "",     // Shortcut.
            "true", // Condition.
            1,      // Radius, meters.
            false,  // Unconscious.
            "",     // Selection.
            ""      // MemoryPoint.
        ];

        _unit setVariable [MCA_CargoManagerVarName_movableObjects, []];
        _unit setVariable [MCA_CargoManagerVarName_actionIdForPause, -1];
	}
];
