private ["_activatingPlayer","_obj","_objectID","_objectUID","_started","_finished","_animState","_isMedic","_isOk","_proceed","_counter","_limit","_objType","_sfx","_dis","_itemOut","_countOut","_selectedRemoveOutput","_friendlies","_ownerID","_refundpart","_isWreck","_brokenTool","_removeTool","_isDestructable","_isRemovable","_objOwnerID","_isOwnerOfObj","_preventRefund","_ipos","_item","_radius","_isWreckBuilding","_nameVehicle","_isModular","_playerUID","_distance","_plotcheck","_IsNearPlot","_nearestPole","_buildcheck","_isowner","_isfriendly"];
if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_88") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;
player removeAction s_player_deleteBuild;
s_player_deleteBuild = 1;
_obj = _this select 3;
_activatingPlayer = player;
_item =	_this select 0;
_sqlQ = false;

_findNearestPoles2 = nearestObjects[player, ["Plastic_Pole_EP1_DZ"], DZE_PlotPole select 0];
_checkme = count _findNearestPoles2;
if (_checkme == 1 )then {
_thePlot2 = _findNearestPoles2 select 0;
_friends2 = _thePlot2 getVariable ["plotfriends", []];
_friendUID2 = _friends2 select 0;
_objOwnerID = _friendUID2;
} else {_objOwnerID = ["0"]};
if((getPlayerUID player) in _objOwnerID)then {

diag_log format ["_objOwnerID: %1", _objOwnerID];
_playerUID = getPlayerUID player;
diag_log format ["_playerUID: %1", _playerUID];
_isOwnerOfObj = true;
} else {_isOwnerOfObj = false;};


_cnt2 = {isPlayer _x && _x != player} count (player nearEntities [['CAManBase'],10]);


if (_cnt2 >= 1 ) exitWith { DZE_ActionInProgress = false; cutText ["Someone is close by.  Cannot desconstruct","PLAIN DOWN"];};

if (_obj in DZE_DoorsLocked) exitWith { DZE_ActionInProgress = false; cutText [(localize "STR_EPOCH_ACTIONS_20"), "PLAIN DOWN"];};
if(_obj getVariable ["GeneratorRunning", false]) exitWith {DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_89"), "PLAIN DOWN"];};
_objectID = _obj getVariable ["ObjectID","0"];
_objectUID = _obj getVariable ["ObjectUID","0"];
_isOk = true;
_proceed = false;
_objType = typeOf _obj;
_isDestructable = _obj isKindOf "BuiltItems";
_isWreck = _objType in DZE_isWreck;

_isRemovable = _objType in DZE_isRemovable;
_isWreckBuilding = _objType in DZE_isWreckBuilding;
_isMine = _objType in ["Land_iron_vein_wreck","Land_silver_vein_wreck","Land_gold_vein_wreck"];
_isModular = _obj isKindOf "ModularItems";
_distance = DZE_PlotPole select 0;

_limit = 3;
if (DZE_StaticConstructionCount > 0) then {
	_limit = DZE_StaticConstructionCount;
}
else {
	if (isNumber (configFile >> "CfgVehicles" >> _objType >> "constructioncount")) then {
		_limit = getNumber(configFile >> "CfgVehicles" >> _objType >> "constructioncount");
	};
};

_nameVehicle = getText(configFile >> "CfgVehicles" >> _objType >> "displayName");
cutText [format[(localize "str_epoch_player_162"),_nameVehicle], "PLAIN DOWN"];
if (_isModular) then {
     cutText [(localize "STR_EPOCH_ACTIONS_21"), "PLAIN DOWN"];
};

[player,50,true,(getPosATL player)] spawn player_alertZombies;
_brokenTool = false;
_counter = 0;
while {_isOk} do {

	if(isNull(_obj)) exitWith {
		_isOk = false;
		_proceed = false;
	};
	[1,1] call dayz_HungerThirst;
	player playActionNow "Medic";
	_dis=20;
	[player,_dis,true,(getPosATL player)] spawn player_alertZombies;

	r_interrupt = false;
	_animState = animationState player;
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
			_sfx = "repair";
			[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
		};
		if (r_interrupt) then {
			r_doLoop = false;
		};

		sleep 0.1;

	};

	if(!_finished) exitWith {
		_isOk = false;
		_proceed = false;
	};

	if(_finished) then {
		_counter = _counter + 1;
		if((_isDestructable || _isRemovable) && !_isOwnerOfObj) then {
			if((random 20) <= 1) then {
				_brokenTool = true;
			};
		};
	};
	if(_brokenTool) exitWith {
		_isOk = false;
		_proceed = false;
	};

	cutText [format[(localize "str_epoch_player_163"), _nameVehicle, _counter,_limit], "PLAIN DOWN"];

	if(_counter == _limit) exitWith {
		_isOk = false;
		_proceed = true;
	};

};

if(_brokenTool) then {
	if(_isWreck) then {
		_removeTool = "ItemToolbox";
	} else {
		_removeTool = ["ItemCrowbar","ItemToolbox"] call BIS_fnc_selectRandom;
	};
	if(([player,_removeTool,1] call BIS_fnc_invRemove) > 0) then {
		cutText [format[(localize "str_epoch_player_164"),getText(configFile >> "CfgWeapons" >> _removeTool >> "displayName"),_nameVehicle], "PLAIN DOWN"];
	};
};

if (_proceed) then {

	if(!isNull(_obj)) then {

		_ipos = getPosATL _obj;

		deleteVehicle _obj;

		if(!_isWreck) then {
			PVDZE_obj_Delete = [_objectID,_objectUID,_activatingPlayer];
			publicVariableServer "PVDZE_obj_Delete";
		};
		



		

		cutText [format[(localize "str_epoch_player_165"),_nameVehicle], "PLAIN DOWN"];

		_preventRefund = false;

		_selectedRemoveOutput = [];
		if(_isWreck) then {
			_refundpart = ["PartEngine","PartGeneric","PartFueltank","PartWheel","PartGlass","ItemJerrycan"] call BIS_fnc_selectRandom;
			_selectedRemoveOutput set [count _selectedRemoveOutput,[_refundpart,1]];
		} else {
			if(_isWreckBuilding) then {
				_selectedRemoveOutput = getArray (configFile >> "CfgVehicles" >> _objType >> "removeoutput");
			} else {
			switch (_objType) do
				{
										// MODULAR BUILDABLES
										case "BagFenceRound_DZ":
                                        {
                                                _selectedRemoveOutput = [["BagFenceRound_DZ_kit",1]];
                                                hint format ["Deconstruction found Round Sandbag - %1",_objType];
                                        };
										case "CanvasHut_DZ":
                                        {
                                                _selectedRemoveOutput = [["sun_shade_kit",1]];
                                                hint format ["Deconstruction found Sun Shade Hut - %1",_objType];
                                        };
										case "CinderWall_DZ":
                                        {
                                                _selectedRemoveOutput = [["cinder_wall_kit",1],["MortarBucket",1],["CinderBlocks",4]];
                                                hint format ["Deconstruction found Cinder Wall - %1",_objType];
                                        };
										case "CinderWallDoor_DZ":
                                        {
                                                _selectedRemoveOutput = [["CinderBlocks",3]];
                                                hint format ["Deconstruction found Cinder Garage Door - %1",_objType];
                                        };
										case "CinderWallDoorSmall_DZ":
                                        {
                                                _selectedRemoveOutput = [["CinderBlocks",3],["ItemTankTrap",1],["ItemPole",1]];
                                                hint format ["Deconstruction found Cinder Small Wall Door - %1",_objType];
                                        };
										case "CinderWallDoorway_DZ":
                                        {
                                                _selectedRemoveOutput = [["CinderBlocks",3]];
                                                hint format ["Deconstruction found Cinder Garage Doorway - %1",_objType];
                                        };
										case "CinderWallHalf_DZ":
                                        {
                                                _selectedRemoveOutput = [["cinder_wall_kit",1]];
                                                hint format ["Deconstruction found Cinder Half Wall - %1",_objType];
                                        };
										case "CinderWallSmallDoorway_DZ":
                                        {
                                                _selectedRemoveOutput = [["CinderBlocks",3]];
                                                hint format ["Deconstruction found Cinder Small Wall Doorway - %1",_objType];
                                        };
										case "DeerStand_DZ":
                                        {
                                                _selectedRemoveOutput = [["deer_stand_kit",1]];
                                                hint format ["Deconstruction found Deer Stand - %1",_objType];
                                        };
										case "Fence_corrugated_DZ":
                                        {
                                                _selectedRemoveOutput = [["ItemCorrugated",1]];
                                                hint format ["Deconstruction found Corrugated Fence - %1",_objType];
                                        };
										case "FireBarrel_DZ":
                                        {
                                                _selectedRemoveOutput = [["ItemFireBarrel_kit",1]];
                                                hint format ["Deconstruction found Fire Barrel - %1",_objType];
                                        };
										case "Fort_RazorWire":
                                        {
                                                _selectedRemoveOutput = [["ItemWire",1]];
                                                hint format ["Deconstruction found Razor Wire - %1",_objType];
                                        };
										case "FuelPump_DZ":
                                        {
                                                _selectedRemoveOutput = [["fuel_pump_kit",1]];
                                                hint format ["Deconstruction found Fuel Tank Pump - %1",_objType];
                                        };
										case "Generator_DZ":
                                        {
                                                _selectedRemoveOutput = [["ItemGenerator",1]];
                                                hint format ["Deconstruction found Power Generator - %1",_objType];
                                        };
										case "GunRack_DZ":
                                        {
                                                _selectedRemoveOutput = [["ItemGunRackKit",1]];
                                                hint format ["Deconstruction found Gunrack - %1",_objType];
                                        };
										case "Hedgehog_DZ":
                                        {
                                                _selectedRemoveOutput = [["ItemTankTrap",1]];
                                                hint format ["Deconstruction found Tank Trap - %1",_objType];
                                        };
										case "Land_DZE_GarageWoodDoor":
                                        {
                                                _selectedRemoveOutput = [["ItemWoodWallGarageDoor",1]];
                                                hint format ["Deconstruction found Wood Garage Door - %1",_objType];
                                        };
										case "Land_DZE_LargeWoodDoor":
                                        {
                                                _selectedRemoveOutput = [["ItemWoodWallDoorLg",1],["PartWoodLumber",1],["PartWoodPlywood",1]];
                                                hint format ["Deconstruction found Large Wood Wall with Door - %1",_objType];
                                        };
										case "Land_DZE_WoodDoor":
                                        {
                                                _selectedRemoveOutput = [["ItemWoodWallDoor",1],["PartWoodLumber",1],["PartWoodPlywood",1]];
                                                hint format ["Deconstruction found Small Wood Wall with Door - %1",_objType];
                                        };
										case "Land_HBarrier1_DZ":
                                        {
                                                _selectedRemoveOutput = [["ItemSandbagLarge",1]];
                                                hint format ["Deconstruction found H Barrier 1 - %1",_objType];
                                        };
										case "Land_HBarrier3_DZ":
                                        {
                                                _selectedRemoveOutput = [["ItemSandbagLarge",3]];
                                                hint format ["Deconstruction found H Barrier 3 - %1",_objType];
                                        };
										case "Land_HBarrier5_DZ":
                                        {
                                                _selectedRemoveOutput = [["ItemSandbagExLarge5x",1]];
                                                hint format ["Deconstruction found H Barrier 5 - %1",_objType];
                                        };
										case "LightPole_DZ":
                                        {
                                                _selectedRemoveOutput = [["light_pole_kit",1]];
                                                hint format ["Deconstruction found Light Pole - %1",_objType];
                                        };
										case "MetalFloor_DZ":
                                        {
                                                _selectedRemoveOutput = [["metal_floor_kit",1]];
                                                hint format ["Deconstruction found Metal Floor - %1",_objType];
                                        };
										case "MetalGate_DZ":
                                        {
                                                _selectedRemoveOutput = [["rusty_gate_kit",1]];
                                                hint format ["Deconstruction found Rusty Metal Gate - %1",_objType];
                                        };
										case "MetalPanel_DZ":
                                        {
                                                _selectedRemoveOutput = [["metal_panel_kit",1]];
                                                hint format ["Deconstruction found  Metal Panel - %1",_objType];
                                        };
										case "OutHouse_DZ":
                                        {
                                                _selectedRemoveOutput = [["outhouse_kit",1]];
                                                hint format ["Deconstruction found Outhouse - %1",_objType];
                                        };
										case "ParkBench_DZ":
                                        {
                                                _selectedRemoveOutput = [["park_bench_kit",1]];
                                                hint format ["Deconstruction found Park Bench - %1",_objType];
                                        };
										case "Sandbag1_DZ":
                                        {
                                                _selectedRemoveOutput = [["ItemSandbag",1]];
                                                hint format ["Deconstruction found Sandbag - %1",_objType];
                                        };
										case "SandNest_DZ":
                                        {
                                                _selectedRemoveOutput = [["sandbag_nest_kit",1]];
                                                hint format ["Deconstruction found Sandbag Nest - %1",_objType];
                                        };
										case "StickFence_DZ":
                                        {
                                                _selectedRemoveOutput = [["stick_fence_kit",1]];
                                                hint format ["Deconstruction found Stick Fence - %1",_objType];
                                        };
										case "StorageShed_DZ":
                                        {
                                                _selectedRemoveOutput = [["storage_shed_kit",1]];
                                                hint format ["Deconstruction found Storage Shed - %1",_objType];
                                        };
										case "Wooden_shed_DZ":
                                        {
                                                _selectedRemoveOutput = [["wooden_shed_kit",1]];
                                                hint format ["Deconstruction found Wooden Shed - %1",_objType];
                                        };
										case "WoodFloor_DZ":
                                        {
                                                _selectedRemoveOutput = [["ItemWoodFloor",1]];
                                                hint format ["Deconstruction found Wooden Floor - %1",_objType];
                                        };
										case "WoodFloorHalf_DZ":
                                        {
                                                _selectedRemoveOutput = [["ItemWoodFloorHalf",1]];
                                                hint format ["Deconstruction found Wood Floor 1/2 - %1",_objType];
                                        };
										case "WoodFloorQuarter_DZ":
                                        {
                                                _selectedRemoveOutput = [["ItemWoodFloorQuarter",1]];
                                                hint format ["Deconstruction found Wood Floor 1/4 - %1",_objType];
                                        };
										case "WoodLadder_DZ":
                                        {
                                                _selectedRemoveOutput = [["ItemWoodLadder",1]];
                                                hint format ["Deconstruction found Wood Ladder - %1",_objType];
                                        };
										case "WoodLargeWall_DZ":
                                        {
                                                _selectedRemoveOutput = [["ItemWoodWallLg",1]];
                                                hint format ["Deconstruction found Large Wood Wall - %1",_objType];
                                        };
										case "WoodLargeWallDoor_DZ":
                                        {
                                                _selectedRemoveOutput = [["ItemWoodWallDoorLg",1]];
                                                hint format ["Deconstruction found Large Wood Wall with Doorway - %1",_objType];
                                        };
										case "WoodLargeWallWin_DZ ":
                                        {
                                                _selectedRemoveOutput = [["ItemWoodWallWindowLg",1]];
                                                hint format ["Deconstruction found Large Wood Wall with Window - %1",_objType];
                                        };
										case "WoodRamp_DZ":
                                        {
                                                _selectedRemoveOutput = [["ItemDocumentRamp",1],["PartWoodLumber",8]];
                                                hint format ["Deconstruction found Wood Ramp - %1",_objType];
                                        };
										case "WoodShack_DZ":
                                        {
                                                _selectedRemoveOutput = [["wood_shack_kit",1]];
                                                hint format ["Deconstruction found Wood Shack - %1",_objType];
                                        };
										case "WoodSmallWall_DZ":
                                        {
                                                _selectedRemoveOutput = [["ItemWoodWall",1]];
                                                hint format ["Deconstruction found Small Wood Wall - %1",_objType];
                                        };
										case "WoodSmallWallDoor_DZ":
                                        {
                                                _selectedRemoveOutput = [["ItemWoodWallDoor",1]];
                                                hint format ["Deconstruction found Small Wood Wall with Doorway - %1",_objType];
                                        };
										case "WoodSmallWallThird_DZ":
                                        {
                                                _selectedRemoveOutput = [["ItemWoodWallThird",1]];
                                                hint format ["Deconstruction found Wood Wall 1/3 - %1",_objType];
                                        };
										case "WoodSmallWallWin_DZ":
                                        {
                                                _selectedRemoveOutput = [["ItemWoodWallWindow",1]];
                                                hint format ["Deconstruction found Small Wood Wall with Window - %1",_objType];
                                        };
										case "WoodStairs_DZ":
                                        {
                                                _selectedRemoveOutput = [["ItemWoodStairsSupport",1]];
                                                hint format ["Deconstruction found Wood Stairs with Supports - %1",_objType];
                                        };
										case "WoodStairsSans_DZ":
                                        {
                                                _selectedRemoveOutput = [["ItemWoodStairs",1]];
                                                hint format ["Deconstruction found Wood Stairs without Supports - %1",_objType];
                                        };
										case "WorkBench_DZ":
                                        {
                                                _selectedRemoveOutput = [["workbench_kit",1]];
                                                hint format ["Deconstruction found Wood Workbench - %1",_objType];
                                        };
										case "Plastic_Pole_EP1_DZ":
                                        {
                                                _selectedRemoveOutput = [["30m_plot_kit",1]];
												_sqlQ = true;
                                                hint format ["Deconstruction found Plot Pole - %1",_objType];
                                        };
										case "M240Nest_DZ":
                                        {
                                                _selectedRemoveOutput = [["m240_nest_kit",1]];
                                                hint format ["Deconstruction found M240 Nest - %1",_objType];
                                        };
										case "Misc_cargo_cont_small_EP1":
                                        {
                                                _selectedRemoveOutput = [["ItemBriefcase100oz",10]];
                                                hint format ["Deconstruction found Garage - %1",_objType];
                                        };
					};
				//_selectedRemoveOutput = getArray (configFile >> "CfgVehicles" >> _objType >> "removeoutput");
				//_preventRefund = (_objectID == "0" && _objectUID == "0");

			};
		};

		if((count _selectedRemoveOutput) <= 0) then {
			cutText [(localize "str_epoch_player_90"), "PLAIN DOWN"];
		};

		if (_ipos select 2 < 0) then {
			_ipos set [2,0];
		};

		_radius = 1;
		
		If (_sqlQ) then{
		_removeID = getPlayerUID player;
		_removeName = name player;
		_removeplayer = player;
		_erase = 1;
		PVDZE_deletePlotArray = [player, _removeID, _removeName, _erase];
		publicVariableServer "PVDZE_deletePlotArray";
		};
		

		if (_isMine) then
		{
			if ((random 10) <= 3) then
			{
                _gem = call {
                        _gems = [];
                        for '_Citrine' from 1 to 25 do {_gems = _gems + ["ItemCitrine"];};
                        for '_Topaz' from 1 to 25 do {_gems = _gems + ["ItemTopaz"];};
                        for '_Amethyst' from 1 to 10 do {_gems = _gems + ["ItemAmethyst"];};
                        for '_Obsidian' from 1 to 10 do {_gems = _gems + ["ItemObsidian"];};
                        for '_Sapphire' from 1 to 10 do {_gems = _gems + ["ItemSapphire"];};
                        for '_Emerald' from 1 to 5 do {_gems = _gems + ["ItemEmerald"];};
                        for '_Ruby' from 1 to 5 do {_gems = _gems + ["ItemRuby"];};




                        _gem = _gems select (floor(random (count _gems)));
                        _gem
                };
                _selectedRemoveOutput set [(count _selectedRemoveOutput),[_gem,1]];
			};
		};

		// give refund items
		if((count _selectedRemoveOutput) > 0 && !_preventRefund) then {
			_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
			{
				_itemOut = _x select 0;
				_countOut = _x select 1;
				if (typeName _countOut == "ARRAY") then {
					_countOut = round((random (_countOut select 1)) + (_countOut select 0));
				};
				_item addMagazineCargoGlobal [_itemOut,_countOut];
			} count _selectedRemoveOutput;

			_item setposATL _iPos;

			player reveal _item;

			player action ["Gear", _item];
		};
	} else {
		cutText [(localize "str_epoch_player_91"), "PLAIN DOWN"];
	};

} else {
	r_interrupt = false;
	if (vehicle player == player) then {
		[objNull, player, rSwitchMove,""] call RE;
		player playActionNow "stop";
	};
};
DZE_ActionInProgress = false;
s_player_deleteBuild = -1;
