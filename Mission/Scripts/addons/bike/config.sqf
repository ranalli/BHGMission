//  **FORMAT** -- (note no comma after last array entry)
//
//  DZE_DEPLOYABLES_CONFIG = [
//      [_clickItem,_deployOffset,_packDistance,_damageLimit,_packAny,_cargo,_ammo,_hive,_plot,_simulation,_road,_deployables,_near,_parts,_condition],
//      [_clickItem,_deployOffset,_packDistance,_damageLimit,_packAny,_cargo,_ammo,_hive,_plot,_simulation,_road,_deployables,_near,_parts,_condition],
//      [...more stuff here...]
//  ];
//    
//  parameter    | description                                                         |  type  | example
// --------------|---------------------------------------------------------------------|--------|--------
// _clickItem    | class name of the item to click on                                  | string | "ItemToolbox"
// _deployOffset | [_side,_front,_up] array to offset the deployable when buiding      | array  | [0,2,1]
// _packDistance | how close does the packer need to be to pack the object?            | number | 5
// _damageLimit  | item can't be repacked if damage is > this. (-1 = no re-packing)    | number | 0.1
// _packAny      | can anyone repack the deployable?                                   | bool   | false
// _cargo        | clear the cargo of the deployable?                                  | bool   | false
// _ammo         | should vehicle ammo be cleared? (does not persist through restart)  | bool   | true
// _hive         | write deployable to database?                                       | bool   | false
// _plot         | require a plot from the owner to build the deployable?              | bool   | false
// _simulation   | enable simulation (movement/damage) for the object? (true for cars) | bool   | true
// _road         | enable road building for this object?                               | bool   | true
// _deployables  | array of class names that can be deployed with this method          | array  | ["MMT_Civ"]
// _near         | array of items required nearby to build (workshop/fire/fueltank)    | array  | []
// _parts        | array of parts required to build (will be taken from player)        | array  | ["ItemToolbox"]
// _condition    | string of code to evaluate to determine whether action is shown     | string | "!(isNull player) && {(getPlayerUID player) in DZE_DEPLOYABLE_ADMINS}"
DZE_DEPLOYABLES_CONFIG = [
    ["ItemToolbox",[0,7,1],5,0.9,false,false,false,false,false,true,true,["MMT_USMC"],[],["ItemToolbox"],"true"],
	["ItemToolbox",[0,7,1],5,0.9,false,false,false,false,false,true,true,["Old_moto_TK_Civ_EP1"],[],["ItemToolbox"],"true"],
	["ItemToolbox",[0,7,1],5,0.9,false,false,false,false,false,true,true,["ATV_CZ_EP1"],[],["ItemToolbox"],"true"],
	["ItemToolbox",[0,7,1],5,0.9,false,false,false,false,false,true,true,["CSJ_GyroC"],[],["PartVRotor","PartEngine","PartGeneric"],"true"],


  ["ItemToolbox", 				    // class name of the item to click on
	[0,4,1],        				// [_side,_front,_up] array to offset the deployable when buiding
	5,              				// how close does the packer need to be to pack the object?
	-1,             				// item can't be repacked if damage is > this. (-1 = no re-packing)
	false,          				// can anyone repack the deployable?
	true,         				    // clear the cargo of the deployable?
	false,         				    // should vehicle ammo be cleared?
	true,          				    // write deployable to database?
	true,        				    // require a plot from the owner to build the deployable?
	false,          				// enable simulation (movement/damage) for the object? (true for cars)
	false,          				// enable road building for this object?
	["Misc_cargo_cont_small_EP1"], 	// array of class names that can be deployed with this method
	[],            					// array of items required nearby to build
	[],
	"true"],

   ["ItemToolbox",					// class name of the item to click on
   [0,6,0],      			        // [_side,_front,_up] array to offset the deployable when buiding
   5,          				        // how close does the packer need to be to pack the object?
   0.9,             			        // item can't be repacked if damage is > this. (-1 = no re-packing)
   false,                           // can anyone repack the deployable?
   true,                            // clear the cargo of the deployable?
   false,                           // should vehicle ammo be cleared?
   true,                            // write deployable to database?
   true,                            // require a plot from the owner to build the deployable?
   false,                           // enable simulation (movement/damage) for the object? (true for cars)
   false,                           // enable road building for this object?
   ["Sr_border"],                   // array of class names that can be deployed with this method
   [],                              // array of items required nearby to build
   [],          // array of parts required to build
   "true"],

	

    ["ItemToolbox",					// class name of the item to click on
	[0,10,0],                       // [_side,_front,_up] array to offset the deployable when buiding
	5,                              // how close does the packer need to be to pack the object?
	0.9,                             // item can't be repacked if damage is > this. (-1 = no re-packing)
	false,                          // can anyone repack the deployable?
	true,                           // clear the cargo of the deployable?
	false,                          // should vehicle ammo be cleared?
	true,                           // write deployable to database?
	true,                           // require a plot from the owner to build the deployable?
	false,                          // enable simulation (movement/damage) for the object? (true for cars)
	false,                          // enable road building for this object?
	["PARACHUTE_TARGET"],           // array of class names that can be deployed with this method
	[],                             // array of items required nearby to build
	[],         // array of parts required to build
	"true"]

];

// **DZE_DEPLOYABLE_NAME_MAP format
//
//  DZE_DEPLOYABLE_NAME_MAP = [
//      [_class,_name],
//      [_class,_name],
//      [... more ...]
//  ];
//
//  parameter    | description                                                         |  type  | example
// -------------|---------------------------------------------------------------------|--------|--------
// _class       | class name of the item you want to replace the name of              | string | "Notebook"
// _name       | new name to display when right clicking                             | string | "Macbook Pro"
//

DZE_DEPLOYABLE_NAME_MAP = [
	["MMT_Civ","Mountain Bike"],
	["ATV_CZ_EP1","ATV"],
	["CSJ_GyroC","Gyrocopter"],
	["Misc_cargo_cont_small_EP1","Garage"],
    ["Sr_border","Ground Spawn"],
    ["PARACHUTE_TARGET","Heli Pad"]
	];

DZE_DEPLOYABLE_ADMINS = [];
