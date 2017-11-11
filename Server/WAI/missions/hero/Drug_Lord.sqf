if(isServer) then {

	private			["_room","_complete","_crate_type","_mission","_position","_crate","_baserunover","_mayor"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;

	_position		= [40] call find_position;
	[_mission,_position,"Extreme","Drug Lord Stash","MainHero",true] call mission_init;
	
	diag_log 		format["WAI: [Mission:[Hero] Drug Lord Stash]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_large call BIS_fnc_selectRandom;
	_crate 			= createVehicle ["BAF_VehicleBox",[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
	 
	//Buildings
	_baserunover0 	= createVehicle ["land_fortified_nest_big",[(_position select 0) - 60, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover1 	= createVehicle ["land_fortified_nest_big",[(_position select 0) + 60, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover2 	= createVehicle ["land_fortified_nest_big",[(_position select 0), (_position select 1) - 60,-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover3 	= createVehicle ["land_fortified_nest_big",[(_position select 0), (_position select 1) + 60,-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover4 	= createVehicle ["Land_Fort_Watchtower",[(_position select 0) - 20, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover5 	= createVehicle ["Land_Fort_Watchtower",[(_position select 0) + 20, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover6 	= createVehicle ["Land_Fort_Watchtower",[(_position select 0), (_position select 1) - 20,-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover7 	= createVehicle ["Land_Fort_Watchtower",[(_position select 0), (_position select 1) + 20,-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover = [_baserunover0,_baserunover1,_baserunover2,_baserunover3,_baserunover4,_baserunover5,_baserunover6,_baserunover7];
	
	_directions = [90,270,0,180,0,180,270,90];
	{ _x setDir (_directions select _forEachIndex) } forEach _baserunover;
	
	{ _x setVectorUp surfaceNormal position _x; } count _baserunover;

	
	//Troops
	[[_position select 0,_position select 1,0],2,"Extreme",["Random","AT"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],2,"Extreme",["Random","AA"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],2,"Extreme","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],2,"Extreme","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;

	


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
		"A Drug lord is setting up shop! Eliminate the competition!",	// mission announcement
		"The drug lord has ate his last bullet?",						// mission success
		"The Drug lord is passing out extacy to children! We have Failed!"										// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,5,10,[15,crate_items_high_value],2] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Hero] Drug Lord]: Ended at %1",_position];

	h_missionsrunning = h_missionsrunning - 1;
};