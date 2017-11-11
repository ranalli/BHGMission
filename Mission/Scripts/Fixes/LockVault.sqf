private ["_obj"];
 
disableuserinput true;disableuserinput true;disableuserinput true;
systemchat "You may not move while locking this.";
sleep 0.1;
_obj = _this select 3;
_obj spawn player_lockVault;
 
sleep 6.5;
disableuserinput false;disableuserinput false;disableuserinput false;
systemchat "You may now move!";