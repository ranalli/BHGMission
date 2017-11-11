startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

dayZ_instance = 11;
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

player setVariable ["BIS_noCoreConversations", true];
enableRadio false;
enableSentences false;

spawnShoremode = 1;
spawnArea= 1500;
MaxVehicleLimit = 0;
MaxDynamicDebris = 0;
MaxMineVeins = 0;
MaxAmmoBoxes = 0;
dayz_MapArea = 14000;
dayz_minpos = -1; 
dayz_maxpos = 16000;
dayz_spawnselection = 0;
dayz_paraSpawn = false;
dayz_sellDistance_vehicle = 30;
dayz_sellDistance_boat = 30;
dayz_sellDistance_air = 40;
dayz_zedsAttackVehicles = false;
dayz_maxLocalZombies = 5;
dayz_maxGlobalZombiesInit = 3;
dayz_maxGlobalZombiesIncrease = 1;
dayz_maxZeds = 100;
dayz_maxAnimals = 0;
dayz_tameDogs = false;
dayz_poleSafeArea = 75; //Distance plot poles will be free of zeds
DynamicVehicleDamageLow = 0;
DynamicVehicleDamageHigh = 10;
DynamicVehicleFuelLow = 50;
DynamicVehicleFuelHigh = 90;
DZE_PlayerZed = false;
DZE_vehicleAmmo = 1;
DZE_BackpackGuard = false;
DZE_BuildingLimit = 175;
DZE_TRADER_SPAWNMODE = false;
DZE_ForceNameTagsInTrader = true;
DZE_BuildHeight = 26; //Max build height
DZE_NoBuildHighValueDis = 450; //Distance that a player cannot build within high value buildings(Hospitals/GeneralStores/Barracks/Hangars/fireHouses/BigIndustrial/GasStations) can be changed in "Scripts\custom\snap_pro\player_build.sqf" ***Line 498***
DZE_PlotPole = [75,375];
DZE_maintainRange = ((DZE_PlotPole select 0)+60);
DZE_BuildOnRoads = false;
DZE_MissionLootTable = true;
DZE_StaticConstructionCount = 1;
DZE_R3F_WEIGHT = false;
DZE_SelfTransfuse = true;
DZE_selfTransfuse_Values = [6000, 5, 210]; //Format [blood amount given, infection chance, timeout from using blood bag];
DZE_noRotate = ["ItemSandbagLarge","ItemSandbagExLarge","ItemSandbagExLarge5x","ItemWoodLadder"];
DZE_vectorDegrees = [0.01, 0.1, 1, 5, 15, 45, 90];
DZE_curDegree = 45;
DZE_dirWithDegrees = true;
DZE_ConfigTrader = true;
DZE_AsReMix_PLAYER_HUD = true;
DZE_DamageBeforeMaint = 0.1;
DZE_Garage = ["Misc_cargo_cont_small_EP1"];

EpochEvents = [
	["any","any","any","any",05,"Treasure"],
	["any","any","any","any",15,"Construction"],
	["any","any","any","any",20,"abandonedvault"],
	["any","any","any","any",45,"Supplyitems"],
	["any","any","any","any",55,"Military"]
];

dayz_fullMoonNights = true;

call compile preprocessFileLineNumbers "Scripts\Variables\Variables.sqf";
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "Scripts\public_EH\publicEH.sqf";
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "Scripts\Server_Compile\compiles.sqf";
call compile preprocessFileLineNumbers "Scripts\addons\bike\init.sqf";
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "Scripts\Server_Traders\server_traders.sqf";
call compile preprocessFileLineNumbers "Scripts\logistic\init.sqf";
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if (isServer) then {
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\dynamic_vehicle.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\mission.sqf";
	_serverMonitor = 	[] execVM "\z\addons\dayz_server\system\server_monitor.sqf";
};
if (!isDedicated) then {
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	execVM "Scripts\Service_Point\service_point.sqf";
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	execFSM "Scripts\Fixes\player_monitor.fsm";
	execVM "Scripts\spawn\start.sqf";
	execVM "Scripts\dzgm\init.sqf";
	execVM "Scripts\Fixes\kill_msg.sqf";
	execVM "Scripts\Fixes\mapmarker.sqf";
	[100000,player] call BNRG_fnc_setRating; //set player rating 100000
	if (DZE_AsReMix_PLAYER_HUD) then {execVM "Scripts\Player_Hud\playerHud.sqf"};
	[] spawn {
		waitUntil { sleep 1; !isNil ("PVDZE_plr_LoginRecord") };
		6 cutRsc ["EarPlugs", "PLAIN"];
		waitUntil { !isNil "player_reloadMag" };
	    player_reloadMago = player_reloadMag;
	    player_reloadMag = {
		    if (_this in ["vil_20Rnd_762x51_G3"]) exitWith {
			    cutText ["You can not split G3 Mags", "PLAIN DOWN"];
		    };
		    _this call player_reloadMago;
	    };
    };
};
execVM "Scripts\Gold_Coin_system\init.sqf";
//execVM "Scripts\SafeZone\safezone.sqf";
execVM "Scripts\SafeZone\andre_safezone.sqf";
execVM "Scripts\custom\base_SafeArea.sqf";
#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"