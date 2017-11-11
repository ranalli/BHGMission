/*  

Class Configuration:

1. These classes are just examples to show what this mod can do. You can add or delete any class
in the _publicClasses list. Don't forget to leave off the last comma for the last element in the array.
You can even remove all gear to make this a skin selector only.

2. _startBag, _startMags and _startWeps make the default loadout. They will be added first, then the class loadout (if any) on top.
Use the base gear that you want all (or most) classes to have. Start binocs, pistols, pistol mags and bags are replaced if they 
are specified in the selected class. 

3. _customLoadout - List of UIDs with custom loadouts.
   _customLoadouts - List of custom loadouts. These must match the order of the first list. The first UID in _customLoadout corresponds with the first loadout in _customLoadouts and so on. 
   These will only show in the class dialog for the player who owns them. If multiple UIDs share the same loadout then add the same loadout multiple times to maintain order, 
   or consider making it a VIP class in _publicClasses instead. Each loadout must have a unique name just like regular classes. Do not include humanity or VIP level in these.
   
4. Regular class format:
	[Name,  Male Skin,  Female Skin,  Magazines and Items,  Weapons and Tools,  Bag,  Bag Mags and Items,  Bag Weps and Tools,  VIP Level,  Humanity Level, Coins]
	Name - Each class must have a unique name. Do not use double quotes " inside.
	Male Skin - Must be a skin compatible with your mod.
	Female Skin - This will be used if the player picked female on the gender selection screen.
	Magazines and Items - Mags and items to add in addition to _startMags. For multiple add the quantity after (i.e. "ItemBandage",3) The quantity is assumed to be 1 if not specified.  
	Weapons and Tools - Weps and tools to add in addition to _startWeps.
	Bag - Leave as "" for _startBag
	Bag Mags - Same format as magazines. Leave as [] for none
	Bag Weps - Same format as weapons. Leave as [] for none
	VIP Level -
		0 - Anyone can pick this class
		1 - Only players with UIDs in _classLevel1 can pick this class
		2 - Only players with UIDs in _classLevel2 can pick this class
		3 - Only players with UIDs in _classLevel3 can pick this class​
	Humanity Level -
		0 - Anyone can pick this class
		Negative # - Only players with humanity less than this number can pick this class
		Positive # - Only players with humanity greater than this number can pick this class​
	Coins
		0 - Does nothing, use if single currency is not installed
		Positive # - Gives player coins with loadout
		
5. Random class format:
	[
		Name, 
		[[Male Skins],[Female Skins]],
		Mags+Items, #ofItemPicks, 
		Tools, #ofToolPicks, 
		Primary, #ofPrimaryMags, 
		Pistol, #ofPistolMags, 
		Bags, 
		BagItems, #ofBagItemPicks, 
		BagTools, #ofBagToolPicks, 
		BagPrimary, #ofBagPrimaryMags, 
		BagPistol, #ofBagPistolMags, 
		VIPLevel, HumanityLevel, Coins
	]	
	Name - Can be anything unique, does not have to be "Random"
	Skins - One will be chosen at random for your gender.
	Mags+Items - Same format as regular.
	#ofItemPicks - # of unique items to pick randomly from the previous list. Never use a # higher than the # of unique Mags+Items.
	Tools - List of toolbelt items to be picked from randomly.
	#ofToolPicks - # of unique tools to pick randomly from the previous list. Never use a # higher than the # of unique Tools.
	Primary - List of primary weapons to be picked from randomly.
	#ofPrimaryMags - The quantity of mags you will always get for your primary weapon.
	Pistol - List of pistols to be picked from randomly.
	#ofPistolMags - The quantity of mags you will always get for your pistol.
	Bags - One will be selected at random.
	BagX,#ofBagX - Same as their respective non-bag counter parts, except they will be added to the backpack.
	VIPLevel, HumanityLevel, Coins - Same as regular.
	
5. Any of the _customLoadouts and _publicClasses can be made into random classes. They just need to be in the random format
and it will be automatically detected. You can have multiple random classes, i.e. Random LMG, Random Rifle, Random Sniper, Random 
Bandit, Random Hero, etc. You can make every class a random class if you want to.

6. Instead of repeating long strings of the same items multiple times you can use constants in this format:
		#define SHORT_HAND_NAME "Item1","Item2","Item3","Item4"
Then replace all occurrences of "Item1","Item2","Item3","Item4" with SHORT_HAND_NAME as I did with the VIP_ITEMS example below.

*/
#define VIP_ITEMS "ItemAntibiotic","ItemBloodbag","ItemEpinephrine","ItemMorphine" // constant example, these can be removed if they are not used below
#define VIP_TOOLS "Binocular_Vector","NVGoggles","ItemCompass","ItemHatchet","ItemKnife","Itemmatchbox","Itemetool","ItemSledge","ItemWatch","ItemGPS","ItemCrowbar"

_startBag = "DZ_Assault_Pack_EP1"; // Use "" for none
_startMags = ["ItemBandage",3,"ItemPainkiller","ItemMorphine","ItemWaterbottle","FoodPistachio","ItemBloodbag","17Rnd_9x19_glock17",3];
_startWeps = ["Binocular_Vector","NVGoggles","ItemMap","ItemToolbox","ItemRadio","glock17_EP1"];
_customLoadout = [
	"76561198014219874", // ebay
	"0",
	"0"
];
_customLoadouts = [
	["ebay's Loadout","GUE_Soldier_2_DZ","BanditW2_DZ",["100Rnd_762x51_M240",2,"30Rnd_9x19_UZI_SD",3,"Skin_GUE_Soldier_Sniper_DZ",VIP_ITEMS],["Mk_48_DZ","UZI_SD_EP1",VIP_TOOLS],"DZ_Backpack_EP1",["5Rnd_86x70_L115A1",3],["BAF_LRR_scoped_W"]],
	[],
	[]
];

_classLevel1 = DollarDonator;

_classLevel2 = AdminLoadout;

_classLevel3 = MonthlyDonator;





// To give higher level VIPs access to lower level VIP classes uncomment the two lines below:
_classLevel1 = _classLevel1 + _classLevel3;

_publicClasses = [
	[
		"Random",
		[["Survivor2_DZ","Haris_Press_EP1_DZ","Rocker1_DZ"],["SurvivorW2_DZ","SurvivorWdesert_DZ","SurvivorWurban_DZ"]],
		["ItemAntibiotic",2,"ItemMorphine","ItemEpinephrine"],2,
		["ItemCompass","ItemHatchet","ItemCrowbar","ItemKnife","ItemGPS"],2,
		["M4A1","AK_74","BAF_L85A2_RIS_Holo","Sa58P_EP1"],2,
		["MakarovSD","Colt1911","revolver_EP1","M9","M9SD"],3,
		["DZ_Assault_Pack_EP1","DZ_Czech_Vest_Puch","DZ_GunBag_EP1"], // use [""] for none
		[],4,
		[],2,
		[],2,
		[],3,
		0,0,0
	],
	
["Survivor","Soldier_TL_PMC_DZ","BanditW1_DZ",["gms_k98_mag",3],["gms_k98"],"",[],[],0,0,0],

["Bandit 7.5K","Bandit1_DZ","BanditW2_DZ",["10x_303",3],["LeeEnfield"],"DZ_TerminalPack_EP1",[],[],0,-7500,0],
["Bandit 15K","Bandit2_DZ","BanditW2_DZ",["30Rnd_9x19_MP5SD",3],["MP5SD"],"DZ_ALICE_Pack_EP1",[],[],0,-15000,0],
["Bandit 100K","Ins_Soldier_GL_DZ","BanditW2_DZ",["30Rnd_556x45_Stanag",3],["m16a4"],"DZ_CompactPack_EP1",[],[],0,-100000,0],
["Bandit 300K","TK_INS_Soldier_EP1_DZ","BanditW2_DZ",["20Rnd_762x51_DMR",2],["RH_m14acog"],"DZ_British_ACU",[],[],0,-275000,0],
["Bandit 550K","TK_INS_Warlord_EP1_DZ","BanditW2_DZ",["20rnd_762x51_SB_SCAR",2],["SCAR_H_CQC_CCO_SD"],"DZ_GunBag_EP1",[],[],0,-450000,0],
["Bandit 750K","CZ_Soldier_Sniper_EP1_DZ","BanditW2_DZ",["5Rnd_86x70_L115A1",2],["BAF_LRR_scoped_W"],"DZ_ALICE_Pack_EP1",[],[],0,-650000,0],
["Bandit 1Mil","Sniper1_dz","BanditW2_DZ",["20Rnd_762x51_DMR",2],["DMR"],"DZ_GunBag_EP1",[],[],0,-850000,0],
["Bandit 1.5Mil","Sniper1_dz","BanditW2_DZ",["RH_20Rnd_762x51_SD_hk417",2],["RH_hk417sdsp"],"DZ_CivilBackpack_EP1",[],[],0,-1000000,0],
	   
	   
["Hero 7.5K","GUE_Soldier_Crew_DZ","BanditW2_DZ",["10x_303",3],["LeeEnfield"],"DZ_TerminalPack_EP1",[],[],0,7500,0],
["Hero 10K","GUE_Commander_DZ","BanditW2_DZ",["30Rnd_9x19_MP5SD",3],["MP5SD"],"DZ_ALICE_Pack_EP1",[],[],0,10000,0],
["Hero 75K","Soldier_Bodyguard_AA12_PMC_DZ","BanditW2_DZ",["30Rnd_556x45_Stanag",3],["m16a4"],"DZ_CompactPack_EP1",[],[],0,75000,0],
["Hero 250K","FR_OHara_DZ","BanditW2_DZ",["20Rnd_762x51_DMR",2],["RH_m14acog"],"DZ_British_ACU",[],[],0,250000,0],
["Hero 400K","FR_OHara_DZ","BanditW2_DZ",["20rnd_762x51_SB_SCAR",3],["SCAR_H_CQC_CCO_SD"],"DZ_GunBag_EP1",[],[],0,400000,0],
["Hero 600K","GUE_Soldier_Sniper_DZ","BanditW2_DZ",["5Rnd_86x70_L115A1",3],["BAF_LRR_scoped_W"],"DZ_ALICE_Pack_EP1",[],[],0,600000,0],
["Hero 750K","Sniper1_dz","BanditW2_DZ",["20Rnd_762x51_DMR",3],["DMR"],"DZ_GunBag_EP1",[],[],0,750000,0],
["Hero 900K","Sniper1_dz","BanditW2_DZ",["RH_20Rnd_762x51_SD_hk417",2],["RH_hk417sdsp"],"DZ_CivilBackpack_EP1",[],[],0,900000,0],
			
["TESTERS","GUE_Soldier_Sniper_DZ","SurvivorWurban_DZ",["20Rnd_762x51_DMR",3,"30Rnd_9x19_UZI_SD",3],["DMR","UZI_SD_EP1","ItemCompass","ItemKnife","ItemGPS"],"DZ_GunBag_EP1",[],[],1,0,0],
	
	
	[
		"ADMIN",
		[["Gsc_eco_stalker_mask_duty"],["hooker1","hooker2","hooker3"]],
		["ItemAntibiotic","ItemMorphine","ItemEpinephrine"],3,
		["ItemHatchet","ItemCrowbar","ItemKnife","ItemGPS"],4,
		["M4A1","AK_74","BAF_L85A2_RIS_Holo","Sa58P_EP1"],0,
		["UZI_SD_EP1"],0,
		["dz_largegunbag_ep1"], // use [""] for none
		[],4,
		[],2,
		[],2,
		[],3,
		2,0,0
	]
];