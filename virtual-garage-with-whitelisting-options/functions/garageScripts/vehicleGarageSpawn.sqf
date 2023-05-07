_spawnTempMarker = "garageTempspawn";
_spawnGroundMarker = "garageGroundspawn";
_spawnPlaneMarker = "garagePlanespawn";
_spawnStaticMarker = "garageStaticspawn";
_spawnWaterMarker = "garageWaterspawn";
_spawnHeliMarker = "garageHelispawn";

_spawnedvehiclePoisition = getmarkerPos _spawnTempMarker;
_veh_list = (_spawnedvehiclePoisition) nearEntities 12;
{
    deletevehicle _x;
} forEach _veh_list;

_selectedindex = lbCurSel 1500;
_allVehs = GlobalAllGarageVehs;

if (_selectedindex != -1) then {
    _selectedvehicle = str(GlobalCurrentlistofVeh select _selectedindex);
    _selectedvehicleArray = _selectedvehicle splitstring "/";
    _selectedvehiclename = _selectedvehicleArray select 2;
    
    switch (true) do {
        case (_selectedvehiclename isKindOf "Ship") : {
            uiNamespace setVariable [ "spawn_location", _spawnWaterMarker ]
        };
        case (_selectedvehiclename isKindOf "StaticWeapon") : {
            uiNamespace setVariable [ "spawn_location", _spawnStaticMarker ]
        };
        case (_selectedvehiclename isKindOf "Plane") : {
            uiNamespace setVariable [ "spawn_location", _spawnPlaneMarker ]
        };
        case (_selectedvehiclename isKindOf "Helicopter") : {
            uiNamespace setVariable [ "spawn_location", _spawnHeliMarker ]
        };
        default {
            uiNamespace setVariable [ "spawn_location", _spawnGroundMarker ]
        };
    };
    
    _spawn_location_veh = (getmarkerPos (uiNamespace getVariable "spawn_location" )) nearEntities 8;
    {
        deletevehicle _x;
    } forEach _spawn_location_veh;
    
    sleep 0.1;
    _spawn_location_marker = uiNamespace getVariable "spawn_location";
    
    _new_veh = _selectedvehiclename createvehicle(getmarkerPos _spawn_location_marker);
} else {
    hint "You need to make a selection";
};
GlobalCameraVar cameraEffect ['terminate', 'back'];
closedialog 2;