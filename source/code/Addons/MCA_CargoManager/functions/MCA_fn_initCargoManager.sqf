// MCA_fn_initCargoManager.sqf.

// This funcion is started automatically while it is described as a library
// function in "config.cpp" file. While it is started as "postInit", passed
// arguments are [String:"postInit", Boolean:didJIP].

// Constants.
MCA_CargoManagerActionText = "Cargo Manager";
MCA_vehClassNamesToFind = ["LandVehicle", "Ship", "Air", "Helicopter"];
MCA_objectsForLoadingToFind = ["LandVehicle", "Ship", "Air", "Helicopter", "WeaponHolder", "WeaponHolderSimulated"];
MCA_vehSearchRadius = 30;

// Variable Names.
MCA_CargoManagerVarName_managedVehicle = "MCA_CM_managedVehicle";
MCA_CargoManagerVarName_objectsLoaded = "MCA_CM_objectsLoaded";
MCA_CargoManagerVarName_objectsNearby = "MCA_CM_objectsNearby";

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
MCA_fn_getNearestObjectForLoading = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_getNearestObjectForLoading.sqf";
MCA_fn_moveCargo = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_moveCargo.sqf";
MCA_fn_initCargoManagerDialog = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_initCargoManagerDialog.sqf";
MCA_fn_refreshCargoManagerDialog = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_refreshCargoManagerDialog.sqf";
MCA_fn_finCargoManagerDialog = compile preprocessFileLineNumbers "MCA_CargoManager\functions\MCA_fn_finCargoManagerDialog.sqf";

// Work.
call MCA_fn_initPlayer;
