//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Unconscious Camera Required Lines ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

[false, false, false] call ace_spectator_fnc_setSpectator;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Global Respawn/Loadout Server Settings ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

comment "Exported from Arsenal by B.R.O.";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local player) exitWith {};

// Removing all items in players' inventories

comment "Remove existing items";
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

// Adding items to players' inventories upon load in and respawn. (Default kits)

comment "Add weapons";
player addWeapon "CUP_arifle_M4A1_black";
player addWeapon "hgun_Pistol_heavy_01_green_F";
comment "Add containers";
player AddHeadgear "H_Cap_tan";
player AddUniform "CUP_I_B_PMC_Unit_40";
player AddVest "CUP_V_PMC_CIRAS_Khaki_Empty";
player AddBackpack "CUP_B_USMC_MOLLE_WDL";

// Weapon Attachments
player addPrimaryWeaponItem "optic_arco_blk_f";
player addPrimaryWeaponItem "cup_acc_anpeq_15_top_flashlight_black_l";
player addSecondaryWeaponItem "optic_mrd_black";
player addSecondaryWeaponItem "cup_acc_cz_m3x";

// Adds binoculars
comment "Add binoculars";
player addWeapon "ACE_Vector";

// Uniform Loadout
comment "Add items to containers"; 
for "_i" from 1 to 2 do {player addItemToUniform "ACE_EarPlugs";};
for "_i" from 2 to 3 do {player addItemToUniform "ACE_tourniquet";};
for "_i" from 2 to 3 do {player addItemToUniform "ACE_splint";};
for "_i" from 1 to 1 do {player addItemToUniform "ACE_MapTools";};
for "_i" from 1 to 1 do {player addItemToUniform "ACE_Flashlight_XL50";};
for "_i" from 1 to 4 do {player addItemToUniform "ACE_CableTie";};

// Vest Loadout
for "_i" from 4 to 8 do {player addItemToVest "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green";};
for "_i" from 1 to 3 do {player addItemToVest "11Rnd_45ACP_Mag";};
for "_i" from 1 to 1 do {player addItemToVest "MRH_SoldierTab";};
for "_i" from 1 to 2 do {player addItemToVest "CUP_HandGrenade_M67";};
for "_i" from 1 to 2 do {player addItemToVest "ACE_M84";};
for "_i" from 1 to 4 do {player addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShellGreen";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShellBlue";};


// Backpack Loadout
for "_i" from 10 to 15 do {player addItemToBackpack "ACE_elasticBandage";};
for "_i" from 5 to 10 do {player addItemToBackpack "ACE_packingBandage";};
for "_i" from 1 to 2 do {player addItemToBackpack "kat_Painkiller";};
for "_i" from 1 to 1 do {player addItemToBackpack "ACE_EntrenchingTool";};
for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShellPurple";};

// Misc Items
comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "TFAR_anprc152";
player linkItem "ItemGPS";
player linkItem "ItemWatch";
