// MCA_fn_initCargoManager.sqf.

// This function is started automatically while it is described as a library
// function in "config.cpp" file. While it is started as "postInit", passed
// arguments are [String:"postInit", Boolean:didJIP].

// Constants.
MCA_CargoManagerActionText = "<t color='#913E00'>" + "Cargo Manager" + "</t>";          // Brownish.
MCA_MoveObjectActionText = "<t color='#00EE00'>" + "Move" + "</t>";                     // Green.
MCA_PauseMovingObjectActionText = "<t color='#FFE500'>" + "Pause Moving" + "</t>";      // Yellow.
MCA_ResumeMovingObjectActionText = "<t color='#00EE00'>" + "Resume Moving" + "</t>";    // Green.
MCA_StopMovingObjectActionText = "<t color='#FF0000'>" + "Put It Here" + "</t>";        // Red.
MCA_vehClassNamesToFind = ["LandVehicle", "Ship", "Air", "Helicopter"];
MCA_vehSearchRadius = 30;
MCA_inaccuracyForFloatCoordinate = 0.1;
MCA_inaccuracyForFloatSpeed = 0.1;

// Variable Names.
MCA_CargoManagerVarName_managedVehicle = "MCA_CM_managedVehicle";
MCA_CargoManagerVarName_loadedObjects = "MCA_CM_loadedObjects";
MCA_CargoManagerVarName_nearbyObjects = "MCA_CM_nearbyObjects";
MCA_CargoManagerVarName_nearbyObjectsPositions = "MCA_CM_nearbyObjectsPositions";
MCA_CargoManagerVarName_movableObjects = "MCA_CM_movableObjects";
MCA_CargoManagerVarName_currentObject = "MCA_CM_currentObject";
MCA_CargoManagerVarName_objectUser = "MCA_CM_objectUser";
MCA_CargoManagerVarName_actionIdForResume = "MCA_CM_AIFR";
MCA_CargoManagerVarName_actionIdForPause = "MCA_CM_AIFP";

// Dialog Control IDs.
// These IDs are hard-coded in UI, see the 'ui\cargo_manager.hpp' file.
MCA_CargoManagerDialogCtrlId_TargetVehicle = 903;
MCA_CargoManagerDialogCtrlId_VehicleCargoList = 905;
MCA_CargoManagerDialogCtrlId_NearbyObjectsList = 908;

// Functions.
MCA_fn_getObjectDimensions = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_getObjectDimensions.sqf";
MCA_fn_compareObjectDimensions = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_compareObjectDimensions.sqf";
MCA_fn_getObjectDisplayName = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_getObjectDisplayName.sqf";
MCA_fn_openCargoManagerDialog = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_openCargoManagerDialog.sqf";
MCA_fn_initPlayer = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_initPlayer.sqf";
MCA_fn_getNearestVehiclesForCargoManagement = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_getNearestVehiclesForCargoManagement.sqf";
MCA_fn_getNearestObjectsForLoading = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_getNearestObjectsForLoading.sqf";
MCA_fn_moveCargo = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_moveCargo.sqf";
MCA_fn_getNearestStationaryVehicle = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_getNearestStationaryVehicle.sqf";
MCA_fn_isCargoMovementPossible = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_isCargoMovementPossible.sqf";
MCA_fn_arePositionsSame = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_arePositionsSame.sqf";
MCA_fn_isObjectTypeAllowed = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_isObjectTypeAllowed.sqf";
MCA_fn_getObjectDiagonal = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_getObjectDiagonal.sqf";
MCA_fn_getObjectActionRadius = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_getObjectActionRadius.sqf";
//
MCA_fn_initCargoManagerDialog = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_initCargoManagerDialog.sqf";
MCA_fn_refreshCargoManagerDialog = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_refreshCargoManagerDialog.sqf";
MCA_fn_finCargoManagerDialog = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_finCargoManagerDialog.sqf";
//
MCA_fn_addMovableObjectToPlayer = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_addMovableObjectToPlayer.sqf";
MCA_fn_deleteMovableObjectFromPlayer = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_deleteMovableObjectFromPlayer.sqf";
//
MCA_fn_getPlayerData = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_getPlayerData.sqf";
MCA_fn_savePlayerData = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_savePlayerData.sqf";
MCA_fn_deletePlayerData = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_deletePlayerData.sqf";
//
MCA_fn_onObjectMoveAction = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_onObjectMoveAction.sqf";
MCA_fn_onObjectPauseMovingAction = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_onObjectPauseMovingAction.sqf";
MCA_fn_onObjectResumeMovingAction = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_onObjectResumeMovingAction.sqf";
MCA_fn_onObjectStopMovingAction = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_onObjectStopMovingAction.sqf";

// Work.
call MCA_fn_initPlayer;
