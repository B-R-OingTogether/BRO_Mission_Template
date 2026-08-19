_arsenalType = "main";
_target = sideUnknown;
//_specNames = ["Rifleman", "Officer", "Section Staff", "Section Medic", "Section MAAWS", "Medium Machinegunner", "Doctor", "Crewman", "Crewman Medic", "Marksman", "Engineer Section Staff", "Engineer", "Shelldrake Section Staff", "Gunner", "Medical Section Staff", "Medical section Personal", "Rotory Pilot", "ProntoStaff", "Prontomedic","Prontosoldier"];
//_specSlots = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1];
_specTypes = [
	["B_Soldier_lite_F"],	   //   Rifleman
	["B_officer_F"],		   // 	Officer	(Zeus,BHQ)
	["B_Soldier_SL_F"],		   //	Section Staff	
	["B_medic_F"],			   // 	Section Medic
	["B_soldier_AT_F"],		   // 	Section MAAWS
	["B_HeavyGunner_F"],	   //	Medium Machinegunner
	["B_Patrol_Medic_F"],	   //	Doctor lvl Medic
	["B_crew_F"],			   //	Crewman (Vanguard)
	["B_Soldier_A_F"],		   //	Crewman Medic (Vanguard)
	["B_soldier_M_F"],		   //	Markman (AUXILLERY)
	["B_soldier_exp_F"],	   //	Engineer Section Staff
	["B_engineer_F"],		   //	Engineer
	["B_support_MG_F"],		   //	Section Staff (ShellDrake) 
	["B_support_Mort_F"],	   //	Gunner (ShellDrake)
	["B_recon_medic_F"],	   //	Medical Section Staff
	["B_recon_medic_F"],	   //	Medical section Personal
	["B_Helipilot_F"],		   //	Rotory (Hotel)
	["B_Survivor_F"],		   //   Pronto Staff
	["B_Soldier_unarmed_F"],   //   Pronto Medic
	["B_Deck_Crew_F"]		   //   Pronto Rifleman
];
/********************************** Era/Mission Specific Gear **********************************/
//Most of the equipment editing would occur here depending on the Era/Faction
//E.g. BLUFOR, OPFOR, OPTRE, etc

_generalRifles = [""];

_generalSecondary = [""];
_generalTertiary = [""];

_marksmanRifles = [""];
_lmgRifles = [""];
_mmgRifles = [""];
_amRifles = [""];
_infantryLaunchers = [""];
_matLaunchers = [""];
_staffRifles = [""];

//Weapons Attachments 

_laserAttach = [""];
_muzzleAttach = [""];
_bipodAttach = [""];
_opticsAttach = [""];
_specialAttachments = [""];
_generalAttachments = [""] + _laserAttach + _muzzleAttach + _bipodAttach + _opticsAttach + _specialAttachments;


_helmets = [""];
_uniforms = [""];
_vests = [""];
_backpacks = [""];

_generalEquipment = _generalSecondary + _generalTertiary + _generalAttachments + _grenades + _helmets + _uniforms + _vests + _backpacks;

/***********************************************************************************************/

/***************************************** General Gear *****************************************/
//Gear that is used by all classes and some specialities
//Only small edits depending on mission parameters would occur here

_chemlights = [""];
_handFlares = [""];
_spraypaint = [""];
_cosmeticFacewear = [""];


_nvg = [""];
_binoculars = [""];
_miscGear = [""];
_miscItems = [""];
_generalItems = _chemlights + _handFlares + _spraypaint + _cosmeticFacewear + _nvg + _binoculars + _miscGear + _miscItems;


//Radios
//Make sure all radio's use the same Encryption
_infantryRadio = ["TFAR_anprc152"];
_backpackRadio = ["TFAR_anarc210","TFAR_mr3000_bwmod","TFAR_mr3000_bwmod_tropen","TFAR_rt1523g_sage","TFAR_rt1523g_green","TFAR_rt1523g_fabric","TFAR_rt1523g_bwmod","TFAR_rt1523g_black","TFAR_rt1523g_big_rhs","TFAR_rt1523g_big_bwmod_tropen","TFAR_rt1523g_big_bwmod","TFAR_rt1523g_big","TFAR_rt1523g","TFAR_rt1523g_rhs","tfw_ilbe_DD_arid","tfw_ilbe_DD_black","tfw_ilbe_DD_coy","tfw_ilbe_DD_gr","tfw_ilbe_DD_wd2","tfw_ilbe_DD_ocp","tfw_ilbe_DD_mc","tfw_ilbe_DD_mct","tfw_ilbe_DD_wd","tfw_ilbe_DD_d","tfw_ilbe_DD_alpine"];
_staffRadio = [""] + _infantryRadio + _backpackRadio;

//Hacking Tool and Designators
_hackingTool = ["MRH_HackingTool"];
_laserDesignators = [""];

_staffItems = ["ACE_HuntIR_monitor","B_UavTerminal"] + _generalItems + _hackingTool + _laserDesignators + _staffRifles
/***********************************************************************************************/

/************************************* Class Specific Gear *************************************/
//Class specific gear
//Only small edits depending on mission parameters would occur here
//Add class specific stuff here. E.g. Backpacks, range tables etc

_officerClothes = ["_Watchcap_blk","MTF_UniformV2","MTF_UniformV1","tsp_gear_fast_mt_black","tsp_gear_fast_mt_black_peltor","U_CBRN_B_black","V_CBRN_B_black","V_CBRN_B_black","G_CBRN_B_black"];

_riflemanBackpacks = [""];
_staffBackpacks = [""];
_medicBackpacks = [""];
_maawsBackpacks = [""];
_mmgBackpacks = [""];
_vanguardBackpacks = [""];
_shelldrakeBackpacks = [""];

_crewmanBackpacks = _riflemanBackpacks + _staffBackpacks + _medicBackpacks + _maawsBackpacks + _mmgBackpacks + _vanguardBackpacks	+ _shelldrakeBackpacks;

_crewmanEquipment = ["H_HelmetCrew_B","H_HelmetCrew_I_E","U_B_Cav_Coveralls"];
_randomEquipment = [""];
_ProntoEquipment = ["Laserdesignator","ibr_U_B_yul_M88","rhsgref_alice_webbing","rhsgref_wdl_alicepack","H_Booniehat_YU","rhsusf_shemagh_tan","aceax_textureOptions","ace_csw_kordCarryTripod","ace_csw_m3CarryTripodLow","ace_csw_m3CarryTripod","ace_csw_100Rnd_127x108_mag","ace_csw_100Rnd_127x108_mag_green","ace_csw_100Rnd_127x108_mag_red","ace_csw_100Rnd_127x108_mag_yellow","ace_compat_rhs_gref3_dshkm_carry","ace_compat_rhs_afrf3_kord_carry","ace_compat_rhs_usf3_m2_carry"];
_marksmanEquipment = [""];
_vanguardEquipment = [""];
_shelldrakeEquipment = [""];
_hotelEquipment = ["slr_slingload_CargoSling","rhsusf_ihadss","H_PilotHelmetHeli_B","RHS_jetpilot_usaf","H_PilotHelmetFighter_B","rhssaf_uniform_heli_pilot","U_B_HeliPilotCoveralls","U_B_PilotCoveralls"];


//Role Equipment Assignment
_riflemanItems = 				_generalRifles 		+ _generalEquipment 	+ _generalItems 	+ _infantryRadio 	+ _infantryMedical 	+ _riflemanBackpacks 	+ _infantryLaunchers;
_officerItems = 				_generalRifles		+ _generalEquipment 	+ _staffItems 		+ _staffRadio 		+ _sectionMedical 	+ _staffBackpacks		+ _infantryLaunchers	+ _officerClothes;
_sectionstaffitems =			_generalRifles		+ _generalEquipment 	+ _staffItems 		+ _staffRadio 		+ _sectionMedical 	+ _staffBackpacks;
_sectionmedicItems =			_generalRifles		+ _generalEquipment 	+ _generalItems 	+ _infantryRadio 	+ _doctorMedical 	+ _medicBackpacks		+ _staffRifles;
_sectionmaawsItems =			_generalRifles		+ _generalEquipment 	+ _generalItems 	+ _infantryRadio 	+ _infantryMedical	+ _maawsBackpacks		+ _matLaunchers			+ _amRifles;
_mediummachinegunnerItems = 	_generalRifles		+ _generalEquipment 	+ _generalItems 	+ _infantryRadio 	+ _infantryMedical 	+ _mmgBackpacks			+ _mmgRifles;
_doctorItems =					_generalRifles		+ _generalEquipment 	+ _generalItems 	+ _infantryRadio 	+ _doctorMedical	+ _staffBackpacks 		+ _medicBackpacks;
_crewmanItems =					_generalRifles		+ _generalEquipment 	+ _staffItems 		+ _staffRadio 		+ _infantryMedical	+ _riflemanBackpacks 	+ _crewmanBackpacks		+ _marksmanEquipment + _lmgRifles	+ _mmgRifles	+ _matLaunchers		+ _crewmanEquipment;
_crewmanmedicItems =			_generalRifles		+ _generalEquipment 	+ _staffItems 		+ _infantryRadio 	+ _sectionMedical	+ _riflemanBackpacks 	+ _crewmanBackpacks		+ _marksmanEquipment + _lmgRifles	+ _mmgRifles	+ _matLaunchers		+ _crewmanEquipment;
_marksmanItems =				_generalRifles		+ _generalEquipment 	+ _generalItems 	+ _infantryRadio 	+ _infantryMedical	+ _marksmanEquipment;
_engineersectionstaffItems = 	_generalRifles		+ _generalEquipment 	+ _staffItems 		+ _staffRadio 		+ _infantryMedical 	+ _staffBackpacks		+ _vanguardEquipment	+ _hackingTool;
_engineerItems =				_generalRifles		+ _generalEquipment 	+ _generalItems 	+ _infantryRadio 	+ _infantryMedical 	+ _vanguardEquipment 	+ _hackingTool;
_shelldrakesectionstaffItems =	_generalRifles		+ _generalEquipment 	+ _staffItems 		+ _staffRadio 		+ _infantryMedical 	+ _staffBackpacks		+ _shelldrakeEquipment;
_gunnerItems =					_generalRifles		+ _generalEquipment 	+ _generalItems 	+ _staffRadio 		+ _infantryMedical 	+ _shelldrakeEquipment;
_medicalsectionstaffItems =		_generalRifles		+ _generalEquipment 	+ _staffItems 		+ _staffRadio 		+ _doctorMedical 	+ _staffBackpacks		+ _medicBackpacks;
_medicsectionItems =			_generalRifles		+ _generalEquipment 	+ _generalItems 	+ _staffRadio 		+ _doctorMedical	+ _medicBackpacks		+ _staffRifles;
_hotelpilotItems =				_generalRifles		+ _generalEquipment 	+ _staffItems 		+ _staffRadio 		+ _doctorMedical 	+ _staffBackpacks		+ _staffRifles 	    	+ _hotelEquipment;
_ProntoStaff = 				    _generalRifles 		+ _generalEquipment 	+ _generalItems 	+ _staffRadio 	    + _infantryMedical 	+ _riflemanBackpacks 	+ _ProntoEquipment 	    + _infantryLaunchers; 
_Prontomedic = 				    _generalRifles 		+ _generalEquipment 	+ _generalItems 	+ _infantryRadio 	+ _doctorMedical 	+ _riflemanBackpacks 	+ _ProntoEquipment 	    + _infantryLaunchers;
_Prontosoldier = 			    _generalRifles 		+ _generalEquipment 	+ _generalItems 	+ _infantryRadio 	+ _infantryMedical 	+ _riflemanBackpacks 	+ _ProntoEquipment 	    + _infantryLaunchers;

/***********************************************************************************************/

_specItems = [_riflemanItems, _officerItems, _sectionstaffItems, _sectionmedicItems, _sectionmaawsItems, _mediummachinegunnerItems, _doctorItems, _crewmanItems, _crewmanmedicItems, _marksmanItems, _engineersectionstaffItems, _engineerItems, _shelldrakesectionstaffItems, _gunnerItems, _medicalsectionstaffItems, _medicsectionItems, _hotelpilotItems, _ProntoStaff, _Prontomedic, _Prontosoldier];

//////////////////////////////////////////////////////////////////////////////////////////////

[[_this select 0, _specTypes, _specItems, _arsenalType]] spawn CHSA_fnc_executeLocalArsenal;