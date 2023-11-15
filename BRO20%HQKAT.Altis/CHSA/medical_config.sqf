_arsenalType = "medical";
_target = sideUnknown;
//_specNames = ["Rifleman", "Officer", "Section Staff", "Section Medic", "Section MAAWS", "Medium Machinegunner", "Doctor", "Crewman", "Crewman Medic", "Marksman", "Engineer Section Staff", "Engineer", "Shelldrake Section Staff", "Gunner", "Medical Section Staff", "Medical section Personal", "Rotory Pilot"];
//_specSlots = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1];
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
	["B_Helipilot_F"]		//	Rotory (Hotel)
];

//Misc
_masks = ["G_AirPurifyingRespirator_02_black_F","G_AirPurifyingRespirator_02_olive_F","G_AirPurifyingRespirator_02_sand_F","G_RegulatorMask_F","G_Respirator_blue_F","G_Respirator_white_F","G_Respirator_yellow_F","G_AirPurifyingRespirator_01_F","SP_GasMask_Black","max_gasmask","max_gasmask_G","MRH_HaloMask","MRH_HaloMaskNoESS"];
//Medical Supplies
_infantryMedical = ["Attachable_Helistretcher","ACE_elasticBandage","ACE_packingBandage","ACE_quikclot","kat_bloodIV_A_N","kat_bloodIV_AB_N","kat_bloodIV_B_N","kat_bloodIV_AB_N_250","kat_bloodIV_B_N_250","kat_bloodIV_A_N_500","kat_bloodIV_AB_N_500","kat_bloodIV_B_N_500","kat_chestSeal","kat_PainkillerItem","ACE_splint","ACE_tourniquet","kat_Bubble_Wrap_Item","kat_bloodIV_A_N_250","kat_Painkiller","kat_Bubble_Wrap","kat_Armband_Kat_Item","kat_armband_kat","kat_stretcherBag","ACE_fieldDressing","RyanZombiesAntiVirusTemporary_Item"] + _masks;
_sectionMedical = ["RyanZombiesAntiVirusCure_Item","kat_IV_16","kat_aatKit","kat_accuvac","ACE_adenosine","kat_X_AED","kat_amiodarone","kat_CarbonateItem","kat_Armband_Doctor_Item","kat_Armband_Kat_Item","kat_Armband_Medic_Item","kat_Armband_Red_Cross_Item","kat_atropine","kat_bloodIV_O_N","kat_bloodIV_O_N_250","kat_bloodIV_O_N_500","kat_BVM","kat_CaffeineItem","ACE_epinephrine","kat_IO_FAST","kat_etomidate","kat_fentanyl","KAT_Empty_bloodIV_250","KAT_Empty_bloodIV_500","kat_flumazenil","kat_guedel","kat_ketamine","kat_larynx","kat_lidocaine","kat_lorazepam","ACE_morphine","kat_nalbuphine","kat_naloxone","kat_ncdKit","kat_nitroglycerin","kat_norepinephrine","kat_PervitinItem","kat_phenylephrine","kat_oxygenTank_150_Item","kat_oxygenTank_300_Item","kat_Pulseoximeter","ACE_salineIV","ACE_salineIV_250","ACE_salineIV_500","kat_stethoscope","ACE_surgicalKit","ACE_tourniquet","kat_TXA","kat_oxygenTank_150","kat_oxygenTank_300","kat_Pervitin","kat_Caffeine","kat_Carbonate","kat_AED","kat_EACA","ACE_bodyBag","ACE_personalAidKit"] + _infantryMedical;
_doctorMedical = ["kat_ketamine"] + _infantryMedical + _sectionMedical;



/***********************************************************************************************/

_specItems = [_infantryMedical, _doctorMedical, _infantryMedical, _doctorMedical, _infantryMedical, _infantryMedical, _doctorMedical, _infantryMedical, _doctorMedical, _infantryMedical, _sectionMedical, _sectionMedical, _sectionMedical, _infantryMedical, _doctorMedical, _doctorMedical, _doctorMedical];

[[_this select 0, _specTypes, _specItems, _arsenalType]] spawn CHSA_fnc_executeLocalArsenal;
