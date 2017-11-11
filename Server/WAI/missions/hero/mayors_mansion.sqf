if(isServer) then {

	private			["_room","_complete","_mayor_himself","_crate_type","_mission","_position","_crate","_mayor"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;

	_position		= [40] call find_position;
	[_mission,_position,"Extreme","Mayors Mansion","MainHero",true] call mission_init;
	
	diag_log 		format["WAI: [Mission:[Hero] Mayors Mansion]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_large call BIS_fnc_selectRandom;
	_crate 			= createVehicle ["BAF_VehicleBox",[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
	 
	
	//Troops
	[[_position select 0,_position select 1,0],2,"Extreme",["Random","AT"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],2,"Extreme",["Random","AA"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],2,"Extreme","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],2,"Extreme","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;

	//The Mayor Himself
	_mayor = [_position,1,"Extreme","Random",4,"Random","Special","Random",["Bandit",500],_mission] call spawn_group;
	_mayor_himself = (units _mayor) select 0;
	
	
	//Static Guns
	[[[(_position select 0) - 10, (_position select 1) + 10, 0]],"random","Hard","bandit","bandit",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) + 10, (_position select 1) - 10, 0]],"random","Hard","bandit","bandit",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) + 10, (_position select 1) + 10, 0]],"random","Hard","bandit","bandit",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) - 10, (_position select 1) - 10, 0]],"random","Hard","bandit","bandit",0,2,"Random","Random",_mission] call spawn_static;
	
	[[[(_position select 0) - 20, (_position select 1) + 20, 0]],"random","Hard","bandit","bandit",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) + 20, (_position select 1) - 20, 0]],"random","Hard","bandit","bandit",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) + 20, (_position select 1) + 20, 0]],"random","Hard","bandit","bandit",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) - 20, (_position select 1) - 20, 0]],"random","Hard","bandit","bandit",0,2,"Random","Random",_mission] call spawn_static;

	_complete = [
		[_mission,_crate],		// mission number and crate
		["crate"], // ["crate"], or ["kill"], or ["assassinate", _unitGroup],

		"The Mayor has gone rogue, go take him and his task force out to claim the black market weapons!",	// mission announcement
		"The rogue mayor has been taken out, who will be the next Mayor of Cherno?",						// mission success
		"Survivors were unable to capture the mansion, time is up"										// mission fail
	] call mission_winorfail;

	if(_complete) then {
			[_crate,[5,ai_wep_sniper],[2,crate_tools_sniper],[15,crate_items_high_value],[2,crate_backpacks_large]] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Hero] Mayors Mansion]: Ended at %1",_position];

	h_missionsrunning = h_missionsrunning - 1;
};
