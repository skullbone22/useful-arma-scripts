
publicVariable "VehicleGarageWhiteList";

if(isNil "VehicleGarageWhiteList") then{
	VehicleGarageWhiteList = [];
};

call garageScripts_fnc_vehicleGarageOpen;