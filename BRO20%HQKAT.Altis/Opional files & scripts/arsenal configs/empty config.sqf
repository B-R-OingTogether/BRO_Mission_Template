arsenalType = "main";
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
_infantryRadio = [""];
_backpackRadio = [""];
_staffRadio = [""] + _infantryRadio + _backpackRadio;

//Hacking Tool and Designators
_hackingTool = [""];
_laserDesignators = [""];

_staffItems = [""] + _generalItems + _hackingTool + _laserDesignators + _staffRifles
/***********************************************************************************************/

/************************************* Class Specific Gear *************************************/
//Class specific gear
//Only small edits depending on mission parameters would occur here
//Add class specific stuff here. E.g. Backpacks, range tables etc

_officerClothes = [""];

_riflemanBackpacks = [""];
_staffBackpacks = [""];
_medicBackpacks = [""];
_maawsBackpacks = [""];
_mmgBackpacks = [""];
_vanguardBackpacks = [""];
_shelldrakeBackpacks = [""];

_crewmanBackpacks = _riflemanBackpacks + _staffBackpacks + _medicBackpacks + _maawsBackpacks + _mmgBackpacks + _vanguardBackpacks	+ _shelldrakeBackpacks;

_crewmanEquipment = [""];
_randomEquipment = [""];
_ProntoEquipment = [""];
_marksmanEquipment = [""];
_vanguardEquipment = [""];
_shelldrakeEquipment = [""];
_hotelEquipment = [""];


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