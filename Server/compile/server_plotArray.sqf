private ["_unit","_friendUID","_friendName"];

_friendUID  =		_this select 0;
_friendName =		_this select 1;
_plotowner = 		_this select 2;
_playerUID = _friendUID;
_player = _friendName;
 
_query = format["INSERT INTO plotArray (PlayerUID, PlayerName, PlotOwner) VALUES ('%1','%2','%3')",_playerUID,_player,_plotowner];
 
[_query, 1, true] call fn_asyncCall;

