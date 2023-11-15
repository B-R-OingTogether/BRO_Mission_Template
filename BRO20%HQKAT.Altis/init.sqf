//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Global Server Settings ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

enableSaving [false, false];

CIVILIAN setFriend [WEST, 1];
WEST setFriend [CIVILIAN, 1];
INDEPENDENT setFriend [WEST, 0];
WEST setFriend [INDEPENDENT, 0];

player addRating 100000;

0 fadeRadio 0.1;
enableRadio false;
enableSentences false;
player disableConversation false;

/*
adv_aceCPR_quotient = 1;
adv_aceCPR_onlyDoctors = 0;
adv_aceCPR_probabilities = [60,40,20,85];
*/

[player, -1] call BIS_fnc_respawnTickets;

WIH_Spectate = {
	["Initialize", [player, [WEST], false, true, true, true, true, true, true, false]] call BIS_fnc_EGSpectator;
	sleep 2;
	waitUntil {(inputaction "actionContext" >0) || (inputaction "action" >0)};
	sleep 0.5;
	["Terminate"] call BIS_fnc_EGSpectator;
};

remoteExec["unconsciousCamera"];