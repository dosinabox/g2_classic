
var int evt_orkoberst_onetime;

func void evt_orkoberst()
{
	if(evt_orkoberst_onetime == FALSE)
	{
		orkelite_antipaladinorkoberst_di.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		orcelite_dioberst1_rest.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		orcelite_dioberst2_rest.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		orcelite_dioberst3_rest.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		Wld_InsertNpc(orcwarrior_roam,"SHIP_DECK_05");
		Wld_InsertNpc(orcwarrior_roam,"SHIP_DECK_17");
		Wld_InsertNpc(orcwarrior_roam,"SHIP_IN_22");
		Wld_InsertNpc(orcwarrior_roam,"DI_SHIP_04");
		if(TORLOFISCAPTAIN == TRUE)
		{
			Wld_InsertNpc(orcwarrior_roam,"DI_SHIP_04");
		};
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_DI_ORK_02");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_DI_ORK_03");
		b_startotherroutine(biff_di,"OrkSturmDI");
		b_startotherroutine(jack_di,"OrkSturmDI");
		b_startotherroutine(torlof_di,"OrkSturmDI");
		b_startotherroutine(mario_di,"OrkSturmDI");
		if(Npc_IsDead(mario_di) == FALSE)
		{
			Wld_InsertNpc(skeleton_mario1,"FP_ROAM_DI_MARIOSSKELETONS_01");
			Wld_InsertNpc(skeleton_mario2,"FP_ROAM_DI_MARIOSSKELETONS_02");
			Wld_InsertNpc(skeleton_mario3,"FP_ROAM_DI_MARIOSSKELETONS_03");
			Wld_InsertNpc(skeleton_mario4,"FP_ROAM_DI_MARIOSSKELETONS_04");
		}
		else
		{
			Wld_InsertNpc(undeadorcwarrior,"FP_ROAM_DI_MARIOSSKELETONS_01");
			Wld_InsertNpc(undeadorcwarrior,"FP_ROAM_DI_MARIOSSKELETONS_02");
			Wld_InsertNpc(undeadorcwarrior,"FP_ROAM_DI_MARIOSSKELETONS_03");
			Wld_InsertNpc(undeadorcwarrior,"FP_ROAM_DI_MARIOSSKELETONS_04");
		};
		ORKSTURMDI = TRUE;
		b_logentry(TOPIC_HALLENVONIRDORATH,"Полковник орков крепкий орешек. Где-то в его тронном зале должен быть какой-то секрет.");
		evt_orkoberst_onetime = TRUE;
	};
	PrintScreen("",-1,-1,FONT_SCREEN,0);
};

