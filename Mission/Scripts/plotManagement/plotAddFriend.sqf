private ["_pos","_plots","_thePlot","_inList","_playerhits","_newUID","_typeQ","_newadd","_ownid","_Friend","_FriendUID"];
_pos = _this select 0;
_playerhits = 0;
if (_pos < 0) exitWith {};
_toAdd = (Humans select _pos);
_plots = nearestObjects [player, ["Plastic_Pole_EP1_DZ"],15];	
_thePlot = _plots select 0;
_friends = _thePlot getVariable ["plotfriends",[]];
_inList = false;
_plotownera =  _friends select 0;
_plotowner = _plotownera select 0;

_FriendUID = _toAdd select 0;
_newUID = _toAdd select 0;
_newadd = _toAdd select 1;
_typeQ = 2;


{ if ((_x  select 0) == (_toAdd select 0)) exitWith { _inList = true; }; } forEach _friends;
if (_inList ) exitWith { cutText ["Already on the list", "PLAIN DOWN"]; };
if (count _friends == 6) exitWith { cutText ["Only 6 allowed","PLAIN DOWN"]; };

PVDZE_queryPlotArray = [player, _newUID, _typeQ, _newadd];
publicVariableServer "PVDZE_queryPlotArray";
If (!isNil "PVDZE_queryPlotArrayResult") then {

waitUntil {!isNil "PVDZE_queryPlotArrayResult"};
_playerhits = PVDZE_queryPlotArrayResult;
PVDZE_queryPlotArrayResult = nil;

if (_playerhits == 0 ) exitWith { cutText ["Already on another Plot or Retry Later","PLAIN DOWN"]; };


if (_playerhits == 1 ) then { 
	_friends = _friends  + [_toAdd ];
	_thePlot setVariable ["plotfriends", _friends, true];
	PVDZE_veh_Update = [_thePlot,"gear"];
	publicVariableServer "PVDZE_veh_Update";

	PVDZE_plotArray = [_friendUID, _newadd, _plotowner];
	publicVariableServer "PVDZE_plotArray";
	waitUntil {!isNil "PVDZE_plotArray"};
	PVDZE_queryPlotArrayResult = nil;

	if (isServer) then {
		PVDZE_veh_Update call server_updateObject;
		PVDZE_plotArray call server_plotArray;
		PVDZE_plotArray = nil;
	};
};	
};
_playerhits = nil;
PVDZE_queryPlotArrayResult = nil;
waitUntil {isNil "PVDZE_queryPlotArrayResult"};
waitUntil {isNil "_playerhits"};
call PlotGetFriends;
call PlotNearbyHumans;
