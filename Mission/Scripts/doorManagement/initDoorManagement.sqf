disableSerialization;
if(count(_this) > 0)then{
TheDoor = _this select 3;
}else{
TheDoor = dayz_selectedDoor;
};
_display = findDisplay 41144;
_display closeDisplay 3000;
_friends = TheDoor getVariable ["doorfriends",[]];
 
_adminList = MasterKey; // Add admins here if you admins to able to manage all plotpoles
_ownerfix = TheDoor getVariable ["doorfriends",[]];
_owner = _ownerfix select 0;
_fuid = [];
{
_friendUID = _x select 0;
_fuid = _fuid + [_friendUID];
} forEach _friends;
_allowed = [_owner];    
_allowed = [_owner] + _adminList + _fuid;
 
if((getPlayerUID player) in _allowed)then{
createDialog "DoorManagement";
call DoorNearbyHumans;
call DoorGetFriends;
}else{
cutText ["You do not have the rights to manage.","PLAIN DOWN"];
};