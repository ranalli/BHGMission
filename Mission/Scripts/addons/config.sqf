//  DZE_CLICK_ACTIONS
//      This is where you register your right-click actions
//  FORMAT -- (no comma after last array entry)
//      [_classname,_text,_execute,_condition],
//  PARAMETERS
//  _classname  : the name of the class to click on 
//                  (example = "ItemBloodbag")
//  _text       : the text for the option that is displayed when right clicking on the item 
//                  (example = "Self Transfuse")
//  _execute    : compiled code to execute when the option is selected 
//                  (example = "execVM 'my\scripts\self_transfuse.sqf';")
//  _condition  : compiled code evaluated to determine whether or not the option is displayed
//                  (example = {true})
//  EXAMPLE -- see below for some simple examples
DZE_CLICK_ACTIONS = [

    ["ItemRadio","Group Management","execVM 'Scripts\dzgm\loadGroupManagement.sqf';","true"],
    ["ItemMap","Locate Vehicle","execVM 'Scripts\custom\locate_vehicle.sqf';","true"],
    ["ItemGPS","Locate Vehicle","execVM 'Scripts\custom\locate_vehicle.sqf';","true"],
	//["ItemRadio","Switch ON/OFF","execVM 'scripts\remote\switch_on_off.sqf';","true"],
    ["Binocular_Vector","View Distance: 500m" ,"setViewDistance 500; systemChat('ViewDistance: 500');","true"],
    ["Binocular_Vector","View Distance: 1000m" ,"setViewDistance 1000; systemChat('ViewDistance: 1000');","true"],
    ["Binocular_Vector","View Distance: 1500m" ,"setViewDistance 1500; systemChat('ViewDistance: 1500');","true"],
    ["Binocular_Vector","View Distance: 2000m" ,"setViewDistance 2000; systemChat('ViewDistance: 2000'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
    ["Binocular_Vector","View Distance: 2500m" ,"setViewDistance 2500; systemChat('ViewDistance: 2500'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
    ["Binocular_Vector","View Distance: 3000m" ,"setViewDistance 3000; systemChat('ViewDistance: 3000'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
    ["Binocular_Vector","View Distance: 3500m" ,"setViewDistance 3500; systemChat('ViewDistance: 3500'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
    ["Binocular_Vector","View Distance: 4000m" ,"setViewDistance 4000; systemChat('ViewDistance: 4000'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
	["Binocular_Vector","View Distance: 5000m" ,"setViewDistance 5000; systemChat('ViewDistance: 5000'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
    ["Binocular","View Distance: 500m" ,"setViewDistance 500; systemChat('ViewDistance: 500');","true"],
    ["Binocular","View Distance: 1000m" ,"setViewDistance 1000; systemChat('ViewDistance: 1000');","true"],
    ["Binocular","View Distance: 1500m" ,"setViewDistance 1500; systemChat('ViewDistance: 1500');","true"],
    ["Binocular","View Distance: 2000m" ,"setViewDistance 2000; systemChat('ViewDistance: 2000'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
    ["Binocular","View Distance: 2500m" ,"setViewDistance 2500; systemChat('ViewDistance: 2500'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
    ["Binocular","View Distance: 3000m" ,"setViewDistance 3000; systemChat('ViewDistance: 3000'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
    ["Binocular","View Distance: 3500m" ,"setViewDistance 3500; systemChat('ViewDistance: 3500'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
    ["Binocular","View Distance: 4000m" ,"setViewDistance 4000; systemChat('ViewDistance: 4000'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
    ["Binocular","View Distance: 5000m" ,"setViewDistance 5000; systemChat('ViewDistance: 5000'); systemChat('Warning: Higher the view distance Lower the FPS');","true"]

];