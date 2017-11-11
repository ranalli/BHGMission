private ["_player","_friendUID","_friendName","_query","_result","_playerUID"];

//_friendUID  =		_this select 0;
//_friendName =		_this select 1;
//_player = _this select 3;		
//_clientID = owner  _player;
//_playerUID = _friendUID;

_typeQ = _this select 2;
_player =		_this select 0;
_clientID = owner _player;

If (_typeQ == 1) then {
_playerUID = _this select 1;
};

If (_typeQ == 2) then {
_Friend = _this select 3;
_FriendUID = _this select 1;
diag_log format ["_Friend: %1", _Friend];
diag_log format ["_FriendUID: %1", _FriendUID];
_playerUID = _FriendUID;

};

_return = 0;
_query = format["SELECT PlayerUID, PlayerName FROM plotArray WHERE PlayerUID=%1",_playerUID];

diag_log format ["_query: %1", _query];

_result = [_query, 2, true] call fn_asyncCall;

if (!isnil "_result") then { 
if (count _result == 0) then { _return = 1 } else { _return = 0 };
}; 
PVDZE_queryPlotArrayResult = _return;

diag_log format ["_result: %1", _result];
diag_log format ["_playerUID: %1", _playerUID];
diag_log format ["_clientID Before: %1", _clientID];

if(!isNull _player) then {
_clientID publicVariableClient "PVDZE_queryPlotArrayResult";
diag_log format ["_clientID After: %1", _clientID];
};

diag_log format ["_return: %1", _return];



