
var int enterow_kapitel1;

func void b_enter_oldworld_kapitel_1()
{
	if(ENTEROW_KAPITEL1 == FALSE)
	{
		ENTEROW_KAPITEL1 = TRUE;
	};
};


var int enterow_kapitel2;

func void b_enter_oldworld_kapitel_2()
{
	if(ENTEROW_KAPITEL2 == FALSE)
	{
		ENTEROW_KAPITEL2 = TRUE;
	};
};


var int enterow_kapitel3;

func void b_enter_oldworld_kapitel_3()
{
	if(ENTEROW_KAPITEL3 == FALSE)
	{
		b_removenpc(pc_mage_ow);
		b_removenpc(pc_fighter_ow);
		b_removenpc(pc_thiefow);
		Wld_InsertNpc(snapper,"SPAWN_OW_MOLERATS_WOOD_OM");
		Wld_InsertNpc(snapper,"SPAWN_OW_MOLERATS_WOOD_OM");
		Wld_InsertNpc(snapper,"SPAWN_OW_MOLERATS_WOOD_OM");
		Wld_InsertNpc(draconian,"SPAWN_OW_MOLERAT_A_6_NC4");
		Wld_InsertNpc(draconian,"SPAWN_OW_MOLERAT_A_6_NC4");
		Wld_InsertNpc(draconian,"SPAWN_OW_MOLERAT_A_6_NC4");
		Wld_InsertNpc(draconian,"SPAWN_OW_MOLERAT_A_6_NC4");
		Wld_InsertNpc(draconian,"MOVEMENT_OW_BLOODFLYS_152");
		Wld_InsertNpc(draconian,"MOVEMENT_OW_BLOODFLYS_152");
		Wld_InsertNpc(draconian,"MOVEMENT_OW_BLOODFLYS_152");
		Wld_InsertNpc(draconian,"MOVEMENT_OW_BLOODFLYS_152");
		Wld_InsertNpc(draconian,"FP_ROAM_OW_BLOODFLY_A_1");
		Wld_InsertNpc(snapper,"OW_PATH_SCAVENGER13_SPAWN01");
		Wld_InsertNpc(snapper,"OW_PATH_SCAVENGER13_SPAWN01");
		Wld_InsertNpc(snapper,"OW_PATH_SCAVENGER13_SPAWN01");
		Wld_InsertNpc(snapper,"OW_PATH_SCAVENGER13_SPAWN01");
		Wld_InsertNpc(snapper,"OW_GOBBO_PLACE_SPAWN");
		Wld_InsertNpc(snapper,"OW_GOBBO_PLACE_SPAWN");
		Wld_InsertNpc(snapper,"OW_GOBBO_PLACE_SPAWN");
		Wld_InsertNpc(bdt_1006_bandit_h,"OW_WOODRUIN_WOLF_SPAWN");
		Wld_InsertNpc(bdt_1007_bandit_h,"OW_WOODRUIN_WOLF_SPAWN");
		Wld_InsertNpc(bdt_1008_bandit_h,"OW_PATH_02_SPAWN_HOGEWOLF");
		Wld_InsertNpc(bdt_1003_bandit_m,"OW_PATH_02_SPAWN_HOGEWOLF");
		Wld_InsertNpc(bdt_1008_bandit_h,"OW_PATH_02_SPAWN_HOGEWOLF");
		Wld_InsertNpc(bdt_1006_bandit_h,"PATH_OC_NC_14");
		Wld_InsertNpc(bdt_1001_bandit_l,"PATH_OC_NC_22");
		Wld_InsertNpc(bdt_1002_bandit_l,"PATH_OC_NC_21");
		Wld_InsertNpc(bdt_1003_bandit_m,"PATH_OC_NC_15");
		Wld_InsertNpc(bdt_1004_bandit_m,"OW_WARAN_G_SPAWN");
		Wld_InsertNpc(bdt_1005_bandit_m,"OW_WARAN_G_SPAWN");
		Wld_InsertNpc(bdt_1006_bandit_h,"OW_WOODRUIN_FOR_WOLF_SPAWN");
		Wld_InsertNpc(bdt_1005_bandit_m,"OW_WOODRUIN_FOR_WOLF_SPAWN");
		Wld_InsertNpc(bdt_1000_bandit_l,"OW_WOODRUIN_FOR_WOLF_SPAWN");
		Wld_InsertNpc(bdt_1003_bandit_m,"PATH_OC_NC_12");
		Wld_InsertNpc(snapper,"SPAWN_OW_SCAVENGER_01_DEMONT5");
		Wld_InsertNpc(snapper,"SPAWN_OW_SCAVENGER_01_DEMONT5");
		Wld_InsertNpc(dmt_dementorambient,"DT_E3_06");
		Wld_InsertNpc(dmt_dementorambient,"DT_E3_05");
		Wld_InsertNpc(dmt_dementorambient,"DT_E3_07");
		Wld_InsertNpc(dmt_dementorambient,"DT_E1_05");
		Wld_InsertNpc(dmt_dementorambient,"DT");
		Wld_InsertNpc(dmt_dementorambient,"OW_PATH_133");
		Wld_InsertNpc(dmt_dementorambient,"OW_PATH_128");
		Wld_InsertItem(itru_fear,"FP_ITEM_XARDASALTERTURM_01");
		if(hero.guild == GIL_KDF)
		{
			Wld_InsertItem(itmi_runeblank,"FP_ITEM_XARDASALTERTURM_02");
		}
		else
		{
			Wld_InsertItem(itmi_nugget,"FP_ITEM_XARDASALTERTURM_02");
		};
		ENTEROW_KAPITEL3 = TRUE;
	};
};


var int enterow_kapitel4;

func void b_enter_oldworld_kapitel_4()
{
	if(ENTEROW_KAPITEL4 == FALSE)
	{
		if(Npc_IsDead(engrom) == FALSE)
		{
			b_startotherroutine(engrom,"Obsessed");
			CreateInvItems(engrom,itat_talbinslurkerskin,1);
			if(hero.guild == GIL_KDF)
			{
				CreateInvItems(engrom,itwr_dementorobsessionbook_mis,1);
			}
			else
			{
				b_killnpc(engrom);
			};
			ENGROMISGONE = TRUE;
		};
		b_removenpc(strf_1115_geppert);
		b_removenpc(strf_1116_kervo);
		b_removenpc(vlk_4106_dobar);
		b_removenpc(vlk_4107_parlaf);
		if(Npc_IsDead(sengrath) == FALSE)
		{
			b_startotherroutine(sengrath,"ORCBARRIER");
			if(Npc_HasItems(sengrath,itrw_mil_crossbow))
			{
				Npc_RemoveInvItem(sengrath,itrw_mil_crossbow);
			};
			CreateInvItems(sengrath,itrw_sengrathsarmbrust_mis,1);
			SENGRATH_MISSING = TRUE;
			b_killnpc(sengrath);
		};
		Wld_InsertNpc(djg_730_toterdrachenjaeger,"OC1");
		b_killnpc(djg_730_toterdrachenjaeger);
		Wld_InsertNpc(djg_731_toterdrachenjaeger,"OC1");
		b_killnpc(djg_731_toterdrachenjaeger);
		Wld_InsertNpc(djg_732_toterdrachenjaeger,"OC1");
		b_killnpc(djg_732_toterdrachenjaeger);
		Wld_InsertNpc(djg_733_toterdrachenjaeger,"OC1");
		b_killnpc(djg_733_toterdrachenjaeger);
		Wld_InsertNpc(djg_734_toterdrachenjaeger,"OC1");
		b_killnpc(djg_734_toterdrachenjaeger);
		Wld_InsertNpc(djg_735_toterdrachenjaeger,"OC1");
		b_killnpc(djg_735_toterdrachenjaeger);
		Wld_InsertNpc(djg_736_toterdrachenjaeger,"OC1");
		b_killnpc(djg_736_toterdrachenjaeger);
		Wld_InsertNpc(djg_737_toterdrachenjaeger,"OC1");
		b_killnpc(djg_737_toterdrachenjaeger);
		Wld_InsertNpc(djg_738_toterdrachenjaeger,"OC1");
		b_killnpc(djg_738_toterdrachenjaeger);
		Wld_InsertNpc(djg_739_toterdrachenjaeger,"OC1");
		b_killnpc(djg_739_toterdrachenjaeger);
		Wld_InsertNpc(djg_740_toterdrachenjaeger,"OC1");
		b_killnpc(djg_740_toterdrachenjaeger);
		Npc_ExchangeRoutine(brutus,"Meatbugs");
		Wld_InsertNpc(meatbug_brutus1,"OC_FOLTER_SHARP");
		Wld_InsertNpc(meatbug_brutus2,"OC_FOLTER_SHARP");
		Wld_InsertNpc(meatbug_brutus3,"OC_FOLTER_SHARP");
		Wld_InsertNpc(meatbug_brutus4,"OC_FOLTER_SHARP");
		Wld_InsertNpc(djg_700_sylvio,"OC1");
		if(SLD_BULLCO_IS_ALIVE == TRUE)
		{
			Wld_InsertNpc(djg_701_bullco,"OC1");
		};
		if(SLD_ROD_IS_ALIVE == TRUE)
		{
			Wld_InsertNpc(djg_702_rod,"OC1");
		};
		if(SLD_CIPHER_IS_ALIVE == TRUE)
		{
			Wld_InsertNpc(djg_703_cipher,"OC1");
		};
		if(SLD_GORN_IS_ALIVE == TRUE)
		{
			Wld_InsertNpc(pc_fighter_djg,"OC1");
		};
		Wld_InsertNpc(djg_705_angar,"OC1");
		Wld_InsertNpc(djg_708_kurgan,"OC1");
		Wld_InsertNpc(djg_709_rethon,"OC1");
		Wld_InsertNpc(djg_710_kjorn,"OC1");
		Wld_InsertNpc(djg_711_godar,"OC1");
		Wld_InsertNpc(djg_712_hokurn,"OC1");
		Wld_InsertNpc(djg_713_biff,"OC1");
		Wld_InsertNpc(djg_714_jan,"OC1");
		Wld_InsertNpc(djg_715_ferros,"OC1");
		Wld_InsertNpc(none_110_urshak,"WP_INTRO_FALL");
		Wld_InsertNpc(warg,"OC3");
		Wld_InsertNpc(orcwarrior_roam,"OW_SCAVENGER_SPAWN_TREE");
		Wld_InsertNpc(orcelite_roam,"OW_SCAVENGER_SPAWN_TREE");
		Wld_InsertNpc(orcwarrior_roam,"OC4");
		Wld_InsertNpc(orcwarrior_roam,"SPAWN_OW_SCAVENGER_AL_ORC");
		Wld_InsertNpc(orcwarrior_roam,"OC5");
		Wld_InsertNpc(orcwarrior_roam,"OC6");
		Wld_InsertNpc(orcwarrior_roam,"SPAWN_PATH_GUARD1");
		Wld_InsertNpc(orcwarrior_roam,"SPAWN_OW_BLACKWOLF_02_01");
		Wld_InsertNpc(warg,"SPAWN_OW_BLACKWOLF_02_01");
		Wld_InsertNpc(warg,"SPAWN_OW_BLACKWOLF_02_01");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_ORC_09");
		Wld_InsertNpc(orcshaman_sit,"FP_ROAM_ORC_08");
		Wld_InsertNpc(orcwarrior_roam,"OW_PATH_103");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_OW_WARAN_ORC_01");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_OW_WARAN_ORC_04");
		Wld_InsertNpc(orcelite_roam,"OW_NEWMINE_02");
		Wld_InsertNpc(orcshaman_sit,"OW_NEWMINE_10");
		Wld_InsertNpc(orcelite_roam,"OW_NEWMINE_11");
		Wld_InsertNpc(orcshaman_sit,"OW_NEWMINE_11");
		Wld_InsertNpc(orcwarrior_roam,"OW_NEWMINE_06");
		Wld_InsertNpc(orcwarrior_roam,"OW_NEWMINE_03");
		Wld_InsertNpc(dragonsnapper,"SPAWN_OW_SCAVENGER_ORC_03");
		Wld_InsertNpc(dragonsnapper,"SPAWN_OW_SCAVENGER_ORC_03");
		Wld_InsertNpc(dragonsnapper,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");
		Wld_InsertNpc(dragonsnapper,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");
		Wld_InsertNpc(dragonsnapper,"OW_PATH_333");
		Wld_InsertNpc(warg,"OW_PATH_099");
		Wld_InsertNpc(warg,"SPAWN_OW_WARAN_ORC_01");
		Wld_InsertNpc(orcwarrior_roam,"OC11");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_ORK_OC_27");
		Wld_InsertNpc(orcelite_roam,"FP_ROAM_ORK_OC_11");
		Wld_InsertNpc(warg,"FP_ROAM_ORK_OC_12");
		Wld_InsertNpc(orcelite_roam,"FP_ROAM_ORK_OC_07");
		Wld_InsertNpc(orcwarrior_roam,"OC9");
		Wld_InsertNpc(warg,"FP_ROAM_ORK_OC_28");
		Wld_InsertNpc(orcelite_roam,"FP_ROAM_ORK_OC_16");
		Wld_InsertNpc(orcelite_roam,"FP_ROAM_ORK_OC_13");
		Wld_InsertNpc(orcelite_roam,"FP_ROAM_ORK_OC_10");
		Wld_InsertNpc(orcelite_roam,"FP_ROAM_ORK_OC_09");
		Wld_InsertNpc(orcwarrior_roam,"FP_CAMPFIRE_ORK_OC_17");
		Wld_InsertNpc(orcelite_roam,"FP_ROAM_OW_SCAVENGER_06_03");
		Wld_InsertNpc(orcshaman_sit,"FP_ROAM_OW_SCAVENGER_06_05");
		Wld_InsertNpc(warg,"FP_ROAM_OW_SCAVENGER_06_06");
		Wld_InsertNpc(orcelite_roam,"FP_ROAM_OW_SCAVENGER_06_04");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_OW_SCAVENGER_06_07");
		Wld_InsertNpc(orcelite_roam,"FP_ROAM_ORK_OC_21");
		Wld_InsertNpc(warg,"FP_ROAM_ORK_OC_22");
		Wld_InsertNpc(warg,"FP_ROAM_ORK_OC_11");
		Wld_InsertNpc(orcelite_roam,"FP_ROAM_ORK_OC_15");
		Wld_InsertNpc(warg,"FP_ROAM_ORK_OC_14");
		Wld_InsertNpc(orcelite_roam,"FP_ROAM_WARG_OC_02");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_WARG_OC_02");
		Wld_InsertNpc(orcelite_roam,"OC_PATH_04");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_WARG_OC_04");
		Wld_InsertNpc(orcelite_roam,"FP_ROAM_ORK_OC_04");
		Wld_InsertNpc(warg,"FP_ROAM_ORK_OC_03");
		Wld_InsertNpc(orcshaman_sit,"FP_ROAM_ORK_OC_03");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_ORK_OC_30");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_ORK_OC_31");
		Wld_InsertNpc(orcelite_roam,"FP_ROAM_WARG_OC_09");
		Wld_InsertNpc(warg,"FP_ROAM_WARG_OC_05");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_WARG_OC_07");
		Wld_InsertNpc(warg,"FP_ROAM_WARG_OC_06");
		Wld_InsertNpc(orcelite_roam,"FP_ROAM_WARG_OC_08");
		Wld_InsertNpc(warg,"OC_PATH_02");
		Wld_InsertNpc(orcelite_roam,"OC_PATH_02");
		Wld_InsertNpc(warg,"FP_ROAM_ORK_OC_02");
		Wld_InsertNpc(warg,"FP_ROAM_ORK_OC_16");
		Wld_InsertNpc(warg,"FP_ROAM_ORK_OC_01");
		Wld_InsertNpc(orcelite_roam,"FP_ROAM_ORK_OC_23");
		Wld_InsertNpc(warg,"FP_ROAM_ORK_OC_24");
		Wld_InsertNpc(orcelite_roam,"FP_ROAM_WARG_OC_11");
		Wld_InsertNpc(warg,"FP_ROAM_ORK_OC_12");
		Wld_InsertNpc(orcelite_roam,"FP_ROAM_ORK_OC_06");
		Wld_InsertNpc(warg,"FP_ROAM_ORK_OC_05");
		Wld_InsertNpc(orcelite_roam,"FP_ROAM_ORK_OC_07");
		Wld_InsertNpc(orcshaman_sit,"FP_ROAM_ORK_OC_08");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_ORK_OC_05");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_ORK_OC_25");
		Wld_InsertNpc(warg,"FP_ROAM_ORK_OC_06");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_ORK_OC_05");
		Wld_InsertNpc(warg,"FP_CAMPFIRE_ORK_OC_09");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_ORK_OC_26");
		Wld_InsertNpc(orcelite_roam,"FP_ROAM_ORK_OC_10");
		Wld_InsertNpc(warg,"FP_ROAM_WARG_OC_14");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_WARG_OC_15");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_WARG_OC_11");
		Wld_InsertNpc(warg,"FP_ROAM_WARG_OC_12");
		Wld_InsertNpc(orcwarrior_roam,"OC_ROUND_28");
		Wld_InsertNpc(warg,"FP_ROAM_ORK_OC_13");
		Wld_InsertNpc(warg,"FP_ROAM_ORK_OC_14");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_ORK_OC_12");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_HOSHPAK_02");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_HOSHPAK_04");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_HOSHPAK_05");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_HOSHPAK_06");
		Wld_InsertNpc(warg,"SPAWN_O_SCAVENGER_OCWOODL2");
		Wld_InsertNpc(orcwarrior_roam,"SPAWN_O_SCAVENGER_OCWOODL2");
		Wld_InsertNpc(orcwarrior_roam,"SPAWN_O_SCAVENGER_OCWOODL2");
		Wld_InsertNpc(lurker,"OW_PATH_OW_PATH_WARAN05_SPAWN01");
		Wld_InsertNpc(lurker,"OW_PATH_OW_PATH_WARAN05_SPAWN01");
		Wld_InsertNpc(lurker,"OW_PATH_OW_PATH_WARAN05_SPAWN01");
		Wld_InsertNpc(shadowbeast,"FP_ROAM_OW_SCAVENGER_LONE_WALD_OC3");
		Wld_InsertNpc(warg,"SPAWN_OW_WOLF2_WALD_OC3");
		Wld_InsertNpc(warg,"SPAWN_OW_WOLF2_WALD_OC3");
		Wld_InsertNpc(orcwarrior_roam,"SPAWN_WALD_OC_BLOODFLY01");
		Wld_InsertNpc(orcwarrior_roam,"SPAWN_WALD_OC_BLOODFLY01");
		Wld_InsertNpc(orcwarrior_roam,"SPAWN_WALD_OC_BLOODFLY01");
		Wld_InsertNpc(shadowbeast,"SPAWN_OW_MOLERAT2_WALD_OC1");
		Wld_InsertNpc(orcwarrior_roam,"PATH_WALD_OC_WOLFSPAWN2");
		Wld_InsertNpc(orcwarrior_roam,"PATH_WALD_OC_WOLFSPAWN2");
		Wld_InsertNpc(warg,"PATH_WALD_OC_WOLFSPAWN2");
		Wld_InsertNpc(shadowbeast,"PATH_WALD_OC_MOLERATSPAWN");
		Wld_InsertNpc(warg,"SPAWN_OW_WOLF2_WALD_OC2");
		Wld_InsertNpc(warg,"SPAWN_OW_WOLF2_WALD_OC2");
		Wld_InsertNpc(warg,"SPAWN_OW_SCAVENGER_INWALD_OC2");
		Wld_InsertNpc(warg,"SPAWN_OW_SCAVENGER_INWALD_OC2");
		Wld_InsertNpc(snapper,"SPAWN_OW_SCAVENGER_OC_PSI_RUIN1");
		Wld_InsertNpc(snapper,"SPAWN_OW_SCAVENGER_OC_PSI_RUIN1");
		Wld_InsertNpc(snapper,"SPAWN_OW_SCAVENGER_OC_PSI_RUIN1");
		Wld_InsertNpc(snapper,"SPAWN_OW_WARAN_OC_PSI3");
		Wld_InsertNpc(snapper,"SPAWN_OW_WARAN_OC_PSI3");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_OW_SNAPPER_OW_ORC5");
		Wld_InsertNpc(orcshaman_sit,"FP_ROAM_OW_SNAPPER_OW_ORC_MOVE");
		Wld_InsertNpc(orcshaman_sit,"LOCATION_16_IN");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_OW_SNAPPER_OW_ORC3");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_OW_SNAPPER_OW_ORC3");
		Wld_InsertNpc(warg,"FP_ROAM_OW_SNAPPER_OW_ORC");
		Wld_InsertNpc(warg,"FP_ROAM_OW_SNAPPER_OW_ORC");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_OW_SNAPPER_OW_ORC");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_OW_SNAPPER_OW_ORC");
		Wld_InsertNpc(warg,"FP_ROAM_OW_SNAPPER_OW_ORC");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_ORC_01");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_ORC_02");
		Wld_InsertNpc(orcshaman_sit,"FP_ROAM_ORC_02");
		Wld_InsertNpc(warg,"CASTLE_2");
		Wld_InsertNpc(firewaran,"OW_PATH_104");
		Wld_InsertNpc(firewaran,"OW_PATH_104");
		Wld_InsertNpc(firewaran,"OW_PATH_104");
		Wld_InsertNpc(warg,"OW_PATH_BLACKWOLF07_SPAWN01");
		Wld_InsertNpc(warg,"OW_PATH_BLACKWOLF07_SPAWN01");
		Wld_InsertNpc(orcwarrior_roam,"CASTLE_3");
		Wld_InsertNpc(warg,"CASTLE_3");
		Wld_InsertNpc(warg,"CASTLE_4");
		Wld_InsertNpc(warg,"CASTLE_4");
		Wld_InsertNpc(orcwarrior_roam,"OW_PATH_109");
		Wld_InsertNpc(dragonsnapper,"FP_ROAM_OW_SNAPPER_02_06");
		Wld_InsertNpc(dragonsnapper,"FP_ROAM_OW_SNAPPER_02_11");
		Wld_InsertNpc(dragonsnapper,"FP_ROAM_OW_SNAPPER_02_05");
		Wld_InsertNpc(dragonsnapper,"FP_ROAM_OW_SNAPPER_02_08");
		Wld_InsertNpc(dragonsnapper,"OW_PATH_303");
		Wld_InsertNpc(dragonsnapper,"OW_PATH_303");
		Wld_InsertNpc(dragonsnapper,"SPAWN_OW_SCAVENGER_01_DEMONT5");
		Wld_InsertNpc(dragonsnapper,"SPAWN_OW_SCAVENGER_01_DEMONT5");
		Wld_InsertNpc(minecrawlerwarrior,"OW_MINE3_LEFT_05");
		Wld_InsertNpc(dragonsnapper,"OW_MINE3_LEFT_07");
		Wld_InsertItem(itmi_goldchalice,"FP_ROAM_MC_04");
		Wld_InsertNpc(dragonsnapper,"OW_PATH_117");
		Wld_InsertNpc(harpie,"DT_E1_07");
		Wld_InsertNpc(harpie,"DT_E1_08");
		Wld_InsertNpc(harpie,"DT_E1_09");
		Wld_InsertNpc(dmt_dementorambient,"OW_PATH_093");
		Wld_InsertNpc(warg,"OW_PATH_195");
		Wld_InsertNpc(warg,"OW_PATH_195");
		Wld_InsertNpc(dragonsnapper,"OW_PATH_210");
		Wld_InsertNpc(dragonsnapper,"OW_PATH_210");
		Wld_InsertNpc(waran,"MT15");
		Wld_InsertNpc(dragonsnapper,"OW_ORC_LOOKOUT_2_02");
		Wld_InsertNpc(dragonsnapper,"OW_ORC_LOOKOUT_2_02");
		Wld_InsertNpc(dragonsnapper,"OW_ORC_LOOKOUT_2_02");
		Wld_InsertNpc(dragonsnapper,"SPAWN_OW_SHADOWBEAST_10_03");
		Wld_InsertNpc(dragonsnapper,"SPAWN_OW_SHADOWBEAST_10_03");
		Wld_InsertNpc(dragonsnapper,"SPAWN_OW_SHADOWBEAST_10_03");
		Wld_InsertNpc(dragonsnapper,"OW_PATH_SCAVENGER13_SPAWN01");
		Wld_InsertNpc(dragonsnapper,"OW_PATH_SCAVENGER13_SPAWN01");
		Wld_InsertNpc(dragonsnapper,"OW_PATH_SCAVENGER13_SPAWN01");
		Wld_InsertItem(itrw_bow_h_02,"FP_ROAM_ITEM_SPECIAL_01");
		Wld_InsertNpc(dragonsnapper,"OW_PATH_07_19");
		Wld_InsertNpc(dragonsnapper,"OW_PATH_146");
		Wld_InsertNpc(firewaran,"OW_PATH_182");
		Wld_InsertNpc(firewaran,"FP_ROAM_OW_SCAVENGER_01_07");
		Wld_InsertNpc(firewaran,"FP_ROAM_OW_SCAVENGER_01_06");
		Wld_InsertNpc(firewaran,"OW_PATH_182");
		Wld_InsertNpc(waran,"FP_ROAM_OW_GOBBO_07_06");
		Wld_InsertNpc(waran,"FP_ROAM_OW_GOBBO_07_03");
		Wld_InsertNpc(dragonsnapper,"FP_ROAM_OW_SNAPPER_WOOD05_02");
		Wld_InsertNpc(dragonsnapper,"FP_ROAM_OW_SNAPPER_WOOD05_02");
		Wld_InsertNpc(dragonsnapper,"SPAWN_OW_SCA_05_01");
		Wld_InsertNpc(dragonsnapper,"SPAWN_OW_SCA_05_01");
		Wld_InsertNpc(warg,"SPAWN_OW_BLOODFLY_06_01");
		Wld_InsertNpc(warg,"SPAWN_OW_BLOODFLY_06_01");
		Wld_InsertNpc(lurker,"SPAWN_OW_BLOODFLY_12");
		Wld_InsertNpc(lurker,"SPAWN_OW_BLOODFLY_12");
		Wld_InsertNpc(lurker,"FP_ROAM_OW_LURKER_NC_LAKE_02");
		Wld_InsertNpc(lurker,"FP_ROAM_OW_LURKER_NC_LAKE_01");
		Wld_InsertNpc(lurker,"OW_LAKE_NC_BLOODFLY_SPAWN01");
		Wld_InsertNpc(lurker,"OW_LAKE_NC_BLOODFLY_SPAWN01");
		Wld_InsertNpc(troll,"OW_PATH_SCAVENGER12_SPAWN01");
		Wld_InsertNpc(troll,"SPAWN_OW_WARAN_NC_03");
		Wld_InsertNpc(troll,"OW_PATH_038");
		Wld_InsertNpc(firewaran,"PLATEAU_ROUND02_CAVE");
		Wld_InsertNpc(draconian,"PLATEAU_ROUND02_CAVE_MOVE");
		Wld_InsertNpc(draconian,"PLATEAU_ROUND02_CAVE_MOVE");
		Wld_InsertItem(itmi_goldchest,"FP_ROAM_ITEM_SPECIAL_03");
		Wld_InsertNpc(draconian,"LOCATION_18_OUT");
		Wld_InsertNpc(draconian,"LOCATION_18_OUT");
		Wld_InsertNpc(draconian,"FP_ROAM_OW_ROCK_DRACONIAN_07");
		Wld_InsertItem(itsc_firestorm,"FP_ROAM_OW_ROCK_DRACONIAN_07_2");
		Wld_InsertNpc(dragonsnapper,"FP_ROAM_OW_SCAVENGER_03_04");
		Wld_InsertNpc(dragonsnapper,"FP_ROAM_OW_SCAVENGER_03_02");
		Wld_InsertNpc(dragonsnapper,"FP_ROAM_OW_SCAVENGER_03_03");
		Wld_InsertNpc(dragonsnapper,"FP_ROAM_OW_SCAVENGER_03_01");
		Wld_InsertNpc(dragonsnapper,"SPAWN_OW_SNAPPER_OCWOOD1_05_02");
		Wld_InsertNpc(dragonsnapper,"SPAWN_OW_SNAPPER_OCWOOD1_05_02");
		Wld_InsertNpc(orcelite_roam,"OW_ORCBARRIER_19");
		Wld_InsertNpc(orcelite_roam,"OW_ORCBARRIER_12");
		Wld_InsertNpc(orcelite_roam,"LOCATION_29_04");
		Wld_InsertNpc(orcelite_roam,"OW_PATH_166");
		Wld_InsertNpc(orcwarrior_roam,"PATH_TO_PLATEAU07");
		Wld_InsertNpc(orcwarrior_roam,"PATH_TO_PLATEAU07");
		Wld_InsertItem(itmi_kerolothsgeldbeutel_mis,"FP_OC_KEROLOTHS_GELDBEUTEL");
		Log_CreateTopic(TOPIC_DRAGONHUNTER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DRAGONHUNTER,LOG_RUNNING);
		b_logentry(TOPIC_DRAGONHUNTER,"Началась масштабная охота на драконов. Она привлекла многих искателей приключений в Долину рудников. Мне остается только надеяться, что они не будут мешаться у меня под ногами.");
		IntroduceChapter(KAPWECHSEL_4,KAPWECHSEL_4_TEXT,"chapter4.tga","chapter_01.wav",6000);
		ENTEROW_KAPITEL4 = TRUE;
	};
	if(TALBIN_FOLLOWSTHROUGHPASS == LOG_OBSOLETE)
	{
		b_killnpc(vlk_4130_talbin);
		Wld_InsertNpc(dragonsnapper,"START");
		TALBIN_FOLLOWSTHROUGHPASS = LOG_FAILED;
	}
	else if(TALBIN_FOLLOWSTHROUGHPASS == LOG_SUCCESS)
	{
		b_removenpc(vlk_4130_talbin);
		TALBIN_FOLLOWSTHROUGHPASS = LOG_FAILED;
	};
};


var int enterow_kapitel5;

func void b_enter_oldworld_kapitel_5()
{
	if(ENTEROW_KAPITEL5 == FALSE)
	{
		vlk_4143_haupttorwache.flags = 0;
		CreateInvItems(vlk_4143_haupttorwache,itke_oc_maingate_mis,1);
		if(Npc_IsDead(brutus) == FALSE)
		{
			CreateInvItems(vlk_4100_brutus,itwr_dementorobsessionbook_mis,1);
		};
		if(TSCHUESSBILGOT == TRUE)
		{
			b_removenpc(vlk_4120_bilgot);
		};
		ENTEROW_KAPITEL5 = TRUE;
	};
	if(BIFF_FOLLOWSTHROUGHPASS == LOG_SUCCESS)
	{
		b_removenpc(djg_713_biff);
	};
};


var int enterow_kapitel6;

func void b_enter_oldworld_kapitel_6()
{
	if(ENTEROW_KAPITEL6 == FALSE)
	{
		ENTEROW_KAPITEL6 = TRUE;
	};
};

func void b_enter_oldworld()
{
	b_initnpcglobals();
	if(KAPITEL >= 1)
	{
		b_enter_oldworld_kapitel_1();
	};
	if(KAPITEL >= 2)
	{
		b_enter_oldworld_kapitel_2();
	};
	if(KAPITEL >= 3)
	{
		b_enter_oldworld_kapitel_3();
	};
	if(KAPITEL >= 4)
	{
		b_enter_oldworld_kapitel_4();
	};
	if(KAPITEL >= 5)
	{
		b_enter_oldworld_kapitel_5();
	};
	if(KAPITEL >= 6)
	{
		b_enter_oldworld_kapitel_6();
	};
	CURRENTLEVEL = OLDWORLD_ZEN;
	b_initnpcglobals();
	if((DJG_BIFFPARTY == TRUE) && (Npc_IsDead(biff) == FALSE))
	{
		if(DJG_BIFF_HALBEHALBE == TRUE)
		{
			Npc_SetRefuseTalk(biff,500);
		}
		else
		{
			Npc_SetRefuseTalk(biff,300);
		};
	};
	if((Npc_IsDead(bilgot) == TRUE) && (MIS_RESCUEBILGOT == LOG_RUNNING))
	{
		MIS_RESCUEBILGOT = LOG_FAILED;
	};
};

