
func void b_enter_newworld_kapitel_1()
{
};


var int enternw_kapitel2;

func void b_enter_newworld_kapitel_2()
{
	if(ENTERNW_KAPITEL2 == FALSE)
	{
		Wld_InsertNpc(bloodfly,"FP_ROAM_CITY_TO_FOREST_50");
		Wld_InsertNpc(bloodfly,"FP_ROAM_CITY_TO_FOREST_49");
		Wld_InsertNpc(wolf,"NW_CITY_TO_FOREST_10");
		Wld_InsertNpc(wolf,"NW_CITY_TO_FOREST_05");
		Wld_InsertNpc(sheep,"NW_FARM3_MOUNTAINLAKE_05");
		Wld_InsertNpc(sheep,"NW_FARM3_MOUNTAINLAKE_05");
		Wld_InsertNpc(scavenger,"NW_TROLLAREA_PLANE_05");
		Wld_InsertNpc(scavenger,"NW_TROLLAREA_PLANE_05");
		Wld_InsertNpc(scavenger,"NW_TROLLAREA_PLANE_06");
		Wld_InsertNpc(scavenger,"NW_TROLLAREA_PLANE_04");
		Wld_InsertNpc(scavenger,"NW_TROLLAREA_PLANE_04");
		Wld_InsertNpc(lurker,"NW_TROLLAREA_PATH_72");
		Wld_InsertNpc(lurker,"NW_TROLLAREA_PATH_72");
		Wld_InsertNpc(lurker,"NW_TROLLAREA_PATH_75");
		Wld_InsertNpc(waran,"NW_TROLLAREA_PATH_22_MONSTER");
		Wld_InsertNpc(waran,"NW_TROLLAREA_PATH_22_MONSTER");
		Wld_InsertNpc(molerat,"FP_ROAM_CITY_TO_FOREST_41");
		Wld_InsertNpc(scavenger,"NW_FOREST_CONNECT_MONSTER2");
		Wld_InsertNpc(scavenger,"NW_FOREST_CONNECT_MONSTER2");
		Wld_InsertNpc(wolf,"NW_SHRINE_MONSTER");
		Wld_InsertNpc(wolf,"NW_SHRINE_MONSTER");
		Wld_InsertNpc(giant_bug,"NW_PATH_TO_MONASTER_AREA_01");
		Wld_InsertNpc(giant_bug,"NW_PATH_TO_MONASTER_AREA_01");
		Wld_InsertNpc(scavenger,"NW_PATH_TO_MONASTER_AREA_11");
		Wld_InsertNpc(scavenger,"NW_PATH_TO_MONASTER_MONSTER22");
		Wld_InsertNpc(giant_bug,"NW_FARM1_CITYWALL_RIGHT_02");
		Wld_InsertNpc(wolf,"NW_FARM1_PATH_CITY_10_B");
		Wld_InsertNpc(wolf,"NW_FARM1_PATH_CITY_SHEEP_04");
		Wld_InsertNpc(giant_bug,"NW_FARM1_PATH_SPAWN_07");
		Wld_InsertNpc(bloodfly,"FP_ROAM_CITY_TO_FOREST_34");
		Wld_InsertNpc(bloodfly,"FP_ROAM_CITY_TO_FOREST_36");
		Wld_InsertNpc(scavenger,"NW_TAVERNE_BIGFARM_MONSTER_01");
		Wld_InsertNpc(scavenger,"NW_TAVERNE_BIGFARM_MONSTER_01");
		Wld_InsertNpc(lurker,"NW_BIGFARM_LAKE_MONSTER_02_01");
		Wld_InsertNpc(gobbo_black,"NW_BIGFARM_LAKE_03_MOVEMENT");
		Wld_InsertNpc(gobbo_black,"NW_BIGFARM_LAKE_03_MOVEMENT");
		Wld_InsertNpc(gobbo_black,"NW_TAVERNE_TROLLAREA_MONSTER_05_01");
		Wld_InsertNpc(gobbo_green,"NW_BIGFARM_LAKE_MONSTER_05_01");
		Wld_InsertNpc(gobbo_green,"NW_BIGFARM_LAKE_MONSTER_05_01");
		Wld_InsertNpc(gobbo_green,"NW_BIGFARM_LAKE_MONSTER_05_01");
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			Wld_InsertItem(itam_dex_01,"FP_ROAM_XARDAS_SECRET_26");
		}
		else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			Wld_InsertItem(itam_hp_01,"FP_ROAM_XARDAS_SECRET_26");
		}
		else
		{
			Wld_InsertItem(itam_hp_mana_01,"FP_ROAM_XARDAS_SECRET_26");
		};
		if(hero.guild == GIL_KDF)
		{
			b_startotherroutine(agon,"StillAlive");
		};
		ENTERNW_KAPITEL2 = TRUE;
	};
};


var int enternw_kapitel3;

func void b_enter_newworld_kapitel_3()
{
	if(ENTERNW_KAPITEL3 == FALSE)
	{
		if(Npc_IsDead(salandril) == FALSE)
		{
			salandril.aivar[AIV_TOUGHGUY] = TRUE;
		};
		cornelius.flags = 0;
		if(!Npc_IsDead(hodges))
		{
			b_startotherroutine(hodges,"BENNETWEG");
		};
		if(Npc_IsDead(diegonw))
		{
			Wld_InsertNpc(pc_thief_nw,"NW_CITY_ENTRANCE_01");
			b_startotherroutine(diegonw,"START");
		};
		if(Npc_IsDead(gornnw_vor_djg))
		{
			Wld_InsertNpc(pc_fighter_nw_vor_djg,"BIGFARM");
			b_startotherroutine(gornnw_vor_djg,"START");
		};
		if(!Npc_IsDead(lares))
		{
			b_startotherroutine(lares,"START");
		};
		Wld_InsertNpc(dmt_dementorambientspeaker,"NW_PASS_GATE_02");
		b_killnpc(pal_297_ritter);
		b_killnpc(pal_298_ritter);
		if(hero.guild == GIL_KDF)
		{
			b_killnpc(ulf);
		};
		Wld_InsertNpc(giant_bug,"FP_ROAM_MEDIUMFOREST_KAP2_01");
		Wld_InsertNpc(giant_bug,"FP_ROAM_MEDIUMFOREST_KAP2_02");
		Wld_InsertNpc(giant_bug,"FP_ROAM_MEDIUMFOREST_KAP2_05");
		if(Npc_IsDead(sekob) == FALSE)
		{
			b_startotherroutine(sekob,"FleeDMT");
			b_startotherroutine(rosi,"FleeDMT");
			b_startotherroutine(till,"FleeDMT");
			b_startotherroutine(balthasar,"FleeDMT");
			b_startotherroutine(bau_933_rega,"FleeDMT");
			b_startotherroutine(bau_934_babera,"FleeDMT");
			b_startotherroutine(bau_937_bauer,"FleeDMT");
			b_startotherroutine(bau_938_bauer,"FleeDMT");
			Wld_InsertNpc(dmt_dementorambientsekob1,"NW_FARM4_IN_06");
			Wld_InsertNpc(dmt_dementorambientsekob2,"NW_FARM4_IN_02");
			Wld_InsertNpc(dmt_dementorambientsekob3,"NW_FARM4_IN_03");
			Wld_InsertNpc(dmt_dementorambientsekob4,"NW_FARM4_IN_04");
			sekob.flags = NPC_FLAG_IMMORTAL;
		};
		b_startotherroutine(lester,"WAITFORPLAYER");
		b_startotherroutine(bennet,"PRISON");
		b_startotherroutine(sergio,"WAIT");
		b_startotherroutine(peck,"STORAGE");
		b_removenpc(pal_203_lothar);
		Wld_InsertNpc(wolf,"NW_PATH_TO_MONASTER_AREA_10");
		Wld_InsertNpc(warg,"NW_XARDAS_GOBBO_01");
		Wld_InsertNpc(warg,"NW_XARDAS_GOBBO_01");
		Wld_InsertNpc(zombie02,"NW_FARM4_WOOD_MONSTER_MORE_02");
		Wld_InsertNpc(zombie01,"NW_FARM4_WOOD_MONSTER_MORE_02");
		Wld_InsertNpc(zombie02,"NW_BIGFARM_LAKE_03_MOVEMENT5");
		Wld_InsertNpc(skeleton,"NW_FARM4_WOOD_MONSTER_MORE_01");
		Wld_InsertNpc(skeleton,"NW_FARM4_WOOD_MONSTER_MORE_01");
		Wld_InsertNpc(giant_bug,"NW_FARM4_WOOD_MONSTER_N_1_MONSTER");
		Wld_InsertNpc(giant_bug,"NW_FARM4_WOOD_MONSTER_N_3");
		Wld_InsertNpc(shadowbeast,"NW_FARM4_WOOD_MONSTER_05");
		Wld_InsertNpc(dragonsnapper,"NW_FARM4_WOOD_MONSTER_05");
		Wld_InsertNpc(dragonsnapper,"NW_FARM4_WOOD_MONSTER_05");
		Wld_InsertNpc(dragonsnapper,"NW_CASTLEMINE_TROLL_02");
		Wld_InsertNpc(dragonsnapper,"NW_CASTLEMINE_TROLL_02");
		Wld_InsertNpc(dragonsnapper,"NW_FARM3_PATH_11_SMALLRIVER_10");
		Wld_InsertNpc(dragonsnapper,"NW_FARM3_PATH_11_SMALLRIVER_10");
		Wld_InsertNpc(dragonsnapper,"NW_FARM3_MOUNTAINLAKE_03");
		Wld_InsertNpc(dragonsnapper,"NW_FARM3_BIGWOOD_03_C");
		Wld_InsertNpc(dragonsnapper,"NW_FARM3_BIGWOOD_03_C");
		Wld_InsertNpc(dmt_dementorambientspeaker,"NW_CITY_TO_FARM2_03");
		Wld_InsertNpc(dmt_dementorambient,"FP_ROAM_NW_BIGFARM_FELDREUBER11");
		Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_02");
		Wld_InsertNpc(dmt_dementorambientspeaker,"FP_STAND_DEMENTOR_03");
		Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_04");
		Wld_InsertNpc(dmt_dementorambientspeaker,"FP_STAND_DEMENTOR_05");
		Wld_InsertNpc(dmt_dementorambientspeaker,"FP_STAND_DEMENTOR_06");
		Wld_InsertNpc(dmt_dementorambientspeaker,"FP_ROAM_CITY_TO_FOREST_01");
		Wld_InsertNpc(dmt_dementorambientspeaker,"FP_ROAM_CITY_TO_FOREST_15");
		Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_07");
		Wld_InsertNpc(dmt_dementorambientspeaker,"FP_STAND_DEMENTOR_08");
		Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_09");
		Wld_InsertNpc(dmt_dementorambientspeaker,"FP_STAND_DEMENTOR_10");
		Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_11");
		Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_12");
		Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_13");
		Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_14");
		Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_15");
		Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_16");
		Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_17");
		Wld_InsertNpc(dmt_dementorambientspeaker,"FP_STAND_DEMENTOR_18");
		Wld_InsertNpc(dmt_dementorambientwalker11,"CITY1");
		Wld_InsertNpc(dmt_dementorambientwalker9,"CITY1");
		Wld_InsertNpc(dmt_dementorambientwalker6,"CITY1");
		Wld_InsertNpc(dmt_dementorambientwalker3,"CITY1");
		Wld_InsertNpc(dmt_dementorambientwalker1,"CITY1");
		Wld_InsertNpc(bdt_1025_bandit_h,"NW_FOREST_CAVE1_02");
		Wld_InsertNpc(bdt_1026_bandit_h,"NW_FOREST_CAVE1_03");
		Wld_InsertNpc(bdt_1027_bandit_h,"NW_FOREST_CAVE1_04");
		Wld_InsertNpc(follow_sheep_akil,"NW_FOREST_CAVE1_IN_02");
		if(Npc_IsDead(malak) == FALSE)
		{
			b_startotherroutine(malak,"FleeFromPass");
			MALAK_ISALIVE_KAP3 = TRUE;
			b_startotherroutine(bau_962_bauer,"FleeFromPass");
			b_startotherroutine(bau_964_bauer,"FleeFromPass");
			b_startotherroutine(bau_965_bauer,"FleeFromPass");
			b_startotherroutine(bau_966_bauer,"FleeFromPass");
			b_startotherroutine(bau_967_bauer,"FleeFromPass");
			b_startotherroutine(bau_968_bauer,"FleeFromPass");
			b_startotherroutine(bau_969_bauer,"FleeFromPass");
			if(hero.guild == GIL_KDF)
			{
				CreateInvItems(malak,itwr_dementorobsessionbook_mis,1);
			};
		};
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			b_startotherroutine(hilda,"Krank");
		};
		if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			Wld_InsertItem(itmw_malethsgehstock_mis,"FP_ITEM_FARM1_01");
			Wld_InsertNpc(shadowbeast,"NW_LITTLESTONEHENDGE");
			Wld_InsertNpc(bdt_1024_malethsbandit,"NW_FARM1_BANDITS_CAVE_08");
			Wld_InsertNpc(bdt_1006_bandit_h,"FP_STAND_DEMENTOR_KDF_29");
			Wld_InsertNpc(bdt_1007_bandit_h,"FP_STAND_DEMENTOR_KDF_30");
			Wld_InsertNpc(bdt_1008_bandit_h,"NW_FARM1_BANDITS_CAVE_03");
			Wld_InsertNpc(bdt_1004_bandit_m,"NW_FARM1_BANDITS_CAVE_02");
			Wld_InsertNpc(bdt_1005_bandit_m,"NW_FARM1_BANDITS_CAVE_04");
		};
		if(hero.guild == GIL_KDF)
		{
			Wld_InsertItem(itmi_karrasblessedstone_mis,"FP_ITEM_FARM1_03");
			Wld_InsertItem(itmi_karrasblessedstone_mis,"FP_NW_ITEM_TROLL_10");
			b_startotherroutine(hilda,"KRANK");
			if(Npc_IsDead(vino) == FALSE)
			{
				b_startotherroutine(vino,"OBESESSIONRITUAL");
				CreateInvItems(vino,itwr_dementorobsessionbook_mis,1);
				VINO_ISALIVE_KAP3 = TRUE;
				b_startotherroutine(lobart,"OBESESSIONRITUAL");
				Wld_InsertNpc(dmt_dementorspeakervino1,"FP_STAND_DEMENTOR_KDF_31");
				Wld_InsertNpc(dmt_dementorspeakervino2,"FP_STAND_DEMENTOR_KDF_32");
				Wld_InsertNpc(dmt_dementorspeakervino3,"FP_STAND_DEMENTOR_KDF_33");
				Wld_InsertNpc(dmt_dementorspeakervino4,"NW_LITTLESTONEHENDGE_02");
				b_killnpc(ygiant_bug_vinoritual1);
				b_killnpc(ygiant_bug_vinoritual2);
			};
			if(Npc_IsDead(bromor) == FALSE)
			{
				CreateInvItems(bromor,itwr_dementorobsessionbook_mis,1);
			};
		};
		if((MIS_CANTHARS_KOMPROBRIEF != LOG_SUCCESS) && (MIS_CANTHARS_KOMPROBRIEF != FALSE) && (CANTHAR_PAY == FALSE) && (Npc_IsDead(canthar) == FALSE))
		{
			b_removenpc(vlk_470_sarah);
			b_startotherroutine(canthar,"MARKTSTAND");
			AI_Teleport(canthar,"NW_CITY_SARAH");
			CANTHAR_SPERRE = TRUE;
			CANTHAR_WIEDERRAUS = TRUE;
		};
		CreateInvItems(lester,itmw_1h_bau_axe,1);
		CreateInvItems(ehnim,itmi_moleratlubric_mis,1);
		SHRINEISOBSESSED_NW_TROLLAREA_PATH_37 = TRUE;
		SHRINEISOBSESSED_NW_FARM1_CONNECT_XARDAS = TRUE;
		SHRINEISOBSESSED_NW_TROLLAREA_PATH_66 = TRUE;
		SHRINEISOBSESSED_NW_TROLLAREA_PATH_04 = TRUE;
		SHRINEISOBSESSED_SAGITTA = TRUE;
		SHRINEISOBSESSED_NW_BIGMILL_MALAKSVERSTECK_02 = TRUE;
		SHRINEISOBSESSED_NW_FARM3_BIGWOOD_02 = TRUE;
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			IntroduceChapter(KAPWECHSEL_3,KAPWECHSEL_3_TEXT,"chapter3_MIL.tga","chapter_01.wav",6000);
		}
		else if(hero.guild == GIL_KDF)
		{
			IntroduceChapter(KAPWECHSEL_3,KAPWECHSEL_3_TEXT,"chapter3_KDF.tga","chapter_01.wav",6000);
		}
		else
		{
			IntroduceChapter(KAPWECHSEL_3,KAPWECHSEL_3_TEXT,"chapter3_SLD.tga","chapter_01.wav",6000);
		};
		ENTERNW_KAPITEL3 = TRUE;
	};
};


var int enternw_kapitel4;

func void b_enter_newworld_kapitel_4()
{
	if(ENTERNW_KAPITEL4 == FALSE)
	{
		if(Npc_GetDistToWP(salandril,"ALTAR") < 10000)
		{
			b_startotherroutine(salandril,"Start");
		};
		b_startotherroutine(jorgen,"Kloster");
		b_killnpc(bdt_1050_landstreicher);
		if(!Npc_IsDead(Sekob))
		{
			Sekob.flags = 0;
		};
		Wld_InsertItem(itat_dragonegg_mis,"FP_ITEM_XARDAS_01");
		Wld_InsertNpc(draconian,"FP_ROAM_XARDASCAVE_DJG_01");
		Wld_InsertNpc(draconian,"FP_ROAM_XARDASCAVE_DJG_02");
		Wld_InsertNpc(draconian,"FP_ROAM_XARDASCAVE_DJG_03");
		Wld_InsertNpc(draconian,"FP_ROAM_XARDAS_CAVE_12");
		Wld_InsertNpc(draconian,"FP_ROAM_XARDAS_CAVE_10");
		Wld_InsertNpc(draconian,"FP_ROAM_XARDAS_CAVE_09");
		Wld_InsertNpc(draconian,"FP_ROAM_XARDAS_TOWER_VALLEY_03");
		Wld_InsertNpc(draconian,"FP_ROAM_XARDAS_TOWER_VALLEY_01");
		Wld_InsertNpc(orcelite_antipaladin,"NW_TROLLAREA_PLANE_05");
		Wld_InsertNpc(orcwarrior_roam,"NW_TROLLAREA_PATH_44");
		Wld_InsertNpc(orcwarrior_roam,"NW_TROLLAREA_PLANE_06");
		Wld_InsertNpc(dragonsnapper,"NW_FARM3_BIGWOOD_04");
		Wld_InsertNpc(dragonsnapper,"NW_FARM3_BIGWOOD_04");
		if(hero.guild == GIL_PAL)
		{
			Wld_InsertNpc(orcelite_antipaladin1,"NW_FARM3_PATH_BRIDGE");
			Wld_InsertNpc(orcelite_antipaladin2,"NW_FARM1_PATH_CITY_13");
			Wld_InsertNpc(orcelite_antipaladin3,"NW_CITY_TO_FOREST_11");
			Wld_InsertNpc(orcelite_antipaladin,"NW_FARM3_PATH_12_MONSTER_03");
			Wld_InsertNpc(orcwarrior_roam,"NW_FARM3_PATH_12_MONSTER_03");
			Wld_InsertNpc(orcelite_antipaladin,"NW_FARM3_PATH_10");
			Wld_InsertNpc(orcelite_antipaladin,"NW_BIGFARM_LAKE_06");
			Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_NW_BIGFARM_LAKE_MONSTER_01_04");
			Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_NW_BIGFARM_LAKE_MONSTER_01_02");
			Wld_InsertNpc(orcelite_antipaladin,"NW_TAVERNE_TROLLAREA_08");
			Wld_InsertNpc(orcelite_antipaladin,"FP_ROAM_TAVERNE_TROLLAREA_03_02");
			Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_TAVERNE_TROLLAREA_03_01");
			Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_TAVERNE_TROLLAREA_03_03");
			Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_TAVERNE_TROLLAREA_03_04");
			Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_TAVERNE_TROLLAREA_03_05");
			Wld_InsertNpc(orcelite_antipaladin,"NW_TROLLAREA_PATH_62");
			Wld_InsertNpc(orcwarrior_roam,"NW_TROLLAREA_PATH_62");
			Wld_InsertNpc(orcwarrior_roam,"NW_TROLLAREA_RIVERSIDE_07");
			Wld_InsertNpc(orcelite_antipaladin,"NW_TROLLAREA_RITUAL_01");
			Wld_InsertNpc(orcwarrior_roam,"NW_TROLLAREA_RITUAL_02");
			Wld_InsertNpc(orcwarrior_roam,"NW_TROLLAREA_RITUAL_03");
			Wld_InsertNpc(orcwarrior_roam,"NW_TROLLAREA_RITUAL_04");
			Wld_InsertNpc(orcelite_antipaladin,"NW_FOREST_PATH_32");
			Wld_InsertNpc(orcwarrior_roam,"NW_FARM2_TO_TAVERN_10");
			Wld_InsertNpc(orcwarrior_roam,"NW_FARM3_PATH_12_MONSTER_01");
			Wld_InsertNpc(orcwarrior_roam,"NW_FARM3_PATH_12_MONSTER_02");
			Wld_InsertNpc(orcelite_antipaladin,"FP_ROAM_XARDAS_GOBBO_01");
			Wld_InsertNpc(orcwarrior_rest,"FP_ROAM_XARDAS_GOBBO_02");
			Wld_InsertNpc(orcwarrior_rest,"FP_ROAM_XARDAS_GOBBO_03");
			Wld_InsertNpc(orcwarrior_rest,"FP_ROAM_FARM1_GOBBO_02");
			Wld_InsertNpc(orcwarrior_rest,"FP_ROAM_FARM1_GOBBO_03");
			Wld_InsertNpc(orcwarrior_rest,"FP_ROAM_FARM1_GOBBO_04");
			Wld_InsertNpc(orcwarrior_rest,"FP_ROAM_FARM1_WOLF_01");
			Wld_InsertNpc(orcwarrior_rest,"FP_ROAM_FARM1_WOLF_02");
			Wld_InsertNpc(orcwarrior_rest,"FP_ROAM_FARM1_WOLF_03");
			Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_CITY_TO_FOREST_39");
			Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_CITY_TO_FOREST_42");
			Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_CITY_TO_FOREST_41");
			Wld_InsertNpc(orcelite_antipaladin,"XARDAS");
			Wld_InsertNpc(orcelite_antipaladin,"NW_BIGFARM_FARM4_PATH_04");
			Wld_InsertNpc(orcwarrior_roam,"FP_PICK_NW_FARM4_FIELD_01");
			Wld_InsertNpc(orcwarrior_roam,"FP_PICK_NW_FARM4_FIELD_04");
			Wld_InsertNpc(orcwarrior_roam,"FP_PICK_NW_FARM4_FIELD_05");
			Wld_InsertNpc(orcwarrior_roam,"FP_PICK_NW_FARM4_FIELD_02");
			Wld_InsertNpc(orcwarrior_roam,"FP_PICK_NW_FARM4_FIELD_06");
			Wld_InsertNpc(orcwarrior_roam,"NW_FARM4_BRONKO");
			Wld_InsertNpc(orcelite_antipaladin,"NW_PATH_TO_MONASTERY_06");
			Wld_InsertNpc(orcwarrior_roam,"NW_PATH_TO_MONASTER_AREA_03");
			Wld_InsertNpc(orcwarrior_roam,"NW_PATH_TO_MONASTERY_05");
			Wld_InsertNpc(orcwarrior_roam,"NW_PATH_TO_MONASTER_AREA_09");
			Wld_InsertNpc(orcwarrior_roam,"NW_PATH_TO_MONASTER_AREA_05");
			Wld_InsertNpc(orcelite_antipaladin,"BIGCROSS");
			Wld_InsertNpc(orcelite_antipaladin,"NW_FARM2_TO_TAVERN_05");
			Wld_InsertNpc(orcwarrior_roam,"NW_FARM2_TO_TAVERN_05");
			Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_CITY_TO_FOREST_45");
			Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_CITY_TO_FOREST_44");
			Wld_InsertNpc(orkelite_antipaladinorkoberst,"NW_FARM1_BANDITS_CAVE_08");
			Wld_InsertNpc(orcelite_antipaladin,"FP_STAND_DEMENTOR_KDF_29");
			Wld_InsertNpc(orcelite_antipaladin,"FP_STAND_DEMENTOR_KDF_30");
			Wld_InsertNpc(orcelite_antipaladin,"NW_FARM1_BANDITS_CAVE_03");
			Wld_InsertNpc(orcelite_antipaladin,"NW_FARM1_BANDITS_CAVE_07");
		};
		if((hero.guild == GIL_DJG) || (hero.guild == GIL_PAL))
		{
			Wld_InsertNpc(orcwarrior_lobart1,"NW_FARM1_PATH_CITY_SHEEP_04");
			Wld_InsertNpc(orcwarrior_lobart2,"NW_FARM1_PATH_CITY_SHEEP_04");
			Wld_InsertNpc(orcwarrior_lobart3,"NW_FARM1_PATH_CITY_SHEEP_04");
			Wld_InsertNpc(orcwarrior_lobart4,"NW_FARM1_PATH_CITY_SHEEP_01");
			Wld_InsertNpc(orcwarrior_lobart5,"NW_FARM1_PATH_CITY_SHEEP_01");
			Wld_InsertNpc(orcwarrior_lobart6,"NW_FARM1_PATH_CITY_SHEEP_01");
			b_startotherroutine(vino,"BugsThere");
			b_startotherroutine(lobartsbauer1,"BugsThere");
			b_startotherroutine(lobartsbauer2,"BugsThere");
		};
		if((hero.guild == GIL_KDF) || (hero.guild == GIL_DJG))
		{
			SHRINEISOBSESSED_NW_TROLLAREA_PATH_37 = FALSE;
			SHRINEISOBSESSED_NW_FARM1_CONNECT_XARDAS = FALSE;
			SHRINEISOBSESSED_NW_TROLLAREA_PATH_66 = FALSE;
			SHRINEISOBSESSED_NW_TROLLAREA_PATH_04 = FALSE;
			SHRINEISOBSESSED_SAGITTA = FALSE;
			SHRINEISOBSESSED_NW_BIGMILL_MALAKSVERSTECK_02 = FALSE;
			SHRINEISOBSESSED_NW_FARM3_BIGWOOD_02 = FALSE;
		};
		if(hero.guild == GIL_DJG)
		{
			Wld_InsertItem(itat_dragonegg_mis,"FP_NW_ITEM_RIVERSIDE_EGG");
			Wld_InsertNpc(draconian,"FP_ROAM_TROLLAREA_06");
			Wld_InsertNpc(draconian,"NW_TROLLAREA_RIVERSIDE_05");
			Wld_InsertNpc(draconian,"NW_TROLLAREA_RIVERSIDE_04");
			Wld_InsertNpc(draconian,"FP_ROAM_TROLLAREA_07");
			Wld_InsertItem(itat_dragonegg_mis,"FP_NW_ITEM_MAGECAVE_EGG");
			Wld_InsertNpc(draconian,"FP_ROAM_MAGECAVE_16");
			Wld_InsertNpc(draconian,"FP_ROAM_MAGECAVE_19");
			Wld_InsertNpc(draconian,"FP_ROAM_MAGECAVE_19");
			Wld_InsertNpc(draconian,"FP_ROAM_MAGECAVE_19");
			Wld_InsertNpc(draconian,"FP_ROAM_MAGECAVE_01");
			Wld_InsertNpc(draconian,"FP_ROAM_MAGECAVE_02");
			Wld_InsertNpc(draconian,"FP_ROAM_MAGECAVE_11");
			Wld_InsertNpc(draconian,"FP_ROAM_MAGECAVE_06");
			Wld_InsertNpc(draconian,"FP_ROAM_MAGECAVE_07");
			Wld_InsertNpc(draconian,"FP_ROAM_MAGECAVE_08");
			Wld_InsertNpc(draconian,"NW_TROLLAREA_PATH_01_01");
			Wld_InsertNpc(draconian,"NW_TROLLAREA_PATH_01");
			Wld_InsertNpc(draconian,"NW_TROLLAREA_PATH_01_02");
			Wld_InsertNpc(draconian,"FP_ROAM_MAGECAVE_08");
			Wld_InsertItem(itat_dragonegg_mis,"FP_NW_ITEM_RITUALFOREST_CAVE_EGG");
			Wld_InsertNpc(draconian,"NW_RITUALFOREST_CAVE_06");
			Wld_InsertNpc(draconian,"FP_ROAM_RITUALFOREST_CAVE_01");
			Wld_InsertNpc(draconian,"FP_ROAM_RITUALFOREST_CAVE_02");
			Wld_InsertItem(itat_dragonegg_mis,"FP_ROAM_NW_CITY_SMFOREST_09_04");
			Wld_InsertNpc(draconian,"FP_ROAM_NW_CITY_SMFOREST_09_03");
			Wld_InsertNpc(draconian,"FP_ROAM_NW_CITY_SMFOREST_09_02");
			Wld_InsertNpc(draconian,"FP_ROAM_NW_CITY_SMFOREST_09_01");
			Wld_InsertItem(itat_dragonegg_mis,"FP_ROAM_NW_CITY_SMFOREST_05_03");
			Wld_InsertNpc(draconian,"FP_ROAM_NW_CITY_SMFOREST_05_04");
			Wld_InsertNpc(draconian,"FP_ROAM_NW_CITY_SMFOREST_05_02");
			Wld_InsertNpc(draconian,"FP_ROAM_NW_CITY_SMFOREST_05_01");
			Wld_InsertItem(itat_dragonegg_mis,"FP_ROAM_CITYFOREST_KAP3_07");
			Wld_InsertNpc(draconian,"FP_ROAM_CITYFOREST_KAP3_06");
			Wld_InsertNpc(draconian,"FP_ROAM_CITYFOREST_KAP3_08");
			Wld_InsertNpc(draconian,"FP_ROAM_CITYFOREST_KAP3_05");
			Wld_InsertItem(itat_dragonegg_mis,"FP_ROAM_CITYFOREST_KAP3_07");
			Wld_InsertNpc(draconian,"FP_ROAM_NW_BIGFARMFORESTCAVE_01");
			Wld_InsertNpc(draconian,"FP_ROAM_NW_BIGFARMFORESTCAVE_02");
			Wld_InsertNpc(draconian,"FP_ROAM_NW_BIGFARMFORESTCAVE_03");
			Wld_InsertItem(itat_dragonegg_mis,"FP_NW_ITEM_CASTLEMINE_EGG");
			Wld_InsertNpc(draconian,"FP_ROAM_CASTLEMINE_01");
			Wld_InsertNpc(draconian,"FP_ROAM_CASTLEMINE_02");
			Wld_InsertNpc(draconian,"FP_ROAM_CASTLEMINE_03");
			Wld_InsertItem(itat_dragonegg_mis,"FP_NW_ITEM_CASTLEMINE_EGG2");
			Wld_InsertNpc(draconian,"FP_ROAM_CASTLEMINE_04");
			Wld_InsertNpc(draconian,"FP_ROAM_CASTLEMINE_05");
			Wld_InsertItem(itat_dragonegg_mis,"FP_NW_ITEM_BIGFARMLAKECAVE_EGG");
			Wld_InsertNpc(draconian,"FP_ROAM_BIGFARM_LAKE_CAVE_01");
			Wld_InsertNpc(draconian,"FP_ROAM_BIGFARM_LAKE_CAVE_02");
			Wld_InsertNpc(draconian,"FP_ROAM_BIGFARM_LAKE_CAVE_03");
			Wld_InsertNpc(draconian,"FP_ROAM_BIGFARM_LAKE_CAVE_04");
			Wld_InsertItem(itat_dragonegg_mis,"FP_NW_ITEM_CASTLEMINE2_EGG");
			Wld_InsertNpc(draconian,"FP_ROAM_CASTLEMINE2_16");
			Wld_InsertNpc(draconian,"FP_ROAM_CASTLEMINE2_15");
			Wld_InsertNpc(draconian,"FP_ROAM_CASTLEMINE2_14");
			Wld_InsertNpc(draconian,"FP_ROAM_CASTLEMINE2_13");
			Wld_InsertItem(itat_dragonegg_mis,"FP_ITEM_FARM1_02");
			Wld_InsertNpc(draconian,"NW_FARM1_BANDITS_CAVE_08");
			Wld_InsertNpc(draconian,"FP_STAND_DEMENTOR_KDF_29");
			Wld_InsertNpc(draconian,"FP_STAND_DEMENTOR_KDF_30");
			Wld_InsertNpc(draconian,"NW_FARM1_BANDITS_CAVE_03");
			Wld_InsertNpc(draconian,"NW_FARM1_BANDITS_CAVE_02");
			Wld_InsertNpc(draconian,"NW_FARM1_BANDITS_CAVE_04");
			Wld_InsertNpc(draconian,"NW_FARM1_BANDITS_CAVE_07");
			Wld_InsertNpc(draconian,"FP_ROAM_CASTLEMINE2_03");
			Wld_InsertNpc(draconian,"FP_ROAM_CASTLEMINE2_04");
			Wld_InsertNpc(draconian,"FP_ROAM_CASTLEMINE2_05");
			Wld_InsertNpc(draconian,"FP_ROAM_XARDAS_VALLEY_01");
			Wld_InsertNpc(draconian,"FP_ROAM_XARDAS_VALLEY_03");
			Wld_InsertNpc(draconian,"FP_ROAM_XARDAS_VALLEY_04");
			Wld_InsertNpc(draconian,"FP_ROAM_XARDAS_MONSTER_02_01");
			Wld_InsertNpc(draconian,"FP_ROAM_XARDAS_MONSTER_02_02");
			Wld_InsertNpc(draconian,"FP_ROAM_XARDAS_MONSTER_02_03");
			Wld_InsertNpc(draconian,"FP_ROAM_XARDAS_MONSTER_02_04");
			Wld_InsertNpc(draconian,"NW_XARDAS_GOBBO_01");
			Wld_InsertNpc(draconian,"NW_XARDAS_GOBBO_01");
			Wld_InsertNpc(draconian,"NW_XARDAS_GOBBO_02");
			Wld_InsertNpc(draconian,"FP_ROAM_XARDAS_TOWER_4_01");
			Wld_InsertNpc(draconian,"FP_ROAM_XARDAS_TOWER_4_02");
			Wld_InsertNpc(draconian,"FP_ROAM_XARDAS_TOWER_4_03");
			Wld_InsertNpc(draconian,"FP_ROAM_XARDAS_TOWER_4_04");
			Wld_InsertNpc(draconian,"FP_ROAM_XARDAS_CAVE_01");
			Wld_InsertNpc(draconian,"FP_ROAM_XARDAS_CAVE_02");
			Wld_InsertNpc(draconian,"FP_ROAM_XARDAS_CAVE_03");
			Wld_InsertNpc(draconian,"FP_ROAM_XARDAS_CAVE_04");
			Wld_InsertNpc(draconian,"FP_ROAM_TROLLAREA_11");
			Wld_InsertNpc(draconian,"FP_ROAM_TROLLAREA_09");
			Wld_InsertNpc(draconian,"FP_ROAM_TROLLAREA_10");
			Wld_InsertNpc(draconian,"FP_ROAM_TROLLAREA_08");
		};
		if(hero.guild == GIL_KDF)
		{
			Wld_InsertNpc(dmt_dementorambientspeaker,"NW_TROLLAREA_PATH_80");
			Wld_InsertNpc(dmt_dementorambientspeaker,"FP_ROAM_TROLLAREA_19");
			Wld_InsertNpc(dmt_dementorambientspeaker,"FP_ROAM_CITY_TO_FOREST_44");
			Wld_InsertNpc(dmt_dementorambientspeaker,"FP_ROAM_MEDIUMFOREST_KAP2_13");
			Wld_InsertNpc(dmt_dementorambientspeaker,"FP_ROAM_XARDAS_TOWER_3_02");
			Wld_InsertNpc(dmt_dementorambientspeaker,"FP_ROAM_XARDAS_TOWER_3_02");
			Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_KDF_04");
			Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_KDF_05");
			Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_KDF_06");
			Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_KDF_07");
			Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_KDF_08");
			Wld_InsertNpc(dmt_dementorambientspeaker,"FP_STAND_DEMENTOR_KDF_09");
			Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_KDF_10");
			Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_KDF_11");
			Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_KDF_13");
			Wld_InsertNpc(dmt_dementorambientspeaker,"FP_STAND_DEMENTOR_KDF_14");
			Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_KDF_22");
			Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_KDF_23");
			Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_KDF_24");
			Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_KDF_25");
			Wld_InsertNpc(dmt_dementorambientwalker10,"CITY1");
			Wld_InsertNpc(dmt_dementorambientwalker8,"CITY1");
			Wld_InsertNpc(dmt_dementorambientwalker7,"CITY1");
			CreateInvItems(randolph,itwr_dementorobsessionbook_mis,1);
			b_startotherroutine(randolph,"Obsessed");
		};
		ENTERNW_KAPITEL4 = TRUE;
	};
	if(TALBIN_FOLLOWSTHROUGHPASS == LOG_RUNNING)
	{
		Wld_InsertNpc(vlk_4132_talbin_nw,"LEVELCHANGE");
		TALBIN_FOLLOWSTHROUGHPASS = LOG_SUCCESS;
	};
};


var int enternw_kapitel5;
var int pal_schiffswache_exchange_onetime;
var int rosi_fleefromsekob_kap5;

func void b_enter_newworld_kapitel_5()
{
	if(ENTERNW_KAPITEL5 == FALSE)
	{
		b_removenpc(none_100_xardas);
		b_startotherroutine(lester,"XardasWeg");
		if(Npc_GetDistToWP(salandril,"ALTAR") < 10000)
		{
			b_startotherroutine(salandril,"Start");
		};
		if(Npc_IsDead(sekob) == FALSE)
		{
			b_startotherroutine(rosi,"FleeFromSekob");
			b_startotherroutine(till,"FleeFromSekob");
			ROSI_FLEEFROMSEKOB_KAP5 = TRUE;
		};
		if(GORNDJG_IS_ALIVE == TRUE)
		{
			Wld_InsertNpc(pc_fighter_nw_nach_djg,"BIGFARM");
		};
		if(DJG_ANGAR_IS_ALIVE == TRUE)
		{
			Wld_InsertNpc(djg_705_angar_nw,"BIGFARM");
		};
		Wld_InsertNpc(xardas_dt_demon1,"FP_ROAM_NW_XARDASTOWER_DEMON_02");
		Wld_InsertNpc(xardas_dt_demon2,"NW_XARDAS_TOWER_IN1_24");
		Wld_InsertNpc(xardas_dt_demon3,"FP_ROAM_NW_XARDASTOWER_DEMON_03");
		Wld_InsertNpc(xardas_dt_demon4,"FP_ROAM_NW_XARDASTOWER_DEMON_04");
		Wld_InsertNpc(xardas_dt_demon5,"FP_ROAM_NW_XARDASTOWER_DEMON_05");
		Wld_InsertNpc(xardas_dt_demonlord,"FP_ROAM_NW_XARDASTOWER_DEMONLORD_01");
		Wld_InsertNpc(bloodfly,"NW_FARM3_PATH_11_SMALLRIVER_15");
		Wld_InsertNpc(bloodfly,"NW_FARM3_PATH_11_SMALLRIVER_15");
		Wld_InsertNpc(waran,"NW_FARM3_PATH_11_SMALLRIVER_11");
		Wld_InsertNpc(waran,"NW_FARM3_PATH_11_SMALLRIVER_11");
		Wld_InsertNpc(lurker,"NW_FARM3_MOUNTAINLAKE_05");
		Wld_InsertNpc(lurker,"NW_FARM3_MOUNTAINLAKE_05");
		Wld_InsertNpc(none_101_mario,"NW_CITY_ENTRANCE_01");
		Wld_InsertItem(itwr_hallsofirdorath_mis,"FP_NW_ITEM_LIBRARY_IRDORATHBOOK");
		Wld_InsertItem(itwr_seamap_irdorath,"FP_NW_ITEM_LIBRARY_SEAMAP");
		Wld_InsertItem(itwr_xardasseamapbook_mis,"FP_NW_ITEM_LIBRARY_SEAMAP");
		Wld_InsertItem(itpo_potionofdeath_01_mis,"FP_NW_ITEM_LIBRARY_SEAMAP2");
		if(hero.guild == GIL_PAL)
		{
			Wld_InsertItem(itar_pal_h,"FP_ITEM_PALFINALARMOR");
			Wld_InsertItem(itmi_runeblank,"FP_NW_ITEM_LIBRARY_SEAMAP");
		};
		if(hero.guild == GIL_DJG)
		{
		};
		if(hero.guild == GIL_KDF)
		{
			Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_KDF_01");
			Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_KDF_02");
			Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_KDF_03");
			Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_KDF_15");
			Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_KDF_16");
			Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_KDF_17");
			Wld_InsertNpc(dmt_dementorambientspeaker,"FP_STAND_DEMENTOR_KDF_18");
			Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_KDF_19");
			Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_KDF_20");
			Wld_InsertNpc(dmt_dementorambientspeaker,"FP_STAND_DEMENTOR_KDF_21");
			Wld_InsertItem(itwr_dementorobsessionbook_mis,"FP_ITEM_FARM1_01");
			Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_KDF_29");
			Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_KDF_30");
			Wld_InsertNpc(dmt_dementorambient,"NW_FARM1_BANDITS_CAVE_08");
			Wld_InsertNpc(dmt_dementorambient,"NW_FARM1_BANDITS_CAVE_03");
			Wld_InsertNpc(dmt_dementorambient,"NW_FARM1_BANDITS_CAVE_02");
			Wld_InsertNpc(dmt_dementorambient,"NW_FARM1_BANDITS_CAVE_04");
			Wld_InsertNpc(dmt_dementorambient,"NW_FARM1_BANDITS_CAVE_07");
			Wld_InsertNpc(dmt_dementorambientspeaker,"FP_STAND_DEMENTOR_KDF_34");
			Wld_InsertNpc(dmt_dementorambientspeaker,"FP_STAND_DEMENTOR_KDF_35");
			Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_KDF_26");
			Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_KDF_27");
			Wld_InsertNpc(dmt_dementorambient,"FP_STAND_DEMENTOR_KDF_28");
			Wld_InsertNpc(dmt_dementorambientwalker5,"CITY1");
			Wld_InsertNpc(dmt_dementorambientwalker4,"CITY1");
			Wld_InsertNpc(dmt_dementorambientwalker2,"CITY1");
			if(Npc_IsDead(sekob) == FALSE)
			{
				CreateInvItems(sekob,itwr_dementorobsessionbook_mis,1);
				b_startotherroutine(sekob,"Obsessed");
			};
		};
		Wld_InsertNpc(pal_285_ritter,"CITY1");
		Wld_InsertNpc(pal_286_ritter,"CITY1");
		Wld_InsertNpc(pal_287_ritter,"CITY1");
		Wld_InsertNpc(pal_288_ritter,"CITY1");
		Wld_InsertNpc(pal_289_ritter,"CITY1");
		Wld_InsertNpc(pal_290_ritter,"CITY1");
		Wld_InsertNpc(pal_291_ritter,"CITY1");
		Wld_InsertNpc(pal_292_ritter,"CITY1");
		Wld_InsertNpc(pal_293_ritter,"CITY1");
		schiffswache_212.flags = 0;
		schiffswache_213.flags = 0;
		pal_220_schiffswache.flags = 0;
		pal_221_schiffswache.flags = 0;
		pal_222_schiffswache.flags = 0;
		pal_223_schiffswache.flags = 0;
		pal_224_schiffswache.flags = 0;
		pal_225_schiffswache.flags = 0;
		pal_226_schiffswache.flags = 0;
		pal_227_schiffswache.flags = 0;
		pal_228_schiffswache.flags = 0;
		b_startotherroutine(pal_220_schiffswache,"ShipFree");
		b_startotherroutine(pal_221_schiffswache,"ShipFree");
		b_startotherroutine(pal_222_schiffswache,"ShipFree");
		b_startotherroutine(pal_223_schiffswache,"ShipFree");
		b_startotherroutine(pal_224_schiffswache,"ShipFree");
		b_startotherroutine(pal_225_schiffswache,"ShipFree");
		b_startotherroutine(pal_226_schiffswache,"ShipFree");
		b_startotherroutine(pal_227_schiffswache,"ShipFree");
		b_startotherroutine(pal_228_schiffswache,"ShipFree");
		b_startotherroutine(pal_230_ritter,"ShipFree");
		b_startotherroutine(pal_231_ritter,"ShipFree");
		b_startotherroutine(pal_240_ritter,"ShipFree");
		b_startotherroutine(pal_241_ritter,"ShipFree");
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			IntroduceChapter(KAPWECHSEL_5,KAPWECHSEL_5_TEXT,"chapter5_PAL.tga","chapter_01.wav",6000);
		}
		else if(hero.guild == GIL_KDF)
		{
			IntroduceChapter(KAPWECHSEL_5,KAPWECHSEL_5_TEXT,"chapter5_KDF.tga","chapter_01.wav",6000);
		}
		else
		{
			IntroduceChapter(KAPWECHSEL_5,KAPWECHSEL_5_TEXT,"chapter5_DJG.tga","chapter_01.wav",6000);
		};
		ENTERNW_KAPITEL5 = TRUE;
	};
	if((MIS_OCGATEOPEN == TRUE) && (PAL_SCHIFFSWACHE_EXCHANGE_ONETIME == FALSE))
	{
		b_startotherroutine(pal_212_schiffswache,"ShipFree");
		b_startotherroutine(pal_213_schiffswache,"ShipFree");
		PAL_SCHIFFSWACHE_EXCHANGE_ONETIME = TRUE;
		MIS_SHIPISFREE = TRUE;
	};
	if(BIFF_FOLLOWSTHROUGHPASS == LOG_RUNNING)
	{
		Wld_InsertNpc(djg_713_biff_nw,"LEVELCHANGE");
		BIFF_FOLLOWSTHROUGHPASS = LOG_SUCCESS;
	};
};


var int enternw_kapitel6;

func void b_enter_newworld_kapitel_6()
{
	if(ENTERNW_KAPITEL6 == FALSE)
	{
		ENTERNW_KAPITEL6 = TRUE;
	};
};

func void b_enter_newworld()
{
	b_initnpcglobals();
	if(KAPITEL >= 1)
	{
		b_enter_newworld_kapitel_1();
	};
	if(KAPITEL >= 2)
	{
		b_enter_newworld_kapitel_2();
	};
	if(KAPITEL >= 3)
	{
		b_enter_newworld_kapitel_3();
	};
	if(KAPITEL >= 4)
	{
		b_enter_newworld_kapitel_4();
	};
	if(KAPITEL >= 5)
	{
		b_enter_newworld_kapitel_5();
	};
	if(KAPITEL >= 6)
	{
		b_enter_newworld_kapitel_6();
	};
	CURRENTLEVEL = NEWWORLD_ZEN;
	b_initnpcglobals();
};

