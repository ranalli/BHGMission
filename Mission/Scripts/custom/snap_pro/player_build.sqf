/*
	DayZ Base Building
	Made for DayZ Epoch please ask permission to use/edit/distrubute email vbawol@veteranbastards.com.
*/
private ["_helperColor","_objectHelper","_objectHelperDir","_objectHelperPos","_canDo","_pos","_cnt","_location","_dir","_classname","_item","_hasrequireditem","_missing","_hastoolweapon","_cancel","_reason","_started","_finished","_animState","_isMedic","_dis","_sfx",
"_hasbuilditem","_tmpbuilt","_onLadder","_isWater","_require","_text","_offset","_IsNearPlot","_isOk","_location1","_location2","_counter","_limit","_proceed","_num_removed","_position","_object","_canBuildOnPlot","_friendlies","_nearestPole","_ownerID","_findNearestPoles",
"_findNearestPole","_distance","_classnametmp","_ghost","_isPole","_needText","_lockable","_zheightchanged","_rotate","_combination_1","_combination_2","_combination_3","_combination_4","_combination","_combination_1_Display","_combinationDisplay","_zheightdirection","_abort",
"_Forbidden","_noBuild","_need","_needNear","_vehicle","_inVehicle","_requireplot","_objHDiff","_isLandFireDZ","_isTankTrap","_vector","_buildOffset","_vUp"];

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_40") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

//snap vars -- temporary fix for errors so variables.sqf can be skipped
if (isNil "snapProVariables") then {
	if (isNil "DZE_snapExtraRange") then {
		DZE_snapExtraRange = 0;
	};
	if (isNil "DZE_checkNearbyRadius") then {
		DZE_checkNearbyRadius = 150;
	};
	s_player_toggleSnap = -1;
	s_player_toggleSnapSelect = -1;
	s_player_toggleSnapSelectPoint=[];
	snapActions = -1;
	snapGizmos = [];
	snapGizmosNearby = [];
	snapProVariables = true; // will skip this statement from now on.
};
if(isNil "vectorBuildVariables") then{
	s_player_toggleDegree = -1;
	s_player_toggleDegrees=[];
	degreeActions = -1;
	s_player_toggleVector = -1;
	s_player_toggleVectors=[];
	vectorActions = -1;
	vectorBuildVariables = true;
};
_pos = [player] call FNC_GetPos;
if ((count (nearestObjects [player,dayz_allowedObjects2,150])) >= DZE_BuildingLimit) exitWith {
DZE_ActionInProgress = false;
cutText ["Cannot build, too many objects within 150 meters!","PLAIN DOWN"];
systemchat "Cannot build, too many objects within 150 meters!";
};
// disallow building if player is higher than DZE_BuildHeight
_vehicle = vehicle player;
_inVehicle = (_vehicle != player);
_BuildHeight = DZE_BuildHeight;
if (((getPosATL _vehicle) select 2) > DZE_BuildHeight) exitWith {
DZE_ActionInProgress = false; 
cutText [format["Your fear of heights prevents you from building above %1 meters!",_BuildHeight], "PLAIN DOWN"];
systemChat format ["Your fear of heights prevents you from building above %1 meters!",_BuildHeight];
};

_onLadder =		(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_isWater = 		dayz_isSwimming;
_cancel = false;
_reason = "";
_canBuildOnPlot = false;

_vehicle = vehicle player;
_inVehicle = (_vehicle != player);

helperDetach = false; 
_canDo = (!r_drag_sqf and !r_player_unconscious);

DZE_Q = false;
DZE_Z = false;

DZE_Q_alt = false;
DZE_Z_alt = false;

DZE_Q_ctrl = false;
DZE_Z_ctrl = false;

DZE_5 = false;
DZE_4 = false;
DZE_6 = false;
DZE_F = false;

DZE_cancelBuilding = false;

DZE_updateVec = false;
DZE_memDir = 0;
DZE_memForBack = 0;
DZE_memLeftRight = 0;

call gear_ui_init;
closeDialog 1;

if (_isWater) exitWith {DZE_ActionInProgress = false; cutText [localize "str_player_26", "PLAIN DOWN"];};
if (_inVehicle) exitWith {DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_42"), "PLAIN DOWN"];};
if (_onLadder) exitWith {DZE_ActionInProgress = false; cutText [localize "str_player_21", "PLAIN DOWN"];};
if (player getVariable["combattimeout", 0] >= time) exitWith {DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_43"), "PLAIN DOWN"];};

_item =	_this;

// Need Near Requirements
_abort = false;
_reason = "";

_needNear = 	getArray (configFile >> "CfgMagazines" >> _item >> "ItemActions" >> "Build" >> "neednearby");

{
	switch(_x) do{
		case "fire":
		{
			_distance = 3;
			_isNear = {inflamed _x} count (_pos nearObjects _distance);
			if(_isNear == 0) then {
				_abort = true;
				_reason = "fire";
			};
		};
		case "workshop":
		{
			_distance = 3;
			_isNear = count (nearestObjects [_pos, ["Wooden_shed_DZ","WoodShack_DZ","WorkBench_DZ"], _distance]);
			if(_isNear == 0) then {
				_abort = true;
				_reason = "workshop";
			};
		};
		case "fueltank":
		{
			_distance = 30;
			_isNear = count (nearestObjects [_pos, dayz_fuelsources, _distance]);
			if(_isNear == 0) then {
				_abort = true;
				_reason = "fuel tank";
			};
		};
	};
} forEach _needNear;


if(_abort) exitWith {
	cutText [format[(localize "str_epoch_player_135"),_reason,_distance], "PLAIN DOWN"];
	DZE_ActionInProgress = false;
};

_classname = 	getText (configFile >> "CfgMagazines" >> _item >> "ItemActions" >> "Build" >> "create");
_classnametmp = _classname;
_require =  getArray (configFile >> "cfgMagazines" >> _this >> "ItemActions" >> "Build" >> "require");
_text = 		getText (configFile >> "CfgVehicles" >> _classname >> "displayName");
_ghost = getText (configFile >> "CfgVehicles" >> _classname >> "ghostpreview");

_lockable = 0;
if(isNumber (configFile >> "CfgVehicles" >> _classname >> "lockable")) then {
	_lockable = getNumber(configFile >> "CfgVehicles" >> _classname >> "lockable");
};

_requireplot = DZE_requireplot;
if(isNumber (configFile >> "CfgVehicles" >> _classname >> "requireplot")) then {
	_requireplot = getNumber(configFile >> "CfgVehicles" >> _classname >> "requireplot");
};

_isAllowedUnderGround = 1;
if(isNumber (configFile >> "CfgVehicles" >> _classname >> "nounderground")) then {
	_isAllowedUnderGround = getNumber(configFile >> "CfgVehicles" >> _classname >> "nounderground");
};

_offset = 	getArray (configFile >> "CfgVehicles" >> _classname >> "offset");
if((count _offset) <= 0) then {
	_offset = [0,1.5,0];
};

_isPole = (_classname == "Plastic_Pole_EP1_DZ");
_isLandFireDZ = (_classname == "Land_Fire_DZ");

_distance = DZE_PlotPole select 0;
_needText = localize "str_epoch_player_246";

if(_isPole) then {
	_distance = DZE_PlotPole select 1;
};

// check for near plot
_findNearestPoles = nearestObjects [(vehicle player), ["Plastic_Pole_EP1_DZ"], _distance];
_findNearestPole = [];

{
	if (alive _x) then {
		_findNearestPole set [(count _findNearestPole),_x];
	};
} count _findNearestPoles;

_IsNearPlot = count (_findNearestPole);

// If item is plot pole && another one exists within DZE_PlotPole
_PlotPole = DZE_PlotPole select 1;
if(_isPole && _IsNearPlot > 0) exitWith {
DZE_ActionInProgress = false;
cutText [format["You Cannot place a plot pole within %1 of another plot pole.",_PlotPole], "PLAIN DOWN"];
systemChat format ["You Cannot place a plot pole within %1 of another plot pole.",_PlotPole];
};
_vehicle = vehicle player;
if ((_isPole) && ((getPosATL _vehicle) select 2) > 5) exitWith  {
			_cancel = true; _reason = "Plot must be on ground..";
			DZE_ActionInProgress = false; 
			cutText ["[BlackHole]: PlotPoles must be on Ground Level","PLAIN DOWN"];
			systemchat "[BlackHole]: PlotPoles must be on Ground Level";
};		
if(_IsNearPlot == 0) then {

	// Allow building of plot
	if(_requireplot == 0 || _isLandFireDZ) then {
		_canBuildOnPlot = true;
	};

} else {
	// Since there are plots nearby we check for ownership && then for friend status

	// check nearby plots ownership && then for friend status
	_nearestPole = _findNearestPole select 0;

	// Find owner
	_ownerID = _nearestPole getVariable ["CharacterID","0"];

	// diag_log format["DEBUG BUILDING: %1 = %2", dayz_characterID, _ownerID];

	// check if friendly to owner
	if(dayz_characterID == _ownerID) then {  //Keep ownership
		// owner can build anything within his plot except other plots
		if(!_isPole) then {
			_canBuildOnPlot = true;
		};

	} else {
		    // disallow building plot
		    if(!_isPole) then {
            _friendlies = _nearestPole getVariable ["plotfriends",[]];
            _fuid  = [];
           {
                _friendUID = _x select 0;
                _fuid  =  _fuid  + [_friendUID];
           } forEach _friendlies;
                _builder  = getPlayerUID player;
           // check if friendly to owner
            if(_builder in _fuid) then {
                _canBuildOnPlot = true;
            };
		};
	};
};

// _message
if(!_canBuildOnPlot) exitWith {  DZE_ActionInProgress = false; cutText [format[(localize "STR_EPOCH_PLAYER_135"),_needText,_distance] , "PLAIN DOWN"]; };

_missing = "";
_hasrequireditem = true;
{
	_hastoolweapon = _x in weapons player;
	if(!_hastoolweapon) exitWith { _hasrequireditem = false; _missing = getText (configFile >> "cfgWeapons" >> _x >> "displayName"); };
} count _require;

_hasbuilditem = _this in magazines player;
if (!_hasbuilditem) exitWith {DZE_ActionInProgress = false; cutText [format[(localize "str_player_31"),_text,"build"] , "PLAIN DOWN"]; };

if (!_hasrequireditem) exitWith {DZE_ActionInProgress = false; cutText [format[(localize "str_epoch_player_137"),_missing] , "PLAIN DOWN"]; };
if (_hasrequireditem) then {

	_location = [0,0,0];
	_isOk = true;

	// get inital players position
	_location1 = [player] call FNC_GetPos;
	_dir = getDir player;

	// if ghost preview available use that instead
	if (_ghost != "") then {
		_classname = _ghost;
	};

	_object = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];
	//Build gizmo
	_objectHelper = "Sign_sphere10cm_EP1" createVehicle _location;
	_helperColor = "#(argb,8,8,3)color(0,0,0,0,ca)";
	_objectHelper setobjecttexture [0,_helperColor];
	_objectHelper attachTo [player,_offset];
	_object attachTo [_objectHelper,[0,0,0]];
	_position = [_objectHelper] call FNC_GetPos;
	
	_objHDiff = 0;

	if (isClass (missionConfigFile >> "SnapBuilding" >> _classname)) then {	
		["","","",["Init",_object,_classname,_objectHelper]] spawn snap_build;
	};
	
	if !(_item in DZE_noRotate) then{
		["","","",["Init","Init",0]] spawn build_vectors;
	};
	while {_isOk} do {

		_zheightchanged = false;
		_zheightdirection = "";
		_rotate = false;

		if (DZE_Q) then {
			DZE_Q = false;
			_zheightdirection = "up";
			_zheightchanged = true;
		};
		if (DZE_Z) then {
			DZE_Z = false;
			_zheightdirection = "down";
			_zheightchanged = true;
		};
		if (DZE_Q_alt) then {
			DZE_Q_alt = false;
			_zheightdirection = "up_alt";
			_zheightchanged = true;
		};
		if (DZE_Z_alt) then {
			DZE_Z_alt = false;
			_zheightdirection = "down_alt";
			_zheightchanged = true;
		};
		if (DZE_Q_ctrl) then {
			DZE_Q_ctrl = false;
			_zheightdirection = "up_ctrl";
			_zheightchanged = true;
		};
		if (DZE_Z_ctrl) then {
			DZE_Z_ctrl = false;
			_zheightdirection = "down_ctrl";
			_zheightchanged = true;
		};
		if (DZE_4) then {
			_rotate = true;
			DZE_4 = false;
			if(DZE_dirWithDegrees) then{
				DZE_memDir = DZE_memDir - DZE_curDegree;
			}else{
				DZE_memDir = DZE_memDir - 45;
			};
		};
		if (DZE_6) then {
			_rotate = true;
			DZE_6 = false;
			if(DZE_dirWithDegrees) then{
				DZE_memDir = DZE_memDir + DZE_curDegree;
			}else{
				DZE_memDir = DZE_memDir + 45;
			};
		};
		
		if(DZE_updateVec) then{
			[_objectHelper,[DZE_memForBack,DZE_memLeftRight,DZE_memDir]] call fnc_SetPitchBankYaw;
			DZE_updateVec = false;
		};
		
		if (DZE_F and _canDo) then {
			if (helperDetach) then {
				_objectHelper attachTo [player];
				DZE_memDir = DZE_memDir-(getDir player);
				helperDetach = false;
				[_objectHelper,[DZE_memForBack,DZE_memLeftRight,DZE_memDir]] call fnc_SetPitchBankYaw;
			} else {		
				_objectHelperPos = getPosATL _objectHelper;
				detach _objectHelper;			
				DZE_memDir = getDir _objectHelper;
				[_objectHelper,[DZE_memForBack,DZE_memLeftRight,DZE_memDir]] call fnc_SetPitchBankYaw;
				_objectHelper setPosATL _objectHelperPos;
				_objectHelper setVelocity [0,0,0]; //fix sliding glitch
				helperDetach = true;
			};
			DZE_F = false;
		};

		if(_rotate) then {
			[_objectHelper,[DZE_memForBack,DZE_memLeftRight,DZE_memDir]] call fnc_SetPitchBankYaw;
		};

		if(_zheightchanged) then {
			if (!helperDetach) then {
				detach _objectHelper;
				_objectHelperDir = getDir _objectHelper;
			};

			_position = [_objectHelper] call FNC_GetPos;

			if(_zheightdirection == "up") then {
				_position set [2,((_position select 2)+0.1)];
				_objHDiff = _objHDiff + 0.1;
			};
			if(_zheightdirection == "down") then {
				_position set [2,((_position select 2)-0.1)];
				_objHDiff = _objHDiff - 0.1;
			};

			if(_zheightdirection == "up_alt") then {
				_position set [2,((_position select 2)+1)];
				_objHDiff = _objHDiff + 1;
			};
			if(_zheightdirection == "down_alt") then {
				_position set [2,((_position select 2)-1)];
				_objHDiff = _objHDiff - 1;
			};

			if(_zheightdirection == "up_ctrl") then {
				_position set [2,((_position select 2)+0.01)];
				_objHDiff = _objHDiff + 0.01;
			};
			if(_zheightdirection == "down_ctrl") then {
				_position set [2,((_position select 2)-0.01)];
				_objHDiff = _objHDiff - 0.01;
			};

			if((_isAllowedUnderGround == 0) && ((_position select 2) < 0)) then {
				_position set [2,0];
			};

			if (surfaceIsWater _position) then {
				_objectHelper setPosASL _position;
			} else {
				_objectHelper setPosATL _position;
			};

			if (!helperDetach) then {
				_objectHelper attachTo [player];
			};
			[_objectHelper,[DZE_memForBack,DZE_memLeftRight,DZE_memDir]] call fnc_SetPitchBankYaw;
		};

		sleep 0.5;

		_location2 = [player] call FNC_GetPos;
		_objectHelperPos = [_objectHelper] call FNC_GetPos;

		if(DZE_5) exitWith {
			_isOk = false;
			_position = [_object] call FNC_GetPos;
			detach _object;
			_dir = getDir _object;
			_vector = [(vectorDir _object),(vectorUp _object)];
			deleteVehicle _object;
			detach _objectHelper;
			deleteVehicle _objectHelper;
		};

		if(_location1 distance _location2 > 10) exitWith {
			_isOk = false;
			_cancel = true;
			_reason = "You've moved to far away from where you started building (within 10 meters)";
			detach _object;
			deleteVehicle _object;
			detach _objectHelper;
			deleteVehicle _objectHelper;
		};
		
		if(_location1 distance _objectHelperPos > 10) exitWith {
			_isOk = false;
			_cancel = true;
			_reason = "Object is placed to far away from where you started building (within 10 meters)";
			detach _object;
			deleteVehicle _object;
			detach _objectHelper;
			deleteVehicle _objectHelper;
		};

		if(abs(_objHDiff) > 10) exitWith {
			_isOk = false;
			_cancel = true;
			_reason = "Cannot move up or down more than 10 meters";
			detach _object;
			deleteVehicle _object;
			detach _objectHelper;
			deleteVehicle _objectHelper;
		};

		if (player getVariable["combattimeout", 0] >= time) exitWith {
			_isOk = false;
			_cancel = true;
			_reason = (localize "str_epoch_player_43");
			detach _object;
			deleteVehicle _object;
			detach _objectHelper;
			deleteVehicle _objectHelper;
		};

		if (DZE_cancelBuilding) exitWith {
			_isOk = false;
			_cancel = true;
			_reason = "Cancelled building.";
			detach _object;
			deleteVehicle _object;
			detach _objectHelper;
			deleteVehicle _objectHelper;
		};
	};

	//No building on roads unless toggled
	if (!DZE_BuildOnRoads) then {
		if (isOnRoad _position) then { _cancel = true; _reason = "Cannot build on a road."; };
	};
	


	// No building in trader zones
	if(!canbuild) then { _cancel = true; _reason = "Cannot build in a city."; };
	
	_isPlotPole2 = (_classname == "Plastic_Pole_EP1_DZ");
	if (_isPlotPole2) then {
	_newUID = getPlayerUID player;
	_newadd = name player;
	_typeQ = 1;
	PVDZE_queryPlotArray = [player, _newUID, _typeQ];
	publicVariableServer "PVDZE_queryPlotArray";
	waitUntil {!isNil "PVDZE_queryPlotArrayResult"};
	_playerhits = PVDZE_queryPlotArrayResult;
	PVDZE_queryPlotArrayResult = nil;
	diag_log format ["_playerhits: %1", _playerhits];
	
		if (_playerhits == 0 ) then { _cancel = true; _reason = "Already on a PlotPole."; };
	};

	//Forbidden Building distance within DZE_NoBuildHighValueDis
	_ForbiddenDis = DZE_NoBuildHighValueDis;
	_noBuild = nearestObjects [(vehicle player), ["HeliHCivil","MASH_EP1","Camp_EP1","CampEast_EP1","Land_SS_hangar","Land_Mil_Barracks_i","Land_Mil_Barracks","Land_Tovarna2","Land_Mil_ControlTower"], _ForbiddenDis];
	_Forbidden = count (_noBuild);
	if(_Forbidden > 0) then { 
	_cancel = true;
	cutText [format["It is forbidden to build within %1 meters of high value buildings!",_ForbiddenDis], "PLAIN DOWN"];
	systemChat format ["It is forbidden to build within %1 meters of high value buildings!",_ForbiddenDis];
	};

	if(!_cancel) then {

		_classname = _classnametmp;

		// Start Build
		_tmpbuilt = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];

		_tmpbuilt setdir _dir;
		_tmpbuilt setVariable["memDir",_dir,true];
		
		// Get position based on object
		_location = _position;

		if((_isAllowedUnderGround == 0) && ((_location select 2) < 0)) then {
			_location set [2,0];
		};

		_tmpbuilt setVectorDirAndUp _vector;
	
		_buildOffset = [0,0,0];
		_vUp = _vector select 1;
		switch (_classname) do {
			case "MetalFloor_DZ": { _buildOffset = [(_vUp select 0) * .148, (_vUp select 1) * .148,0]; };
		};
		
		_location = [
			(_location select 0) - (_buildOffset select 0),
			(_location select 1) - (_buildOffset select 1),
			(_location select 2) - (_buildOffset select 2)
		];
		
		if (surfaceIsWater _location) then {
			_tmpbuilt setPosASL _location;
			_location = ASLtoATL _location; //Database uses ATL
		} else {
			_tmpbuilt setPosATL _location;
		};

		cutText [format[(localize "str_epoch_player_138"),_text], "PLAIN DOWN"];

		_limit = 3;

		if (DZE_StaticConstructionCount > 0) then {
			_limit = DZE_StaticConstructionCount;
		}
		else {
			if (isNumber (configFile >> "CfgVehicles" >> _classname >> "constructioncount")) then {
				_limit = getNumber(configFile >> "CfgVehicles" >> _classname >> "constructioncount");
			};
		};

		_isOk = true;
		_proceed = false;
		_counter = 0;

		while {_isOk} do {

			[10,10] call dayz_HungerThirst;
			player playActionNow "Medic";

			_dis=20;
			_sfx = "repair";
			[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
			[player,_dis,true,(getPosATL player)] spawn player_alertZombies;

			r_interrupt = false;
			r_doLoop = true;
			_started = false;
			_finished = false;

			while {r_doLoop} do {
				_animState = animationState player;
				_isMedic = ["medic",_animState] call fnc_inString;
				if (_isMedic) then {
					_started = true;
				};
				if (_started && !_isMedic) then {
					r_doLoop = false;
					_finished = true;
				};
				if (r_interrupt || (player getVariable["combattimeout", 0] >= time)) then {
					r_doLoop = false;
				};
				if (DZE_cancelBuilding) exitWith {
					r_doLoop = false;
				};
				sleep 0.1;
			};
			r_doLoop = false;


			if(!_finished) exitWith {
				_isOk = false;
				_proceed = false;
			};

			if(_finished) then {
				_counter = _counter + 1;
			};

			cutText [format[(localize "str_epoch_player_139"),_text, _counter,_limit], "PLAIN DOWN"];
			
			_isPlotPole = (_classname == "Plastic_Pole_EP1_DZ");
			if (_isPlotPole) then {
			//[] execVM 'Scripts\plotManagement\addowner.sqf';
			};			

			if(_counter == _limit) exitWith {
				_isOk = false;
				_proceed = true;
			};

		};

		if (_proceed) then {

			_num_removed = ([player,_item] call BIS_fnc_invRemove);
			if(_num_removed == 1) then {

				cutText [format[localize "str_build_01",_text], "PLAIN DOWN"];

				if (_isPole) then {
					[] spawn player_plotPreview;
				};

				_tmpbuilt setVariable ["OEMPos",_location,true];

				if(_lockable > 1) then {

					_combinationDisplay = "";

					switch (_lockable) do {

						case 2: { // 2 lockbox
							_combination_1 = (floor(random 3)) + 100; // 100=red,101=green,102=blue
							_combination_2 = floor(random 10);
							_combination_3 = floor(random 10);
							_combination = format["%1%2%3",_combination_1,_combination_2,_combination_3];
							dayz_combination = _combination;
							if (_combination_1 == 100) then {
								_combination_1_Display = "Red";
							};
							if (_combination_1 == 101) then {
								_combination_1_Display = "Green";
							};
							if (_combination_1 == 102) then {
								_combination_1_Display = "Blue";
							};
							_combinationDisplay = format["%1%2%3",_combination_1_Display,_combination_2,_combination_3];
						};

						case 3: { // 3 combolock
							_combination_1 = floor(random 10);
							_combination_2 = floor(random 10);
							_combination_3 = floor(random 10);
							_combination = format["%1%2%3",_combination_1,_combination_2,_combination_3];
							dayz_combination = _combination;
							_combinationDisplay = _combination;
						};

						case 4: { // 4 safe
							_combination_1 = floor(random 10);
							_combination_2 = floor(random 10);
							_combination_3 = floor(random 10);
							_combination_4 = floor(random 10);
							_combination = format["%1%2%3%4",_combination_1,_combination_2,_combination_3,_combination_4];
							dayz_combination = _combination;
							_combinationDisplay = _combination;
						};
					};

					_tmpbuilt setVariable ["CharacterID",_combination,true];


					PVDZE_obj_Publish = [_combination,_tmpbuilt,[_dir,_location,_vector],_classname];
					publicVariableServer "PVDZE_obj_Publish";

					cutText [format[(localize "str_epoch_player_140"),_combinationDisplay,_text], "PLAIN DOWN", 5];
					systemChat format [(localize "str_epoch_player_140"),_combinationDisplay,_text];


				} else {
					_tmpbuilt setVariable ["CharacterID",dayz_characterID,true];

					// fire?
					if(_tmpbuilt isKindOf "Land_Fire_DZ") then {
						_tmpbuilt spawn player_fireMonitor;
					} else {
						PVDZE_obj_Publish = [dayz_characterID,_tmpbuilt,[_dir,_location,_vector],_classname];
						publicVariableServer "PVDZE_obj_Publish";
					};
				};
			} else {
				deleteVehicle _tmpbuilt;
				cutText [(localize "str_epoch_player_46") , "PLAIN DOWN"];
			};

		} else {
			r_interrupt = false;
			if (vehicle player == player) then {
				[objNull, player, rSwitchMove,""] call RE;
				player playActionNow "stop";
			};

			deleteVehicle _tmpbuilt;

			cutText [(localize "str_epoch_player_46") , "PLAIN DOWN"];
		};

	} else {
		cutText [format[(localize "str_epoch_player_47"),_text,_reason], "PLAIN DOWN"];
	};
};
			_isPlotPole = (_classname == "Plastic_Pole_EP1_DZ");
			if (_isPlotPole) then {
			
			_nul = [] execVM 'Scripts\plotManagement\addowner.sqf';
			};	
			
DZE_ActionInProgress = false;
