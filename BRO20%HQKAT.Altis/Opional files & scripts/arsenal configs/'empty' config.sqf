_target = sideUnknown;
_restrictionDistance = 5;
_specNames = ["Rifleman", "Officer", "Section Staff", "Section Medic", "Section MAAWS", "Lght Machinegunner", "Medium Machinegunner", "Signaller/Radio Man", "Doctor", "Crewman", "Crewman Medic", "Marksman", "Engineer Section Staff", "Engineer", "Fixed Wing Pilot", "Golf Section Staff", "Gunner", "Mike Section Staff", "Mike Medic", "Hotel Pilot"];
_specSlots = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1];
_specTypes = [
	["B_Soldier_lite_F"],
	["B_officer_F"],
	["B_Soldier_SL_F"],
	["B_medic_F"],
	["B_soldier_AT_F"],
	["B_soldier_AR_F"],
	["B_HeavyGunner_F"],
	["B_soldier_UAV_F"],
	["B_Patrol_Medic_F"],
	["B_crew_F"],
	["B_Soldier_A_F"],
	["B_soldier_M_F"],
	["B_soldier_exp_F"],
	["B_engineer_F"],
	["B_Pilot_F"],
	["B_support_MG_F"],
	["B_support_Mort_F"],
	["B_CTRG_Soldier_Medic_tna_F"],
	["B_recon_medic_F"],
	["B_Helipilot_F"]
];
/********************************** Era/Mission Specific Gear **********************************/
//Most of the equipment editing would occur here depending on the Era/Faction
//E.g. BLUFOR, OPFOR, OPTRE, etc

_generalRifles = [];
_generalSecondary = [];
_generalTertiary = [];

_marksmanRifles = [];
_lmgRifles = [];
_mmgRifles = [];
_infantryLaunchers = [];
_matLaunchers = [];
_staffRifles = [];

//Weapons Attachments 
_laserAttach = [];
_muzzleAttach = [];
_bipodAttach = [];
_opticsAttach = [];
_specialAttachments = [];
_generalAttachments = [] + _laserAttach + _muzzleAttach + _bipodAttach + _opticsAttach + _specialAttachments;

_generalAmmo = [];
_lmgAmmo = [];
_mmgAmmo = [];
_glaAmmo = [];
_grenades = [];

_helmets = [];
_uniforms = [];
_vests = [];
_backpacks = [];

_generalEquipment = _generalSecondary + _generalTertiary + _generalAmmo + _generalAttachments + _grenades + _helmets + _uniforms + _vests + _backpacks;

/***********************************************************************************************/

/***************************************** General Gear *****************************************/
//Gear that is used by all classes and some specialities
//e.g. Medical
//Only small edits depending on mission parameters would occur here

_chemlights = [];
_handFlares = [];
_spraypaint = [];
_cosmeticFacewear = [];

_nvg = [];
_binoculars = [];
_miscGear = [];
_miscItems = [];
_generalItems = _chemlights + _handFlares + _spraypaint + _cosmeticFacewear + _nvg + _binoculars + _miscGear + _miscItems;

//Medical Supplies
_infantryMedical = [];
_sectionMedical = [] + _infantryMedical;
_doctorMedical = [] + _sectionMedical;

//Radios
//Make sure all radio's use the same Encryption
_infantryRadio = [];
_backpackRadio = [];
_staffRadio = [] + _infantryRadio + _backpackRadio;

//Hacking Tool and Designators
_hackingTool = [];
_laserDesignators = [];

_staffItems = [] + _generalItems + _hackingTool + _laserDesignators + _staffRifles + _glaAmmo;
/***********************************************************************************************/

/************************************* Class Specific Gear *************************************/
//Class specific gear
//Only small edits depending on mission parameters would occur here
//Add class specific stuff here. E.g. Backpacks, range tables etc

_riflemanBackpacks = [];
_staffBackpacks = [];
_medicBackpacks = [];
_maawsBackpacks = [];
_lmgBackpacks = [];
_mmgBackpacks = [];
_signallerBackpacks = [];
_echoBackpacks = [];
_golfBackpacks = [];
_mikeBackpacks = [];
_crewmanBackpacks = _riflemanBackpacks + _staffBackpacks + _medicBackpacks + _maawsBackpacks + _lmgBackpacks	+ _mmgBackpacks	+ _signallerBackpacks + _echoBackpacks	+ _golfBackpacks + _mikeBackpacks;

_crewmanEquipment = [];
_deltaEquipment = [];
_marksmanEquipment = [];
_echoEquipment = [];
_foxtrotEquipment = [];
_golfEquipment = [];
_hotelEquipment = [];
_mikeEquipment = [];

//Role Equipment Assignment
_riflemanItems = 				_generalRifles 		+ _generalEquipment 	+ _generalItems 	+ _infantryRadio 	+ _infantryMedical 	+ _riflemanBackpacks 	+ _infantryLaunchers;
_officerItems = 				_generalRifles		+ _generalEquipment 	+ _staffItems 		+ _staffRadio 		+ _infantryMedical 	+ _staffBackpacks 		+ _crewmanEquipment;
_sectionstaffitems =			_generalRifles		+ _generalEquipment 	+ _staffItems 		+ _staffRadio 		+ _infantryMedical 	+ _staffBackpacks;
_sectionmedicItems =			_generalRifles		+ _generalEquipment 	+ _generalItems 	+ _infantryRadio 	+ _sectionMedical 	+ _medicBackpacks;
_sectionmaawsItems =			_generalRifles		+ _generalEquipment 	+ _generalItems 	+ _infantryRadio 	+ _infantryMedical	+ _maawsBackpacks		+ _matLaunchers;
_lightmachinegunnerItems =		_lmgRifles			+ _generalEquipment 	+ _generalItems 	+ _infantryRadio 	+ _infantryMedical 	+ _lmgBackpacks;
_mediummachinegunnerItems = 	_mmgRifles			+ _generalEquipment 	+ _generalItems 	+ _infantryRadio 	+ _infantryMedical 	+ _mmgBackpacks;
_signallerItems =				_generalRifles		+ _generalEquipment 	+ _staffItems 		+ _staffRadio 		+ _infantryMedical 	+ _staffBackpacks 		+ _infantryLaunchers;
_doctorItems =					_generalRifles		+ _generalEquipment 	+ _generalItems 	+ _infantryRadio 	+ _doctorMedical	+ _staffBackpacks 		+ _medicBackpacks;
_crewmanItems =					_generalRifles		+ _generalEquipment 	+ _staffItems 		+ _staffRadio 		+ _sectionMedical	+ _riflemanBackpacks 	+ _crewmanBackpacks		+ _staffRifles + _marksmanEquipment + _lmgRifles	+ _mmgRifles	+ _matLaunchers		+ _crewmanEquipment;
_crewmanmedicItems =			_generalRifles		+ _generalEquipment 	+ _staffItems 		+ _staffRadio 		+ _sectionMedical	+ _riflemanBackpacks 	+ _crewmanBackpacks		+ _staffRifles + _marksmanEquipment + _lmgRifles	+ _mmgRifles	+ _matLaunchers		+ _crewmanEquipment;
_marksmanItems =				_generalRifles		+ _generalEquipment 	+ _generalItems 	+ _infantryRadio 	+ _infantryMedical	+ _marksmanEquipment;
_engineersectionstaffItems = 	_generalRifles		+ _generalEquipment 	+ _staffItems 		+ _staffRadio 		+ _infantryMedical 	+ _staffBackpacks		+ _echoEquipment		+ _hackingTool;
_engineerItems =				_generalRifles		+ _generalEquipment 	+ _generalItems 	+ _infantryRadio 	+ _infantryMedical 	+ _echoEquipment 		+ _hackingTool;
_fixedwingpilotItems =			_generalRifles		+ _generalEquipment 	+ _generalItems 	+ _infantryRadio 	+ _infantryMedical 	+ _staffBackpacks		+ _foxtrotEquipment;
_golfsectionstaffItems =		_generalRifles		+ _generalEquipment 	+ _staffItems 		+ _staffRadio 		+ _infantryMedical 	+ _staffBackpacks		+ _golfEquipment;
_gunnerItems =					_generalRifles		+ _generalEquipment 	+ _generalItems 	+ _infantryRadio 	+ _infantryMedical 	+ _golfEquipment;
_mikesectionstaffItems =		_generalRifles		+ _generalEquipment 	+ _staffItems 		+ _staffRadio 		+ _doctorMedical 	+ _staffBackpacks		+ _medicBackpacks;
_mikemedicItems =				_generalRifles		+ _generalEquipment 	+ _generalItems 	+ _infantryRadio 	+ _doctorMedical	+ _medicBackpacks;
_hotelpilotItems =				_generalRifles		+ _generalEquipment 	+ _staffItems 		+ _staffRadio 		+ _sectionMedical 	+ _staffBackpacks		+ _hotelEquipment;

/***********************************************************************************************/

_specItems = [_riflemanItems, _officerItems, _sectionstaffItems, _sectionmedicItems, _sectionmaawsItems, _lightmachinegunnerItems, _mediummachinegunnerItems, _signallerItems, _doctorItems, _crewmanItems, _crewmanmedicItems, _marksmanItems, _engineersectionstaffItems, _engineerItems, _fixedwingpilotItems, _golfsectionstaffItems, _gunnerItems, _mikesectionstaffItems, _mikemedicItems, _hotelpilotitems];

//////////////////////////////////////////////////////////////////////////////////////////////

[_target, [_this select 0, _restrictionDistance, _specNames, _specSlots, _specTypes, _specItems]] spawn CHSA_fnc_executeLocalArsenal;