// Vehicle Service Point by Axe Cop

private ["_folder","_servicePointClasses","_maxDistance","_actionTitleFormat","_actionCostsFormat","_costsFree","_message","_messageShown","_refuel_enable","_refuel_costs","_refuel_updateInterval","_refuel_amount","_repair_enable","_repair_costs","_repair_repairTime","_rearm_enable","_rearm_costs","_rearm_magazineCount","_lastVehicle","_lastRole","_fnc_removeActions","_fnc_getCosts","_fnc_actionTitle","_fnc_isArmed","_fnc_getWeapons"];

// ---------------- CONFIG START ----------------

// -- Single Currency Prices -- //
_coinsRepairAir = 25000;
_coinsRepairVehicles = 20000;

_coinsRefuelVehicles = 5000;
_coinsRefuelAir = 5000;

_coinsRearmJET = 500000;
_coinsRearmTANK = 250000;

_coinsRearmAdvAir = 250000;

_coinsRearmAir = 25000;
_coinsRearmVehicles = 25000;

// -- End Single Currency Prices -- //

// general settings
_folder = "Scripts\service_point\"; // folder where the service point scripts are saved, relative to the mission file
_servicePointClasses = dayz_fuelpumparray; // service point classes (can be house, vehicle and unit classes)
_maxDistance = 35; // maximum distance from a service point for the options to be shown
_actionTitleFormat = "%1 (%2)"; // text of the vehicle menu, %1 = action name (Refuel, Repair, Rearm), %2 = costs (see format below)
_actionCostsFormat = "%2 %1"; // %1 = item name, %2 = item count
_costsFree = "free"; // text for no costs
_message = "Pull over, I need a Twinkie"; // message to be shown when in range of a service point (set to "" to disable)

// refuel settings
_dcav = "AllVehicles";
_refuel_enable = true; // enable or disable the refuel option
_refuel_costs = [
	[_dcav,[CurrencyName,_coinsRefuelVehicles]],
	["Air",[CurrencyName,_coinsRefuelAir]]];
_refuel_updateInterval = 1; // update interval (in seconds)
_refuel_amount = 0.015; // amount of fuel to add with every update (in percent)

// repair settings
_repair_enable = true; // enable or disable the repair option
_repair_costs = [
	["Air",[CurrencyName,_coinsRepairAir]], // 5 Gold for helicopters and planes
	[_dcav,[CurrencyName,_coinsRepairVehicles]] // 2 Gold for all other vehicles
];
_repair_repairTime = 2.5; // time needed to repair each damaged part (in seconds)

// rearm settings
_rearm_enable = true; // enable or disable the rearm option
_rearm_costs = [
	["F35B",[CurrencyName,_coinsRearmJET]], // special costs for a single vehicle type
	["A10",[CurrencyName,_coinsRearmJET]], // special costs for a single vehicle type
	["AV8B2",[CurrencyName,_coinsRearmJET]], // special costs for a single vehicle type
	["AV8B",[CurrencyName,_coinsRearmJET]], // special costs for a single vehicle type
	["su25_cdf",[CurrencyName,_coinsRearmJET]], // special costs for a single vehicle type
	["su25_ins",[CurrencyName,_coinsRearmJET]], // special costs for a single vehicle type
	["su39",[CurrencyName,_coinsRearmJET]], // special costs for a single vehicle type
	["su34",[CurrencyName,_coinsRearmJET]], // special costs for a single vehicle type
	["su25_tk_ep1",[CurrencyName,_coinsRearmJET]], // special costs for a single vehicle type
	["a10_us_ep1",[CurrencyName,_coinsRearmJET]], // special costs for a single vehicle type
	["l39_tk_ep1",[CurrencyName,_coinsRearmJET]], // special costs for a single vehicle type
	
	
	["Ah1Z",[CurrencyName,_coinsRearmAdvAir]], // special costs for a single vehicle type
	["KA52",[CurrencyName,_coinsRearmAdvAir]], // special costs for a single vehicle type
	["KA52Black",[CurrencyName,_coinsRearmAdvAir]], // special costs for a single vehicle type
	["Ah64D",[CurrencyName,_coinsRearmAdvAir]], // special costs for a single vehicle type
	["BAF_Apache_AH1_D",[CurrencyName,_coinsRearmAdvAir]], // special costs for a single vehicle type
	["mi24_v",[CurrencyName,_coinsRearmAdvAir]], // special costs for a single vehicle type
	["mi24_b",[CurrencyName,_coinsRearmAdvAir]], // special costs for a single vehicle type
	["mi24_p",[CurrencyName,_coinsRearmAdvAir]], // special costs for a single vehicle type
	["AW159_Lynx_BAF",[CurrencyName,_coinsRearmAdvAir]], // special costs for a single vehicle type
	["MI17_Rockets_RU",[CurrencyName,_coinsRearmAdvAir]], // special costs for a single vehicle type
	["ka60_GL_PMC",[CurrencyName,_coinsRearmAdvAir]], // special costs for a single vehicle type
	["AH6J_EP1",[CurrencyName,_coinsRearmAdvAir]], // special costs for a single vehicle type
	["UH1y",[CurrencyName,_coinsRearmAdvAir]], // special costs for a single vehicle type
	["AH6J_EP1",[CurrencyName,_coinsRearmAdvAir]], // special costs for a single vehicle type
	
	
	["m1a2_Tusk_Mg",[CurrencyName,_coinsRearmTANK]], // special costs for a single vehicle type
	["m1a2_US_Tusk_Mg_ep1",[CurrencyName,_coinsRearmTANK]], // special costs for a single vehicle type
	["t90",[CurrencyName,_coinsRearmTANK]], // special costs for a single vehicle type
	["m1a1_us_des_ep1",[CurrencyName,_coinsRearmTANK]], // special costs for a single vehicle type
	["M1A1",[CurrencyName,_coinsRearmTANK]], // special costs for a single vehicle type
	["Bmp3",[CurrencyName,_coinsRearmTANK]], // special costs for a single vehicle type
	["T72_RU",[CurrencyName,_coinsRearmTANK]], // special costs for a single vehicle type
	["T72_CDF",[CurrencyName,_coinsRearmTANK]], // special costs for a single vehicle type
	["T72_Gue",[CurrencyName,_coinsRearmTANK]], // special costs for a single vehicle type
	["T72_tk_ep1",[CurrencyName,_coinsRearmTANK]], // special costs for a single vehicle type
	["T72_INS",[CurrencyName,_coinsRearmTANK]], // special costs for a single vehicle type
	["BTR90",[CurrencyName,_coinsRearmTANK]], // special costs for a single vehicle type
	["m6_ep1",[CurrencyName,_coinsRearmTANK]], // special costs for a single vehicle type
	["hmmwv_avenger",[CurrencyName,_coinsRearmTANK]], // special costs for a single vehicle type
	
	["hmmwv_avenger_Des_ep1",[CurrencyName,_coinsRearmTANK]], // special costs for a single vehicle type
	["m2A2_ep1",[CurrencyName,_coinsRearmTANK]], // special costs for a single vehicle type
	["m2A3_ep1",[CurrencyName,_coinsRearmTANK]], // special costs for a single vehicle type
	["t55_tk_ep1",[CurrencyName,_coinsRearmTANK]], // special costs for a single vehicle type
	["t55_tk_gue_ep1",[CurrencyName,_coinsRearmTANK]], // special costs for a single vehicle type
	
	
	
	
	
	
	
	["Air",[CurrencyName,_coinsRearmAir]], // 2 10oz Gold for helicopters and planes
	[_dcav,[CurrencyName,_coinsRearmVehicles]] // 1 10oz Gold for all other vehicles
];
_rearm_magazineCount = 6; // amount of magazines to be added to the vehicle weapon

// ----------------- CONFIG END -----------------

execVM "Scripts\service_point\fnc_GetAllTurretPaths.sqf";

_lastVehicle = objNull;
_lastRole = [];

SP_refuel_action = -1;
SP_repair_action = -1;
SP_rearm_action = -1;

_messageShown = false;

_fnc_removeActions = {
	if (isNull _lastVehicle) exitWith {};
	_lastVehicle removeAction SP_refuel_action;
	SP_refuel_action = -1;
	_lastVehicle removeAction SP_repair_action;
	SP_repair_action = -1;
	_lastVehicle removeAction SP_rearm_action;
	SP_rearm_action = -1;
	_lastVehicle = objNull;
	_lastRole = [];
};

_fnc_getCosts = {
	private ["_vehicle","_costs","_cost"];
	_vehicle = _this select 0;
	_costs = _this select 1;
	_cost = [];
	{
		private "_typeName";
		_typeName = _x select 0;
		if (_vehicle isKindOf _typeName) exitWith {
			_cost = _x select 1;
		};
	} forEach _costs;
	_cost
};

_fnc_actionTitle = {
	private ["_actionName","_costs","_costsText","_actionTitle"];
	_actionName = _this select 0;
	_costs = _this select 1;
	_costsText = _costsFree;
	if (count _costs == 2) then {
		private ["_itemName","_itemCount","_displayName"];
		_itemName = _costs select 0;
		_itemCount = _costs select 1;
		_displayName = _itemName;
		_costsText = format [_actionCostsFormat, _displayName, _itemCount];
	};
	_actionTitle = format [_actionTitleFormat, _actionName, _costsText];
	_actionTitle
};

_fnc_isArmed = {
	private ["_role","_armed"];
	_role = _this;
	_armed = count _role > 1;
	_armed
};

_fnc_getWeapons = {
	private ["_vehicle","_role","_weapons"];
	_vehicle = _this select 0;
	_role = _this select 1;
	_weapons = [];
	if (count _role > 1) then {
		private ["_turret","_weaponsTurret"];
		_turret = _role select 1;
		_weaponsTurret = _vehicle weaponsTurret _turret;
		{
			private "_weaponName";
			_weaponName = getText (configFile >> "CfgWeapons" >> _x >> "displayName");
			_weapons set [count _weapons, [_x, _weaponName, _turret]];
		} forEach _weaponsTurret;
	};
	_weapons
};

while {true} do {
	private ["_vehicle","_inVehicle"];
	_vehicle = vehicle player;
	_inVehicle = _vehicle != player;
	if (local _vehicle && _inVehicle) then {
		private ["_pos","_servicePoints","_inRange"];
		_pos = getPosATL _vehicle;
		_servicePoints = (nearestObjects [_pos, _servicePointClasses, _maxDistance]) - [_vehicle];
		_inRange = count _servicePoints > 0;
		if (_inRange) then {
			private ["_servicePoint","_role","_actionCondition","_costs","_actionTitle"];
			_servicePoint = _servicePoints select 0;
			if (assignedDriver _vehicle == player) then {
				_role = ["Driver", [-1]];
			} else {
				_role = assignedVehicleRole player;
			};
			if (((str _role) != (str _lastRole)) || (_vehicle != _lastVehicle)) then {
				// vehicle or seat changed
				call _fnc_removeActions;
			};
			_lastVehicle = _vehicle;
			_lastRole = _role;
			_actionCondition = "vehicle _this == _target && local _target";
			if (SP_refuel_action < 0 && _refuel_enable) then {
				_costs = [_vehicle, _refuel_costs] call _fnc_getCosts;
				_actionTitle = ["Refuel", _costs] call _fnc_actionTitle;
				SP_refuel_action = _vehicle addAction [_actionTitle, _folder + "service_point_refuel.sqf", [_servicePoint, _costs, _refuel_updateInterval, _refuel_amount], -1, false, true, "", _actionCondition];
			};
			if (SP_repair_action < 0 && _repair_enable) then {
				_costs = [_vehicle, _repair_costs] call _fnc_getCosts;
				_actionTitle = ["Repair", _costs] call _fnc_actionTitle;
				SP_repair_action = _vehicle addAction [_actionTitle, _folder + "service_point_repair.sqf", [_servicePoint, _costs, _repair_repairTime], -1, false, true, "", _actionCondition];
			};
			if (SP_rearm_action < 0 && _rearm_enable && (_role call _fnc_isArmed)) then {
				_costs = [_vehicle, _rearm_costs] call _fnc_getCosts;
				_actionTitle = ["Rearm", _costs] call _fnc_actionTitle;
				SP_rearm_action = _vehicle addAction [_actionTitle, _folder + "service_point_rearm.sqf", [_servicePoint, _costs, _rearm_magazineCount], -1, false, true, "", _actionCondition];
			};
			if (!_messageShown && _message != "") then {
				_messageShown = true;
				_vehicle vehicleChat _message;
			};
		} else {
			call _fnc_removeActions;
			_messageShown = false;
		};
	} else {
		call _fnc_removeActions;
		_messageShown = false;
	};
	sleep 2;
};