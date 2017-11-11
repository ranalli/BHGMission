// Vehicle Service Point (Rearm) by Axe Cop

private ["_vehicle","_args","_servicePoint","_costs","_magazineCount","_weapon","_type","_name","_weaponType","_weaponName","_turret","_magazines","_ammo","_textMissing"];

_vehicle = _this select 0;
if (!local _vehicle) exitWith { diag_log format["Error: called service_point_rearm.sqf with non-local vehicle: %1", _vehicle] };

_args = _this select 3;
_servicePoint = _args select 0;
_costs = _args select 1;
_magazineCount = _args select 2;

//if !([_costs] call player_checkAndRemoveItems) exitWith {};
if !([ player,_costs select 1] call SC_fnc_removeCoins) then {
	_textMissing = _costs select 0 ;
	_player_money = player getVariable ["cashMoney",0];
	_repair_cost = _costs select 1;
	_needed = _repair_cost - _player_money;
	cutText [format["You need another %1 %2",_needed,CurrencyName] , "PLAIN DOWN"];
} else {
	_vehicle setVehicleAmmo 1;	// Reload turrets / drivers magazine

	_type_name = typeOf _vehicle;
	_type = typeof _vehicle;
	
	_magazines = getArray(configFile >> "CfgVehicles" >> _type >> "magazines");

	if (count _magazines > 0) then {
		_removed = [];
		{
			if (!(_x in _removed)) then {
				_vehicle removeMagazines _x;
				_removed set [count _removed, _x];
			};
		} forEach _magazines;
		{
			sleep x_reload_time_factor;
			if (!alive _vehicle) exitWith {};
			_vehicle addMagazine _x;
		} forEach _magazines;
	};

	_count = count (configFile >> "CfgVehicles" >> _type >> "Turrets");

	if (_count > 0) then {
		for "_i" from 0 to (_count - 1) do {
			scopeName "xx_reload2_xx";
			_config = (configFile >> "CfgVehicles" >> _type >> "Turrets") select _i;
			_magazines = getArray(_config >> "magazines");
			_removed = [];
			{
				if (!(_x in _removed)) then {
					_vehicle removeMagazines _x;
					_removed set [count _removed, _x];
				};
			} forEach _magazines;
			{
				if (!alive _vehicle) then {breakOut "xx_reload2_xx"};
				_vehicle addMagazine _x;
				if (!alive _vehicle) then {breakOut "xx_reload2_xx"};
			} forEach _magazines;
			// check if the main turret has other turrets
			_count_other = count (_config >> "Turrets");
			// this code doesn't work, it's not possible to load turrets that are part of another turret :(
			// nevertheless, I leave it here
			if (_count_other > 0) then {
				for "_i" from 0 to (_count_other - 1) do {
					_config2 = (_config >> "Turrets") select _i;
					_magazines = getArray(_config2 >> "magazines");
					_removed = [];
					{
						if (!(_x in _removed)) then {
							_vehicle removeMagazines _x;
							_removed set [count _removed, _x];
						};
					} forEach _magazines;
					{
						if (!alive _vehicle) then {breakOut "xx_reload2_xx"};
						_vehicle addMagazine _x;
						if (!alive _vehicle) then {breakOut "xx_reload2_xx"};
					} forEach _magazines;
				};
			};
		};
	};
	_vehicle setVehicleAmmo 1;	// Reload turrets / drivers magazine
	
	titleText [format["Rearm Complete"], "PLAIN DOWN"];
};
