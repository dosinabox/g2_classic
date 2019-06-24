
func void evt_truhe_ow_01_s1()
{
	if(TRUHESFX == FALSE)
	{
		Snd_Play("ORC_ANGRY");
		TRUHESFX = TRUE;
		Wld_InsertNpc(gobbo_black,"FP_ROAM_OW_MOLERAT_03_02");
		Wld_InsertNpc(gobbo_black,"FP_ROAM_OW_MOLERAT_03_03");
		Wld_InsertNpc(gobbo_black,"FP_ROAM_OW_MOLERAT_03_04");
		Wld_InsertNpc(gobbo_black,"FP_ROAM_OW_MOLERAT_03_05");
		Wld_InsertNpc(orcwarrior_rest,"SPAWN_OW_MOLERAT_03_04");
	};
};

