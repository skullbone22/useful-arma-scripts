
class garageSpawnerUi {
	idd = 1234;

	class controls {

		class vehicle_list: RscListbox
		{
			idc = 1500;
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0.22 * safezoneW;
			h = 1 * safezoneH;
			onLBSelChanged = "_scriptHandle = [] execVM 'functions\garageScripts\vehicleGarageSelect.sqf'"
		};
		class btn_land: RscButton
		{
			idc = 1600;
			text = "Land"; //--- ToDo: Localize;
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "GlobalGarageSelected = 'Car';_scriptHandle = [] execVM 'functions\garageScripts\vehicleGarageChangeOption.sqf'"
		};
		class btn_water: RscButton
		{
			idc = 1601;
			text = "Tanks"; //--- ToDo: Localize;
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "GlobalGarageSelected = 'Tank';_scriptHandle = [] execVM 'functions\garageScripts\vehicleGarageChangeOption.sqf'"

		};
		class btn_heli: RscButton
		{
			idc = 1602;
			text = "Helicopters"; //--- ToDo: Localize;
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "GlobalGarageSelected = 'Helicopter';_scriptHandle = [] execVM 'functions\garageScripts\vehicleGarageChangeOption.sqf'"

		};
		class btn_plane: RscButton
		{
			idc = 1603;
			text = "Planes"; //--- ToDo: Localize;
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "GlobalGarageSelected = 'Plane';_scriptHandle = [] execVM 'functions\garageScripts\vehicleGarageChangeOption.sqf'"

		};
		class btn_static: RscButton
		{
			idc = 1604;
			text = "Naval"; //--- ToDo: Localize;
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "GlobalGarageSelected = 'Ship';_scriptHandle = [] execVM 'functions\garageScripts\vehicleGarageChangeOption.sqf'"
		};
		class btn_other: RscButton
		{
			idc = 1604;
			text = "Static"; //--- ToDo: Localize;
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.33 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "GlobalGarageSelected = 'StaticWeapon';_scriptHandle = [] execVM 'functions\garageScripts\vehicleGarageChangeOption.sqf'"
		};
		class btn_spawn: RscButton
		{
			idc = 1605;
			text = "Spawn"; //--- ToDo: Localize;
			x = 0.891875 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.055 * safezoneH;
			action = "_scriptHandle = [] execVM 'functions\garageScripts\vehicleGarageSpawn.sqf'";
			// action = "GlobalCameraVar cameraEffect ['terminate', 'back']; closeDialog 2;";
		};
	};
};