if(isServer) then {

	private 		["_baserunover","_complete","_crate","_mission","_static_gun","_crate_type","_rndnum","_playerPresent","_vehname","_vehicle","_position","_vehclass"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;

	//Armed Land Vehicle
	_vehclass 		= AntiAir call BIS_fnc_selectRandom;
	_vehname 		= getText (configFile >> "CfgVehicles" >> _vehclass >> "displayName");

	_position		= [30] call find_position;
	[_mission,_position,"extreme",format["Anti Air %1",_vehname],"MainHero",true] call mission_init;
	
	diag_log 		format["WAI: [Mission:[Hero]Anti Air]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_small call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1) + 5,0], [], 0, "CAN_COLLIDE"];
	
	
		// Create some Buildings
	_baserunover0 	= createVehicle ["MAP_Misc_Cargo1A",[(_position select 0) - 40, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover1 	= createVehicle ["MAP_Misc_Cargo1B",[(_position select 0) + 40, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover2 	= createVehicle ["MAP_Misc_Cargo1Bo",[(_position select 0), (_position select 1) - 40,-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover3 	= createVehicle ["MAP_Misc_Cargo1F",[(_position select 0), (_position select 1) + 40,-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover4 	= createVehicle ["MAP_SeaCrate",[(_position select 0) - 10, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover5 	= createVehicle ["MAP_Misc_Cargo2E",[(_position select 0) + 10, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover6 	= createVehicle ["MAP_Misc_Cargo2D",[(_position select 0), (_position select 1) - 10,-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover7 	= createVehicle ["MAP_Misc_Cargo2B",[(_position select 0), (_position select 1) + 10,-0.2],[], 0, "CAN_COLLIDE"];
	
	// Adding buildings to one variable just for tidiness
	_baserunover = [_baserunover0,_baserunover1,_baserunover2,_baserunover3,_baserunover4,_baserunover5,_baserunover6,_baserunover7];
	
	// Set some directions for our buildings
	_directions = [90,270,0,180,0,180,270,90];
	{ _x setDir (_directions select _forEachIndex) } forEach _baserunover;

	// Make buildings flat on terrain surface
	{ _x setVectorUp surfaceNormal position _x; } count _baserunover;
	
	
		
//Troops
	_num = 1 + round (random 1);
	[[_position select 0,_position select 1,0],_num,"extreme",["Random","AA"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],_num,"extreme",["Random","AA"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],_num,"extreme",["Random","AA"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],_num,"extreme",["Random","AA"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],_num,"extreme",["Random","AA"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	
	

	//Static Guns
	[[[(_position select 0) - 10, (_position select 1) + 10, 0]],"random","extreme","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) + 10, (_position select 1) - 10, 0]],"random","extreme","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) + 10, (_position select 1) + 10, 0]],"random","extreme","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) - 10, (_position select 1) - 10, 0]],"random","extreme","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;
	
	//Spawn Vehicle
	_vehicle		= [_vehclass,_position,_mission] call custom_publish;
	
	if(debug_mode) then {
		diag_log format["WAI: [Hero] Anti Air a %1",_vehname];
	};
	
	//Condition
	_complete = [
		[_mission,_crate],	// mission number and crate
		["crate"], 			// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_vehicle], 		// cleanup objects
		"Anti Air Defenders have caused a no fly zone!",	// mission announcement
		"Survivors have secured the Anti Air Vehicle!",																		// mission success
		"Survivors did not secure the Anti Air in time"																// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,[2,crate_weapons_AA],[2,crate_tools_sniper],[5,crate_items_high_value],[2,crate_backpacks_large]] call dynamic_crate;
	};

	diag_log format["WAI: [Bandit] Anti Air ended at %1",_position];
	
	h_missionsrunning = h_missionsrunning - 1;
};