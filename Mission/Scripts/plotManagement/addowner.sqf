private ["_plots","_thePlot"];
_findNearestPoles = nearestObjects[player, ["Plastic_Pole_EP1_DZ"], DZE_PlotPole select 0];
_checkme = count _findNearestPoles;
	if (_checkme == 1 )then {
		_plots = nearestObjects [player, ["Plastic_Pole_EP1_DZ"],15];
		_friendUID = getPlayerUID player;
		_friendName = name  player;
		_thePlot = _plots select 0;
		player reveal _thePlot;
		_friends = [[_friendUID,_friendName]] ; 
		_thePlot setVariable ["plotfriends", _friends, true];
		PVDZE_veh_Update = [_thePlot,"gear"];
		publicVariableServer "PVDZE_veh_Update";	
		PVDZE_plotArray = [_friendUID, _friendName, _friendUID];
		publicVariableServer "PVDZE_plotArray";
		waitUntil {!isNil "PVDZE_plotArray"};

		if (isServer) then {
		PVDZE_veh_Update call server_updateObject;
		PVDZE_plotArray call server_plotArray;
		};
	 } Else {
		//cutText ["[BlackHole]: No PlotPole Found, Canot Place Owner.", "PLAIN DOWN"];
		//systemChat "[BlackHole]: No PlotPole Found, Canot Place Owner.";
		};