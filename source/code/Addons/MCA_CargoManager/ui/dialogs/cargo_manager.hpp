// cargo_manager.hpp.

// Documentation: 
// https://community.bistudio.com/wiki/Arma:_GUI_Configuration

class MCA_CargoManagerDialog
{
	idd = 9001;

	movingEnable = true;
	enableSimulation = true;
	
	onLoad = "";
	onUnload = "_this call MCA_fn_finCargoManagerDialog";

	class ControlsBackground
	{
		class DialogBG: IGUIBack
		{
			idc = 900;
			moving = true;
			x = 0 * GUI_GRID_W + GUI_GRID_X;
			y = 0 * GUI_GRID_H + GUI_GRID_Y;
			w = 40 * GUI_GRID_W;
			h = 25 * GUI_GRID_H;
			colorBackground[] = {0.5,0.5,0.5,0.5};
		};
	};

	class Controls
	{
		// Top Header.
		// Target Vehicle and Cancel Button.
		class HeaderFrame: RscFrame
		{
			idc = 901;
			moving = true;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 38 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class TargetVehicleLabel: RscText
		{
			idc = 902;
			moving = true;
			text = "TARGET VEHICLE";
			x = 1.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 7 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class TargetVehicleName: RscText
		{
			idc = 903;
			moving = true;
			text = "...";
			x = 9.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 24 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class CancelButton: RscButton
		{
			text = "QUIT";
			idc = 2; // 2 = Cancel.
			moving = true;
			x = 33.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			colorText[] =				{1.0, 1.0, 1.0, 1.0};
			colorBackground[] =			{1.0, 0.1, 0.1, 0.5};
			colorFocused[] =			{1.0, 0.1, 0.1, 0.7};
			colorBackgroundActive[] =	{1.0, 0.1, 0.1, 1.0};
			tooltip = "Press this button to exit the dialog window";
		};
		
		
		// Left Column.
		// Vehicle Cargo List and Unload Button.
		class VehicleCargoLabel: RscText
		{
			idc = 904;
			moving = true;
			text = "VEHICLE CARGO";
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 18 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class VehicleCargoList: RscListbox
		{
			idc = 905;
			moving = true;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 18 * GUI_GRID_W;
			h = 15 * GUI_GRID_H;
		};
		class UnloadButton: RscButton
		{
			text = "UNLOAD THE SELECTED CARGO";
			idc = 906;
			moving = true;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 18 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			colorBackground[] =			{0.1, 1.0, 0.1, 0.5};
			colorFocused[] =			{0.1, 1.0, 0.1, 0.7};
			colorBackgroundActive[] =	{0.1, 1.0, 0.1, 1.0};
			
			// Action IDs: 1 = Load, 2 = Unload.
			onButtonClick = "[2, lbCurSel 905] call MCA_fn_moveCargo; _this call MCA_fn_refreshCargoManagerDialog;";
		};
		
		
		// Right Column.
		// Nearby Objects List and Load Button.
		class NearbyObjectsLabel: RscText
		{
			idc = 907;
			moving = true;
			text = "OBJECTS READY FOR LOADING";
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 18 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class NearbyObjectsList: RscListbox
		{
			idc = 908;
			moving = true;
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 18 * GUI_GRID_W;
			h = 15 * GUI_GRID_H;
		};
		class LoadButton: RscButton
		{
			text = "LOAD THE SELECTED OBJECT";
			idc = 909;
			moving = true;
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 18 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			colorBackground[] =			{0.1, 0.1, 1.0, 0.5};
			colorFocused[] =			{0.1, 0.1, 1.0, 0.7};
			colorBackgroundActive[] =	{0.1, 0.1, 1.0, 1.0};
			
			// Action IDs: 1 = Load, 2 = Unload.
			onButtonClick = "[1, lbCurSel 908] call MCA_fn_moveCargo; _this call MCA_fn_refreshCargoManagerDialog;";
		};
	};
};
