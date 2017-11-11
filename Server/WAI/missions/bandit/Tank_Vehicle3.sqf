if(isServer) then {

	private 		["_complete","_vehicle","_rndnum","_crate_type","_crate","_mission","_tanktraps","_mines","_playerPresent","_cleanmission","_currenttime","_starttime","_missiontimeout","_vehname","_veh","_position","_vehclass","_vehdir","_objPosition"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;

	//TANK_vehicle3
	_vehclass 		= tanks_vehicle call BIS_fnc_selectRandom;
	_vehname 		= getText (configFile >> "CfgVehicles" >> _vehclass >> "displayName");

	_position		= [30] call find_position;
	[_mission,_position,"extreme",format["Tank Extraction %1", _vehname],"MainBandit",true] call mission_init;	
	
	diag_log 		format["WAI: [Mission:[Bandit] Tank Extraction]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_medium call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1) + 5,0], [], 0, "CAN_COLLIDE"];
	
	//Troops
	_rndnum = 1 + round (random 3);
	[[_position select 0,_position select 1,0],_rndnum,"Extreme",["Random","AT"],4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],_rndnum,"Extreme",["Random","AA"],4,"Random","Hero","Random","Hero",_mission] call spawn_group;


	//Static Guns
	[[
		[(_position select 0) + 30, (_position select 1) - 30, 0],
		[(_position select 0) + 30, (_position select 1) + 30, 0],
		[(_position select 0) - 30, (_position select 1) - 30, 0],
		[(_position select 0) - 30, (_position select 1) + 30, 0]
	],"random","extreme","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;
	
	
	//Bmp3
	[[(_position select 0) + 75, _position select 1, 0],[(_position select 0) + 75, _position select 1, 0],50,2,"lav25_dz","Extreme","Hero","Hero",_mission] call vehicle_patrol;
	
	
	//Spawn vehicle
	_vehicle		= [_vehclass,_position,_mission] call custom_publish;
	
	if(debug_mode) then {
		diag_log format["WAI: [Bandit] tank_vehicle3 spawned a %1",_vehname];
	};
	
	//Condition
	_complete = [
		[_mission,_crate],	// mission number and crate
		["crate"], 			// ["crate"], or ["kill",wai_kill_percent], or ["assassinate", _unitGroup],
		[_vehicle], 		// cleanup objects
		"Heroes have captured a tank from the Takistani bandit clan, make your move as a bandit whilst they are planning a getaway",		// mission announcement
		"Bandits have secured the tank!",		// mission success
		"Bandits did not secure thetank in time"				// mission fail
	] call mission_winorfail;

	if(_complete) then {
			[_crate,[5,ai_wep_sniper],[2,crate_tools_sniper],[10,crate_items_high_value],[2,crate_backpacks_large]] call dynamic_crate;
		
	};

	diag_log format["WAI: [Mission:[Bandit] tank Extraction]: Ended at %1",_position];
	
	b_missionsrunning = b_missionsrunning - 1;
};