_bodyCheck = 2000; // body within this distance. Set to -1 to disable.
_mapRadius = 12000; // Only used when spawnNearPlot is enabled.
_spawnNearGroup = true; // Requires DZGM to work.
_spawnNearPlot = false; // Requires Plot4Life to work. 
_spawnRadius = 1000; // Do not set too low or BIS_fnc_findSafePos may fail.
_customBase = [
	 // New
];
_customBases = [ 
	
];

// Camp VIP Spawn
_spawnLevel1 = DollarDonator + MonthlyDonator + MaxBankDonator + AdminLoadout;
_spawnLevel2 = ["0","0","0"];
_spawnLevel3 = ["0","0","0"];

_spawnPoints = switch (toLower worldName) do {
	case "chernarus":{
		[
			["Random",[[4523,2444,0],[12037,9100,0],[6723,2562,0],[10417,2120,0],[1896,2242,0],[13470,6306,0]],0,0,1], // Random will never be blocked, so always keep it if using body check.
			["Balota",[4523,2444,0],0,0],
			["Berezino",[12037,9100,0],0,0],
			["Cherno",[6723,2562,0],0,0],
			["Elektro",[10417,2120,0],0,0],
			["Kamenka",[1896,2242,0],0,0],
			["Solnichny",[13470,6306,0],0,0],
			// Above are defaults
			["Devils",[6900,11419,0],0,0],
			["Gorka",[9659,8839,0],0,0],
			["Grishino",[5967,10323,0],0,0],
			["Guglovo",[8472,6754,0],0,0],
			["Gvozdno",[8654,11832,0],0,0],
			["Kabanino",[5346,8630,0],0,0],
			["Kamyshovo",[12073,3490,0],0,0],
			["Komarovo",[3643,2473,0],0,0],
			["Krasnostav",[11342,12232,0],0,0],
			["Krutoy",[13395,4159,0],0,0],
			["Lopatino",[2731,10000,0],0,0],
			["Petrovka",[5035,12459,0],0,0],
			["Pogorevka",[4461,6424,0],0,0],
			["Prigor",[8059,3381,0],0,0],
			["Pusta",[9178,3928,0],0,0],
			["Vybor",[3893,8883,0],0,0],
			["Vyshnoye",[6612,6065,0],0,0],
			["Zelenogorsk",[2858,5313,0],0,0]
		
			
		]
	};
};