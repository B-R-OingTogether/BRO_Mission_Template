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
_infantryMedical = ["ACM_SuctionBag","ACM_IV_14g","ACM_IV_16g","ACM_ChestSeal","ACM_ElasticWrap","ACM_EmergencyTraumaDressing","ACM_NCDKit","ACM_NPA","ACM_PressureBandage","ACM_SAMSplint","ACE_tourniquet","ACE_Canteen","ACE_Canteen_Half","ACE_WaterBottle","ACE_WaterBottle_Half","ACM_AmmoniaInhalant","ACM_Paracetamol"];
_sectionMedical = ["ACM_OxygenTank_425","ACM_IV_16g","ACM_ChestSeal","ACM_ElasticWrap","ACM_EmergencyTraumaDressing","ACM_NCDKit","ACM_NPA","ACM_PressureBandage","ACM_SAMSplint","ACE_tourniquet","ACE_Canteen","ACE_Canteen_Half","ACE_WaterBottle","ACE_WaterBottle_Half","ACM_BloodBag_ON_1000","ACM_BloodBag_ON_250","ACM_BloodBag_ON_500","ACE_bodyBag","ACM_Vial_CalciumChloride","ACM_SuctionBag","ACM_Vial_Epinephrine","ACM_IO_EZ","ACM_IO_FAST","ACM_FieldBloodTransfusionKit_500","ACM_IGel","ACM_OPA","ACM_PocketBVM","ACM_OPA","ACM_PocketBVM","ACM_Syringe_1","ACE_morphine","ACM_AmmoniaInhalant","ACM_Paracetamol","ACM_Inhaler_Penthrox"] + _infantryMedical;
_doctorMedical = ["ACM_IV_14g","ACM_IV_16g","ACM_ChestSeal","ACM_ElasticWrap","ACM_EmergencyTraumaDressing","ACM_NCDKit","ACM_NPA","ACM_PressureBandage","ACM_SAMSplint","ACE_tourniquet","ACE_Canteen","ACE_Canteen_Half","ACE_WaterBottle","ACE_WaterBottle_Half","ACM_ACCUVAC","ACM_Vial_Adenosine","ACM_Vial_Amiodarone","ACM_Vial_Atropine","ACM_AED","ACM_BVM","ACM_BloodBag_ON_1000","ACM_BloodBag_ON_250","ACM_BloodBag_ON_500","ACE_bodyBag","ACE_bodyBag_blue","ACM_Vial_CalciumChloride","ACM_ChestTubeKit","ACM_CricKit","ACM_SuctionBag","ACE_epinephrine","ACM_Vial_Epinephrine","ACM_Vial_Ertapenem","ACM_Vial_Esmolol","ACM_IO_EZ","ACM_IO_FAST","ACM_Lozenge_Fentanyl","ACM_Vial_Fentanyl","ACM_FieldBloodTransfusionKit_250","ACM_FieldBloodTransfusionKit_500","ACM_IGel","ACM_Vial_Ketamine","ACM_Vial_Lidocaine","ACM_Vial_Morphine","ACM_Spray_Naloxone","ACM_Vial_Ondansetron","ACM_OPA","ACM_PocketBVM","ACM_PressureCuff","ACM_PulseOximeter","ACE_salineIV_250","ACM_Stethoscope","ACE_salineIV_500","ACE_salineIV","ACM_Vial_TXA","ACM_ThoracostomyKit","ACM_Syringe_5","ACM_Syringe_3","ACM_Syringe_1","ACM_Syringe_10","ACE_suture","ACE_surgicalKit","ACE_plasmaIV_500","ACE_plasmaIV_250","ACE_plasmaIV","ACE_personalAidKit","ACM_Autoinjector_ATNA","ACM_Autoinjector_Midazolam","ACE_morphine","ACM_AmmoniaInhalant","ACM_Paracetamol","ACM_Inhaler_Penthrox","ACM_OxygenTank_425"] + _infantryMedical + _sectionMedical;


/***********************************************************************************************/

_specItems = [_infantryMedical, _doctorMedical, _infantryMedical, _doctorMedical, _infantryMedical, _infantryMedical, _doctorMedical, _infantryMedical, _doctorMedical, _infantryMedical, _sectionMedical, _sectionMedical, _sectionMedical, _infantryMedical, _doctorMedical, _doctorMedical, _doctorMedical];

[[_this select 0, _specTypes, _specItems, _arsenalType]] spawn CHSA_fnc_executeLocalArsenal;
