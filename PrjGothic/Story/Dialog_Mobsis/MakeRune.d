
func void makerune_s1()
{
	var C_NPC her;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_MAKERUNE;
		AI_ProcessInfos(her);
	};
};


instance PC_MAKERUNE_END(C_INFO)
{
	npc = pc_hero;
	nr = 999;
	condition = pc_makerune_end_condition;
	information = pc_makerune_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int pc_makerune_end_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_MAKERUNE)
	{
		return TRUE;
	};
};

func void pc_makerune_end_info()
{
	CreateInvItems(self,itmi_runeblank,1);
	b_endproductiondialog();
};


instance PC_CIRCLE_01(C_INFO)
{
	npc = pc_hero;
	condition = pc_circle_01_condition;
	information = pc_circle_01_info;
	permanent = TRUE;
	description = "Создать руну 1-го круга";
};


func int pc_circle_01_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKERUNE) && ((PLAYER_TALENT_RUNES[SPL_LIGHT] == TRUE) || (PLAYER_TALENT_RUNES[SPL_FIREBOLT] == TRUE) || (PLAYER_TALENT_RUNES[SPL_LIGHTHEAL] == TRUE) || (PLAYER_TALENT_RUNES[SPL_SUMMONGOBLINSKELETON] == TRUE) || (PLAYER_TALENT_RUNES[SPL_ZAP] == TRUE)))
	{
		return TRUE;
	};
};

func void pc_circle_01_info()
{
	Info_ClearChoices(pc_circle_01);
	Info_AddChoice(pc_circle_01,DIALOG_BACK,pc_circle_01_back);
	if(PLAYER_TALENT_RUNES[SPL_LIGHT] == TRUE)
	{
		Info_AddChoice(pc_circle_01,NAME_SPL_LIGHT,pc_itru_light_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_FIREBOLT] == TRUE)
	{
		Info_AddChoice(pc_circle_01,NAME_SPL_FIREBOLT,pc_itru_firebolt_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_ZAP] == TRUE)
	{
		Info_AddChoice(pc_circle_01,NAME_SPL_ZAP,pc_itru_zap_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_LIGHTHEAL] == TRUE)
	{
		Info_AddChoice(pc_circle_01,NAME_SPL_LIGHTHEAL,pc_itru_lightheal_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_SUMMONGOBLINSKELETON] == TRUE)
	{
		Info_AddChoice(pc_circle_01,NAME_SPL_SUMMONGOBLINSKELETON,pc_itru_sumgobskel_info);
	};
};

func void pc_circle_01_back()
{
	Info_ClearChoices(pc_circle_01);
};


instance PC_CIRCLE_02(C_INFO)
{
	npc = pc_hero;
	condition = pc_circle_02_condition;
	information = pc_circle_02_info;
	permanent = TRUE;
	description = "Создать руну 2-го круга";
};


func int pc_circle_02_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKERUNE) && ((PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] == TRUE) || (PLAYER_TALENT_RUNES[SPL_ICEBOLT] == TRUE) || (PLAYER_TALENT_RUNES[SPL_SUMMONWOLF] == TRUE) || (PLAYER_TALENT_RUNES[SPL_WINDFIST] == TRUE) || (PLAYER_TALENT_RUNES[SPL_SLEEP] == TRUE)))
	{
		return TRUE;
	};
};

func void pc_circle_02_info()
{
	Info_ClearChoices(pc_circle_02);
	Info_AddChoice(pc_circle_02,DIALOG_BACK,pc_circle_02_back);
	if(PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] == TRUE)
	{
		Info_AddChoice(pc_circle_02,NAME_SPL_INSTANTFIREBALL,pc_itru_instfireball_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_ICEBOLT] == TRUE)
	{
		Info_AddChoice(pc_circle_02,NAME_SPL_ICEBOLT,pc_itru_icebolt_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_SUMMONWOLF] == TRUE)
	{
		Info_AddChoice(pc_circle_02,NAME_SPL_SUMMONWOLF,pc_itru_sumwolf_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_WINDFIST] == TRUE)
	{
		Info_AddChoice(pc_circle_02,NAME_SPL_WINDFIST,pc_itru_windfist_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_SLEEP] == TRUE)
	{
		Info_AddChoice(pc_circle_02,NAME_SPL_SLEEP,pc_itru_sleep_info);
	};
};

func void pc_circle_02_back()
{
	Info_ClearChoices(pc_circle_02);
};


instance PC_CIRCLE_03(C_INFO)
{
	npc = pc_hero;
	condition = pc_circle_03_condition;
	information = pc_circle_03_info;
	permanent = TRUE;
	description = "Создать руну 3-го круга";
};


func int pc_circle_03_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKERUNE) && ((PLAYER_TALENT_RUNES[SPL_MEDIUMHEAL] == TRUE) || (PLAYER_TALENT_RUNES[SPL_SUMMONSKELETON] == TRUE) || (PLAYER_TALENT_RUNES[SPL_FEAR] == TRUE) || (PLAYER_TALENT_RUNES[SPL_ICECUBE] == TRUE) || (PLAYER_TALENT_RUNES[SPL_CHARGEZAP] == TRUE) || (PLAYER_TALENT_RUNES[SPL_FIRESTORM] == TRUE)))
	{
		return TRUE;
	};
};

func void pc_circle_03_info()
{
	Info_ClearChoices(pc_circle_03);
	Info_AddChoice(pc_circle_03,DIALOG_BACK,pc_circle_03_back);
	if(PLAYER_TALENT_RUNES[SPL_MEDIUMHEAL] == TRUE)
	{
		Info_AddChoice(pc_circle_03,NAME_SPL_MEDIUMHEAL,pc_itru_mediumheal_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_SUMMONSKELETON] == TRUE)
	{
		Info_AddChoice(pc_circle_03,NAME_SPL_SUMMONSKELETON,pc_itru_sumskel_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_FEAR] == TRUE)
	{
		Info_AddChoice(pc_circle_03,NAME_SPL_FEAR,pc_itru_fear_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_ICECUBE] == TRUE)
	{
		Info_AddChoice(pc_circle_03,NAME_SPL_ICECUBE,pc_itru_icecube_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_CHARGEZAP] == TRUE)
	{
		Info_AddChoice(pc_circle_03,NAME_SPL_CHARGEZAP,pc_itru_thunderball_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_FIRESTORM] == TRUE)
	{
		Info_AddChoice(pc_circle_03,NAME_SPL_FIRESTORM,pc_itru_firestorm_info);
	};
};

func void pc_circle_03_back()
{
	Info_ClearChoices(pc_circle_03);
};


instance PC_CIRCLE_04(C_INFO)
{
	npc = pc_hero;
	condition = pc_circle_04_condition;
	information = pc_circle_04_info;
	permanent = TRUE;
	description = "Создать руну 4-го круга";
};


func int pc_circle_04_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKERUNE) && ((PLAYER_TALENT_RUNES[SPL_DESTROYUNDEAD] == TRUE) || (PLAYER_TALENT_RUNES[SPL_LIGHTNINGFLASH] == TRUE) || (PLAYER_TALENT_RUNES[SPL_CHARGEFIREBALL] == TRUE) || (PLAYER_TALENT_RUNES[SPL_SUMMONGOLEM] == TRUE)))
	{
		return TRUE;
	};
};

func void pc_circle_04_info()
{
	Info_ClearChoices(pc_circle_04);
	Info_AddChoice(pc_circle_04,DIALOG_BACK,pc_circle_04_back);
	if(PLAYER_TALENT_RUNES[SPL_SUMMONGOLEM] == TRUE)
	{
		Info_AddChoice(pc_circle_04,NAME_SPL_SUMMONGOLEM,pc_itru_sumgol_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_DESTROYUNDEAD] == TRUE)
	{
		Info_AddChoice(pc_circle_04,NAME_SPL_DESTROYUNDEAD,pc_itru_harmundead_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_CHARGEFIREBALL] == TRUE)
	{
		Info_AddChoice(pc_circle_04,NAME_SPL_CHARGEFIREBALL,pc_itru_chargefireball_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_LIGHTNINGFLASH] == TRUE)
	{
		Info_AddChoice(pc_circle_04,NAME_SPL_LIGHTNINGFLASH,pc_itru_lightningflash_info);
	};
};

func void pc_circle_04_back()
{
	Info_ClearChoices(pc_circle_04);
};


instance PC_CIRCLE_05(C_INFO)
{
	npc = pc_hero;
	condition = pc_circle_05_condition;
	information = pc_circle_05_info;
	permanent = TRUE;
	description = "Создать руну 5-го круга";
};


func int pc_circle_05_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKERUNE) && ((PLAYER_TALENT_RUNES[SPL_ICEWAVE] == TRUE) || (PLAYER_TALENT_RUNES[SPL_SUMMONDEMON] == TRUE) || (PLAYER_TALENT_RUNES[SPL_FULLHEAL] == TRUE) || (PLAYER_TALENT_RUNES[SPL_PYROKINESIS] == TRUE)))
	{
		return TRUE;
	};
};

func void pc_circle_05_info()
{
	Info_ClearChoices(pc_circle_05);
	Info_AddChoice(pc_circle_05,DIALOG_BACK,pc_circle_05_back);
	if(PLAYER_TALENT_RUNES[SPL_ICEWAVE] == TRUE)
	{
		Info_AddChoice(pc_circle_05,NAME_SPL_ICEWAVE,pc_itru_icewave_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_SUMMONDEMON] == TRUE)
	{
		Info_AddChoice(pc_circle_05,NAME_SPL_SUMMONDEMON,pc_itru_sumdemon_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_FULLHEAL] == TRUE)
	{
		Info_AddChoice(pc_circle_05,NAME_SPL_FULLHEAL,pc_itru_fullheal_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_PYROKINESIS] == TRUE)
	{
		Info_AddChoice(pc_circle_05,NAME_SPL_PYROKINESIS,pc_itru_pyrokinesis_info);
	};
};

func void pc_circle_05_back()
{
	Info_ClearChoices(pc_circle_05);
};


instance PC_CIRCLE_06(C_INFO)
{
	npc = pc_hero;
	condition = pc_circle_06_condition;
	information = pc_circle_06_info;
	permanent = TRUE;
	description = "Создать руну 6-го круга";
};


func int pc_circle_06_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKERUNE) && ((PLAYER_TALENT_RUNES[SPL_FIRERAIN] == TRUE) || (PLAYER_TALENT_RUNES[SPL_BREATHOFDEATH] == TRUE) || (PLAYER_TALENT_RUNES[SPL_ARMYOFDARKNESS] == TRUE) || (PLAYER_TALENT_RUNES[SPL_SHRINK] == TRUE)))
	{
		return TRUE;
	};
};

func void pc_circle_06_info()
{
	Info_ClearChoices(pc_circle_06);
	Info_AddChoice(pc_circle_06,DIALOG_BACK,pc_circle_06_back);
	if(PLAYER_TALENT_RUNES[SPL_FIRERAIN] == TRUE)
	{
		Info_AddChoice(pc_circle_06,NAME_SPL_FIRERAIN,pc_itru_firerain_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_BREATHOFDEATH] == TRUE)
	{
		Info_AddChoice(pc_circle_06,NAME_SPL_BREATHOFDEATH,pc_itru_breathofdeath_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_MASSDEATH] == TRUE)
	{
		Info_AddChoice(pc_circle_06,NAME_SPL_MASSDEATH,pc_itru_massdeath_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_ARMYOFDARKNESS] == TRUE)
	{
		Info_AddChoice(pc_circle_06,NAME_SPL_ARMYOFDARKNESS,pc_itru_armyofdarkness_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_SHRINK] == TRUE)
	{
		Info_AddChoice(pc_circle_06,NAME_SPL_SHRINK,pc_itru_shrink_info);
	};
};

func void pc_circle_06_back()
{
	Info_ClearChoices(pc_circle_06);
};


instance PC_SPL_MASTEROFDISASTER(C_INFO)
{
	npc = pc_hero;
	condition = pc_spl_masterofdisaster_condition;
	information = pc_spl_masterofdisaster_info;
	permanent = TRUE;
	description = "Секрет библиотеки!";
};


func int pc_spl_masterofdisaster_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKERUNE) && (PLAYER_TALENT_RUNES[SPL_MASTEROFDISASTER] == TRUE))
	{
		return TRUE;
	};
};

func void pc_spl_masterofdisaster_info()
{
	Info_ClearChoices(pc_spl_masterofdisaster);
	Info_AddChoice(pc_spl_masterofdisaster,DIALOG_BACK,pc_spl_masterofdisaster_back);
	if(PLAYER_TALENT_RUNES[SPL_MASTEROFDISASTER] == TRUE)
	{
		Info_AddChoice(pc_spl_masterofdisaster,"Секрет библиотеки!",pc_spl_masterofdisaster_create);
	};
};

func void pc_spl_masterofdisaster_back()
{
	Info_ClearChoices(pc_spl_masterofdisaster);
};

func void pc_spl_masterofdisaster_create()
{
	if(Npc_HasItems(hero,itmi_holywater) >= 1)
	{
		Npc_RemoveInvItems(hero,itmi_holywater,1);
		CreateInvItems(hero,itru_masterofdisaster,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};


instance PC_SPL_PALTELEPORTSECRET(C_INFO)
{
	npc = pc_hero;
	condition = pc_spl_palteleportsecret_condition;
	information = pc_spl_palteleportsecret_info;
	permanent = TRUE;
	description = "Создать руну телепорта";
};


func int pc_spl_palteleportsecret_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKERUNE) && (PLAYER_TALENT_RUNES[SPL_PALTELEPORTSECRET] == TRUE))
	{
		return TRUE;
	};
};

func void pc_spl_palteleportsecret_info()
{
	Info_ClearChoices(pc_spl_palteleportsecret);
	Info_AddChoice(pc_spl_palteleportsecret,DIALOG_BACK,pc_spl_palteleportsecret_back);
	if(PLAYER_TALENT_RUNES[SPL_PALTELEPORTSECRET] == TRUE)
	{
		Info_AddChoice(pc_spl_palteleportsecret,"Секрет библиотеки!",pc_spl_palteleportsecret_create);
	};
};

func void pc_spl_palteleportsecret_back()
{
	Info_ClearChoices(pc_spl_palteleportsecret);
};

func void pc_spl_palteleportsecret_create()
{
	if(Npc_HasItems(hero,itmi_holywater) >= 1)
	{
		Npc_RemoveInvItems(hero,itmi_holywater,1);
		CreateInvItems(hero,itru_palteleportsecret,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};

func void pc_itru_light_info()
{
	if((Npc_HasItems(hero,itsc_light) >= 1) && (Npc_HasItems(hero,itmi_gold) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_light,1);
		Npc_RemoveInvItems(hero,itmi_gold,1);
		CreateInvItems(hero,itru_light,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};

func void pc_itru_firebolt_info()
{
	if((Npc_HasItems(hero,itsc_firebolt) >= 1) && (Npc_HasItems(hero,itmi_sulfur) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_firebolt,1);
		Npc_RemoveInvItems(hero,itmi_sulfur,1);
		CreateInvItems(hero,itru_firebolt,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};

func void pc_itru_lightheal_info()
{
	if((Npc_HasItems(hero,itsc_lightheal) >= 1) && (Npc_HasItems(hero,itpl_health_herb_01) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_lightheal,1);
		Npc_RemoveInvItems(hero,itpl_health_herb_01,1);
		CreateInvItems(hero,itru_lightheal,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};

func void pc_itru_sumgobskel_info()
{
	if((Npc_HasItems(hero,itsc_sumgobskel) >= 1) && (Npc_HasItems(hero,itat_goblinbone) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_sumgobskel,1);
		Npc_RemoveInvItems(hero,itat_goblinbone,1);
		CreateInvItems(hero,itru_sumgobskel,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};

func void pc_itru_zap_info()
{
	if((Npc_HasItems(hero,itsc_zap) >= 1) && (Npc_HasItems(hero,itmi_rockcrystal) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_zap,1);
		Npc_RemoveInvItems(hero,itmi_rockcrystal,1);
		CreateInvItems(hero,itru_zap,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};

func void pc_itru_instfireball_info()
{
	if((Npc_HasItems(hero,itsc_instantfireball) >= 1) && (Npc_HasItems(hero,itmi_pitch) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_instantfireball,1);
		Npc_RemoveInvItems(hero,itmi_pitch,1);
		CreateInvItems(hero,itru_instantfireball,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};

func void pc_itru_icebolt_info()
{
	if((Npc_HasItems(hero,itsc_icebolt) >= 1) && (Npc_HasItems(hero,itmi_quartz) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_icebolt,1);
		Npc_RemoveInvItems(hero,itmi_quartz,1);
		CreateInvItems(hero,itru_icebolt,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};

func void pc_itru_sumwolf_info()
{
	if((Npc_HasItems(hero,itsc_sumwolf) >= 1) && (Npc_HasItems(hero,itat_wolffur) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_sumwolf,1);
		Npc_RemoveInvItems(hero,itat_wolffur,1);
		CreateInvItems(hero,itru_sumwolf,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};

func void pc_itru_windfist_info()
{
	if((Npc_HasItems(hero,itsc_windfist) >= 1) && (Npc_HasItems(hero,itmi_coal) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_windfist,1);
		Npc_RemoveInvItems(hero,itmi_coal,1);
		CreateInvItems(hero,itru_windfist,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};

func void pc_itru_sleep_info()
{
	if((Npc_HasItems(hero,itsc_sleep) >= 1) && (Npc_HasItems(hero,itpl_swampherb) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_sleep,1);
		Npc_RemoveInvItems(hero,itpl_swampherb,1);
		CreateInvItems(hero,itru_sleep,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};

func void pc_itru_mediumheal_info()
{
	if((Npc_HasItems(hero,itsc_mediumheal) >= 1) && (Npc_HasItems(hero,itpl_health_herb_02) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_mediumheal,1);
		Npc_RemoveInvItems(hero,itpl_health_herb_02,1);
		CreateInvItems(hero,itru_mediumheal,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};

func void pc_itru_lightningflash_info()
{
	if((Npc_HasItems(hero,itsc_lightningflash) >= 1) && (Npc_HasItems(hero,itmi_rockcrystal) >= 1) && (Npc_HasItems(hero,itmi_quartz) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_lightningflash,1);
		Npc_RemoveInvItems(hero,itmi_rockcrystal,1);
		Npc_RemoveInvItems(hero,itmi_quartz,1);
		CreateInvItems(hero,itru_lightningflash,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};

func void pc_itru_chargefireball_info()
{
	if((Npc_HasItems(hero,itsc_chargefireball) >= 1) && (Npc_HasItems(hero,itmi_sulfur) >= 1) && (Npc_HasItems(hero,itmi_pitch) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_chargefireball,1);
		Npc_RemoveInvItems(hero,itmi_sulfur,1);
		Npc_RemoveInvItems(hero,itmi_pitch,1);
		CreateInvItem(hero,itru_chargefireball);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};

func void pc_itru_sumskel_info()
{
	if((Npc_HasItems(hero,itsc_sumskel) >= 1) && (Npc_HasItems(hero,itat_skeletonbone) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_sumskel,1);
		Npc_RemoveInvItems(hero,itat_skeletonbone,1);
		CreateInvItems(hero,itru_sumskel,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};

func void pc_itru_fear_info()
{
	if((Npc_HasItems(hero,itsc_fear) >= 1) && (Npc_HasItems(hero,itmi_darkpearl) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_fear,1);
		Npc_RemoveInvItems(hero,itmi_darkpearl,1);
		CreateInvItems(hero,itru_fear,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};

func void pc_itru_icecube_info()
{
	if((Npc_HasItems(hero,itsc_icecube) >= 1) && (Npc_HasItems(hero,itmi_quartz) >= 1) && (Npc_HasItems(hero,itmi_aquamarine) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_icecube,1);
		Npc_RemoveInvItems(hero,itmi_quartz,1);
		Npc_RemoveInvItems(hero,itmi_aquamarine,1);
		CreateInvItems(hero,itru_icecube,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
	};
	b_endproductiondialog();
};

func void pc_itru_thunderball_info()
{
	if((Npc_HasItems(hero,itsc_thunderball) >= 1) && (Npc_HasItems(hero,itmi_rockcrystal) >= 1) && (Npc_HasItems(hero,itmi_sulfur) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_thunderball,1);
		Npc_RemoveInvItems(hero,itmi_rockcrystal,1);
		Npc_RemoveInvItems(hero,itmi_sulfur,1);
		CreateInvItems(hero,itru_thunderball,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};

func void pc_itru_sumgol_info()
{
	if((Npc_HasItems(hero,itsc_sumgol) >= 1) && (Npc_HasItems(hero,itat_stonegolemheart) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_sumgol,1);
		Npc_RemoveInvItems(hero,itat_stonegolemheart,1);
		CreateInvItems(hero,itru_sumgol,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};

func void pc_itru_harmundead_info()
{
	if((Npc_HasItems(hero,itsc_harmundead) >= 1) && (Npc_HasItems(hero,itmi_holywater) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_harmundead,1);
		Npc_RemoveInvItems(hero,itmi_holywater,1);
		CreateInvItems(hero,itru_harmundead,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
	};
	b_endproductiondialog();
};

func void pc_itru_pyrokinesis_info()
{
	if((Npc_HasItems(hero,itsc_pyrokinesis) >= 1) && (Npc_HasItems(hero,itmi_sulfur) >= 1) && (Npc_HasItems(hero,itat_waranfiretongue) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_pyrokinesis,1);
		Npc_RemoveInvItems(hero,itmi_sulfur,1);
		Npc_RemoveInvItems(hero,itat_waranfiretongue,1);
		CreateInvItems(hero,itru_pyrokinesis,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};

func void pc_itru_firestorm_info()
{
	if((Npc_HasItems(hero,itsc_firestorm) >= 1) && (Npc_HasItems(hero,itmi_pitch) >= 1) && (Npc_HasItems(hero,itmi_sulfur) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_firestorm,1);
		Npc_RemoveInvItems(hero,itmi_pitch,1);
		Npc_RemoveInvItems(hero,itmi_sulfur,1);
		CreateInvItems(hero,itru_firestorm,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};

func void pc_itru_icewave_info()
{
	if((Npc_HasItems(hero,itsc_icewave) >= 1) && (Npc_HasItems(hero,itmi_quartz) >= 1) && (Npc_HasItems(hero,itmi_aquamarine) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_icewave,1);
		Npc_RemoveInvItems(hero,itmi_quartz,1);
		Npc_RemoveInvItems(hero,itmi_aquamarine,1);
		CreateInvItems(hero,itru_icewave,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};

func void pc_itru_sumdemon_info()
{
	if((Npc_HasItems(hero,itsc_sumdemon) >= 1) && (Npc_HasItems(hero,itat_demonheart) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_sumdemon,1);
		Npc_RemoveInvItems(hero,itat_demonheart,1);
		CreateInvItems(hero,itru_sumdemon,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};

func void pc_itru_fullheal_info()
{
	if((Npc_HasItems(hero,itsc_fullheal) >= 1) && (Npc_HasItems(hero,itpl_health_herb_03) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_fullheal,1);
		Npc_RemoveInvItems(hero,itpl_health_herb_03,1);
		CreateInvItems(hero,itru_fullheal,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};

func void pc_itru_firerain_info()
{
	if((Npc_HasItems(hero,itsc_firerain) >= 1) && (Npc_HasItems(hero,itmi_pitch) >= 1) && (Npc_HasItems(hero,itmi_sulfur) >= 1) && (Npc_HasItems(hero,itat_waranfiretongue) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_firerain,1);
		Npc_RemoveInvItems(hero,itmi_pitch,1);
		Npc_RemoveInvItems(hero,itat_waranfiretongue,1);
		CreateInvItems(hero,itru_firerain,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};

func void pc_itru_breathofdeath_info()
{
	if((Npc_HasItems(hero,itsc_breathofdeath) >= 1) && (Npc_HasItems(hero,itmi_coal) >= 1) && (Npc_HasItems(hero,itmi_darkpearl) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_breathofdeath,1);
		Npc_RemoveInvItems(hero,itmi_coal,1);
		Npc_RemoveInvItems(hero,itmi_darkpearl,1);
		CreateInvItems(hero,itru_breathofdeath,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};

func void pc_itru_massdeath_info()
{
	if((Npc_HasItems(hero,itsc_massdeath) >= 1) && (Npc_HasItems(hero,itat_skeletonbone) >= 1) && (Npc_HasItems(hero,itmi_darkpearl) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_massdeath,1);
		Npc_RemoveInvItems(hero,itat_skeletonbone,1);
		Npc_RemoveInvItems(hero,itmi_darkpearl,1);
		CreateInvItems(hero,itru_massdeath,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};

func void pc_itru_armyofdarkness_info()
{
	if((Npc_HasItems(hero,itsc_armyofdarkness) >= 1) && (Npc_HasItems(hero,itat_skeletonbone) >= 1) && (Npc_HasItems(hero,itmi_darkpearl) >= 1) && (Npc_HasItems(hero,itat_stonegolemheart) >= 1) && (Npc_HasItems(hero,itat_demonheart) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_armyofdarkness,1);
		Npc_RemoveInvItems(hero,itat_skeletonbone,1);
		Npc_RemoveInvItems(hero,itmi_darkpearl,1);
		Npc_RemoveInvItems(hero,itat_stonegolemheart,1);
		Npc_RemoveInvItems(hero,itat_demonheart,1);
		CreateInvItems(hero,itru_armyofdarkness,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};

func void pc_itru_shrink_info()
{
	if((Npc_HasItems(hero,itsc_shrink) >= 1) && (Npc_HasItems(hero,itat_goblinbone) >= 1) && (Npc_HasItems(hero,itat_trolltooth) >= 1))
	{
		Npc_RemoveInvItems(hero,itsc_shrink,1);
		Npc_RemoveInvItems(hero,itat_goblinbone,1);
		Npc_RemoveInvItems(hero,itat_trolltooth,1);
		CreateInvItems(hero,itru_shrink,1);
		Print(PRINT_RUNESUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_runeblank,1);
	};
	b_endproductiondialog();
};

