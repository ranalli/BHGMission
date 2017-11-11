[] execVM "\z\addons\dayz_server\init\AH.sqf";
waituntil {!isnil "bis_fnc_init"};

//DB
"extDB" callExtension "9:DATABASE:Database2";
"extDB" callExtension format["9:ADD:DB_RAW_V2:%1",1];
"extDB" callExtension "9:LOCK";

BIS_Effects_Burn = {};
server_playerLogin = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_playerLogin.sqf";
server_playerSetup = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_playerSetup.sqf";
server_onPlayerDisconnect = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_onPlayerDisconnect.sqf";
server_updateObject = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_updateObject.sqf";
server_playerDied = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_playerDied.sqf";
server_publishObj = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_publishObject.sqf";
server_deleteObj = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_deleteObj.sqf";
server_swapObject = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_swapObject.sqf"; 
server_publishVeh = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_publishVehicle.sqf";
server_publishVeh2 = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_publishVehicle2.sqf";
server_publishVeh3 = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_publishVehicle3.sqf";
server_tradeObj = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_tradeObject.sqf";
server_traders = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_traders.sqf";
server_playerSync = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_playerSync.sqf";
server_spawnCrashSite = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_spawnCrashSite.sqf";
server_spawnEvents = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_spawnEvent.sqf";
fnc_plyrHit = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\fnc_plyrHit.sqf";
fnc_remWepSG = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\fnc_remWepSG.sqf";
fnc_remThermal = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\fnc_remThermal.sqf";
server_deaths = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_playerDeaths.sqf";
server_maintainArea = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_maintainArea.sqf";
server_queryGarageVehicle = 	compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\garage\server_queryGarageVehicle.sqf";
server_spawnVehicle = 	compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\garage\server_spawnVehicle.sqf";
server_storeVehicle = 	compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\garage\server_storeVehicle.sqf";
server_plotArray = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_plotArray.sqf";
server_queryplotArray = 	compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_queryPlotArray.sqf";
server_deletePlotArray =    compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_deletePlotArray.sqf";
fn_asyncCall = 	compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\garage\fn_async.sqf";

server_sendToClient = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_sendToClient.sqf";

#include "\z\addons\dayz_server\bankzones\bankinit.sqf"

onPlayerDisconnected {[_uid,_name] call server_onPlayerDisconnect;};

server_updateNearbyObjects = {
	private["_pos"];

	_pos = _this select 0;
	{
		[_x, "gear"] call server_updateObject;
	} count nearestObjects [_pos, dayz_updateObjects, 10];
};

server_handleZedSpawn = {
	private["_zed"];

	_zed = _this select 0;
	_zed enableSimulation false;
};

zombie_findOwner = {
	private["_unit"];

	_unit = _this select 0;
	#ifdef DZE_SERVER_DEBUG
	diag_log ("CLEANUP: DELETE UNCONTROLLED ZOMBIE: " + (typeOf _unit) + " OF: " + str(_unit) );
	#endif
	deleteVehicle _unit;
};

vehicle_handleInteract = {
	private["_object"];

	_object = _this select 0;
	needUpdate_objects = needUpdate_objects - [_object];
	[_object, "all"] call server_updateObject;
};

array_reduceSizeReverse = {
	private["_array","_count","_num","_newarray","_startnum","_index"];

	_array = _this select 0;
	_newarray = [];
	_count = _this select 1;
	_num = count _array;
	if (_num > _count) then {
		_startnum = _num - 1;
		_index = _count - 1;
		for "_i" from 0 to _index do {
			_newarray set [(_index-_i),_array select (_startnum - _i)];
		};
		_array = _newarray;
	}; 
	_array
};

array_reduceSize = {
	private ["_array1","_array","_count","_num"];

	_array1 = _this select 0;
	_array = _array1 - ["Hatchet_Swing","Machete_Swing","Fishing_Swing","sledge_swing","crowbar_swing","CSGAS"];
	_count = _this select 1;
	_num = count _array;
	if (_num > _count) then {
		_array resize _count;
	};
	_array
};

object_handleServerKilled = {
	private["_unit","_objectID","_objectUID","_killer"];
	
	_unit = _this select 0;
	_killer = _this select 1;
	_objectID = _unit getVariable ["ObjectID","0"];
	_objectUID = _unit getVariable ["ObjectUID","0"];
	[_objectID,_objectUID,_killer] call server_deleteObj;
	_unit removeAllMPEventHandlers "MPKilled";
	_unit removeAllEventHandlers "Killed";
	_unit removeAllEventHandlers "HandleDamage";
	_unit removeAllEventHandlers "GetIn";
	_unit removeAllEventHandlers "GetOut";
};

check_publishobject = {
	private["_allowed","_object","_playername"];

	_object = _this select 0;
	_playername = _this select 1;
	_allowed = false;

	if ((typeOf _object) in dayz_allowedObjects) then {
		_allowed = true;
	};
    _allowed
};

eh_localCleanup = {
	private ["_object"];

	_object = _this select 0;
	_object addEventHandler ["local", {

		if(_this select 1) then {
			private["_type","_unit"];
			_unit = _this select 0;
			_type = typeOf _unit;
			_myGroupUnit = group _unit;
 			_unit removeAllMPEventHandlers "mpkilled";
 			_unit removeAllMPEventHandlers "mphit";
 			_unit removeAllMPEventHandlers "mprespawn";
 			_unit removeAllEventHandlers "FiredNear";
			_unit removeAllEventHandlers "HandleDamage";
			_unit removeAllEventHandlers "Killed";
			_unit removeAllEventHandlers "Fired";
			_unit removeAllEventHandlers "GetOut";
			_unit removeAllEventHandlers "GetIn";
			_unit removeAllEventHandlers "Local";
			clearVehicleInit _unit;
			deleteVehicle _unit;
			if ((count (units _myGroupUnit) == 0) && (_myGroupUnit != grpNull)) then {
				deleteGroup _myGroupUnit;
			};
		};
	}];
};

server_hiveWrite = {
	private["_data"];

	_data = "HiveExt" callExtension _this;
};

server_hiveReadWrite = {
	private["_key","_resultArray","_data"];

	_key = _this;
	_data = "HiveExt" callExtension _key;
	_resultArray = call compile format ["%1",_data];
	_resultArray
};


server_hiveReadWriteLarge = {
	private["_key","_resultArray","_data"];
	_key = _this;
	_data = "HiveExt" callExtension _key;
	_resultArray = call compile _data;
	_resultArray
};

server_checkIfTowed = {
	private ["_vehicle","_player","_attached"];

	if (DZE_HeliLift) then {

		_vehicle = _this select 0;
		_player = _this select 2;
		_attached = _vehicle getVariable["attached",false];

		if (typeName _attached == "OBJECT") then {
			_player action ["eject", _vehicle];
			detach _vehicle;
			_vehicle setVariable["attached",false,true];
			_attached setVariable["hasAttached",false,true];
		};
	};
};

server_characterSync = {
	private ["_characterID","_playerPos","_playerGear","_playerBackp","_medical","_currentState","_currentModel","_key"];
	
	_characterID = _this select 0;	
	_playerPos = _this select 1;
	_playerGear = _this select 2;
	_playerBackp = _this select 3;
	_medical = _this select 4;
	_currentState = _this select 5;
	_currentModel = _this select 6;
	_key = format["CHILD:201:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:%14:%15:%16:",_characterID,_playerPos,_playerGear,_playerBackp,_medical,false,false,0,0,0,0,_currentState,0,0,_currentModel,0];
	_key call server_hiveWrite;
};

if(isnil "dayz_MapArea") then {
	dayz_MapArea = 10000;
};

if(isnil "DynamicVehicleArea") then {
	DynamicVehicleArea = dayz_MapArea / 2;
};

MarkerPosition = getMarkerPos "center";
RoadList = MarkerPosition nearRoads DynamicVehicleArea;

BuildingList = [];
{
	if (DZE_MissionLootTable) then {
		if (isClass (missionConfigFile >> "CfgBuildingLoot" >> (typeOf _x))) then
		{
			BuildingList set [count BuildingList,_x];
		};
	} else {
		if (isClass (configFile >> "CfgBuildingLoot" >> (typeOf _x))) then
		{
			BuildingList set [count BuildingList,_x];
		};
	};
} count (MarkerPosition nearObjects ["building",DynamicVehicleArea]);

spawn_vehicles = {
	private ["_random","_lastIndex","_weights","_index","_vehicle","_velimit","_qty","_isAir","_isShip","_position","_dir","_istoomany","_veh","_objPosition","_marker","_iClass","_itemTypes","_cntWeights","_itemType","_num","_allCfgLoots"];
	
	if (!isDedicated) exitWith { };

	while {count AllowedVehiclesList > 0} do {

		_index = floor random count AllowedVehiclesList;
		_random = AllowedVehiclesList select _index;
		_vehicle = _random select 0;
		_velimit = _random select 1;
		_qty = {_x == _vehicle} count serverVehicleCounter;

		if (_qty <= _velimit) exitWith {};

		_lastIndex = (count AllowedVehiclesList) - 1;

		if (_lastIndex != _index) then {
			AllowedVehiclesList set [_index, AllowedVehiclesList select _lastIndex];
		};

		AllowedVehiclesList resize _lastIndex;
	};

	if (count AllowedVehiclesList == 0) then {
		diag_log("DEBUG: unable to find suitable vehicle to spawn");
	} else {

		serverVehicleCounter set [count serverVehicleCounter,_vehicle];
	
		_isAir = _vehicle isKindOf "Air";
		_isShip = _vehicle isKindOf "Ship";
	
		if(_isShip || _isAir) then {
			if(_isShip) then {
				waitUntil{!isNil "BIS_fnc_findSafePos"};
				_position = [MarkerPosition,0,DynamicVehicleArea,10,1,2000,1] call BIS_fnc_findSafePos;
			} else {
				waitUntil{!isNil "BIS_fnc_findSafePos"};
				_position = [MarkerPosition,0,DynamicVehicleArea,10,0,2000,0] call BIS_fnc_findSafePos;
			};
		
		
		} else {
			if((random 1) > 0.5) then {

				waitUntil{!isNil "BIS_fnc_selectRandom"};

				_position = RoadList call BIS_fnc_selectRandom;
				_position = _position modelToWorld [0,0,0];

				waitUntil{!isNil "BIS_fnc_findSafePos"};

				_position = [_position,0,10,10,0,2000,0] call BIS_fnc_findSafePos;

			} else {

				waitUntil{!isNil "BIS_fnc_selectRandom"};

				_position = BuildingList call BIS_fnc_selectRandom;
				_position = _position modelToWorld [0,0,0];

				waitUntil{!isNil "BIS_fnc_findSafePos"};

				_position = [_position,0,40,5,0,2000,0] call BIS_fnc_findSafePos;
			};
		};

		if ((count _position) == 2) then { 

			_dir = round(random 180);
			_istoomany = _position nearObjects ["AllVehicles",50];

			if((count _istoomany) > 0) exitWith { diag_log("DEBUG: Too many vehicles at " + str(_position)); };

			_veh = createVehicle [_vehicle, _position, [], 0, "CAN_COLLIDE"];
			_veh setdir _dir;
			_veh setpos _position;		

			if(DZEdebug) then {
				_marker = createMarker [str(_position) , _position];
				_marker setMarkerShape "ICON";
				_marker setMarkerType "DOT";
				_marker setMarkerText _vehicle;
			};	
		
			_objPosition = getPosATL _veh;

			clearWeaponCargoGlobal  _veh;
			clearMagazineCargoGlobal  _veh;

			_num = floor(random 4);
			_allCfgLoots = ["trash","civilian","food","generic","medical","military","policeman","hunter","worker","clothes","militaryclothes","specialclothes","trash"];

			for "_x" from 1 to _num do {

				_iClass = _allCfgLoots call BIS_fnc_selectRandom;
				_itemTypes = [];

				if (DZE_MissionLootTable) then{
					{
						_itemTypes set[count _itemTypes, _x select 0]
					} count getArray(missionConfigFile >> "cfgLoot" >> _iClass);
				}
				else {
					{
						_itemTypes set[count _itemTypes, _x select 0]
					} count getArray(configFile >> "cfgLoot" >> _iClass);
				};

				_index = dayz_CLBase find _iClass;
				_weights = dayz_CLChances select _index;
				_cntWeights = count _weights;
				_index = floor(random _cntWeights);
				_index = _weights select _index;
				_itemType = _itemTypes select _index;
				_veh addMagazineCargoGlobal [_itemType,1];
			};
			[_veh,[_dir,_objPosition],_vehicle,true,"0"] call server_publishVeh;
		};
	};
};

spawn_ammosupply = {
	private ["_position","_veh","_istoomany","_marker","_spawnveh","_WreckList"];

	if (isDedicated) then {
		_WreckList = ["Supply_Crate_DZE"];
		waitUntil{!isNil "BIS_fnc_selectRandom"};
		_position = RoadList call BIS_fnc_selectRandom;
		_position = _position modelToWorld [0,0,0];
		waitUntil{!isNil "BIS_fnc_findSafePos"};
		_position = [_position,5,20,5,0,2000,0] call BIS_fnc_findSafePos;
		if ((count _position) == 2) then {

			_istoomany = _position nearObjects ["All",5];

			if((count _istoomany) > 0) exitWith { diag_log("DEBUG VEIN: Too many at " + str(_position)); };

			_spawnveh = _WreckList call BIS_fnc_selectRandom;

			if(DZEdebug) then {
				_marker = createMarker [str(_position) , _position];
				_marker setMarkerShape "ICON";
				_marker setMarkerType "DOT";
				_marker setMarkerText str(_spawnveh);
			};

			_veh = createVehicle [_spawnveh,_position, [], 0, "CAN_COLLIDE"];
			_veh enableSimulation false;
			_veh setDir round(random 360);
			_veh setpos _position;
			_veh setVariable ["ObjectID","1",true];
		};
	};
};

DZE_LocalRoadBlocks = [];

spawn_roadblocks = {
	private ["_position","_veh","_istoomany","_marker","_spawnveh","_WreckList"];

	_WreckList = ["SKODAWreck","HMMWVWreck","UralWreck","datsun01Wreck","hiluxWreck","datsun02Wreck","UAZWreck","Land_Misc_Garb_Heap_EP1","Fort_Barricade_EP1","Rubbish2"];

	waitUntil{!isNil "BIS_fnc_selectRandom"};

	if (isDedicated) then {

		_position = RoadList call BIS_fnc_selectRandom;
		_position = _position modelToWorld [0,0,0];

		waitUntil{!isNil "BIS_fnc_findSafePos"};

		_position = [_position,0,10,5,0,2000,0] call BIS_fnc_findSafePos;
		
		if ((count _position) == 2) then {

			_istoomany = _position nearObjects ["All",5];

			if((count _istoomany) > 0) exitWith { diag_log("DEBUG: Too many at " + str(_position)); };

			waitUntil{!isNil "BIS_fnc_selectRandom"};

			_spawnveh = _WreckList call BIS_fnc_selectRandom;

			if(DZEdebug) then {
				_marker = createMarker [str(_position) , _position];
				_marker setMarkerShape "ICON";
				_marker setMarkerType "DOT";
				_marker setMarkerText str(_spawnveh);
			};

			_veh = createVehicle [_spawnveh,_position, [], 0, "CAN_COLLIDE"];
			_veh enableSimulation false;
			_veh setDir round(random 360);
			_veh setpos _position;
			_veh setVariable ["ObjectID","1",true];
		};
	};
};

spawn_mineveins = {
	private ["_position","_veh","_istoomany","_marker","_spawnveh","_positions"];

	if (isDedicated) then {

		_position = [getMarkerPos "center",0,(HeliCrashArea*0.75),10,0,2000,0] call BIS_fnc_findSafePos;

		if ((count _position) == 2) then {

			_positions = selectBestPlaces [_position, 500, "(1 + forest) * (1 + hills) * (1 - houses) * (1 - sea)", 10, 5];
			_position = (_positions call BIS_fnc_selectRandom) select 0;
			_istoomany = _position nearObjects ["All",10];

			if((count _istoomany) > 0) exitWith { diag_log("DEBUG VEIN: Too many objects at " + str(_position)); };
			if(isOnRoad _position) exitWith { diag_log("DEBUG VEIN: on road " + str(_position)); };

			_spawnveh = ["Iron_Vein_DZE","Iron_Vein_DZE","Iron_Vein_DZE","Iron_Vein_DZE","Iron_Vein_DZE","Silver_Vein_DZE","Silver_Vein_DZE","Silver_Vein_DZE","Gold_Vein_DZE","Gold_Vein_DZE"] call BIS_fnc_selectRandom;

			if(DZEdebug) then {
				_marker = createMarker [str(_position) , _position];
				_marker setMarkerShape "ICON";
				_marker setMarkerType "DOT";
				_marker setMarkerText str(_spawnveh);
			};

			_veh = createVehicle [_spawnveh,_position, [], 0, "CAN_COLLIDE"];
			_veh enableSimulation false;
			_veh setDir round(random 360);
			_veh setpos _position;
			_veh setVariable ["ObjectID","1",true];
		};
	};
};

if(isnil "DynamicVehicleDamageLow") then {
	DynamicVehicleDamageLow = 0;
};

if(isnil "DynamicVehicleDamageHigh") then {
	DynamicVehicleDamageHigh = 100;
};

if(isnil "DynamicVehicleFuelLow") then {
	DynamicVehicleFuelLow = 0;
};

if(isnil "DynamicVehicleFuelHigh") then {
	DynamicVehicleFuelHigh = 100;
};

if(isnil "DZE_DiagFpsSlow") then {
	DZE_DiagFpsSlow = false;
};

if(isnil "DZE_DiagFpsFast") then {
	DZE_DiagFpsFast = false;
};

if(isnil "DZE_DiagVerbose") then {
	DZE_DiagVerbose = false;
};

dze_diag_fps = {
	if(DZE_DiagVerbose) then {
		diag_log format["DEBUG FPS : %1 OBJECTS: %2 : PLAYERS: %3", diag_fps,(count (allMissionObjects "")),(playersNumber west)];
	} else {
		diag_log format["DEBUG FPS : %1", diag_fps];
	};
};

generate_new_damage = {
	private ["_damage"];
	
    _damage = ((random(DynamicVehicleDamageHigh-DynamicVehicleDamageLow))+DynamicVehicleDamageLow) / 100;
	_damage;
};

generate_exp_damage = {
	private ["_damage"];
    _damage = ((random(DynamicVehicleDamageHigh-DynamicVehicleDamageLow))+DynamicVehicleDamageLow) / 100;
	_damage;
};

server_getDiff =	{
	private["_variable","_object","_vNew","_vOld","_result"];

	_variable = _this select 0;
	_object = _this select 1;
	_vNew = _object getVariable[_variable,0];
	_vOld = _object getVariable[(_variable + "_CHK"),_vNew];
	_result = 0;

	if (_vNew < _vOld) then {
		_vNew = _vNew + _vOld;
		_object getVariable[(_variable + "_CHK"),_vNew];
	} else {
		_result = _vNew - _vOld;
		_object setVariable[(_variable + "_CHK"),_vNew];
	};
	_result
};

server_getDiff2 =	{
	private["_variable","_object","_vNew","_vOld","_result"];

	_variable = _this select 0;
	_object = _this select 1;
	_vNew = _object getVariable[_variable,0];
	_vOld = _object getVariable[(_variable + "_CHK"),_vNew];
	_result = _vNew - _vOld;
	_object setVariable[(_variable + "_CHK"),_vNew];
	_result
};

dayz_objectUID = {
	private["_position","_dir","_key","_object"];

	_object = _this;
	_position = getPosATL _object;
	_dir = direction _object;
	_key = [_dir,_position] call dayz_objectUID2;
    _key
};

//build vector
dayz_objectUID2 = {
	private["_position","_dir","_key","_element","_vector","_set","_vecCnt","_usedVec"];
	_dir = _this select 0;
	_key = "";
	_position = _this select 1;
	
	if((count _this) == 2) then{
		{
			_x = _x * 10;
			if ( _x < 0 ) then { _x = _x * -10 };
			_key = _key + str(round(_x));
		} count _position;
		_key = _key + str(round(_dir));
	}else{
		_vector = [];
		_usedVec = false;
		{
			_element = _x;
			if(typeName _element == "ARRAY") then{
				_vector = _element;
				if((count _vector) == 2)then{
					if(((count (_vector select 0)) == 3) && ((count (_vector select 1)) == 3))then{
							{
								_x = _x * 10;
								if ( _x < 0 ) then { _x = _x * -10 };
								_key = _key + str(round(_x));
							} count _position;
							
							_vecCnt = 0;
							{
								_set = _x;
								{
									_vecCnt = _vecCnt + (round (_x * 100));
									
								} foreach _set;
								
							} foreach _vector;
							if(_vecCnt < 0)then{
								_vecCnt = ((_vecCnt * -1) * 3);
							};
							_key = _key + str(_vecCnt);
							_usedVec = true;
					};
				};
			};
		} count _this;
		
		if!(_usedVec) then{
				{
					_x = _x * 10;
					if ( _x < 0 ) then { _x = _x * -10 };
					_key = _key + str(round(_x));
				} count _position;
				_key = _key + str(round(_dir));
		};
		
		
	};
	_key
};

dayz_objectUID3 = {
	private["_position","_dir","_key"];

	_dir = _this select 0;
	_key = "";
	_position = _this select 1;

	{
		_x = _x * 10;
		if ( _x < 0 ) then { _x = _x * -10 };
		_key = _key + str(round(_x));
	} count _position;

	_key = _key + str(round(_dir + time));
	_key
};

dayz_recordLogin = {
	private["_key"];

	_key = format["CHILD:103:%1:%2:%3:",_this select 0,_this select 1,_this select 2];
	_key call server_hiveWrite;
};

currentInvites = [];
publicVariable "currentInvites";
dayz_perform_purge = {
	if(!isNull(_this)) then {
		_group = group _this;
		_this removeAllMPEventHandlers "mpkilled";
		_this removeAllMPEventHandlers "mphit";
		_this removeAllMPEventHandlers "mprespawn";
		_this removeAllEventHandlers "FiredNear";
		_this removeAllEventHandlers "HandleDamage";
		_this removeAllEventHandlers "Killed";
		_this removeAllEventHandlers "Fired";
		_this removeAllEventHandlers "GetOut";
		_this removeAllEventHandlers "GetIn";
		_this removeAllEventHandlers "Local";
		clearVehicleInit _this;
		deleteVehicle _this;
		if ((count (units _group) == 0) && (_group != grpNull)) then {
			deleteGroup _group;
		};
	};
};

dayz_perform_purge_player = {

	private ["_countr","_backpack","_backpackType","_backpackWpn","_backpackMag","_objWpnTypes","_objWpnQty","_location","_dir","_holder","_weapons","_magazines"];

    diag_log ("Purging player: " + str(_this));	

	if(!isNull(_this)) then {

		_location = getPosATL _this;
		_dir = getDir _this;
		_holder = createVehicle ["GraveDZE", _location, [], 0, "CAN_COLLIDE"];
		_holder setDir _dir;
		_holder setPosATL _location;
		_holder enableSimulation false;
		_weapons = weapons _this;
		_magazines = magazines _this;

		if(!(isNull unitBackpack _this)) then {

			_backpack = unitBackpack _this;
			_backpackType = typeOf _backpack;
			_backpackWpn = getWeaponCargo _backpack;
			_backpackMag = getMagazineCargo _backpack;
			_holder addBackpackCargoGlobal [_backpackType,1];
			_objWpnTypes = _backpackWpn select 0;
			_objWpnQty = _backpackWpn select 1;
			_countr = 0;

			{
				_holder addWeaponCargoGlobal [_x,(_objWpnQty select _countr)];
				_countr = _countr + 1;
			} count _objWpnTypes;

			_objWpnTypes = _backpackMag select 0;
			_objWpnQty = _backpackMag select 1;
			_countr = 0;

			{
				_holder addMagazineCargoGlobal [_x,(_objWpnQty select _countr)];
				_countr = _countr + 1;
			} count _objWpnTypes;
		};
	};

	{ 
		_holder addWeaponCargoGlobal [_x, 1];
	} count _weapons;

	{ 
		_holder addMagazineCargoGlobal [_x, 1];
	} count _magazines;

	_group = group _this;
	_this removeAllMPEventHandlers "mpkilled";
	_this removeAllMPEventHandlers "mphit";
	_this removeAllMPEventHandlers "mprespawn";
	_this removeAllEventHandlers "FiredNear";
	_this removeAllEventHandlers "HandleDamage";
	_this removeAllEventHandlers "Killed";
	_this removeAllEventHandlers "Fired";
	_this removeAllEventHandlers "GetOut";
	_this removeAllEventHandlers "GetIn";
	_this removeAllEventHandlers "Local";

	clearVehicleInit _this;
	deleteVehicle _this;

	if ((count (units _group) == 0) && (_group != grpNull)) then {
		deleteGroup _group;
	};
};

dayz_removePlayerOnDisconnect = {
	if(!isNull(_this)) then {
		_group = group _this;
		_this removeAllMPEventHandlers "mphit";
		deleteVehicle _this;
		deleteGroup (group _this);
	};
};

server_timeSync = {
	private ["_hour","_minute","_date","_key","_result","_outcome"];

    _key = "CHILD:307:";
	_result = _key call server_hiveReadWrite;
	_outcome = _result select 0;

	if(_outcome == "PASS") then {

		_date = _result select 1; 

		if(dayz_fullMoonNights) then {
			_hour = _date select 3;
			_minute = _date select 4;
			_date = [2013,8,3,_hour,_minute];
		};
		setDate _date;
		PVDZE_plr_SetDate = _date;
		publicVariable "PVDZE_plr_SetDate";
		diag_log ("TIME SYNC: Local Time set to " + str(_date));	
	};
};

server_spawncleanDead = {
	private ["_deathTime","_delQtyZ","_delQtyP","_qty","_allDead"];

	_allDead = allDead;
	_delQtyZ = 0;
	_delQtyP = 0;

	{
		if (local _x) then {
			if (_x isKindOf "zZombie_Base") then
			{
				_x call dayz_perform_purge;
				sleep 0.05;
				_delQtyZ = _delQtyZ + 1;
			} else {
				if (_x isKindOf "CAManBase") then {
					_deathTime = _x getVariable ["processedDeath", diag_tickTime];
					if (diag_tickTime - _deathTime > 660) then {
						_x call dayz_perform_purge_player;
						sleep 0.025;
						_delQtyP = _delQtyP + 1;
					};
				};
			};
		};
		sleep 0.025;
	} count _allDead;

	if (_delQtyZ > 0 || _delQtyP > 0) then {
		_qty = count _allDead;
		diag_log (format["CLEANUP: Deleted %1 players && %2 zombies out of %3 dead",_delQtyP,_delQtyZ,_qty]);
	};
};

server_cleanupGroups = {

	if (DZE_DYN_AntiStuck3rd > 3) then { DZE_DYN_GroupCleanup = nil; DZE_DYN_AntiStuck3rd = 0; };
	if(!isNil "DZE_DYN_GroupCleanup") exitWith {  DZE_DYN_AntiStuck3rd = DZE_DYN_AntiStuck3rd + 1;};
	DZE_DYN_GroupCleanup = true;
	{
		if ((count (units _x) == 0) && (_x != grpNull)) then {
			deleteGroup _x;
		};
		sleep 0.001;
	} count allGroups;
	DZE_DYN_GroupCleanup = nil;
};

server_checkHackers = {

	if (DZE_DYN_AntiStuck2nd > 3) then { DZE_DYN_HackerCheck = nil; DZE_DYN_AntiStuck2nd = 0; };
	if(!isNil "DZE_DYN_HackerCheck") exitWith {  DZE_DYN_AntiStuck2nd = DZE_DYN_AntiStuck2nd + 1;};
	DZE_DYN_HackerCheck = true;
	{
	if (!((isNil "_x") || {(isNull _x)})) then {
		if(vehicle _x != _x && !(vehicle _x in PVDZE_serverObjectMonitor) && (isPlayer _x)  && !((typeOf vehicle _x) in DZE_safeVehicle)) then {
			diag_log ("CLEANUP: KILLING A HACKER " + (name _x) + " " + str(_x) + " IN " + (typeOf vehicle _x));
			(vehicle _x) setDamage 1;
			_x setDamage 1;
			sleep 0.25;
		};
	};
		sleep 0.001;
	} count allUnits;
	DZE_DYN_HackerCheck = nil;
};

server_spawnCleanFire = {
	private ["_delQtyFP","_qty","_delQtyNull","_missionFires"];

	_missionFires = allMissionObjects "Land_Fire_DZ";
	_delQtyFP = 0;

	{
		if (local _x) then {
			deleteVehicle _x;
			sleep 0.025;
			_delQtyFP = _delQtyFP + 1;
		};
		sleep 0.001;
	} count _missionFires;

	if (_delQtyFP > 0) then {
		_qty = count _missionFires;
		diag_log (format["CLEANUP: Deleted %1 fireplaces out of %2",_delQtyNull,_qty]);
	};
};
server_spawnCleanLoot = {
	private ["_created","_delQty","_nearby","_age","_keep","_qty","_missionObjs","_dateNow"];

	if (DZE_DYN_AntiStuck > 3) then { DZE_DYN_cleanLoot = nil; DZE_DYN_AntiStuck = 0; };
	if(!isNil "DZE_DYN_cleanLoot") exitWith {  DZE_DYN_AntiStuck = DZE_DYN_AntiStuck + 1;};

	DZE_DYN_cleanLoot = true;
	
	_missionObjs = allMissionObjects "ReammoBox";
	_delQty = 0;
	_dateNow = (DateToNumber date);

	{
		if (!isNull _x) then {
			_keep = _x getVariable["permaLoot", false];
			if (!_keep) then {
				_created = _x getVariable["created", -0.1];
				if (_created == -0.1) then{
					_x setVariable["created", _dateNow, false];
					_created = _dateNow;
				}
				else {
					_age = (_dateNow - _created) * 525948;
					if (_age > 20) then{
						_nearby = { (isPlayer _x) && (alive _x) } count(_x nearEntities[["CAManBase", "AllVehicles"], 130]);
						if (_nearby == 0) then{
							deleteVehicle _x;
							sleep 0.025;
							_delQty = _delQty + 1;
						};
					};
				};
			};
		};
		sleep 0.001;
	} count _missionObjs;
	if (_delQty > 0) then {
		_qty = count _missionObjs;
		diag_log (format["CLEANUP: Deleted %1 Loot Piles out of %2",_delQty,_qty]);
	};
	DZE_DYN_cleanLoot = nil;
};

server_spawnCleanAnimals = {
	private ["_pos","_delQtyAnimal","_qty","_missonAnimals","_nearby"];

	_missonAnimals = entities "CAAnimalBase";
	_delQtyAnimal = 0;

	{
		if (local _x) then {
			_x call dayz_perform_purge;
			sleep 0.05;
			_delQtyAnimal = _delQtyAnimal + 1;
		} else {
			if (!alive _x) then {
				_pos = getPosATL _x;
				if (count _pos > 0) then {
					_nearby = {(isPlayer _x) && (alive _x)} count (_pos nearEntities [["CAManBase","AllVehicles"], 130]);
					if (_nearby==0) then {
						_x call dayz_perform_purge;
						sleep 0.05;
						_delQtyAnimal = _delQtyAnimal + 1;
					};
				};
			};
		};
		sleep 0.001;
	} count _missonAnimals;

	if (_delQtyAnimal > 0) then {
		_qty = count _missonAnimals;
		diag_log (format["CLEANUP: Deleted %1 Animals out of %2",_delQtyAnimal,_qty]);
	};
};

server_logUnlockLockEvent = {
	private["_player", "_obj", "_objectID", "_objectUID", "_statusText", "_status"];

	_player = _this select 0;
	_obj = _this select 1;
	_status = _this select 2;

	if (!isNull(_obj)) then {
		_objectID = _obj getVariable["ObjectID", "0"];
		_objectUID = _obj getVariable["ObjectUID", "0"];
		_statusText = "UNLOCKED";
		if (_status) then {
			[_obj, "gear"] call server_updateObject;
			_statusText = "LOCKED";
		};
		diag_log format["SAFE %5: ID:%1 UID:%2 BY %3(%4)", _objectID, _objectUID, (name _player), (getPlayerUID _player), _statusText];
	};
};
cad_pvar_shared_var = 0; cad_pvar_server_answer = 1;
"cad_pvar_shared_var" addPublicVariableEventHandler {
	owner (_this select 1) publicVariableClient "cad_pvar_server_answer";
};


//[] ExecVM "\z\addons\dayz_server\buildings\Shadow_PVP.sqf";
//[] ExecVM "\z\addons\dayz_server\buildings\event_location.sqf";

//[] ExecVM "\z\addons\dayz_server\buildings\HALLOWEEN.sqf";
//[] ExecVM "\z\addons\dayz_server\buildings\SnowmanHunt.sqf";


[] ExecVM "\z\addons\dayz_server\buildings\skalisty_bridge.sqf";
[] ExecVM "\z\addons\dayz_server\buildings\roadtobridge.sqf";
[] ExecVM "\z\addons\dayz_server\buildings\TulgaTrader.sqf";
[] ExecVM "\z\addons\dayz_server\buildings\New_Airtrader.sqf";
//[] ExecVM "\z\addons\dayz_server\buildings\NEW_NE.sqf";
[] ExecVM "\z\addons\dayz_server\buildings\Novy_Trader.sqf";
[] ExecVM "\z\addons\dayz_server\buildings\NEW_NW.sqf";

//[] execVM "\z\addons\dayz_server\init\cleaner.sqf";

SlotRes = ["76561197985855418","76561197960269273","76561198188377267","76561198088945434"];publicVariable "SlotRes";
if((preProcessFileLineNumbers ("reserved.sqf")) != "")then{
	_tmpRS = call compile preProcessFileLineNumbers "reserved.sqf";
	if(!isNil '_tmpRS')then
	{
		if(typeName _tmpRS == 'ARRAY')then
		{
			if(str _tmpRS != '[]')then
			{
				SlotRes = SlotRes + _tmpRS;publicVariable "SlotRes";
			};
		};
	};
};

//Monthly Donator
MonthlyDonator = ["0"];publicVariable "MonthlyDonator";
if((preProcessFileLineNumbers ("MonthlyDonator.sqf")) != "")then{
	_tmpMD = call compile preProcessFileLineNumbers "MonthlyDonator.sqf";
	if(!isNil '_tmpMD')then
	{
		if(typeName _tmpMD == 'ARRAY')then
		{
			if(str _tmpMD != '[]')then
			{
				MonthlyDonator = MonthlyDonator + _tmpMD;publicVariable "MonthlyDonator";
			};
		};
	};
};

//Dollar Donator
DollarDonator = ["0"];publicVariable "DollarDonator";
if((preProcessFileLineNumbers ("DollarDonator.sqf")) != "")then{
	_tmpDD = call compile preProcessFileLineNumbers "DollarDonator.sqf";
	if(!isNil '_tmpDD')then
	{
		if(typeName _tmpDD == 'ARRAY')then
		{
			if(str _tmpDD != '[]')then
			{
				DollarDonator = DollarDonator + _tmpDD;publicVariable "DollarDonator";
			};
		};
	};
};







currentInvites = [];
publicVariable "currentInvites";
"currentInvites" addPublicVariableEventHandler {publicVariable "currentInvites";};