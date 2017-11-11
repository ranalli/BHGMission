if (isServer) then {


_unit_1 = objNull;
if (true) then {
  _this = createAgent ["RU_Functionary2", [4059.6631, 11682.2705,0.00140381], [], 0, "CAN_COLLIDE"];
  _unit_1 = _this;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setDir 170.305;
  _this setPos [4059.6631, 11682.2705,0.00140381];
  _this setUnitAbility 0.60000002;
  _this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;
};

	_unit_3 = objNull;
if (true) then {
  _this = createAgent ["RU_Functionary2", [11456.994, 11359.937,0.00140381], [], 0, "CAN_COLLIDE"];
  _unit_3 = _this;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setDir 123.557;
  _this setPos [11456.994, 11359.937,0.00140381];
  _this setUnitAbility 0.60000002;
  _this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;
  
    };
	
	
	
	
};