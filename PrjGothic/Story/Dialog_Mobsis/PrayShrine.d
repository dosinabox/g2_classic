
var int prayday;
var int specialbless;

var string concatdonation;

var int shrineisobsessed;
var int shrinehealing;
var int shrineshealed;
var int shrineisobsessed_nw_trollarea_path_37;
var int shrineisobsessed_nw_farm1_connect_xardas;
var int shrineisobsessed_nw_trollarea_path_66;
var int shrineisobsessed_nw_trollarea_path_04;
var int shrineisobsessed_sagitta;
var int shrineisobsessed_nw_bigmill_malaksversteck_02;
var int shrineisobsessed_nw_farm3_bigwood_02;

func void c_isshrineobsessed(var C_NPC slf)
{
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(hero))
	{
		SHRINEISOBSESSED = TRUE;
		if((Npc_GetDistToWP(hero,"NW_TROLLAREA_PATH_37") < 2000) && (SHRINEISOBSESSED_NW_TROLLAREA_PATH_37 == TRUE))
		{
			if(SHRINEHEALING == TRUE)
			{
				SHRINEISOBSESSED_NW_TROLLAREA_PATH_37 = FALSE;
				SHRINEISOBSESSED = FALSE;
			};
		}
		else if((Npc_GetDistToWP(hero,"NW_FARM1_CONNECT_XARDAS") < 2000) && (SHRINEISOBSESSED_NW_FARM1_CONNECT_XARDAS == TRUE))
		{
			if(SHRINEHEALING == TRUE)
			{
				SHRINEISOBSESSED_NW_FARM1_CONNECT_XARDAS = FALSE;
				SHRINEISOBSESSED = FALSE;
			};
		}
		else if((Npc_GetDistToWP(hero,"NW_TROLLAREA_PATH_66") < 2000) && (SHRINEISOBSESSED_NW_TROLLAREA_PATH_66 == TRUE))
		{
			if(SHRINEHEALING == TRUE)
			{
				SHRINEISOBSESSED_NW_TROLLAREA_PATH_66 = FALSE;
				SHRINEISOBSESSED = FALSE;
			};
		}
		else if((Npc_GetDistToWP(hero,"NW_TROLLAREA_PATH_04") < 2000) && (SHRINEISOBSESSED_NW_TROLLAREA_PATH_04 == TRUE))
		{
			if(SHRINEHEALING == TRUE)
			{
				SHRINEISOBSESSED_NW_TROLLAREA_PATH_04 = FALSE;
				SHRINEISOBSESSED = FALSE;
			};
		}
		else if((Npc_GetDistToWP(hero,"SAGITTA") < 2000) && (SHRINEISOBSESSED_SAGITTA == TRUE))
		{
			if(SHRINEHEALING == TRUE)
			{
				SHRINEISOBSESSED_SAGITTA = FALSE;
				SHRINEISOBSESSED = FALSE;
			};
		}
		else if((Npc_GetDistToWP(hero,"NW_BIGMILL_MALAKSVERSTECK_02") < 2000) && (SHRINEISOBSESSED_NW_BIGMILL_MALAKSVERSTECK_02 == TRUE))
		{
			if(SHRINEHEALING == TRUE)
			{
				SHRINEISOBSESSED_NW_BIGMILL_MALAKSVERSTECK_02 = FALSE;
				SHRINEISOBSESSED = FALSE;
			};
		}
		else if((Npc_GetDistToWP(hero,"NW_FARM3_BIGWOOD_02") < 2000) && (SHRINEISOBSESSED_NW_FARM3_BIGWOOD_02 == TRUE))
		{
			if(SHRINEHEALING == TRUE)
			{
				SHRINEISOBSESSED_NW_FARM3_BIGWOOD_02 = FALSE;
				SHRINEISOBSESSED = FALSE;
			};
		}
		else
		{
			SHRINEISOBSESSED = FALSE;
		};
	};
};


instance PC_PRAYSHRINE_HEALSHRINE(C_INFO)
{
	npc = pc_hero;
	nr = 1;
	condition = pc_prayshrine_healshrine_condition;
	information = pc_prayshrine_healshrine_info;
	permanent = TRUE;
	description = "Очистить алтарь";
};


func int pc_prayshrine_healshrine_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYSHRINE) && Npc_HasItems(hero,itmi_ultharsholywater_mis) && (SHRINEISOBSESSED == TRUE) && (CURRENTLEVEL != DRAGONISLAND_ZEN))
	{
		return TRUE;
	};
};

func void pc_prayshrine_healshrine_info()
{
	var string shrinestext;
	var string shrinesleft;
	Wld_PlayEffect("spellFX_HealShrine",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_Heal_Cast");
	SHRINEHEALING = TRUE;
	c_isshrineobsessed(self);
	SHRINEHEALING = FALSE;
	SHRINESHEALED = SHRINESHEALED + 1;
	if(SHRINESHEALED < 7)
	{
		b_say(self,self,"$HEALSHRINE");
		shrinesleft = IntToString(7 - SHRINESHEALED);
		shrinestext = ConcatStrings(shrinesleft,PRINT_NUMBERLEFT);
		AI_PrintScreen(shrinestext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,3);
	}
	else
	{
		b_say(self,self,"$HEALLASTSHRINE");
		MIS_ULTHAR_HEILESCHREINE_PAL = LOG_SUCCESS;
	};
	b_giveplayerxp(XP_AMBIENT);
	b_endproductiondialog();
};

func void prayshrine_s1()
{
	var C_NPC her;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		c_isshrineobsessed(self);
		if(SHRINEISOBSESSED == TRUE)
		{
			Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
		};
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_PRAYSHRINE;
		AI_ProcessInfos(self);
	};
};

func void prayidol_s1()
{
	var C_NPC her;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_PRAYSHRINE;
		AI_ProcessInfos(self);
	};
};

instance PC_PRAYSHRINE_END(C_INFO)
{
	npc = pc_hero;
	nr = 999;
	condition = pc_prayshrine_end_condition;
	information = pc_prayshrine_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int pc_prayshrine_end_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYSHRINE)
	{
		return TRUE;
	};
};

func void pc_prayshrine_end_info()
{
	b_endproductiondialog();
};


instance PC_PRAYSHRINE_PALADINE(C_INFO)
{
	npc = pc_hero;
	nr = 3;
	condition = pc_prayshrine_paladine_condition;
	information = pc_prayshrine_paladine_info;
	permanent = FALSE;
	description = "Помолиться за паладинов.";
};


func int pc_prayshrine_paladine_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYSHRINE) && (MIS_MARDUKBETEN == LOG_RUNNING) && (KAPITEL == 1) && (CURRENTLEVEL != DRAGONISLAND_ZEN))
	{
		return TRUE;
	};
};

func void pc_prayshrine_paladine_info()
{
	PrintScreen(PRAY_PALADIN1,-1,33,FONT_SCREENSMALL,4);
	PrintScreen(PRAY_PALADIN2,-1,36,FONT_SCREENSMALL,5);
	PrintScreen(PRAY_PALADIN3,-1,39,FONT_SCREENSMALL,6);
	PrintScreen(PRAY_PALADIN4,-1,42,FONT_SCREENSMALL,7);
};


instance PC_PRAYSHRINE_PRAY(C_INFO)
{
	npc = pc_hero;
	nr = 2;
	condition = pc_prayshrine_pray_condition;
	information = pc_prayshrine_pray_info;
	permanent = TRUE;
	description = "Помолиться";
};


func int pc_prayshrine_pray_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYSHRINE) && (CURRENTLEVEL != DRAGONISLAND_ZEN))
	{
		return TRUE;
	};
};

func void pc_prayshrine_pray_info()
{
	if(SHRINEISOBSESSED == TRUE)
	{
		SC_ISOBSESSED = TRUE;
		PrintScreen(PRINT_SCISOBSESSED,-1,-1,FONT_SCREEN,3);
		Snd_Play("DEM_Die");
	}
	else
	{
		Info_ClearChoices(pc_prayshrine_pray);
		Info_AddChoice(pc_prayshrine_pray,DIALOG_BACK,pc_prayshrine_pray_back);
		Info_AddChoice(pc_prayshrine_pray,"Я хочу помолиться и пожертвовать 0 золотых монет.",pc_prayshrine_pray_nopay);
		if(Npc_HasItems(hero,itmi_gold) >= 10)
		{
			Info_AddChoice(pc_prayshrine_pray,"Я хочу помолиться и пожертвовать 10 золотых монет.",pc_prayshrine_pray_smallpay);
		};
		if(Npc_HasItems(hero,itmi_gold) >= 50)
		{
			Info_AddChoice(pc_prayshrine_pray,"Я хочу помолиться и пожертвовать 50 золотых монет.",pc_prayshrine_pray_mediumpay);
		};
		if(Npc_HasItems(hero,itmi_gold) >= 100)
		{
			Info_AddChoice(pc_prayshrine_pray,"Я хочу помолиться и пожертвовать 100 золотых монет.",pc_prayshrine_pray_bigpay);
		};
	};
};

func void pc_prayshrine_pray_back()
{
	Info_ClearChoices(pc_prayshrine_pray);
};

func void pc_prayshrine_pray_nopay()
{
	var int zufall;
	zufall = Hlp_Random(4);
	if(PRAYDAY == Wld_GetDay())
	{
		PrintScreen(PRINT_BLESSNONE,-1,-1,FONT_SCREEN,2);
	}
	else if(hero.guild == GIL_PAL)
	{
		if(zufall >= 1)
		{
			b_blessattribute(hero,ATR_HITPOINTS,5);
		}
		else
		{
			b_blessattribute(hero,ATR_MANA,5);
		};
	}
	else if(hero.guild == GIL_KDF)
	{
		if(zufall >= 2)
		{
			b_blessattribute(hero,ATR_MANA,5);
		}
		else
		{
			PrintScreen(PRINT_BLESSNONE,-1,-1,FONT_SCREEN,2);
		};
	}
	else
	{
		PrintScreen(PRINT_BLESSNONE,-1,-1,FONT_SCREEN,2);
	};
	PRAYDAY = Wld_GetDay();
	Info_ClearChoices(pc_prayshrine_pray);
};

func void pc_prayshrine_pray_smallpay()
{
	Npc_RemoveInvItems(hero,itmi_gold,10);
	Stats_Blessings_GoldGiven += 10;
	if(PRAYDAY == Wld_GetDay())
	{
		PrintScreen(PRINT_BLESSNONE,-1,-1,FONT_SCREEN,2);
	}
	else if(hero.guild == GIL_PAL)
	{
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
		PrintScreen(PRINT_BLESSMANA_HIT,-1,-1,FONT_SCREEN,2);
	}
	else if(hero.guild == GIL_KDF)
	{
		b_blessattribute(hero,ATR_MANA,5);
	}
	else
	{
		PrintScreen(PRINT_BLESSNONE,-1,-1,FONT_SCREEN,2);
	};
	PRAYDAY = Wld_GetDay();
	Info_ClearChoices(pc_prayshrine_pray);
};

func void pc_prayshrine_pray_mediumpay()
{
	var int zufall;
	zufall = Hlp_Random(4);
	Npc_RemoveInvItems(hero,itmi_gold,50);
	Stats_Blessings_GoldGiven += 50;
	if(PRAYDAY == Wld_GetDay())
	{
		PrintScreen(PRINT_BLESSNONE,-1,-1,FONT_SCREEN,2);
	}
	else if(SPECIALBLESS <= 10)
	{
		if(hero.guild == GIL_PAL)
		{
			if(zufall >= 2)
			{
				b_blessattribute(hero,ATR_MANA_MAX,2);
			}
			else
			{
				b_blessattribute(hero,ATR_HITPOINTS_MAX,4);
			};
		}
		else if(hero.guild == GIL_KDF)
		{
			b_blessattribute(hero,ATR_MANA_MAX,2);
		}
		else
		{
			b_blessattribute(hero,ATR_HITPOINTS_MAX,2);
		};
		SPECIALBLESS = SPECIALBLESS + 1;
	}
	else
	{
		b_blessattribute(hero,ATR_HITPOINTS,5);
	};
	PRAYDAY = Wld_GetDay();
	Info_ClearChoices(pc_prayshrine_pray);
};

func void pc_prayshrine_pray_bigpay()
{
	var int zufall;
	zufall = Hlp_Random(4);
	Npc_RemoveInvItems(hero,itmi_gold,100);
	Stats_Blessings_GoldGiven += 100;
	if(PRAYDAY == Wld_GetDay())
	{
		PrintScreen(PRINT_BLESSNONE,-1,-1,FONT_SCREEN,2);
	}
	else if(SPECIALBLESS <= 10)
	{
		if(hero.guild == GIL_PAL)
		{
			if(zufall >= 3)
			{
				b_blessattribute(hero,ATR_MANA_MAX,4);
			}
			else if(zufall >= 2)
			{
				b_blessattribute(hero,ATR_HITPOINTS_MAX,8);
			}
			else if(zufall >= 1)
			{
				b_blessattribute(hero,ATR_STRENGTH,2);
			}
			else if(zufall >= 0)
			{
				b_blessattribute(hero,ATR_DEXTERITY,2);
			};
		}
		else if(hero.guild == GIL_KDF)
		{
			b_blessattribute(hero,ATR_MANA_MAX,4);
		}
		else if(zufall >= 2)
		{
			b_blessattribute(hero,ATR_HITPOINTS_MAX,4);
		}
		else
		{
			b_blessattribute(hero,ATR_STRENGTH,1);
		};
		SPECIALBLESS = SPECIALBLESS + 1;
	}
	else if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
		PrintScreen(PRINT_BLESSMANA_HIT,-1,-1,FONT_SCREEN,2);
	}
	else
	{
		b_blessattribute(hero,ATR_HITPOINTS,5);
	};
	PRAYDAY = Wld_GetDay();
	Info_ClearChoices(pc_prayshrine_pray);
};


instance PC_PRAYSHRINE_BLESSSWORD(C_INFO)
{
	npc = pc_hero;
	nr = 2;
	condition = pc_prayshrine_blesssword_condition;
	information = pc_prayshrine_blesssword_info;
	permanent = TRUE;
	description = BLESS_SWORD;
};


func int pc_prayshrine_blesssword_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYSHRINE) && (hero.guild == GIL_PAL) && (Npc_GetDistToWP(hero,"NW_MONASTERY_CHAPELL_02") <= 500) && ((Npc_HasItems(hero,itmw_1h_blessed_01) >= 1) || (Npc_HasItems(hero,itmw_2h_blessed_01) >= 1)) && (CURRENTLEVEL != DRAGONISLAND_ZEN))
	{
		return TRUE;
	};
};

func void pc_prayshrine_blesssword_info()
{
	if(SHRINEISOBSESSED == TRUE)
	{
		SC_ISOBSESSED = TRUE;
		PrintScreen(PRINT_SCISOBSESSED,-1,-1,FONT_SCREEN,3);
		Snd_Play("DEM_Die");
	}
	else if(Npc_HasItems(hero,itmi_gold) >= GOLD_BLESSSWORD)
	{
		Npc_RemoveInvItems(hero,itmi_gold,GOLD_BLESSSWORD);
		CONCATDONATION = ConcatStrings(IntToString(GOLD_BLESSSWORD),PRINT_GOLDGEGEBEN);
		AI_PrintScreen(CONCATDONATION,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
		if(Npc_HasItems(hero,itmw_2h_blessed_01) >= 1)
		{
			Npc_RemoveInvItems(hero,itmw_2h_blessed_01,1);
			CreateInvItems(hero,itmw_2h_blessed_02,1);
			Wld_PlayEffect("spellFX_PalHeal_ORIGIN",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_Heal_Cast");
			b_giveplayerxp(XP_SWORDBLESSED);
		}
		else
		{
			Npc_RemoveInvItems(hero,itmw_1h_blessed_01,1);
			CreateInvItems(hero,itmw_1h_blessed_02,1);
			Wld_PlayEffect("spellFX_PalHeal_ORIGIN",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_Heal_Cast");
			b_giveplayerxp(XP_SWORDBLESSED);
		};
	}
	else
	{
		AI_PrintScreen(PRINT_NOTENOUGHGOLD,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
	};
};


instance PC_PRAYSHRINE_BLESSSWORD_FINAL(C_INFO)
{
	npc = pc_hero;
	nr = 2;
	condition = pc_prayshrine_blesssword_final_condition;
	information = pc_prayshrine_blesssword_final_info;
	permanent = TRUE;
	description = BLESS_SWORD2;
};


func int pc_prayshrine_blesssword_final_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYSHRINE) && (hero.guild == GIL_PAL) && (Npc_GetDistToWP(hero,"NW_MONASTERY_CHAPELL_02") <= 500) && (PAL_KNOWSABOUT_FINAL_BLESSING == TRUE) && ((Npc_HasItems(hero,itmw_1h_blessed_02) >= 1) || (Npc_HasItems(hero,itmw_2h_blessed_02) >= 1)) && (CURRENTLEVEL != DRAGONISLAND_ZEN))
	{
		return TRUE;
	};
};

func void pc_prayshrine_blesssword_final_info()
{
	if(SHRINEISOBSESSED == TRUE)
	{
		SC_ISOBSESSED = TRUE;
		PrintScreen(PRINT_SCISOBSESSED,-1,-1,FONT_SCREEN,3);
		Snd_Play("DEM_Die");
	}
	else if((Npc_HasItems(hero,itpo_potionofdeath_01_mis) >= 1) || (Npc_HasItems(hero,itpo_potionofdeath_02_mis) >= 1))
	{
		Npc_RemoveInvItems(hero,itpo_potionofdeath_01_mis,1);
		Npc_RemoveInvItems(hero,itpo_potionofdeath_02_mis,1);
		if(Npc_HasItems(hero,itmw_2h_blessed_02) >= 1)
		{
			Npc_RemoveInvItems(hero,itmw_2h_blessed_02,1);
			CreateInvItems(hero,itmw_2h_blessed_03,1);
			Wld_PlayEffect("spellFX_PalHeal_ORIGIN",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_Heal_Cast");
			b_giveplayerxp(XP_SWORDBLESSED2);
		}
		else
		{
			Npc_RemoveInvItems(hero,itmw_1h_blessed_02,1);
			CreateInvItems(hero,itmw_1h_blessed_03,1);
			Wld_PlayEffect("spellFX_PalHeal_ORIGIN",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_Heal_Cast");
			b_giveplayerxp(XP_SWORDBLESSED2);
		};
	}
	else
	{
		AI_PrintScreen(PRINT_NOINNOSTEARS,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
	};
};

