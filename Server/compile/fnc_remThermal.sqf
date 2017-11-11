	//Remove Weapon SiothieGaming german Youtubechannel: http://www.youtube.com/user/SiothieGaming
	//Lines underneath are just a small tutorial
	// the Number in the Bracket is Important, -1  means Pilot seat
	//Try getting up with these numbers when you want to remove from another seat (e.g. gunner, front gunner, rear gunner etc. pp)
	// For every seat you have to do something like i did          
	//_object magazinesTurret [-1];
	//_object removeMagazinesTurret ["14Rnd_FFAR",[-1]]; If you want to remove something from another seat at the same time you need to do something like this:
	// _object magazinesTurret [1];
	//_object removeMagazinesTurret ["14Rnd_FFAR",[1]]; I'm not completly sure now which number is which seat. I only know that -1 is pilot seat.
	
{//FIRST METHOD
//The method underneath is if you want to remove a specific Weapon or a specific amount of ammo
//	if (_object isKindof "AH6J_EP1") then {
//        _object magazinesTurret [-1];
//		 _object removeMagazinesTurret ["14Rnd_FFAR",[-1]];
//		 _object WeaponsTurret [-1];
//		 _object removeWeapon "FFARLauncher_14";
//	};
	
//SECOND METHOD
//The method underneath is for removing the complete ammo for the selected seat in the vehicle
//if (_object isKindof "AllVehicles") then {
//        _mag = _object magazinesTurret [-1];
//        cpt = 0;
//        {
//            _object removeMagazinesTurret [_mag select cpt,[-1]];  
//           cpt = cpt + 1;
//        } forEach _mag;
//		//You still need to remove the weapon
//		 _object WeaponsTurret [-1];
//		 _object removeWeapon "FFARLauncher_14";
//    };
	
	
	//THIS IS STILL IN TESTING PHASE, IT COULD SCREW UP YOUR WHOLE SERVER
	//Just put the Classname of the Vehicle there and it should disable thear vision.
	// For example my server runs fine with it (Epoch Panthera) but a friend of mine screwed up his whole database
	if (_object isKindOf "AllVehicles") then {
		 _object disableTIEquipment true;
	};
	//TESTING STUFF END
} forEach vehicles; //Not completly necessary, it just makes sure no vehicle is left out during the process (e.g. high server load)
