_arsenalType = "ammo";
_target = sideUnknown;
//_specNames = ["Rifleman", "Officer", "Section Staff", "Section Medic", "Section MAAWS", "Medium Machinegunner", "Doctor", "Crewman", "Crewman Medic", "Marksman", "Engineer Section Staff", "Engineer", "Shelldrake Section Staff", "Gunner", "Medical Section Staff", "Medical section Personal", "Rotory Pilot", "ProntoStaff", "Prontomedic","Prontosoldier"];
//_specSlots = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1];
_specTypes = [
	["B_Soldier_lite_F"],	//  Rifleman
	["B_officer_F"],		// 	Officer	(Zeus,BHQ)
	["B_Soldier_SL_F"],		//	Section Staff	
	["B_medic_F"],			// 	Section Medic
	["B_soldier_AT_F"],		// 	Section MAAWS
	["B_HeavyGunner_F"],	//	Medium Machinegunner
	["B_Patrol_Medic_F"],	//	Doctor lvl Medic
	["B_crew_F"],			//	Crewman (Vanguard)
	["B_Soldier_A_F"],		//	Crewman Medic (Vanguard)
	["B_soldier_M_F"],		//	Markman (AUXILLERY)
	["B_soldier_exp_F"],	//	Engineer Section Staff
	["B_engineer_F"],		//	Engineer
	["B_support_MG_F"],		//	Section Staff (ShellDrake) 
	["B_support_Mort_F"],	//	Gunner (ShellDrake)
	["B_recon_medic_F"],	//	Medical Section Staff
	["B_recon_medic_F"],	//	Medical section Personal
	["B_Helipilot_F"],		 //	Rotory (Hotel)
	["B_Survivor_F"],		 // Pronto Staff
	["B_Soldier_unarmed_F"], // Pronto Medic
	["B_Deck_Crew_F"]		 // Pronto Rifleman
];
/********************************** Ammo & Consumables (magazines, ordnance, single-use gear) **********************************/
//All small arms / launcher. Attachment classnames (suppressors, brakes, bipods) removed - those live in config.sqf.


_generalAmmo = [""];

_grenades = [""];
_glaAmmo = [""];

_chemlights = [""];
_handFlares = [""];
_spraypaint = [""];

_generalEquipment = _generalAmmo + _grenades + _glaAmmo + _chemlights + _handFlares + _spraypaint;

/************************************* Class Specific Gear *************************************/
//Class specific gear
//Only small edits depending on mission parameters would occur here
//Add class specific stuff here. E.g. Backpacks, range tables etc

_crewmanEquipment = [""];
_randomEquipment = [];
_marksmanEquipment = [""];
_vanguardEquipment = [""];
_shelldrakeEquipment = [""];
_hotelEquipment = [""];
_prontoEquipment = [""];

/***********************************************************************************************/

//Role Equipment Assignment
_riflemanItems = 				 _generalEquipment;
_officerItems = 				 _generalEquipment 		+ _glaAmmo;
_sectionstaffItems =			 _generalEquipment 		+ _glaAmmo;
_sectionmedicItems =			 _generalEquipment;
_sectionmaawsItems =			 _generalEquipment;
_mediummachinegunnerItems =		 _generalEquipment;
_doctorItems =		 		   	 _generalEquipment 		+ _glaAmmo;
_crewmanItems =					 _generalEquipment;
_crewmanmedicItems =			 _generalEquipment;
_marksmanItems =				 _generalEquipment 		+ _marksmanEquipment;
_engineersectionstaffItems = 	 _generalEquipment 		+ _vanguardEquipment		+ _glaAmmo;
_engineerItems =				 _generalEquipment 		+ _vanguardEquipment;
_shelldrakesectionstaffItems =	 _generalEquipment 		+ _shelldrakeEquipment		+ _glaAmmo;
_gunnerItems =					 _generalEquipment 		+ _shelldrakeEquipment;
_medicalsectionstaffItems =		 _generalEquipment 		+ _glaAmmo;
_medicsectionItems =			 _generalEquipment;
_hotelpilotItems =				 _generalEquipment 		+ _hotelEquipment		    + _vanguardEquipment		+ _glaAmmo;
_ProntoStaff = 				     _generalEquipment      + _prontoEquipment;
_Prontomedic = 				     _generalEquipment 	    + _prontoEquipment;
_Prontosoldier = 			     _generalEquipment 	    + _prontoEquipment;


/***********************************************************************************************/

_specItems = [_riflemanItems, _officerItems, _sectionstaffItems, _sectionmedicItems, _sectionmaawsItems, _mediummachinegunnerItems, _doctorItems, _crewmanItems, _crewmanmedicItems, _marksmanItems, _engineersectionstaffItems, _engineerItems, _shelldrakesectionstaffItems, _gunnerItems, _medicalsectionstaffItems, _medicsectionItems, _hotelpilotItems, _ProntoStaff, _Prontomedic, _Prontosoldier];
//////////////////////////////////////////////////////////////////////////////////////////////

[[_this select 0, _specTypes, _specItems, _arsenalType]] spawn CHSA_fnc_executeLocalArsenal;

/***********************************************************************************************/