/*
	DZMSAIConfig.sqf
	This is a configuration for the AI that spawn at missions.
	This includes their skin, weapons, gear, and skills.
	You can adjust these to your liking, but it is for advanced users.
*/

///////////////////////////////////////////////
// Array of skin classnames for the AI to use
DZMSBanditSkins = ["Bandit1_DZ","BanditW1_DZ","Sniper1_DZ"];

////////////////////////
// Array of AI Skills
DZMSSkills0 = [
	["aimingAccuracy",1.00,1.00],
	["aimingShake",1.00,1.00],
	["aimingSpeed",1.00,1.00],
	["endurance",1.00,0.90],
	["spotDistance",1.00,1.00],
	["spotTime",1.00,1.00],
	["courage",1.00,1.00],
	["reloadSpeed",1.00,1.00],
	["commanding",1.00,1.00],
	["general",1.00,1.00]
];

DZMSSkills1 = [
	["aimingAccuracy",1.00,1.00],
	["aimingShake",1.00,1.00],
	["aimingSpeed",1.00,1.00],
	["endurance",1.00,0.90],
	["spotDistance",1.00,1.00],
	["spotTime",1.00,1.00],
	["courage",1.00,1.00],
	["reloadSpeed",1.00,1.00],
	["commanding",1.00,1.00],
	["general",1.00,1.00]
];

DZMSSkills2 = [
	["aimingAccuracy",1.00,1.00],
	["aimingShake",1.00,1.00],
	["aimingSpeed",1.00,1.00],
	["endurance",1.00,0.90],
	["spotDistance",1.00,1.00],
	["spotTime",1.00,1.00],
	["courage",1.00,1.00],
	["reloadSpeed",1.00,1.00],
	["commanding",1.00,1.00],
	["general",1.00,1.00]
];

DZMSSkills3 = [	
	["aimingAccuracy",1.00,1.00],
	["aimingShake",1.00,1.00],
	["aimingSpeed",1.00,1.00],
	["endurance",1.00,0.90],
	["spotDistance",1.00,1.00],
	["spotTime",1.00,1.00],
	["courage",1.00,1.00],
	["reloadSpeed",1.00,1.00],
	["commanding",1.00,1.00],
	["general",1.00,1.00]
];

//////////////////////////////////////////////////////////////
// This is the primary weaponlist that can be assigned to AI
// These are assigned based on AI difficulty level
DZMSWeps0 = [
"FHQ_ACR_BLK_CCO", 
"RH_hk416saim", 
"RH_hk416sdaim", 
"RH_hk417eotech",
"RH_masbaim", 
"RH_m1saim", 
"RH_m14aim",
"FHQ_ACR_WDL_RCO", 
"RH_hk416sacog",
"RH_hk416sdaim", 
"RH_hk417acog", 
"RH_masbacog", 
"RH_m1stacog", 
"RH_m14acog", 
"RH_sc2acog",
"RH_hk417sgleotech",
"RH_hk417sglacog",
"RH_hk416glaim",
"FHQ_ACR_WDL_HWS_GL",
"FHQ_ACR_BLK_HAMR_GL", 
"FHQ_ACR_TAN_RCO_GL", 
"RH_ctar21glacog",  
"RH_sc2shd",
"RH_m21", 
"vil_M110", 
"vil_M110sd", 
"vil_SVDK", 
"vil_SV_98", 
"FHQ_RSASS_TAN", 
"FHQ_MSR_DESERT"
];

DZMSWeps1 = [
"FHQ_ACR_BLK_CCO", 
"RH_hk416saim", 
"RH_hk416sdaim", 
"RH_hk417eotech",
"RH_masbaim", 
"RH_m1saim", 
"RH_m14aim",
"FHQ_ACR_WDL_RCO", 
"RH_hk416sacog",
"RH_hk416sdaim", 
"RH_hk417acog", 
"RH_masbacog", 
"RH_m1stacog", 
"RH_m14acog", 
"RH_sc2acog",
"RH_hk417sgleotech",
"RH_hk417sglacog",
"RH_hk416glaim",
"FHQ_ACR_WDL_HWS_GL",
"FHQ_ACR_BLK_HAMR_GL", 
"FHQ_ACR_TAN_RCO_GL", 
"RH_ctar21glacog",  
"RH_sc2shd",
"RH_m21", 
"vil_M110", 
"vil_M110sd", 
"vil_SVDK", 
"vil_SV_98", 
"FHQ_RSASS_TAN", 
"FHQ_MSR_DESERT"
];

DZMSWeps2 = [
"FHQ_ACR_BLK_CCO", 
"RH_hk416saim", 
"RH_hk416sdaim", 
"RH_hk417eotech",
"RH_masbaim", 
"RH_m1saim", 
"RH_m14aim",
"FHQ_ACR_WDL_RCO", 
"RH_hk416sacog",
"RH_hk416sdaim", 
"RH_hk417acog", 
"RH_masbacog", 
"RH_m1stacog", 
"RH_m14acog", 
"RH_sc2acog",
"RH_hk417sgleotech",
"RH_hk417sglacog",
"RH_hk416glaim",
"FHQ_ACR_WDL_HWS_GL",
"FHQ_ACR_BLK_HAMR_GL", 
"FHQ_ACR_TAN_RCO_GL", 
"RH_ctar21glacog",  
"RH_sc2shd",
"RH_m21", 
"vil_M110", 
"vil_M110sd", 
"vil_SVDK", 
"vil_SV_98", 
"FHQ_RSASS_TAN", 
"FHQ_MSR_DESERT"
];

DZMSWeps3 = [
"FHQ_ACR_BLK_CCO", 
"RH_hk416saim", 
"RH_hk416sdaim", 
"RH_hk417eotech",
"RH_masbaim", 
"RH_m1saim", 
"RH_m14aim",
"FHQ_ACR_WDL_RCO", 
"RH_hk416sacog",
"RH_hk416sdaim", 
"RH_hk417acog", 
"RH_masbacog", 
"RH_m1stacog", 
"RH_m14acog", 
"RH_sc2acog",
"RH_hk417sgleotech",
"RH_hk417sglacog",
"RH_hk416glaim",
"FHQ_ACR_WDL_HWS_GL",
"FHQ_ACR_BLK_HAMR_GL", 
"FHQ_ACR_TAN_RCO_GL", 
"RH_ctar21glacog",  
"RH_sc2shd",
"RH_m21", 
"vil_M110", 
"vil_M110sd", 
"vil_SVDK", 
"vil_SV_98", 
"FHQ_RSASS_TAN", 
"FHQ_MSR_DESERT"
];

/////////////////////////////////////////////////////////////
// These are gear sets that will be randomly given to the AI
// They are all the same, but can be customized.
DZMSGear0 = [
["ItemBandage","ItemBandage","ItemPainkiller","ItemGoldBar10oz"],
["ItemKnife","ItemFlashlight"]
];

DZMSGear1 = [
["ItemBandage","ItemBandage","ItemPainkiller","ItemGoldBar10oz"],
["ItemKnife","ItemFlashlight"]
];

DZMSGear2 = [
["ItemBandage","ItemBandage","ItemPainkiller","ItemGoldBar10oz"],
["ItemKnife","ItemFlashlight"]
];

DZMSGear3 = [
["ItemBandage","ItemBandage","ItemPainkiller","ItemGoldBar10oz"],
["ItemKnife","ItemFlashlight"]
];

DZMSGear4 = [
["ItemBandage","ItemBandage","ItemPainkiller","ItemGoldBar10oz"],
["ItemKnife","ItemFlashlight"]
];

////////////////////////////////////////////////////////////
// These are the backpacks that can be assigned to AI units.
DZMSPacklist = [
"DZ_Patrol_Pack_EP1",
"DZ_Assault_Pack_EP1",
"DZ_Czech_Vest_Puch",
"DZ_TerminalPack_EP1",
"DZ_ALICE_Pack_EP1",
"DZ_TK_Assault_Pack_EP1",
"DZ_CompactPack_EP1",
"DZ_British_ACU",
"DZ_GunBag_EP1",
"DZ_CivilBackpack_EP1",
"DZ_Backpack_EP1",
"DZ_LargeGunBag_EP1"
];