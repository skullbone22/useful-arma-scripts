
disableSerialization;

// allVariables
_spawnVehVarName = "testVeh";
_locationSpawnTemp = "garageTempSpawn";

_PaidDLC = ["Contact", "Expansion", "Jets","Enoch","Orange","Heli","Tanks","Karts"];

_spawnedVehicleObject = missionNamespace getVariable _spawnVehVarName;
_spawnedVehiclePoisition = getMarkerPos _locationSpawnTemp;


_veh_list = ( _spawnedVehiclePoisition ) nearEntities 8;
{
	deleteVehicle _x;
} forEach _veh_list;

_newVehiclePosition = [];
{
	_newVehiclePosition pushBack (_x + 7);
} forEach _spawnedVehiclePoisition;

_camera = "camera" camCreate _newVehiclePosition;

_camera camSetTarget _spawnedVehiclePoisition;
_camera camPrepareFov 0.7;
_camera camCommitPrepared 0;
_camera camCommit 0;
_camera cameraEffect ["internal", "back"];
showCinemaBorder false;

GlobalCameraVar = _camera;
publicVariable "GlobalCameraVar";



createDialog "garageSpawnerUi";
_garageDialogBoxControl = findDisplay 1234;
waitUntil { !isNull _garageDialogBoxControl };
_garageDialogBoxControl displayAddEventHandler ["Unload", { GlobalCameraVar cameraEffect ["terminate", "back"];}];

_garageDialogBoxControl displayAddEventHandler ["MouseZChanged", {
	params ["_displayOrControl", "_scroll"];
	if(_scroll < 0) then {
		GlobalCameraVar camPrepareFov 1.2;
	}
	else{
		GlobalCameraVar camPrepareFov 0.4;
	};
	GlobalCameraVar camCommit 0.5;
}];

GlobalGarageSelected = "Car";
publicVariable "GlobalGarageSelected";

_displayListControl = _garageDialogBoxControl displayCtrl 1500;


GlobalAllGarageVehs = (configfile >> "CfgVehicles") call BIS_fnc_getCfgSubClasses;
publicVariable "GlobalAllGarageVehs";

GlobalCurrentListOfVeh = [];
publicVariable "GlobalCurrentListOfVeh";

{

	_cfg = configfile >> "CfgVehicles" >> _x;
	_public = getNumber ( _cfg >> "scope" ) == 2;

	_selectedvehicleArray = str(_cfg) splitstring "/";
	_selectedvehiclename = _selectedvehicleArray select 2;


	if (_x isKindOf GlobalGarageSelected && _public) then {
		if((count VehicleGarageWhiteList) > 0) then {
			if(!(_selectedvehiclename in VehicleGarageWhiteList)) then{
				continue;
			};
		};
		GlobalCurrentListOfVeh pushBack _cfg;
		_displayName = getText ( _cfg >> "displayName" );
		_DLC =  getText ( _cfg >> "DLC" );
		_icon = ( getText ( _cfg >> "picture" ) ) call BIS_fnc_textureVehicleIcon;
		_DLCicon = (getText ( configfile >> "CfgMods" >> _DLC >> "logoSmall" ));
					
		_newItem = _displayListControl lbAdd _displayName;
		_displayListControl lbSetData [_newItem, _x];
		_displayListControl lbSetPicture [_newItem, _icon];
		_displayListControl lbSetPictureRight [_newItem, _DLCicon];
	}
}foreach GlobalAllGarageVehs;

