if(isServer) then {

	/* GENERAL CONFIG */

		debug_mode					= true;		// enable debug
		use_blacklist				= false;			// use blacklist
		blacklist					= [
			[[0,16000,0],[1000,-0,0]],				// Left
			[[0,16000,0],[16000.0,14580.3,0]]		// Top
		];

	/* END GENERAL CONFIG */

	/* AI CONFIG */

		ai_clear_body 				= false;		// instantly clear bodies
		ai_clean_dead 				= false;		// clear bodies after certain amount of time
		ai_cleanup_time 			= 7200;			// time to clear bodies in seconds
		ai_clean_roadkill			= false; 		// clean bodies that are roadkills
		ai_roadkill_damageweapon	= 0;			// percentage of chance a roadkill will destroy weapon AI is carrying

		ai_bandit_combatmode		= "RED";		// combatmode of bandit AI
		ai_bandit_behaviour			= "Stealth";		// behaviour of bandit AI

		ai_hero_combatmode			= "RED";		// combatmode of hero AI
		ai_hero_behaviour			= "Stealth";		// behaviour of hero AI

		ai_friendly_behaviour		= false;		// make ai friendly towards comrades

		player_bandit				= -5000;		// this is the amount you declare someone to be a bandit on your server, bandit AI will not attack you if ai_friendly_behaviour is true
		player_hero					= 5000;			// this is the amount you declare someone to be a hero on your server, hero AI will not attack you if ai_friendly_behaviour is true

		ai_share_info				= false;			// AI share info on player position
		ai_share_distance			= 1200;			// distance from killed AI for AI to share your rough position

		ai_kills_gain				= true;			// add kill to bandit/human kill score
		ai_humanity_gain			= true;			// gain humanity for killing AI
		ai_add_humanity				= 200;			// amount of humanity gained for killing a bandit AI
		ai_remove_humanity			= 100;			// amount of humanity lost for killing a hero AI
		ai_special_humanity			= 250;			// amount of humanity gain or loss for killing a special AI dependant on player alignment
		
		ai_skill_extreme			= [["aimingAccuracy",1.00],["aimingShake",1.00],["aimingSpeed",1.00],["endurance",1.00],["spotDistance",1.00],["spotTime",1.00],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]]; 	// Extreme
		ai_skill_hard				= [["aimingAccuracy",0.98],["aimingShake",0.98],["aimingSpeed",0.98],["endurance",1.00],["spotDistance",0.98],["spotTime",0.98],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]]; 	// Hard
		ai_skill_medium				= [["aimingAccuracy",0.92],["aimingShake",0.92],["aimingSpeed",0.92],["endurance",1.00],["spotDistance",0.92],["spotTime",0.92],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]];	// Medium
		ai_skill_easy				= [["aimingAccuracy",0.88],["aimingShake",0.88],["aimingSpeed",0.88],["endurance",1.00],["spotDistance",0.88],["spotTime",0.88],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]];	// Easy
		ai_skill_random				= [ai_skill_extreme,ai_skill_hard,ai_skill_hard,ai_skill_hard,ai_skill_hard,ai_skill_medium,ai_skill_medium,ai_skill_medium,ai_skill_medium,ai_skill_easy];

		ai_static_useweapon			= false;	// Allows AI on static guns to have a loadout 	
		ai_static_weapons			= ["DSHKM_Ins","M2StaticMG"];	// static guns

		ai_static_skills			= false;	// Allows you to set custom array for AI on static weapons. (true: On false: Off) 
		ai_static_array				= [["aimingAccuracy",1.00],["aimingShake",1.00],["aimingSpeed",1.00],["endurance",1.00],["spotDistance",1.00],["spotTime",1.00],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]];

		ai_gear0					= [["ItemBandage","ItemBandage","ItemAntibiotic"],["ItemCrowbar"]];
		ai_gear1					= [["ItemBandage","ItemSodaPepsi","ItemMorphine"],["Binocular_Vector"]];
		ai_gear2					= [["ItemDocument","FoodCanFrankBeans","ItemHeatPack"],["ItemToolbox"]];
		ai_gear3					= [["ItemWaterbottle","ItemBloodbag"],["ItemCompass","ItemCrowbar"]];
		ai_gear4					= [["ItemBandage","ItemEpinephrine","ItemPainkiller"],["ItemGPS"]];
		ai_gear_random				= [ai_gear0,ai_gear1,ai_gear2,ai_gear3,ai_gear4];	// Allows the possibility of random gear

		ai_wep_assault				= ["M16A4_ACG","Sa58V_RCO_EP1","SCAR_L_STD_Mk4CQT","M8_sharpshooter","M4A1_HWS_GL_camo","SCAR_L_STD_HOLO","M4A3_CCO_EP1","M4A3_CCO_EP1","M4A1_AIM_SD_camo","M16A4","m8_carbine","BAF_L85A2_RIS_Holo","Sa58V_CCO_EP1"];	// Assault
		ai_wep_machine				= ["RPK_74","MK_48_DZ","M249_EP1_DZ","Pecheneg_DZ","M240_DZ"];	// Light machine guns
		ai_wep_sniper				= ["USSR_cheytacM200","Baf_as50_Scoped_dz","m107","M14_EP1","SCAR_H_LNG_Sniper_SD","M110_NVG_EP1","SVD_CAMO","VSS_Vintorez","DMR_DZ","M40A3"];	// Sniper rifles
		ai_wep_random				= [ai_wep_assault,ai_wep_assault,ai_wep_assault,ai_wep_sniper,ai_wep_sniper,ai_wep_machine,ai_wep_sniper];	// random weapon 60% chance assault rifle,20% light machine gun,20% sniper rifle
		ai_wep_launchers_AT			= ["M136","RPG18"];
		ai_wep_launchers_AA			= ["Strela","Igla","STINGER"];
		
		ai_packs					= ["DZ_GunBag_EP1","DZ_CivilBackpack_EP1","DZ_Backpack_EP1","DZ_LargeGunBag_EP1"];
		ai_hero_skin				= ["FR_AC","FR_AR","FR_Corpsman","FR_GL","FR_Marksman","FR_R","FR_Sapper","FR_TL"];
		ai_bandit_skin				= ["Ins_Soldier_GL_DZ","TK_INS_Soldier_EP1_DZ","TK_INS_Warlord_EP1_DZ","GUE_Commander_DZ","GUE_Soldier_Sniper_DZ","GUE_Soldier_MG_DZ","GUE_Soldier_Crew_DZ","GUE_Soldier_2_DZ","GUE_Soldier_CO_DZ","BanditW1_DZ","BanditW2_DZ","Bandit1_DZ","Bandit2_DZ"];
		ai_special_skin				= ["Functionary1_EP1_DZ"];
		ai_all_skin					= [ai_hero_skin,ai_bandit_skin,ai_special_skin];
		ai_coin_award				= true;  		// gain Money for killing AI
		
		
		ai_add_skin					= true;			// adds unit skin to inventory on death
		
		/* AI Cache Units */
		ai_cache_units			= false;
		/**Range for Re-Activation*************/
		/****** Default: 800 ******************/
		ai_cache_units_reactivation_range = 1500;
		/**Time untill units are Frozen again**/
		/************* Default: 30 ************/
		ai_cache_units_refreeze = 30;
		/****** Log Actions to RPT File? ******/
		/*********** Default: true ************/
		ai_cache_units_freeze_log = true;
		/******** Unassign Waypoints?  ********/
		/*********** Default: false ***********/
		ai_cache_units_unassign_waypoints = false;
		/******** Randomize Position?  ********/
		/******** Distance to Randomize *******/
		/*********** Default: true ************/
		/*********** Distance: 20 *************/
		ai_cache_units_randomize_position = true;
		ai_cache_units_randomize_distance = 20;
		/********** Hide un-used AI?  *********/
		/*********** Default: true ************/
		ai_cache_unites_hide_ai = true;
		/* AI Cache Units End */
		
	/* END AI CONFIG */

	/* WAI MISSIONS CONFIG */
		wai_mission_system			= true;	// use built in mission system

		wai_mission_markers			= ["DZMSMajMarker","DZMSMinMarker","DZMSBMajMarker","DZMSBMinMarker"];
		wai_avoid_missions			= 1300;								// avoid spawning missions this close to other missions, these are defined in wai_mission_markers
		wai_avoid_traders			= 750;								// avoid spawning missions this close to traders
		wai_avoid_town				= 0;								// avoid spawning missions this close to towns, *** doesn't function with infiSTAR enabled ***
		wai_avoid_road				= 0;								// avoid spawning missions this close to roads
		wai_avoid_water				= 50;								// avoid spawning missions this close to water

		
		wai_mission_timer			= [0,15];							// time between missions 5-15 minutes
		wai_mission_timeout			= [900,1200]; 						// time each missions takes to despawn if inactive 15-30 minutes
		wai_timeout_distance		= 1400;								// if a player is this close to a mission then it won't time-out
		
		wai_clean_mission			= true;								// clean all mission buildings after a certain period
		wai_clean_mission_time		= 1800;								// time after a mission is complete to clean mission buildings

		wai_mission_fuel			= [50,50];							// fuel inside mission spawned vehicles [min%,max%]
		wai_vehicle_damage			= [0,0];							// damages to spawn vehicles with [min%,max%]
		wai_keep_vehicles			= true;								// save vehicles to database and keep them after restart
		wai_linux_server			= false;							// false = Windows (HiveExt.dll)		true = Linux Server (writer.pl)		has no effect when "wai_keep_vehicles = false;"
		wai_lock_vehicles			= true;								// lock mission vehicles and add keys to random AI bodies (be careful with ai_clean_dead if this is true

		wai_crates_smoke			= False;								// pop smoke on crate when mission is finished during daytime
		wai_crates_flares			= False;								// pop flare on crate when mission is finished during nighttime
		
		wai_players_online			= 0; 								// number of players online before mission starts
		wai_server_fps				= 3; 								// missions only starts if server FPS is over wai_server_fps
		
		wai_kill_percent			= 0;								// percentage of AI players that must be killed at "crate" missions to be able to trigger completion

		wai_high_value				= true;								// enable the possibility of finding a high value item (defined below crate_items_high_value) inside a crate
		wai_high_value_chance		= 99;								// chance in percent you find above mentioned item

		wai_enable_minefield		= true;								// enable minefields to better defend missions
		wai_use_launchers			= true;								// add a rocket launcher to each spawned AI group
		wai_remove_launcher			= true;								// remove rocket launcher from AI on death

		// Missions
		wai_radio_announce			= true;								// Setting this to true will announce the missions to those that hold a radio only
		wai_hero_limit				= 1;								// define how many hero missions can run at once
		wai_bandit_limit			= 1;								// define how many bandit missions can run at once

		wai_hero_missions			= [ 								// ["mission filename",% chance of picking this mission],Make sure the chances add up to 100,or it will not be accurate percentages
										
										["Rabbit_farm",12],
										["AntiAir",20],
										["Jet_Test",2],
										["Drug_Lord",19],
										["armed_vehicle",8],
										["bandit_base",14],						
										["disabled_milchopper",8],
										["mayors_mansion",17]
																
									];
		wai_bandit_missions			= [
										
										
										["blackmarket",20],
									    ["loot",17],
										["MI24",9],
										["Tank_Vehicle3",7],
										["armed_vehicle",7],
										["hero_base",13],
										["presidents_mansion",19],
										["sniper_extraction",8]
																
									];
		
		// Vehicle arrays
		
		patrol_mission 			= ["btr40_mg_tk_gue_ep1","hmmwv_m2","zsu_ins","lav25_dz","LandRover_Special_CZ_EP1_DZ","hmmwv_mk19","HMMWV_M998A2_SOV_DES_EP1_DZ","BTR60_tk_ep1","ural_zu23_cdf","baf_jackal2_gmg_W","t34","ArmoredSUV_PMC_DZ","GAZ_Vodnik_DZ"];
		
		AntiAir		     = ["hmmwv_avenger","M6_ep1","m2a2_ep1","m2a3_ep1","ural_zu23_cdf"];
		
		bigmission		    = ["grad_tk_ep1","mlrs"];
		jets_vehicle 			= ["a10","su39","l39_tk_ep1","f35b","Av8b2","su25_cdf","su25_ins","su34","su25_tk_ep1"];
		
		tanks_vehicle = ["hmmwv_avenger","t90","AAV","m1a1_us_des_ep1","BTR90","t90","m1a2_tusk_mg","lav25_dz","M6_ep1","t72_ru","m2a2_ep1","m2a3_ep1","bmp3","m1a1","t55_tk_ep1","m1128_mgs_ep1","m1126_icv_mk19_ep1"];
		
		armed_vehicle 				= ["hmmwv_avenger","ZSU_INS","AAV","lav25_dz","t34","GAZ_Vodnik_hmg","M6_ep1"];
		armed_chopper 				= ["Ah64D","mi24_v","Ah1Z","KA52Black","baf_Apache_AH1_D","mi24_d","AW159_Lynx_BAF","mi24_P","mi17_rockets_ru"];
		civil_chopper 				= ["Ah64D","mi24_v","Ah1Z","KA52Black","baf_Apache_AH1_D","mi24_d","AW159_Lynx_BAF","mi24_P","mi17_rockets_ru"];
		military_unarmed 			= ["AAV","zsu_ins","lav25_dz","LandRover_Special_CZ_EP1_DZ","hmmwv_mk19","HMMWV_M998A2_SOV_DES_EP1_DZ","BTR60_tk_ep1","ural_zu23_cdf","baf_jackal2_gmg_W"];
		cargo_trucks 				= ["Ural_TK_CIV_EP1","ArmoredSUV_PMC_DZ"];
		refuel_trucks				= ["KamazRefuel_DZ","ArmoredSUV_PMC_DZ"];
		civil_vehicles 				= ["btr40_mg_tk_gue_ep1","hmmwv_m2","GAZ_Vodnik_DZ"];

		// Dynamic box array
		crates_large				= ["USVehicleBox","RUVehicleBox","TKVehicleBox_EP1"];
		crates_medium				= ["USBasicWeaponsBox","RUBasicWeaponsBox","USSpecialWeaponsBox","USSpecialWeapons_EP1","RUSpecialWeaponsBox","SpecialWeaponsBox","TKSpecialWeapons_EP1","CZBasicWeapons_EP1","UNBasicWeapons_EP1"];
		crates_small				= ["GuerillaCacheBox","RULaunchersBox","RUBasicAmmunitionBox","RUOrdnanceBox","USBasicAmmunitionBox","USLaunchersBox","USOrdnanceBox","USOrdnanceBox_EP1","USLaunchers_EP1","USBasicWeapons_EP1","USBasicAmmunitionBox_EP1","UNBasicAmmunitionBox_EP1","TKOrdnanceBox_EP1","TKLaunchers_EP1","TKBasicAmmunitionBox_EP1","GuerillaCacheBox_EP1","GERBasicWeapons_EP1"];

		
		crate_weapons_ALLRPG	= ["Strela","Igla","STINGER","Javelin","M136","RPG18"];
		crate_weapons_RPGAA	        = ["Javelin","M136","RPG18"];
		crate_weapons_AA			= ["Strela","Igla","STINGER"];
		
		
		
		
		
		
		crate_weapons_buildables	= ["ChainSaw","ChainSawB","ChainSawG","ChainSawP","ChainSawR"];
		
		crate_tools					= ["ItemKeyKit","Binocular","Binocular_Vector","ItemCompass","ItemCrowbar","ItemEtool","ItemFishingPole","ItemFlashlightRed","ItemGPS","ItemHatchet_DZE","ItemKnife","ItemMachete","ItemMatchbox_DZE","ItemToolbox","NVGoggles"];
		crate_tools_buildable		= ["ItemToolbox","ItemEtool","ItemCrowbar","ItemKnife"];
		crate_tools_sniper			= ["ItemCompass","Binocular","Binocular_Vector","NVGoggles","ItemGPS"];

		crate_items					= ["FoodNutmix","FoodPistachio","FoodMRE","ItemSodaOrangeSherbet","ItemSodaRbull","ItemSodaR4z0r","ItemSodaMdew","ItemSodaPepsi","ItemBandage","ItemSodaCoke","FoodbaconCooked","FoodCanBakedBeans","FoodCanFrankBeans","FoodCanPasta","FoodCanSardines","FoodchickenCooked","FoodmuttonCooked","FoodrabbitCooked","ItemTroutCooked","ItemTunaCooked","ItemSeaBassCooked","ItemAntibiotic","ItemBloodbag","ItemEpinephrine","ItemHeatPack","ItemMorphine","ItemGoldBar","ItemGoldBar10oz","CinderBlocks","ItemCanvas","ItemComboLock","ItemLightBulb","ItemSandbag","ItemTankTrap","ItemWire","MortarBucket","PartEngine","PartFueltank","PartGeneric","PartGlass","PartPlankPack","PartVRotor","PartWheel","PartWoodPile"];
		
		crate_items_high_value		= ["ItemHotWireKit","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemCitrine","ItemEmerald","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemCitrine","ItemEmerald"];
		
		crate_items_food			= ["ItemWaterbottle","FoodNutmix","FoodPistachio","FoodMRE","ItemSodaOrangeSherbet","ItemSodaRbull","ItemSodaR4z0r","ItemSodaMdew","ItemSodaPepsi","ItemSodaCoke","FoodbaconCooked","FoodCanBakedBeans","FoodCanFrankBeans","FoodCanPasta","FoodCanSardines","FoodchickenCooked","FoodmuttonCooked","FoodrabbitCooked","ItemTroutCooked","ItemTunaCooked","ItemSeaBassCooked"];
		
		crate_items_buildables		= ["forest_large_net_kit","cinder_garage_kit",["PartPlywoodPack",5],"ItemSandbagExLarge5X","park_bench_kit","ItemComboLock",["CinderBlocks",10],"ItemCanvas","ItemComboLock",["ItemLightBulb",5],["ItemSandbag",10],["ItemTankTrap",10],["ItemWire",10],["MortarBucket",10],["PartPlankPack",5],"PartWoodPile"];
		
		crate_items_vehicle_repair	= ["PartEngine","PartFueltank","PartGeneric","PartGlass","PartVRotor","PartWheel"];
		
		crate_items_medical			= ["ItemWaterbottle","ItemAntibiotic","ItemBloodbag","ItemEpinephrine","ItemHeatPack","ItemMorphine","ItemBandage","FoodCanFrankBeans","FoodCanPasta"];
		
		crate_items_chainbullets	= ["2000Rnd_762x51_M134","200Rnd_762x51_M240","100Rnd_127x99_M2","150Rnd_127x107_DSHKM"];
		
		crate_items_sniper			= [["ItemPainkiller",5],"Skin_Sniper1_DZ","Skin_CZ_Soldier_Sniper_EP1_DZ","Skin_GUE_Soldier_Sniper_DZ"];
		
		
		crate_items_rabbit		= ["FoodrabbitCooked"];
		crate_items_president		= ["ItemHotWireKit","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemCitrine","ItemEmerald","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemCitrine","ItemEmerald"];
		
		crate_items_BlackMarket	= ["ItemHotWireKit","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemCitrine","ItemEmerald","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemBriefcase100oz","ItemCitrine","ItemEmerald"];
		
		crate_backpacks_all			= ["DZ_GunBag_EP1","DZ_Backpack_EP1","DZ_LargeGunBag_EP1","DZ_CivilBackpack_EP1"];
		crate_backpacks_large		= ["DZ_GunBag_EP1","DZ_Backpack_EP1","DZ_LargeGunBag_EP1","DZ_CivilBackpack_EP1"];

		crate_random				= [crate_items,crate_items_food,crate_items_buildables,crate_items_vehicle_repair,crate_items_medical,crate_items_chainbullets];

	/* END WAI MISSIONS CONFIG */

	/* STATIC MISSIONS CONFIG */

		static_missions				= false;		// use static mission file
		custom_per_world			= false;		// use a custom mission file per world

	/* END STATIC MISSIONS CONFIG */

	WAIconfigloaded = true;

};