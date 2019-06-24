
func void evt_oc_maingate_func_s1()
{
	if(MIS_OCGATEOPEN == FALSE)
	{
		Wld_InsertNpc(orcelite_roam,"OC_TO_GUARD");
		Wld_InsertNpc(orcwarrior_roam,"OC_TO_GUARD");
		Wld_InsertNpc(orcelite_roam,"OC_TO_GUARD");
		Wld_InsertNpc(orcwarrior_roam,"OC_TO_GUARD");
		Wld_InsertNpc(orcshaman_sit,"OC_TO_GUARD");
		Wld_InsertNpc(orcelite_roam,"OC_TO_GUARD");
		Wld_InsertNpc(warg,"OC_GUARD_ENTRANCE");
		Wld_InsertNpc(orcelite_roam,"OC_GUARD_ENTRANCE");
		Wld_InsertNpc(warg,"OC_GUARD_ENTRANCE");
		Wld_InsertNpc(orcelite_roam,"OC_GUARD_ENTRANCE");
		Wld_InsertNpc(orcwarrior_roam,"OC_TRAIN_03");
		Wld_InsertNpc(orcelite_roam,"OC_TRAIN_03");
		Wld_InsertNpc(orcwarrior_roam,"OC_TRAIN_03");
		Wld_InsertNpc(orcelite_roam,"OC_TRAIN_03");
		Wld_InsertNpc(orcwarrior_roam,"OC_TRAIN_04");
		Wld_InsertNpc(orcelite_roam,"OC_TRAIN_04");
		Wld_InsertNpc(orcwarrior_roam,"OC_CAMPFIRE_OUT_01");
		Wld_InsertNpc(warg,"OC_CAMPFIRE_OUT_01");
		Wld_InsertNpc(warg,"OC_CAMPFIRE_OUT_01");
		Wld_InsertNpc(orcelite_roam,"OC_CAMPFIRE_OUT_01");
		Wld_InsertNpc(orcwarrior_roam,"OC_CENTER_02");
		Wld_InsertNpc(orcelite_roam,"OC_CENTER_02");
		Wld_InsertNpc(orcwarrior_roam,"OC_CENTER_03");
		Wld_InsertNpc(orcelite_roam,"OC_CENTER_03");
		Wld_InsertNpc(orcwarrior_roam,"OC_KITCHEN_ENTRANCE");
		Wld_InsertNpc(orcelite_roam,"OC_KITCHEN_ENTRANCE");
		Wld_InsertNpc(orcshaman_sit,"OC_KITCHEN_ENTRANCE");
		Wld_InsertNpc(orcelite_roam,"OC_KITCHEN_ENTRANCE");
		Wld_InsertNpc(orcwarrior_roam,"OC_EBR_HALL_THRONE");
		Wld_InsertNpc(orcshaman_sit,"OC_EBR_HALL_THRONE");
		Wld_InsertNpc(warg,"OC_EBR_HALL_THRONE");
		b_killnpc(vlk_4143_haupttorwache);
		b_killnpc(vlk_4145_waffenknecht);
		b_killnpc(vlk_4146_waffenknecht);
		b_killnpc(vlk_4147_waffenknecht);
		b_killnpc(vlk_4101_waffenknecht);
		b_killnpc(vlk_4102_waffenknecht);
		b_killnpc(vlk_4103_waffenknecht);
		b_killnpc(vlk_4104_waffenknecht);
		b_killnpc(vlk_4105_waffenknecht);
		b_killnpc(vlk_4108_engor);
		garond.flags = 0;
		brutus.flags = NPC_FLAG_IMMORTAL;
		PlayVideo("ORCATTACK.BIK");
		MIS_OCGATEOPEN = TRUE;
	};
};

