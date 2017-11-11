if(isServer) then {

	private			["_room","_complete","_crate_type","_mission","_position","_crate","_baserunover","_mayor"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;

	_position		= [40] call find_position;
	[_mission,_position,"Extreme","Rabbit Farm","MainHero",true] call mission_init;
	
	diag_log 		format["WAI: [Mission:[Hero] Rabbit Farm]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_large call BIS_fnc_selectRandom;
	_crate 			= createVehicle ["BAF_VehicleBox",[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
	 
	//Buildings
	_baserunover0 	= createVehicle ["Land_Dirthump01",[(_position select 0) - 60, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover1 	= createVehicle ["Land_Dirthump02",[(_position select 0) + 60, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover2 	= createVehicle ["Land_Dirthump03",[(_position select 0), (_position select 1) - 60,-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover3 	= createVehicle ["Land_Dirthump01",[(_position select 0), (_position select 1) + 60,-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover4 	= createVehicle ["Land_Dirthump02",[(_position select 0) - 20, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover5 	= createVehicle ["Land_Dirthump03",[(_position select 0) + 20, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];

	_baserunover = [_baserunover0,_baserunover1,_baserunover2,_baserunover3,_baserunover4,_baserunover5];
	
	_directions = [90,270,0,180,0,180,270,90];
	{ _x setDir (_directions select _forEachIndex) } forEach _baserunover;
	
	{ _x setVectorUp surfaceNormal position _x; } count _baserunover;

	
	//Troops
	_rndnum = (1 + round (random 2));
	[[_position select 0,_position select 1,0],_rndnum,"Random",["Random","AT"],3,"extreme","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],_rndnum,"Random",["Random","AA"],3,"extreme","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],_rndnum,"Random",["Random","AT"],3,"extreme","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],_rndnum,"Random",["Random","AT"],3,"extreme","Bandit","Random","Bandit",_mission] call spawn_group;

	


	//Static Guns
	[[[(_position select 0) - 10, (_position select 1) + 10, 0]],"random","Hard","bandit","bandit",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) + 10, (_position select 1) - 10, 0]],"random","Hard","bandit","bandit",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) + 10, (_position select 1) + 10, 0]],"random","Hard","bandit","Hero",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) - 10, (_position select 1) - 10, 0]],"random","Hard","bandit","bandit",0,2,"Random","Random",_mission] call spawn_static;
	
	[[[(_position select 0) - 20, (_position select 1) + 20, 0]],"random","Hard","bandit","bandit",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) + 20, (_position select 1) - 20, 0]],"random","Hard","bandit","bandit",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) + 20, (_position select 1) + 20, 0]],"random","Hard","bandit","bandit",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) - 20, (_position select 1) - 20, 0]],"random","Hard","bandit","bandit",0,2,"Random","Random",_mission] call spawn_static;

	_complete = [
		[_mission,_crate],		// mission number and crate
		["crate"], // ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_baserunover], 		// cleanup objects
		"A Farmer Protects is herd of rabbits!",	// mission announcement
		"The Farmer has been overrun by big corporations",						// mission success
		"The Farmer has defended his farm!"										// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,3,5,[10,crate_items_rabbit],2] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Hero] Drug Lord]: Ended at %1",_position];

	h_missionsrunning = h_missionsrunning - 1;
};