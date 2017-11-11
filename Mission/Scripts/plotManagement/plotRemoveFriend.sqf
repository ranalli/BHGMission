private ["_list","_plots","_thePlot","_friends"];
_playerhits = 1;
_pos = _this select 0;
if (_pos < 0) exitWith {};
_plots = nearestObjects [player, ["Plastic_Pole_EP1_DZ"],15];	
_thePlot = _plots select 0;
_friends = _thePlot getVariable ["plotfriends", []];
_toRemove = (_friends select _pos);
if((_toRemove select 0) == (_friends select 0) select 0)exitWith{systemChat "Cant remove owner!";};
_erase = 0;

if(count _toRemove >= 1) then {

_FriendUID = _toRemove select 0;
_remUID = _toRemove select 0;
_newrem = _toRemove select 1;
_typeQ = 2;

PVDZE_queryPlotArray = [player, _remUID, _typeQ, _newrem];
publicVariableServer "PVDZE_queryPlotArray";
If (!isNil "PVDZE_queryPlotArrayResult") then {

waitUntil {!isNil "PVDZE_queryPlotArrayResult"};
_playerhits = PVDZE_queryPlotArrayResult;

if (_playerhits == 0 ) then {

_newList = [];
{
	if(_x select 0  != _toRemove select 0)then{
	_newList = _newList + [_x];
	};
} forEach _friends;
_thePlot setVariable ["plotfriends", _newList, true];
PVDZE_veh_Update = [_thePlot,"gear"];
publicVariableServer "PVDZE_veh_Update";

	if (isServer) then {
			PVDZE_veh_Update call server_updateObject;
	};
call PlotGetFriends;
call PlotNearbyHumans;

PVDZE_deletePlotArray = [player, _remUID, _newrem, _erase];
publicVariableServer "PVDZE_deletePlotArray";


		if (isServer) then {
			PVDZE_deletePlotArray call server_deletePlotArray;
			PVDZE_deletePlotArray = nil;
		};
};
};
_playerhits = 1;
PVDZE_queryPlotArrayResult = nil;
waitUntil {isNil "PVDZE_queryPlotArrayResult"};
waitUntil {_playerhits == 1};
call PlotGetFriends;
call PlotNearbyHumans;
};

