if(isServer) then {
	 
	private 		["_complete","_baserunover","_mission","_directions","_position","_crate","_num","_crate_type","_baserunover0","_baserunover1","_baserunover2","_baserunover3","_baserunover4","_baserunover5","_baserunover6","_baserunover7"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;

	_position		= [80] call find_position;
	[_mission,_position,"Extreme","BlackMarket","MainBandit",true] call mission_init;
	
	diag_log 		format["WAI: [Mission:[Bandit] BlackMarket]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_large call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1),0],[],0,"CAN_COLLIDE"];
	
	//Buildings
	_baserunover0 	= createVehicle ["Map_A_Castle_Bergfrit",[(_position select 0) - 60, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover1 	= createVehicle ["Map_A_Castle_Bergfrit",[(_position select 0) + 60, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover2 	= createVehicle ["Map_A_Castle_Bergfrit",[(_position select 0), (_position select 1) - 60,-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover3 	= createVehicle ["Map_A_Castle_Bergfrit",[(_position select 0), (_position select 1) + 60,-0.2],[], 0, "CAN_COLLIDE"];

	_baserunover = [_baserunover0,_baserunover1,_baserunover2,_baserunover3];
	
	_directions = [90,270,0,180,0,180,270,90];
	{ _x setDir (_directions select _forEachIndex) } forEach _baserunover;
	
	{ _x setVectorUp surfaceNormal position _x; } count _baserunover;
	
	//Group Spawning
	_num = 2 + round (random 3);
	[[_position select 0,_position select 1,0],_num,"extreme",["Random","AT"],4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],_num,"extreme",["Random","AA"],4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],_num,"extreme","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;


	//Humvee Patrol
	[[(_position select 0) + 100, _position select 1, 0],[(_position select 0) + 100, _position select 1, 0],50,2,"baf_jackal2_l2a1_w","Hard","Hero","Hero",_mission] call vehicle_patrol;
	 
	//Static Guns
	[[
		[(_position select 0) + 30, (_position select 1) - 30, 0],
		[(_position select 0) + 30, (_position select 1) + 30, 0],
		[(_position select 0) - 30, (_position select 1) - 30, 0],
		[(_position select 0) - 30, (_position select 1) + 30, 0]
	],"random","hard","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;

	//Condition
	_complete = [
		[_mission,_crate],	// mission number and crate
		["crate"], 			// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_baserunover], 	// cleanup objects
		"The Black Market Mercenaries Have taken refuge",	// mission announcement
		"Black Market Mercenaries have been killed!",										// mission success
		"Black Market Mercenaries have Escaped"									// mission fail
	] call mission_winorfail;

	
	
	if(_complete) then {
		[_crate,[2,crate_weapons_AA],[2,crate_tools_sniper],[15,crate_items_BlackMarket],[2,crate_backpacks_large]] call dynamic_crate;
		
	};

	diag_log format["WAI: [Mission:[Bandit] Hero Base]: Ended at %1",_position];
	
	b_missionsrunning = b_missionsrunning - 1;
};