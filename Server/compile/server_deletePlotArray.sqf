private ["_playerUID","_playerName","_player"];

_player =		_this select 0;
_clientID = owner _player;
_playerUID = _this select 1;
_playerName = _this select 2;
_erase = _this select 3;
_return = 1;

if (_erase == 1) then {
_query1 = format["DELETE FROM plotArray WHERE PlotOwner='%1'",_playerUID];
_result = [_query1, 1, true] call fn_asyncCall;

diag_log format ["result: %1", _result];

if (!isnil "_result") then { 
if (_result) then { _return = 1 } else { _return = 0 };
}; 
PVDZE_queryPlotArrayResult = _return;

if(!isNull _player) then {
_clientID publicVariableClient "PVDZE_queryPlotArrayResult";
};

} Else {

_query1 = format["DELETE FROM plotArray WHERE PlayerUID='%1'",_playerUID];
_result = [_query1, 1, true] call fn_asyncCall;

diag_log format ["result: %1", _result];

if (!isnil "_result") then { 
if (_result) then { _return = 1 } else { _return = 0 };
}; 
PVDZE_queryPlotArrayResult = _return;

if(!isNull _player) then {
_clientID publicVariableClient "PVDZE_queryPlotArrayResult";
};
};


