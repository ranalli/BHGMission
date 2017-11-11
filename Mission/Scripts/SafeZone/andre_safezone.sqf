if (hasInterface) then {
	//MAP SAFEZONES (READY FOR CHERNARUS)
	donn_traders = [
		["Safe 1",[4063.4226,11664.19,0],160,500],
		["Safe 2",[11447.472,11364.504,0],160,500],
		["Safe 3",[12890.1,4462.49,0.],160,500]
		
	];
	waitUntil {uiSleep 0.5;!isNil "PVDZE_plr_LoginRecord"};
	inSafeZone = false;
	donn_InSafeZone = false;
	donn_canbuild = true;
	donn_incarWas = [];
	donn_inSafeCounter = 0;
	donn_vehicle_handleDamage = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\vehicle_handleDamage.sqf";
	vehicle_handleDamage_timer = 0;
	vehicle_handleDamage = {
		_owner = (_this select 0) getVariable ["don_owner",objNull];
		_hasOwner = !isNull _owner;
		if (_hasOwner) then {
			if (time - vehicle_handleDamage_timer > 2) then {
				vehicle_handleDamage_timer = time;
				systemChat "This vehicle have God Mode!";
			};
		} else {
			_this call donn_vehicle_handleDamage;				
		};
	};
	
	//SAFEZONE PROXIMITY CHECK FUNCTION
	donn_calcSafe = {
		private ["_tName","_tPos","_tRad"];
		_obj = _this select 0;
		_radNumber = 1 + (_this select 1);
		_minDist = 100000;
		{
			_safePos = _x select 1;
			_safeRad = _x select _radNumber;
			_dist = (_obj distance _safePos) - _safeRad;
			if (_dist < _minDist) then {
				_minDist = _dist;
				_tName = _x select 0;
				_tPos = _x select 1;
				_tRad = _safeRad;
			};
		} forEach donn_traders;
		[_minDist,_tName,_tPos,_tRad]
	};

	//SAFEZONE ENTER AND EXIT
	[] spawn {
		_maxVel = 80;
		while {true} do {
			//CHECK IF IN SAFE
			_result = [player,1] call donn_calcSafe;_minDist = _result select 0;
			while {_minDist > 0} do {
				uiSleep (((_minDist/_maxVel) max 1) min 10);
				_result = [player,1] call donn_calcSafe;
				_minDist = _result select 0;
			};
			
			//SAFE ON
			donn_InSafeZone = true;
			donn_inSafeCounter = donn_inSafeCounter + 1;
			systemChat "You are in the Safe Zone...";
			player_zombieCheck = {};
			fnc_usec_unconscious = {};
			fnc_usec_damageHandler_timer = 0;
			fnc_usec_damageHandler = {
				_attacker = _this select 3;
				if (!isNull _attacker) then {
					if (isPlayer _attacker) then {
						if (time - fnc_usec_damageHandler_timer > 2) then {
							fnc_usec_damageHandler_timer = time;
							[nil,_attacker,"loc",rHINT,"This player have God Mode!"] call RE;
						};
					};
				};
				_damage = 0;
				_damage
			};
			player_fired = {deleteVehicle (_this select 6);};
			player setCaptive true;
			inSafeZone = true; //INFISTAR FIRED EH RELATED
			_veh = vehicle player;
			if (_veh != player) then {
				donn_incarWas = donn_incarWas + [_veh];
				_veh addEventHandler ["Fired",{deleteVehicle (_this select 6);}];
				if (player == driver _veh) then {
					_veh setVariable ['don_owner',driver _veh,true];
				};
			};
			
			//CHECK IF LEAVED FROM SAFE
			_tPos = _result select 2;
			_tRad = _result select 3;
			_dist = player distance _tPos;
			while {_dist < _tRad} do {
				uiSleep 1;
				_dist = player distance _tPos;
			};

			//LEAVED SAFE
			donn_InSafeZone = false;
			systemChat "You leaved the Safe Zone...";
			donn_inSafeCounter spawn {
				_inSafeIndex = _this;
				_unGod = true;
				for "_c" from 0 to 5 do {
					_sleep = 10;
					if (vehicle player != player) then {_sleep = 5;};
					systemChat ("God Mode ends in " + str (_sleep*6-_c*_sleep) + "/" + str (_sleep*6) + " seconds.");
					uiSleep _sleep;
					if (donn_InSafeZone || _inSafeIndex != donn_inSafeCounter) exitWith {
						_unGod = false;
					};
				};
				if (_unGod) then {
					systemChat "God Mode ended!";
					player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
					fnc_usec_unconscious = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";
					fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
					player_fired = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_fired.sqf";
					player setCaptive false;
					inSafeZone = false; //INFISTAR FIRED EH RELATED
					{
						_x removeAllEventHandlers "Fired";
						_inSafe = ([_x,1] call donn_calcSafe) select 0 < 0;
						if (!_inSafe) then {
							_ownerSet = !isNull (_x getVariable ['don_owner',objNull]);
							if (_ownerSet) then {
								_x setVariable ['don_owner',objNull,true];
							};
						};
					} forEach donn_incarWas;
					donn_incarWas = [];
				};
			};
		};
	};
	
	//IN BUILD ZONE CHECK
	[] spawn {
		_maxVel = 50;
		while {true} do {
			_result = [player,2] call donn_calcSafe;
			_minDist = _result select 0;
			while {_minDist > 0} do {
				uiSleep (((_minDist/_maxVel) max 2) min 10);
				_result = [player,2] call donn_calcSafe;
				_minDist = _result select 0;
			};
			donn_canbuild = false;
			systemChat "Your are in the NoBuild zone...";
			_tPos = _result select 2;
			_tRad = _result select 3;
			_dist = player distance _tPos;
			while {_dist < _tRad} do {
				uiSleep 2;
				_dist = player distance _tPos;
			};
			donn_canbuild = true;
			systemChat "You leaved the NoBuild zone...";
		};
	};
	
	//ENTERING VEHICLES PROTECTION
	don_incar = false;
	[] spawn {
		while {true} do {
			waitUntil {uiSleep 1;don_player_veh = vehicle player;don_player_veh != player};
			don_incar = true;
			don_player_veh_isAir = don_player_veh isKindOf "Air"; //NOT NECESSARY
			if (donn_InSafeZone) then {
				_don_veh_owner = don_player_veh getVariable ['don_owner',objNull];
				if (isNull _don_veh_owner) then {
					don_player_veh setVariable ['don_owner',player,true];
					_don_veh_owner = player;
				};
				_ownerGroup = units group _don_veh_owner;
				_ownerGroupTag = _don_veh_owner getVariable ["friendlies",[]];
				_playerID = player getVariable ["CharacterID","0"];
				if (player in _ownerGroup || _playerID in _ownerGroupTag) then {
					if !(don_player_veh in donn_incarWas) then {
						donn_incarWas = donn_incarWas + [don_player_veh];
						don_player_veh addEventHandler ["Fired",{deleteVehicle (_this select 6);}];
					};
				} else {
					player action ['getOut', don_player_veh];
				};
			};
			waitUntil {uiSleep 1; vehicle player != don_player_veh};
			don_incar = false;
		};
	};
	
	//GEAR PROTECTION
	[] spawn {
		while {true} do {
			_playerID = player getVariable ["CharacterID",0];
			if (donn_InSafeZone) then {
				if (!don_incar) then {
					//CHECK NEAR PLAYERS AND VEHICLES
					_nearP = [];_nearV = [];
					{
						if (isPlayer _x && _x != player) then {_nearP = _nearP + [_x];};
					} forEach (player nearEntities ['CAManBase',4]);
					_countNear = count _nearP;
					{
						if (player distance _x < ((sizeOf typeOf _x)/2) + 3) then {_nearV = _nearV + [_x];};
					} forEach (player nearEntities [['LandVehicle','Air','Ship'],25]);
					_countNear = _countNear + count _nearV;
					//CHECK IF ALL ARE FRIENDLY
					_friends = units group player;
					if (_countNear > 0) then {
						_countNearF = {_x in _friends || _playerID in (_x getVariable ["friendlies",[]])} count _nearP;
						_countNearF = _countNearF + ({_owner = _x getVariable ['don_owner',objNull];_owner in _friends || _playerID in (_owner getVariable ["friendlies",[]])} count _nearV);
						if (_countNear > _countNearF && !isNull findDisplay 106) then {
							(findDisplay 106) closedisplay 0;
							closeDialog 0;closeDialog 0;closeDialog 0;
							cutText [format['%1. You is near a stranger player or vehicle and cant access gear now.',name player],'PLAIN'];
						};
					};
				};
				uiSleep 0.25;
			} else {
				uiSleep 2;
			};
		};
	};
	
	//LOG INFO
	diag_log "[ANDRE SAFEZONES] SCRIPT LOADED OK!";
};