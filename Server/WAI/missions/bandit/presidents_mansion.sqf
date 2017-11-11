if(isServer) then {

	private			["_complete","_president_himself","_crate_type","_mission","_position","_crate","_rndnum","_baserunover","_president","_firstlady"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;

	_position		= [50] call find_position;
	[_mission,_position,"Extreme","Presidents in Town","MainBandit",true] call mission_init;
	
	diag_log 		format["WAI: [Mission:[Bandit] Presidents in Town]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_small call BIS_fnc_selectRandom;
	_crate 			= createVehicle ["BAF_VehicleBox",[(_position select 0),(_position select 1),.1], [], 0, "CAN_COLLIDE"];
	
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
	[[_position select 0,_position select 1,0],4,"Extreme",["Random","AT"],4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Extreme","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;


	//The President Himself
	_president = [[((_position select 0) + 5), _position select 1, 4.1],1,"Extreme","Random",4,"none","Special","Random",["Hero",750],_mission] call spawn_group;
	_firstlady = [[((_position select 0) + 5), _position select 1, 4.1],1,"Extreme","Unarmed",4,"none","Secretary1","Random",["Hero",250],_mission] call spawn_group;

	_president_himself = (units _president) select 0;
	_president_himself disableAI "MOVE";

	//Humvee Patrol
	[[(_position select 0) + 100, _position select 1, 0],[(_position select 0) + 100, _position select 1, 0],50,2,"HMMWV_Armored","extreme","Hero","Hero",_mission] call vehicle_patrol;

	
	//Static Guns
	[[[(_position select 0) - 10, (_position select 1) + 10, 0]],"random","extreme","hero","hero",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) + 10, (_position select 1) - 10, 0]],"random","extreme","hero","hero",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) + 10, (_position select 1) + 10, 0]],"random","extreme","hero","hero",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) - 10, (_position select 1) - 10, 0]],"random","extreme","hero","hero",0,2,"Random","Random",_mission] call spawn_static;
	

	//Condition
	_complete = [
		[_mission,_crate],			// mission number and crate
		["crate"],  // ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_baserunover], 			// cleanup objects
		"The President is in town for a press conference, rumour has it bandits are planning his assasination",	// mission announcement
		"The President has been assassinated, a day of mourning has been announced",							// mission success
		"The President managed to get away from the assasination attempt"										// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,5,0,[15,crate_items_president],2] call dynamic_crate;
	};

	diag_log format["WAI: [Bandit] presidents_mansion ended at %1",_position];

	b_missionsrunning = b_missionsrunning - 1;
};
