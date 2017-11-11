disableSerialization;

AsReMixhud_Control = true; // player getVariable["AsReMixhud",true];

while {true} do
{
    1000 cutRsc ["AsReMixhud","PLAIN"];
    _wpui = uiNameSpace getVariable "AsReMixhud";
    _vitals = _wpui displayCtrl 4900;
	
	_thePlayer = player;
	
	_cashMoney 		= _thePlayer getVariable["cashMoney",0];
    _bankMoney 		= _thePlayer getVariable["bankMoney",0];
    
	_vitals ctrlSetStructuredText parseText format ["
		<t size='1'> %1 </t><img size='1' align='right' image='Scripts\Player_Hud\icons\Money.paa'/>   <br/>",
	[_cashMoney] call BIS_fnc_numberText,
	[_bankMoney] call BIS_fnc_numberText
	];
	_vitals ctrlCommit 0;
        
    sleep 2;
};