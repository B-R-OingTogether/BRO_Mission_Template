_arsenalType = "medical";
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

//Misc
_masks = [""];

//Medical Supplies

//Medical Supplies
_infantryMedical = [""];
_sectionMedical = [""] + _infantryMedical;
_doctorMedical = [""] + _infantryMedical + _sectionMedical;


/***********************************************************************************************/

_specItems = [_infantryMedical, _doctorMedical, _infantryMedical, _doctorMedical, _infantryMedical, _infantryMedical, _doctorMedical, _infantryMedical, _doctorMedical, _infantryMedical, _sectionMedical, _sectionMedical, _sectionMedical, _infantryMedical, _doctorMedical, _doctorMedical, _doctorMedical];

[[_this select 0, _specTypes, _specItems, _arsenalType]] spawn CHSA_fnc_executeLocalArsenal;
