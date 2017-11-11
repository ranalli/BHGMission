/*
	DayZ Mission System Config by Vampire
	DZMS: https://github.com/SMVampire/DZMS-DayZMissionSystem
*/

///////////////////////////////////////////////////////////////////////
// Do you want your players to gain humanity from killing mission AI?
DZMSMissHumanity = true;

// How Much Humanity?
DZMSCntHumanity = 50;

// Do You Want AI to use NVGs?
//(They are deleted on death)
DZMSUseNVG = true;

//Money?
DZMSaddmoney = true;

// Do you want AI to use RPG7V's?
//(Only one unit per group spawn will have one)
DZMSUseRPG = true;

// Do you want AI kills to count as bandit kills?
DZMSCntBanditKls = true;

// Do you want AI to disappear instantly when killed?
DZMSCleanDeath = false;

// Do you want AI that players run over to not have gear?
// (If DZMSCleanDeath is true, this doesn't matter)
DZMSRunGear = true;

// How long before bodies disappear? (in seconds) (default = 2400)
DZMSBodyTime = 600;

// Percentage of AI that must be dead before mission completes (default = 0)
//( 0 is 0% of AI / 0.50 is 50% / 1 is 100% )
DZMSRequiredKillPercent = 0.00;

// How long in seconds before mission scenery disappears (default = 1800 / 0 = disabled)
DZMSSceneryDespawnTimer = 900;

// Should crates despawn with scenery? (default = false)
DZMSSceneryDespawnLoot = true;

//////////////////////////////////////////////////////////////////////////////////////////
// You can adjust the weapons that spawn in weapon crates inside DZMSWeaponCrateList.sqf
// You can adjust the AI's gear inside DZMSAIConfig.sqf in the ExtConfig folder also.
//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////
// Do you want to use static coords for missions?
// Leave this false unless you know what you are doing.
DZMSStaticPlc = false;

// Array of static locations. X,Y,Z
DZMSStatLocs = [
[0,0,0],
[0,0,0]
];

///////////////////////////////////////////////////////////////////////////////////////////////////////////
// Do you want vehicles from missions to save to the Database? (this means they will stay after a restart)
// If False, vehicles will disappear on restart. It will warn a player who gets inside of a vehicle.
// This is experimental, and off by default in this version.
DZMSSaveVehicles = true;

/////////////////////////////////////////////////////////////////////////////////////////////
// These are arrays of vehicle classnames for the missions.
// Adjust to your liking.

//Armed Choppers (Huey)
DZMSChoppers = ["CH_47F_EP1_DZ","Mi17_DZ","UH1H_DZ","UH1Y_DZ","UH60M_EP1_DZ","AH6J_EP1_DZ","Ka137_MG_PMC","pook_H13_gunship_CDF","MH60S_DZ","pook_H13_transport_INS"];

//Small Vehicles (Humvees)
DZMSSmallVic = ["HMMWV_M998A2_SOV_DES_EP1_DZ","HMMWV_M1151_M2_CZ_DES_EP1_DZ","LandRover_Special_CZ_EP1_DZ","LandRover_MG_TK_EP1_DZ","UAZ_MG_TK_EP1_DZ","GAZ_Vodnik_DZ","BRDM2_TK_EP1","BTR40_MG_TK_INS_EP1","BRDM2_INS","BRDM2_Gue","BTR60_TK_EP1"];

//Large Vehicles (Urals)
DZMSLargeVic = ["V3S_Refuel_TK_GUE_EP1_DZ","UralRefuel_TK_EP1_DZ","MTVR","V3S_RA_TK_GUE_EP1_DZE"];

/*///////////////////////////////////////////////////////////////////////////////////////////
There are two types of missions that run simultaneously on a the server.
The two types are Major and Minor missions.

Major missions have a higher AI count, but also have more crates to loot.
Minor missions have less AI than Major missions, but have crates that reflect that.

Below is the array of mission file names and the minimum and maximum times they run.
Do not edit the Arrays unless you know what you are doing.
*/
DZMSMajorArray = ["armoredveh","buildsupply","wptruck"];
DZMSMinorArray = ["buildsupply","house","hunt","medcamp"];

/////////////////////////////////////////////////////////////////////////////////////////////
// The Minumum time in seconds before a major mission will run.
// At least this much time will pass between major missions. Custom = 1200 (20 Minutes) Default = 650 (10.8 Minutes)
DZMSMajorMin = 1200;

// Maximum time in seconds before a major mission will run.
// A major mission will always run before this much time has passed. Custom = 2100 (35 Minutes) Default = 2000 (33.33 Minutes)
DZMSMajorMax = 2100;

// Time in seconds before a minor mission will run.
// At least this much time will pass between minor missions. Custom = 900 (15 Minutes) Default = 600 (10 Minutes)
DZMSMinorMin = 1200;

// Maximum time in seconds before a minor mission will run.
// A minor mission will always run before this much time has passed. Custom = 1500 (25 Minutes) Default = 990 (16.5 Minutes)
DZMSMinorMax = 2100;

// Blacklist Zone Array -- missions will not spawn in these areas
// format: [[x,y,z],radius]
// Ex: [[06325,07807,0],300] //Starry Sobor
DZMSBlacklistZones = [
	
	[[4063,11664,0],1000],
	[[11447,11364,0],1000],
	[[1606,7803,0],1000],
	[[12944,12766,0],1000],
	[[604,13831,0],1500]
];

/*=============================================================================================*/
// Do Not Edit Below This Line
/*=============================================================================================*/
DZMSVersion = "1.1FIN";
