/*
	VEHICLE CLEANUP ZONE
	Script by HALV
*/
_obj = _this select 0;

if (!isServer) exitWith {diag_log "Server_DeleteObjInsafezone.sqf - ERROR: NOT SERVER?"};

//\\\\\\\\\\\\\\\\\\\\ Setup Area ////////////////////\\

//vehicle types to Check for
_delVeh = ["Air","Landvehicle","Ship","Tank"];

//Action to take when vehicle is detected in a [VEHICLE CLEANUP ZONE]
//0 Delete vehicles ingame but keep in database. NOTE: This will stack vehicles in database if not cleaned propper
//1 Tp vehicles outside [VEHICLE CLEANUP ZONE] ("radius" + 50 meter to 4x "radius" from VEHICLE CLEANUP ZONE pos eg: if radius is 100 vehicles are moved 150-400 meter away)
//2 Tp vehicles to a position within 125m of _safespot (remember to set a position below)
//3 will delete vehicles completly from database
_Action = 2;

//if _Action = 2 then enter the position you desire here (default is by grozovoy pass around 022010)
_safespot = [6483.32,7664.63,0];
//how large radius to spread them in this area in meters (default 125m)
_radius = 125;

//damaged above this amoun, vehicle is deleted (set to 1 to only delete completely destroyed vehicles)
_dam = 0.90;

//if true will delete vehicles matching array below by default
_delbikmot = true;
//if above is true will delete these by default
_defdelar = ["Bicycle","Motorcycle","CSJ_GyroC","CSJ_GyroCover","CSJ_GyroP"];//,"ATV_Base_EP1"

//set to true, to unlock vehicles by default when TP'ed
_unlock = true;

//log text, this is what you want to look for in the logs, if you need to know something about a moved vehicle
_txt = "[VEHICLE CLEANUP ZONE]";

//Update vehicles to the hive, and make sure they are not moved each restart?
_updateHIVE = true;

//VEHICLE CLEANUP ZONE's/areas switch choosing the map name for cleanup location purposes
if(isNil "HALV_VEHICLE_CLEANUPZONES")then{
	diag_log format["%1: selecting world to cleanup ...",_txt];
	_WorldName = toLower format ["%1", worldName];
	switch (_WorldName)do {

//chernarus
		case "chernarus":{
			diag_log format["%2: Cleanup zones for chernarus selected! (check: %1)",_WorldName,_txt]; //logging if right worldname was selected, if uncommented
			HALV_VEHICLE_CLEANUPZONES = [
			//position					radius		cityname/text
			
			[[4063.4226,11664.19,0],	500,		"Trader City Bash"],
			[[11447.472,11364.504,0],	500,		"Trader City Klen"],
			[[12905.7,4461.35,0],	    500,		"Trader City Tulga"],

			
			[[5055.84,9736.8,0],	    75,		"Aircraft  NW"],
			[[12070.5,12660.6,0],	    75,		"Aircraft NE"],
			[[5239.85,2169.14,0],	    75,		"Aircraft Balota"],
			[[8019.55,2889.47,0],	    150,	"Boat Dealer South"]
			
			
			];
		};

		
/*
//myworldname
		case "myworldnameinlowercase":{
//			diag_log format["%2: Cleanup zones for myworldnameinlowercase selected! (check: %1)",_WorldName,_txt]; //logging if right worldname was selected, if uncommented
			HALV_VEHICLE_CLEANUPZONES = [
			//position					//radius	//cityname/text
			[[7839.60,8414.73,381.33],	150,		"my custom zone marker"],
			[[7839.60,8414.73,381.33],	75,			"my custom location"] // <-- no comma for last entry
			];
		};
*/
//default
		default{
			diag_log format["%2: Cleanup zones for %1 not availible ...",_WorldName,_txt]; //logging if right worldname was selected, if uncommented
			HALV_VEHICLE_CLEANUPZONES = [
			//position	//radius	//cityname/text
			[[4063.4226,11664.19,0],	125,		"Trader City Bash"],
			[[11447.472,11364.504,0],	125,		"Trader City Klen"],
			[[12905.7,4461.35,0],	125,		"Trader City Klen"],

			
			[[5055.84,9736.8,0],	75,		"Aircraft  NW"],
			[[12070.5,12660.6,0],	75,		"Aircraft NE"],
			[[5239.85,2169.14,0],	75,		"Aircraft Balota"],
			[[8019.55,2889.47,0],	100,	"Boat Dealer South"]
			
			];
		};
	};
};
//\\\\\\\\\\\\\\\\\\\\  End Setup Area ////////////////////\\

/////////////// dont touch anything below this line unless you know what you are doing \\\\\\\\\\\\\\\

_possiblematch = false;
{if(_obj isKindOf _x)then{_possiblematch=true;};}forEach _delVeh;
if(_possiblematch)then{
	{
	_Spos = _x select 0;
	_Rad = _x select 1;
	_name = _x select 2;
	_radats = _Rad+50;
	_radx4 = _Rad+_Rad+_Rad+_Rad;
		if(_obj distance _Spos < _Rad)then{
			_defdel		= false;
			_typeOf		= typeOf _obj;
			_pos		= getpos _obj;
			_mags		= getmagazinecargo _obj;
			_weaps		= getweaponcargo _obj;
			_packs		= getbackpackcargo _obj;
			_objID		= _obj getVariable["ObjectID","0"];
			_objUID		= _obj getVariable["ObjectUID","0"];
			_objname	= (gettext (configFile >> 'CfgVehicles' >> _typeOf >> 'displayName'));
			diag_log format["%1: %2 (%3) by %4 @%5 %6 [ID:%7,UID:%8] Cargo: [%9,%10,%11]",_txt,_typeOf,_objname,_name,mapgridposition _pos,_pos,_objID,_objUID,_weaps,_mags,_packs];
			if(_delbikmot)then{{if(_obj isKindOf _x)then{_defdel = true};}forEach _defdelar;};
			if(_defdel)then{_Action=3;diag_log format["%2: %1 is Model to delete by default!",_typeOf,_txt];};
			if(getDammage _obj > _dam)then{_Action=3;diag_log format["%2: %1 too damaged",_typeOf,_txt];};
			if(_unlock and !_defdel and (locked _obj))then{_obj setVehicleLock "UNLOCKED";_obj setVariable ["R3F_LOG_disabled",false,true];diag_log format["%2: %1 Un-Locked",_typeOf,_txt];};
			switch(_Action)do{
				case 0:{deleteVehicle _obj;diag_log format["%2: %1 Deleted, but remains in DB (Dont forget to clean this up)",_typeOf,_txt];};
				case 1:{
					_newPos = [_Spos, _radats, _radx4, 10, 0, 2000, 0] call BIS_fnc_findSafePos;
					_obj setpos _newPos;
					//update to HIVE?
					if(_updateHIVE)then{
					private["_position","_worldspace","_fuel","_key"];
						_position = getPosATL _obj;
						_worldspace = [
							round(direction _obj),
							_position
						]; 
						_fuel = fuel _obj;
						_key = format["CHILD:305:%1:%2:%3:",_objID,_worldspace,_fuel];
						diag_log ("HIVE: WRITE: "+ str(_key));
						_key call server_hiveWrite;
					};
					diag_log format["%6: %5 TP from %1 %2 to %3 %4",_pos,mapgridposition _pos,_newPos,mapgridposition _newPos,_typeOf,_txt];
				};
				case 2:{
					_newPos = [_safespot, 0, _radius, 10, 0, 2000, 0] call BIS_fnc_findSafePos;
					_obj setpos _newPos;
					//update to HIVE?
					if(_updateHIVE)then{
					private["_position","_worldspace","_fuel","_key"];
						_position = getPosATL _obj;
						_worldspace = [
							round(direction _obj),
							_position
						];
						_fuel = fuel _obj;
						_key = format["CHILD:305:%1:%2:%3:",_objID,_worldspace,_fuel];
						diag_log ("HIVE: WRITE: "+ str(_key));
						_key call server_hiveWrite;
					};
					diag_log format["%6: %5 TP from %1 %2 to %3 %4",_pos,mapgridposition _pos,_newPos,mapgridposition _newPos,_typeOf,_txt];
				};
				default{_msg = format["%2: %1",_typeOf,_txt];deleteVehicle _obj;[_objID,_objUID,_msg] call server_deleteObj;};
			};
		};
	}forEach HALV_VEHICLE_CLEANUPZONES;
};