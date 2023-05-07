
_locationSpawnTemp = "garageTempSpawn";
_spawnedVehiclePoisition = getMarkerPos _locationSpawnTemp;

_selectedIndex = lbCurSel 1500;
_allVehs = GlobalAllGarageVehs; 

_veh_list = ( _spawnedVehiclePoisition ) nearEntities 12;
{
	deleteVehicle _x;
} forEach _veh_list;

sleep 0.2;

_selectedVehicle = str(GlobalCurrentListOfVeh select _selectedIndex);
_selectedVehicleArray = _selectedVehicle splitString "/";
_selectedVehicleName = _selectedVehicleArray select 2;

_new_veh = _selectedVehicleName createVehicle(_spawnedVehiclePoisition);


