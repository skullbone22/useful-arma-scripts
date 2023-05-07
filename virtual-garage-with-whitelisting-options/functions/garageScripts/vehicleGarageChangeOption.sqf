GlobalCurrentlistofVeh = [];
_garagedialogBoxControl = findDisplay 1234;
_displaylistControl = _garagedialogBoxControl displayCtrl 1500;
lbClear 1500;
{
    _cfg = configFile >> "Cfgvehicles" >> _x;
    _public = getNumber (_cfg >> "scope") == 2;
    _selectedvehicleArray = str(_cfg) splitstring "/";
	_selectedvehiclename = _selectedvehicleArray select 2;
    if (_x isKindOf GlobalGarageselected && _public) then {
        if((count VehicleGarageWhiteList) > 0) then {
			if(!(_selectedvehiclename in VehicleGarageWhiteList)) then{
				continue;
			};
		};
        GlobalCurrentlistofVeh pushBack _cfg;
        _displayname = gettext (_cfg >> "displayname");
        _DLC = gettext (_cfg >> "DLC");
        _icon = (gettext ( _cfg >> "picture" )) call BIS_fnc_texturevehicleIcon;
        _DLCicon = (gettext ( configFile >> "Cfgmods" >> _DLC >> "logoSmall" ));
        
        _newItem = _displaylistControl lbAdd _displayname;
        _displaylistControl lbsetData [_newItem, _x];
        _displaylistControl lbsetpicture [_newItem, _icon];
        _displaylistControl lbsetpictureRight [_newItem, _DLCicon];
    }
} forEach GlobalAllGarageVehs;