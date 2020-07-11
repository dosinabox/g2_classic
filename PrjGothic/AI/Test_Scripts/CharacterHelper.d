
instance MOBSIBRIEF(C_ITEM)
{
	name = "Руна MobsiBrief";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItRu_TeleportOWDemonTower.3DS";
	material = MAT_STONE;
	scemename = "MAP";
	description = name;
	text[0] = "Исправить блокировку состояния.";
	on_state[0] = usemobsibrief;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void usemobsibrief()
{
	var int ndocid;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PrintScreen("PLAYER_MOBSI_PRODUCTION = MOBSI_NONE",-1,50,FONT_SCREEN,4);
	PrintScreen("self.aivar[AIV_INVINCIBLE] = FALSE",-1,55,FONT_SCREEN,4);
};


instance FULLNPCREMOVER(C_ITEM)
{
	name = "Руна FullNPCRemover";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItRu_TeleportOWDemonTower.3DS";
	material = MAT_STONE;
	scemename = "MAP";
	description = name;
	text[0] = "Исправить зависание при переходе.";
	on_state[0] = usenpcremover;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void usenpcremover()
{
	if(FullNPCRemoval == FALSE)
	{
		FullNPCRemoval = TRUE;
		PrintScreen("FullNPCRemoval = TRUE",-1,50,FONT_SCREEN,4);
	}
	else
	{
		FullNPCRemoval = FALSE;
		PrintScreen("FullNPCRemoval = FALSE",-1,50,FONT_SCREEN,4);
	};
};


instance CH(NPC_DEFAULT)
{
	name[0] = "Помощник по персонажу";
	guild = GIL_NONE;
	id = 0;
	voice = 15;
	flags = 0;
	npctype = NPCTYPE_FRIEND;
	b_setattributestochapter(self,1);
	b_givenpctalents(self);
	fight_tactic = FAI_HUMAN_MASTER;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_N_PLAYER,BODYTEX_PLAYER,-1);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	daily_routine = rtn_start_0;
};


func void rtn_start_0()
{
	ta_stand_armscrossed(8,0,23,0,"XXX");
	ta_stand_armscrossed(23,0,8,0,"XXX");
};

func void b_setheroexp()
{
	var string attributes;
	hero.exp = 250 * (hero.level + 1) * hero.level;
	hero.exp_next = 250 * (hero.level + 2) * (hero.level + 1);
	hero.lp = hero.level * LP_PER_LEVEL;
	hero.attribute[ATR_HITPOINTS_MAX] = 40 + (10 * hero.level);
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	attributes = "Повышение уровня! Очки обучения: ";
	attributes = ConcatStrings(attributes,IntToString(hero.lp));
	attributes = ConcatStrings(attributes,"  Здоровье: ");
	attributes = ConcatStrings(attributes,IntToString(hero.attribute[ATR_HITPOINTS_MAX]));
	PrintScreen(attributes,-1,-1,FONT_SCREEN,3);
	Snd_Play("LEVELUP");
};


instance CH_EXIT(C_INFO)
{
	npc = ch;
	nr = 999;
	condition = ch_exit_condition;
	information = ch_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int ch_exit_condition()
{
	return TRUE;
};

func void ch_exit_info()
{
	AI_StopProcessInfos(self);
};


instance CH_RESET(C_INFO)
{
	npc = ch;
	nr = 990;
	condition = ch_reset_condition;
	information = ch_reset_info;
	description = "Полный сброс";
};


func int ch_reset_condition()
{
	return TRUE;
};

func void ch_reset_info()
{
	other.guild = GIL_NONE;
	Npc_SetTrueGuild(other,GIL_NONE);
	hero.lp = 0;
	hero.level = 0;
	hero.exp = 0;
	hero.attribute[ATR_STRENGTH] = 10;
	hero.attribute[ATR_DEXTERITY] = 10;
	hero.attribute[ATR_MANA_MAX] = 5;
	hero.attribute[ATR_MANA] = 5;
	hero.attribute[ATR_HITPOINTS] = 40;
	hero.attribute[ATR_HITPOINTS_MAX] = 40;
	Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_ALCHEMY,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_RUNES,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_MAGE,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_BOW,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_CROSSBOW,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_1H,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_2H,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_MAGE,0);
	AI_UnequipArmor(hero);
	PrintScreen("Восстановлен исходный PC_Hero",-1,-1,FONT_SCREEN,2);
};


instance CH_VLIPPER(C_INFO)
{
	npc = ch;
	nr = 990;
	condition = ch_vlipper_condition;
	information = ch_vlipper_info;
	description = "Добавить очки обучения";
};


func int ch_vlipper_condition()
{
	if(hero.level == 0)
	{
		return TRUE;
	};
};

func void ch_vlipper_info()
{
	hero.lp = hero.lp + 5000;
	PrintScreen("LP + 5000",-1,-1,FONT_SCREEN,2);
};

func void b_setpaladinequipment()
{
	CreateInvItems(hero,itru_pallight,1);
	CreateInvItems(hero,itru_pallightheal,1);
	CreateInvItems(hero,itru_palholybolt,1);
	CreateInvItems(hero,itru_palmediumheal,1);
	CreateInvItems(hero,itru_palrepelevil,1);
	CreateInvItems(hero,itru_palfullheal,1);
	CreateInvItems(hero,itru_paldestroyevil,1);
	CreateInvItems(hero,itru_palteleportsecret,1);
};


instance CH_GUILD(C_INFO)
{
	npc = ch;
	condition = ch_guild_condition;
	information = ch_guild_info;
	important = FALSE;
	permanent = TRUE;
	description = "Изменить гильдию";
};


func int ch_guild_condition()
{
	if((hero.level > 0) || Npc_KnowsInfo(hero,ch_vlipper))
	{
		return TRUE;
	};
};

func void ch_guild_info()
{
	Info_ClearChoices(ch_guild);
	Info_AddChoice(ch_guild,DIALOG_BACK,ch_guild_back);
	Info_AddChoice(ch_guild,NAME_NOVIZE,ch_nov);
	Info_AddChoice(ch_guild,NAME_MAGIER,ch_kdf);
	Info_AddChoice(ch_guild,NAME_SOELDNER,ch_sld);
	Info_AddChoice(ch_guild,NAME_DRACHENJAEGER,ch_djg);
	Info_AddChoice(ch_guild,NAME_MILIZ,ch_mil);
	Info_AddChoice(ch_guild,NAME_PALADIN,ch_pal);
	Info_AddChoice(ch_guild,"Нет гильдии",ch_none);
};

func void ch_guild_back()
{
	Info_ClearChoices(ch_guild);
};

func void ch_nov()
{
	Info_ClearChoices(ch_guild);
	other.guild = GIL_NOV;
	Npc_SetTrueGuild(other,GIL_NOV);
	CreateInvItem(hero,itar_nov_l);
	AI_EquipArmor(hero,itar_nov_l);
};

func void ch_kdf()
{
	Info_ClearChoices(ch_guild);
	other.guild = GIL_KDF;
	Npc_SetTrueGuild(other,GIL_KDF);
	CreateInvItem(hero,itar_kdf_l);
	AI_EquipArmor(hero,itar_kdf_l);
};

func void ch_sld()
{
	Info_ClearChoices(ch_guild);
	other.guild = GIL_SLD;
	Npc_SetTrueGuild(other,GIL_SLD);
	CreateInvItem(hero,itar_sld_m);
	AI_EquipArmor(hero,itar_sld_m);
};

func void ch_djg()
{
	Info_ClearChoices(ch_guild);
	other.guild = GIL_DJG;
	Npc_SetTrueGuild(other,GIL_DJG);
	CreateInvItem(hero,itar_djg_m);
	AI_EquipArmor(hero,itar_djg_m);
};

func void ch_mil()
{
	Info_ClearChoices(ch_guild);
	other.guild = GIL_MIL;
	Npc_SetTrueGuild(other,GIL_MIL);
	CreateInvItem(hero,itar_mil_l);
	AI_EquipArmor(hero,itar_mil_l);
};

func void ch_pal()
{
	Info_ClearChoices(ch_guild);
	other.guild = GIL_PAL;
	Npc_SetTrueGuild(other,GIL_PAL);
	CreateInvItem(hero,itar_pal_m);
	AI_EquipArmor(hero,itar_pal_m);
	b_setpaladinequipment();
};

func void ch_none()
{
	Info_ClearChoices(ch_guild);
	other.guild = GIL_NONE;
	Npc_SetTrueGuild(other,GIL_NONE);
	AI_UnequipArmor(hero);
};

func void b_setheroweapon()
{
	if(hero.level <= 6)
	{
		CreateInvItems(hero,itrw_crossbow_l_01,1);
	}
	else if(hero.level <= 12)
	{
		CreateInvItems(hero,itrw_bow_l_04,1);
		CreateInvItems(hero,itrw_crossbow_l_02,1);
	}
	else if(hero.level <= 18)
	{
		CreateInvItems(hero,itrw_bow_m_02,1);
		CreateInvItems(hero,itrw_crossbow_m_02,1);
	}
	else if(hero.level <= 24)
	{
		CreateInvItems(hero,itrw_bow_m_04,1);
		CreateInvItems(hero,itrw_crossbow_h_01,1);
	}
	else if(hero.level <= 30)
	{
		CreateInvItems(hero,itrw_bow_h_02,1);
		CreateInvItems(hero,itrw_crossbow_h_02,1);
	}
	else if(hero.level <= 36)
	{
		CreateInvItems(hero,itrw_bow_h_04,1);
		CreateInvItems(hero,itrw_bow_l_04,1);
	};
	AI_EquipBestMeleeWeapon(hero);
	AI_EquipBestRangedWeapon(hero);
};

func void b_setheroequipment()
{
	CreateInvItems(hero,itrw_arrow,100);
	CreateInvItems(hero,itrw_bolt,100);
	CreateInvItems(hero,itlstorch,30);
	CreateInvItems(hero,itmi_gold,500);
	CreateInvItems(hero,itpo_health_03,5);
	CreateInvItems(hero,itpo_mana_03,5);
	CreateInvItems(hero,itke_lockpick,30);
};

func void b_setkdfrunes()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1)
	{
		CreateInvItems(hero,itru_light,1);
		CreateInvItems(hero,itru_firebolt,1);
		CreateInvItems(hero,itru_lightheal,1);
		CreateInvItems(hero,itru_sumgobskel,1);
		CreateInvItems(hero,itru_zap,1);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2)
	{
		CreateInvItems(hero,itru_instantfireball,1);
		CreateInvItems(hero,itru_icebolt,1);
		CreateInvItems(hero,itru_sumwolf,1);
		CreateInvItems(hero,itru_windfist,1);
		CreateInvItems(hero,itru_sleep,1);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3)
	{
		CreateInvItems(hero,itru_mediumheal,1);
		CreateInvItems(hero,itru_firestorm,1);
		CreateInvItems(hero,itru_thunderball,1);
		CreateInvItems(hero,itru_sumskel,1);
		CreateInvItems(hero,itru_fear,1);
		CreateInvItems(hero,itru_icecube,1);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
	{
		CreateInvItems(hero,itru_sumgol,1);
		CreateInvItems(hero,itru_harmundead,1);
		CreateInvItems(hero,itru_lightningflash,1);
		CreateInvItems(hero,itru_chargefireball,1);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)
	{
		CreateInvItems(hero,itru_pyrokinesis,1);
		CreateInvItems(hero,itru_icewave,1);
		CreateInvItems(hero,itru_sumdemon,1);
		CreateInvItems(hero,itru_fullheal,1);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 6)
	{
		CreateInvItems(hero,itru_firerain,1);
		CreateInvItems(hero,itru_breathofdeath,1);
		CreateInvItems(hero,itru_massdeath,1);
		CreateInvItems(hero,itru_armyofdarkness,1);
		CreateInvItems(hero,itru_shrink,1);
	};
};


instance CH_LEVEL(C_INFO)
{
	npc = ch;
	condition = ch_level_condition;
	information = ch_level_info;
	description = "Повысить уровень";
	permanent = TRUE;
};


func int ch_level_condition()
{
	if(!Npc_KnowsInfo(hero,ch_vlipper) && (hero.level == 0))
	{
		return TRUE;
	};
};

func void ch_level_info()
{
	Info_ClearChoices(ch_level);
	Info_AddChoice(ch_level,DIALOG_BACK,ch_level_back);
	Info_AddChoice(ch_level,"Уровни  1 -  5",ch_level1);
	Info_AddChoice(ch_level,"Уровни  6 - 10",ch_level6);
	Info_AddChoice(ch_level,"Уровни 11 - 15",ch_level11);
	Info_AddChoice(ch_level,"Уровни 16 - 20",ch_level16);
	Info_AddChoice(ch_level,"Уровни 21 - 25",ch_level21);
	Info_AddChoice(ch_level,"Уровни 26 - 30",ch_level26);
};

func void ch_level26()
{
	Info_ClearChoices(ch_level);
	Info_AddChoice(ch_level,DIALOG_BACK,ch_level_back);
	Info_AddChoice(ch_level,"Уровень 26",ch_level_26);
	Info_AddChoice(ch_level,"Уровень 27",ch_level_27);
	Info_AddChoice(ch_level,"Уровень 28",ch_level_28);
	Info_AddChoice(ch_level,"Уровень 29",ch_level_29);
	Info_AddChoice(ch_level,"Уровень 30",ch_level_30);
};

func void ch_level21()
{
	Info_ClearChoices(ch_level);
	Info_AddChoice(ch_level,DIALOG_BACK,ch_level_back);
	Info_AddChoice(ch_level,"Уровень 21",ch_level_21);
	Info_AddChoice(ch_level,"Уровень 22",ch_level_22);
	Info_AddChoice(ch_level,"Уровень 23",ch_level_23);
	Info_AddChoice(ch_level,"Уровень 24",ch_level_24);
	Info_AddChoice(ch_level,"Уровень 25",ch_level_25);
};

func void ch_level16()
{
	Info_ClearChoices(ch_level);
	Info_AddChoice(ch_level,DIALOG_BACK,ch_level_back);
	Info_AddChoice(ch_level,"Уровень 16",ch_level_16);
	Info_AddChoice(ch_level,"Уровень 17",ch_level_17);
	Info_AddChoice(ch_level,"Уровень 18",ch_level_18);
	Info_AddChoice(ch_level,"Уровень 19",ch_level_19);
	Info_AddChoice(ch_level,"Уровень 20",ch_level_20);
};

func void ch_level11()
{
	Info_ClearChoices(ch_level);
	Info_AddChoice(ch_level,DIALOG_BACK,ch_level_back);
	Info_AddChoice(ch_level,"Уровень 11",ch_level_11);
	Info_AddChoice(ch_level,"Уровень 12",ch_level_12);
	Info_AddChoice(ch_level,"Уровень 13",ch_level_13);
	Info_AddChoice(ch_level,"Уровень 14",ch_level_14);
	Info_AddChoice(ch_level,"Уровень 15",ch_level_15);
};

func void ch_level6()
{
	Info_ClearChoices(ch_level);
	Info_AddChoice(ch_level,DIALOG_BACK,ch_level_back);
	Info_AddChoice(ch_level,"Уровень 6",ch_level_6);
	Info_AddChoice(ch_level,"Уровень 7",ch_level_7);
	Info_AddChoice(ch_level,"Уровень 8",ch_level_8);
	Info_AddChoice(ch_level,"Уровень 9",ch_level_9);
	Info_AddChoice(ch_level,"Уровень 10",ch_level_10);
};

func void ch_level1()
{
	Info_ClearChoices(ch_level);
	Info_AddChoice(ch_level,DIALOG_BACK,ch_level_back);
	Info_AddChoice(ch_level,"Уровень 1",ch_level_1);
	Info_AddChoice(ch_level,"Уровень 2",ch_level_2);
	Info_AddChoice(ch_level,"Уровень 3",ch_level_3);
	Info_AddChoice(ch_level,"Уровень 4",ch_level_4);
	Info_AddChoice(ch_level,"Уровень 5",ch_level_5);
};

func void ch_level_back()
{
	Info_ClearChoices(ch_level);
};

func void ch_level_1()
{
	Info_ClearChoices(ch_level);
	hero.level = 1;
	hero.attribute[ATR_HITPOINTS_MAX] = 52;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_2()
{
	Info_ClearChoices(ch_level);
	hero.level = 2;
	hero.attribute[ATR_HITPOINTS_MAX] = 64;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_3()
{
	Info_ClearChoices(ch_level);
	hero.level = 3;
	hero.attribute[ATR_HITPOINTS_MAX] = 76;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_4()
{
	Info_ClearChoices(ch_level);
	hero.level = 4;
	hero.attribute[ATR_HITPOINTS_MAX] = 88;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_5()
{
	Info_ClearChoices(ch_level);
	hero.level = 5;
	hero.attribute[ATR_HITPOINTS_MAX] = 100;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_6()
{
	Info_ClearChoices(ch_level);
	hero.level = 6;
	hero.attribute[ATR_HITPOINTS_MAX] = 112;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_7()
{
	Info_ClearChoices(ch_level);
	hero.level = 7;
	hero.attribute[ATR_HITPOINTS_MAX] = 124;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_8()
{
	Info_ClearChoices(ch_level);
	hero.level = 8;
	hero.attribute[ATR_HITPOINTS_MAX] = 136;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_9()
{
	Info_ClearChoices(ch_level);
	hero.level = 9;
	hero.attribute[ATR_HITPOINTS_MAX] = 148;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_10()
{
	Info_ClearChoices(ch_level);
	hero.level = 10;
	hero.attribute[ATR_HITPOINTS_MAX] = 160;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_11()
{
	Info_ClearChoices(ch_level);
	hero.level = 11;
	hero.attribute[ATR_HITPOINTS_MAX] = 172;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_12()
{
	Info_ClearChoices(ch_level);
	hero.level = 12;
	hero.attribute[ATR_HITPOINTS_MAX] = 184;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_13()
{
	Info_ClearChoices(ch_level);
	hero.level = 13;
	hero.attribute[ATR_HITPOINTS_MAX] = 196;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_14()
{
	Info_ClearChoices(ch_level);
	hero.level = 14;
	hero.attribute[ATR_HITPOINTS_MAX] = 208;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_15()
{
	Info_ClearChoices(ch_level);
	hero.level = 15;
	hero.attribute[ATR_HITPOINTS_MAX] = 220;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_16()
{
	Info_ClearChoices(ch_level);
	hero.level = 16;
	hero.attribute[ATR_HITPOINTS_MAX] = 232;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_17()
{
	Info_ClearChoices(ch_level);
	hero.level = 17;
	hero.attribute[ATR_HITPOINTS_MAX] = 244;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_18()
{
	Info_ClearChoices(ch_level);
	hero.level = 18;
	hero.attribute[ATR_HITPOINTS_MAX] = 256;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_19()
{
	Info_ClearChoices(ch_level);
	hero.level = 19;
	hero.attribute[ATR_HITPOINTS_MAX] = 268;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_20()
{
	Info_ClearChoices(ch_level);
	hero.level = 20;
	hero.attribute[ATR_HITPOINTS_MAX] = 280;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_21()
{
	Info_ClearChoices(ch_level);
	hero.level = 21;
	hero.attribute[ATR_HITPOINTS_MAX] = 292;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_22()
{
	Info_ClearChoices(ch_level);
	hero.level = 22;
	hero.attribute[ATR_HITPOINTS_MAX] = 304;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_23()
{
	Info_ClearChoices(ch_level);
	hero.level = 23;
	hero.attribute[ATR_HITPOINTS_MAX] = 316;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_24()
{
	Info_ClearChoices(ch_level);
	hero.level = 24;
	hero.attribute[ATR_HITPOINTS_MAX] = 328;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_25()
{
	Info_ClearChoices(ch_level);
	hero.level = 25;
	hero.attribute[ATR_HITPOINTS_MAX] = 340;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_26()
{
	Info_ClearChoices(ch_level);
	hero.level = 26;
	hero.attribute[ATR_HITPOINTS_MAX] = 352;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_27()
{
	Info_ClearChoices(ch_level);
	hero.level = 27;
	hero.attribute[ATR_HITPOINTS_MAX] = 364;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_28()
{
	Info_ClearChoices(ch_level);
	hero.level = 28;
	hero.attribute[ATR_HITPOINTS_MAX] = 376;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_29()
{
	Info_ClearChoices(ch_level);
	hero.level = 29;
	hero.attribute[ATR_HITPOINTS_MAX] = 388;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_30()
{
	Info_ClearChoices(ch_level);
	hero.level = 30;
	hero.attribute[ATR_HITPOINTS_MAX] = 400;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};


instance DIA_CH_ATTRIBUTE(C_INFO)
{
	npc = ch;
	nr = 1;
	condition = dia_ch_attribute_condition;
	information = dia_ch_attribute_info;
	permanent = TRUE;
	description = "Повысить характеристики";
};


func int dia_ch_attribute_condition()
{
	if((hero.level > 0) || Npc_KnowsInfo(hero,ch_vlipper))
	{
		return TRUE;
	};
};

func void dia_ch_attribute_info()
{
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,DIALOG_BACK,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,"Повысить силу",dia_ch_attribute_str);
	Info_AddChoice(dia_ch_attribute,"Повысить ловкость",dia_ch_attribute_dex);
	Info_AddChoice(dia_ch_attribute,"Повысить ману",dia_ch_attribute_mana);
};

func void dia_ch_attribute_back()
{
	Info_ClearChoices(dia_ch_attribute);
};

func void dia_ch_attribute_str()
{
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,DIALOG_BACK,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ch_strength_str_1);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ch_strength_str_5);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNSTR10,b_getlearncostattribute(other,ATR_STRENGTH) * 10),dia_ch_strength_str_10);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNSTR20,b_getlearncostattribute(other,ATR_STRENGTH) * 20),dia_ch_strength_str_20);
};

func void dia_ch_attribute_dex()
{
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,DIALOG_BACK,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_ch_dex_1);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_ch_dex_5);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNDEX10,b_getlearncostattribute(other,ATR_DEXTERITY) * 10),dia_ch_dex_10);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNDEX20,b_getlearncostattribute(other,ATR_DEXTERITY) * 20),dia_ch_dex_20);
};

func void dia_ch_attribute_mana()
{
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,DIALOG_BACK,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_ch_mana_1);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_ch_mana_5);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNMANA10,b_getlearncostattribute(other,ATR_MANA_MAX) * 10),dia_ch_mana_10);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNMANA20,b_getlearncostattribute(other,ATR_MANA_MAX) * 20),dia_ch_mana_20);
};

func void dia_ch_strength_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,100);
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,DIALOG_BACK,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ch_strength_str_1);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ch_strength_str_5);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNSTR10,b_getlearncostattribute(other,ATR_STRENGTH) * 10),dia_ch_strength_str_10);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNSTR20,b_getlearncostattribute(other,ATR_STRENGTH) * 20),dia_ch_strength_str_20);
};

func void dia_ch_strength_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,100);
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,DIALOG_BACK,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ch_strength_str_1);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ch_strength_str_5);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNSTR10,b_getlearncostattribute(other,ATR_STRENGTH) * 10),dia_ch_strength_str_10);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNSTR20,b_getlearncostattribute(other,ATR_STRENGTH) * 20),dia_ch_strength_str_20);
};

func void dia_ch_strength_str_10()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,10,100);
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,DIALOG_BACK,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ch_strength_str_1);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ch_strength_str_5);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNSTR10,b_getlearncostattribute(other,ATR_STRENGTH) * 10),dia_ch_strength_str_10);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNSTR20,b_getlearncostattribute(other,ATR_STRENGTH) * 20),dia_ch_strength_str_20);
};

func void dia_ch_strength_str_20()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,20,100);
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,DIALOG_BACK,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ch_strength_str_1);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ch_strength_str_5);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNSTR10,b_getlearncostattribute(other,ATR_STRENGTH) * 10),dia_ch_strength_str_10);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNSTR20,b_getlearncostattribute(other,ATR_STRENGTH) * 20),dia_ch_strength_str_20);
};

func void dia_ch_dex_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,100);
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,DIALOG_BACK,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_ch_dex_1);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_ch_dex_5);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNDEX10,b_getlearncostattribute(other,ATR_DEXTERITY) * 10),dia_ch_dex_10);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNDEX20,b_getlearncostattribute(other,ATR_DEXTERITY) * 20),dia_ch_dex_20);
};

func void dia_ch_dex_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,100);
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,DIALOG_BACK,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_ch_dex_1);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_ch_dex_5);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNDEX10,b_getlearncostattribute(other,ATR_DEXTERITY) * 10),dia_ch_dex_10);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNDEX20,b_getlearncostattribute(other,ATR_DEXTERITY) * 20),dia_ch_dex_20);
};

func void dia_ch_dex_10()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,10,100);
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,DIALOG_BACK,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_ch_dex_1);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_ch_dex_5);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNDEX10,b_getlearncostattribute(other,ATR_DEXTERITY) * 10),dia_ch_dex_10);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNDEX20,b_getlearncostattribute(other,ATR_DEXTERITY) * 20),dia_ch_dex_20);
};

func void dia_ch_dex_20()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,20,100);
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,DIALOG_BACK,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_ch_dex_1);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_ch_dex_5);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNDEX10,b_getlearncostattribute(other,ATR_DEXTERITY) * 10),dia_ch_dex_10);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNDEX20,b_getlearncostattribute(other,ATR_DEXTERITY) * 20),dia_ch_dex_20);
};

func void dia_ch_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,100);
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,DIALOG_BACK,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_ch_mana_1);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_ch_mana_5);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNMANA10,b_getlearncostattribute(other,ATR_MANA_MAX) * 10),dia_ch_mana_10);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNMANA20,b_getlearncostattribute(other,ATR_MANA_MAX) * 20),dia_ch_mana_20);
};

func void dia_ch_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,100);
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,DIALOG_BACK,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_ch_mana_1);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_ch_mana_5);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNMANA10,b_getlearncostattribute(other,ATR_MANA_MAX) * 10),dia_ch_mana_10);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNMANA20,b_getlearncostattribute(other,ATR_MANA_MAX) * 20),dia_ch_mana_20);
};

func void dia_ch_mana_10()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,10,100);
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,DIALOG_BACK,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_ch_mana_1);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_ch_mana_5);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNMANA10,b_getlearncostattribute(other,ATR_MANA_MAX) * 10),dia_ch_mana_10);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNMANA20,b_getlearncostattribute(other,ATR_MANA_MAX) * 20),dia_ch_mana_20);
};

func void dia_ch_mana_20()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,20,100);
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,DIALOG_BACK,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_ch_mana_1);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_ch_mana_5);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNMANA10,b_getlearncostattribute(other,ATR_MANA_MAX) * 10),dia_ch_mana_10);
	Info_AddChoice(dia_ch_attribute,b_buildlearnstring(PRINT_LEARNMANA20,b_getlearncostattribute(other,ATR_MANA_MAX) * 20),dia_ch_mana_20);
};


instance CH_TRAINING_TALENTE(C_INFO)
{
	npc = ch;
	condition = ch_training_talente_condition;
	information = ch_training_talente_info;
	important = FALSE;
	permanent = TRUE;
	description = "Изучить навыки";
};


func int ch_training_talente_condition()
{
	if((hero.level > 0) || Npc_KnowsInfo(hero,ch_vlipper))
	{
		return TRUE;
	};
};

func void ch_training_talente_info()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,"Боевые навыки",ch_training_talente_fight);
	Info_AddChoice(ch_training_talente,"Круги магии",ch_training_talente_circles);
	Info_AddChoice(ch_training_talente,"Воровские навыки",ch_training_talente_thief);
	Info_AddChoice(ch_training_talente,"Кузнечное дело",ch_training_talente_smith);
	Info_AddChoice(ch_training_talente,"Алхимия",ch_training_talente_alchimie);
	Info_AddChoice(ch_training_talente,"Создание рун",ch_training_talente_runes);
	Info_AddChoice(ch_training_talente,"Трофеи животных",ch_training_talente_trophy);
};

func void ch_training_talente_back()
{
	Info_ClearChoices(ch_training_talente);
};

func void ch_training_talente_fight()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),ch_training_combat_1h_1);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),ch_training_combat_1h_5);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN1H10,b_getlearncosttalent(other,NPC_TALENT_1H) * 10),ch_training_combat_1h_10);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN1H20,b_getlearncosttalent(other,NPC_TALENT_1H) * 20),ch_training_combat_1h_20);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),ch_training_combat_2h_1);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),ch_training_combat_2h_5);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN2H10,b_getlearncosttalent(other,NPC_TALENT_2H) * 10),ch_training_combat_2h_10);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN2H20,b_getlearncosttalent(other,NPC_TALENT_2H) * 20),ch_training_combat_2h_20);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW)),ch_training_combat_bow_1);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW) * 5),ch_training_combat_bow_5);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNBOW10,b_getlearncosttalent(other,NPC_TALENT_BOW) * 10),ch_training_combat_bow_10);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNBOW20,b_getlearncosttalent(other,NPC_TALENT_BOW) * 20),ch_training_combat_bow_20);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW)),ch_training_combat_crossbow_1);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 5),ch_training_combat_crossbow_5);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNCROSSBOW10,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 10),ch_training_combat_crossbow_10);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNCROSSBOW20,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 20),ch_training_combat_crossbow_20);
};

func void ch_training_talente_circles()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 1)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("1-й круг магии",b_getlearncosttalent(other,NPC_TALENT_MAGE)),ch_training_mage_circle_1);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("2-й круг магии",b_getlearncosttalent(other,NPC_TALENT_MAGE)),ch_training_mage_circle_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("3-й круг магии",b_getlearncosttalent(other,NPC_TALENT_MAGE)),ch_training_mage_circle_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 3)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("4-й круг магии",b_getlearncosttalent(other,NPC_TALENT_MAGE)),ch_training_mage_circle_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("5-й круг магии",b_getlearncosttalent(other,NPC_TALENT_MAGE)),ch_training_mage_circle_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("6-й круг магии",b_getlearncosttalent(other,NPC_TALENT_MAGE)),ch_training_mage_circle_6);
	};
};

func void ch_training_talente_thief()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Отмычки",b_getlearncosttalent(other,NPC_TALENT_PICKLOCK)),ch_training_thief_picklock);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Воровство",b_getlearncosttalent(other,NPC_TALENT_PICKPOCKET)),ch_training_thief_pickpocket);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Подкрадывание",b_getlearncosttalent(other,NPC_TALENT_SNEAK)),ch_training_thief_sneak);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_ACROBAT) == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Акробатика",b_getlearncosttalent(other,NPC_TALENT_ACROBAT)),ch_training_thief_acrobat);
	};
};

func void ch_training_talente_smith()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	if(PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_ITMW_1H_COMMON_01,b_getlearncosttalent(other,NPC_TALENT_SMITH)),ch_training_smith_common);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_01] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_01,b_getlearncosttalent(other,NPC_TALENT_SMITH)),ch_training_smith_1hspecial1);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_01] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_01,b_getlearncosttalent(other,NPC_TALENT_SMITH)),ch_training_smith_2hspecial1);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_02] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_02,b_getlearncosttalent(other,NPC_TALENT_SMITH)),ch_training_smith_1hspecial2);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_02] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_02,b_getlearncosttalent(other,NPC_TALENT_SMITH)),ch_training_smith_2hspecial2);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_03] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_03,b_getlearncosttalent(other,NPC_TALENT_SMITH)),ch_training_smith_1hspecial3);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_03] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_03,b_getlearncosttalent(other,NPC_TALENT_SMITH)),ch_training_smith_2hspecial3);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_04] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_04,b_getlearncosttalent(other,NPC_TALENT_SMITH)),ch_training_smith_1hspecial4);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_04] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_04,b_getlearncosttalent(other,NPC_TALENT_SMITH)),ch_training_smith_2hspecial4);
	};
};

func void ch_training_talente_alchimie()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Лечебная эссенция",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),ch_training_alchemy_potion_health_01);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Лечебный экстракт",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),ch_training_alchemy_potion_health_02);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Лечебный эликсир",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),ch_training_alchemy_potion_health_03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Эссенция маны",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),ch_training_alchemy_potion_mana_01);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Экстракт маны",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),ch_training_alchemy_potion_mana_02);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Эликсир маны",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),ch_training_alchemy_potion_mana_03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_SPEED] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Зелье ускорения",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),ch_training_alchemy_potion_speed);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Эликсир силы",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),ch_training_alchemy_potion_perm_str);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Эликсир ловкости",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),ch_training_alchemy_potion_perm_dex);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Эликсир духа",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),ch_training_alchemy_potion_perm_mana);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Эликсир жизни",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),ch_training_alchemy_potion_perm_health);
	};
	if(PLAYER_TALENT_ALCHEMY[CHARGE_INNOSEYE] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Зарядка Глаза Инноса",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),ch_training_alchemy_charge_innoseye);
	};
};

func void ch_training_talente_runes()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,"Руны паладинов",ch_training_runen_paladin);
	Info_AddChoice(ch_training_talente,"Руны 1-го круга",ch_training_runen_circle_1);
	Info_AddChoice(ch_training_talente,"Руны 2-го круга",ch_training_runen_circle_2);
	Info_AddChoice(ch_training_talente,"Руны 3-го круга",ch_training_runen_circle_3);
	Info_AddChoice(ch_training_talente,"Руны 4-го круга",ch_training_runen_circle_4);
	Info_AddChoice(ch_training_talente,"Руны 5-го круга",ch_training_runen_circle_5);
	Info_AddChoice(ch_training_talente,"Руны 6-го круга",ch_training_runen_circle_6);
};

func void ch_training_talente_trophy()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Удаление зубов",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),ch_training_trophys_teeth);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Удаление когтей",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),ch_training_trophys_claws);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Снятие шкур",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),ch_training_trophys_fur);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_HEART] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Удаление сердца",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),ch_training_trophys_heart);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Рог мракориса",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),ch_training_trophys_shadowhorn);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FIRETONGUE] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Огненный язык",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),ch_training_trophys_firetongue);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Жало кровавой мухи",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),ch_training_trophys_bfsting);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Крылья кровавой мухи",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),ch_training_trophys_bfwing);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CRAWLERPLATE] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Удаление панцирей краулеров",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),ch_training_trophys_crawlerplate);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_MANDIBLES] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Удаление мандибул",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),ch_training_trophys_mandibles);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRGSNAPPERHORN] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Рог драконьего снеппера",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),ch_training_trophys_drgsnapperhorn);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Удаление чешуи драконов",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),ch_training_trophys_dragonscale);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring("Сбор крови дракона",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),ch_training_trophys_dragonblood);
	};
};

func void ch_training_combat_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,100);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),ch_training_combat_1h_1);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),ch_training_combat_1h_5);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN1H10,b_getlearncosttalent(other,NPC_TALENT_1H) * 10),ch_training_combat_1h_10);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN1H20,b_getlearncosttalent(other,NPC_TALENT_1H) * 20),ch_training_combat_1h_20);
};

func void ch_training_combat_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,100);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),ch_training_combat_1h_1);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),ch_training_combat_1h_5);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN1H10,b_getlearncosttalent(other,NPC_TALENT_1H) * 10),ch_training_combat_1h_10);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN1H20,b_getlearncosttalent(other,NPC_TALENT_1H) * 20),ch_training_combat_1h_20);
};

func void ch_training_combat_1h_10()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,10,100);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),ch_training_combat_1h_1);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),ch_training_combat_1h_5);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN1H10,b_getlearncosttalent(other,NPC_TALENT_1H) * 10),ch_training_combat_1h_10);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN1H20,b_getlearncosttalent(other,NPC_TALENT_1H) * 20),ch_training_combat_1h_20);
};

func void ch_training_combat_1h_20()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,20,100);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),ch_training_combat_1h_1);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),ch_training_combat_1h_5);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN1H10,b_getlearncosttalent(other,NPC_TALENT_1H) * 10),ch_training_combat_1h_10);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN1H20,b_getlearncosttalent(other,NPC_TALENT_1H) * 20),ch_training_combat_1h_20);
};

func void ch_training_combat_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,100);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),ch_training_combat_2h_1);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),ch_training_combat_2h_5);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN2H10,b_getlearncosttalent(other,NPC_TALENT_2H) * 10),ch_training_combat_2h_10);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN2H20,b_getlearncosttalent(other,NPC_TALENT_2H) * 20),ch_training_combat_2h_20);
};

func void ch_training_combat_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,100);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),ch_training_combat_2h_1);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),ch_training_combat_2h_5);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN2H10,b_getlearncosttalent(other,NPC_TALENT_2H) * 10),ch_training_combat_2h_10);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN2H20,b_getlearncosttalent(other,NPC_TALENT_2H) * 20),ch_training_combat_2h_20);
};

func void ch_training_combat_2h_10()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,10,100);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),ch_training_combat_2h_1);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),ch_training_combat_2h_5);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN2H10,b_getlearncosttalent(other,NPC_TALENT_2H) * 10),ch_training_combat_2h_10);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN2H20,b_getlearncosttalent(other,NPC_TALENT_2H) * 20),ch_training_combat_2h_20);
};

func void ch_training_combat_2h_20()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,20,100);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),ch_training_combat_2h_1);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),ch_training_combat_2h_5);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN2H10,b_getlearncosttalent(other,NPC_TALENT_2H) * 10),ch_training_combat_2h_10);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARN2H20,b_getlearncosttalent(other,NPC_TALENT_2H) * 20),ch_training_combat_2h_20);
};

func void ch_training_combat_bow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,100);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW)),ch_training_combat_bow_1);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW) * 5),ch_training_combat_bow_5);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNBOW10,b_getlearncosttalent(other,NPC_TALENT_BOW) * 10),ch_training_combat_bow_10);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNBOW20,b_getlearncosttalent(other,NPC_TALENT_BOW) * 20),ch_training_combat_bow_20);
};

func void ch_training_combat_bow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,100);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW)),ch_training_combat_bow_1);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW) * 5),ch_training_combat_bow_5);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNBOW10,b_getlearncosttalent(other,NPC_TALENT_BOW) * 10),ch_training_combat_bow_10);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNBOW20,b_getlearncosttalent(other,NPC_TALENT_BOW) * 20),ch_training_combat_bow_20);
};

func void ch_training_combat_bow_10()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,10,100);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW)),ch_training_combat_bow_1);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW) * 5),ch_training_combat_bow_5);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNBOW10,b_getlearncosttalent(other,NPC_TALENT_BOW) * 10),ch_training_combat_bow_10);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNBOW20,b_getlearncosttalent(other,NPC_TALENT_BOW) * 20),ch_training_combat_bow_20);
};

func void ch_training_combat_bow_20()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,20,100);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW)),ch_training_combat_bow_1);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW) * 5),ch_training_combat_bow_5);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNBOW10,b_getlearncosttalent(other,NPC_TALENT_BOW) * 10),ch_training_combat_bow_10);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNBOW20,b_getlearncosttalent(other,NPC_TALENT_BOW) * 20),ch_training_combat_bow_20);
};

func void ch_training_combat_crossbow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,1,100);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW)),ch_training_combat_crossbow_1);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 5),ch_training_combat_crossbow_5);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNCROSSBOW10,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 10),ch_training_combat_crossbow_10);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNCROSSBOW20,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 20),ch_training_combat_crossbow_20);
};

func void ch_training_combat_crossbow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,5,100);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW)),ch_training_combat_crossbow_1);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 5),ch_training_combat_crossbow_5);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNCROSSBOW10,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 10),ch_training_combat_crossbow_10);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNCROSSBOW20,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 20),ch_training_combat_crossbow_20);
};

func void ch_training_combat_crossbow_10()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,10,100);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW)),ch_training_combat_crossbow_1);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 5),ch_training_combat_crossbow_5);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNCROSSBOW10,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 10),ch_training_combat_crossbow_10);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNCROSSBOW20,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 20),ch_training_combat_crossbow_20);
};

func void ch_training_combat_crossbow_20()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,20,100);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW)),ch_training_combat_crossbow_1);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 5),ch_training_combat_crossbow_5);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNCROSSBOW10,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 10),ch_training_combat_crossbow_10);
	Info_AddChoice(ch_training_talente,b_buildlearnstring(PRINT_LEARNCROSSBOW20,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 20),ch_training_combat_crossbow_20);
};

func void ch_training_mage_circle_1()
{
	Info_ClearChoices(ch_training_talente);
	b_teachmagiccircle(self,other,1);
	b_setkdfrunes();
};

func void ch_training_mage_circle_2()
{
	Info_ClearChoices(ch_training_talente);
	b_teachmagiccircle(self,other,2);
	b_setkdfrunes();
};

func void ch_training_mage_circle_3()
{
	Info_ClearChoices(ch_training_talente);
	b_teachmagiccircle(self,other,3);
	b_setkdfrunes();
};

func void ch_training_mage_circle_4()
{
	Info_ClearChoices(ch_training_talente);
	b_teachmagiccircle(self,other,4);
	b_setkdfrunes();
};

func void ch_training_mage_circle_5()
{
	Info_ClearChoices(ch_training_talente);
	b_teachmagiccircle(self,other,5);
	b_setkdfrunes();
};

func void ch_training_mage_circle_6()
{
	Info_ClearChoices(ch_training_talente);
	b_teachmagiccircle(self,other,6);
	b_setkdfrunes();
};

func void ch_training_thief_picklock()
{
	Info_ClearChoices(ch_training_talente);
	b_teachthieftalent(self,other,NPC_TALENT_PICKLOCK);
};

func void ch_training_thief_pickpocket()
{
	Info_ClearChoices(ch_training_talente);
	b_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET);
};

func void ch_training_thief_sneak()
{
	Info_ClearChoices(ch_training_talente);
	b_teachthieftalent(self,other,NPC_TALENT_SNEAK);
};

func void ch_training_thief_acrobat()
{
	Info_ClearChoices(ch_training_talente);
	b_teachthieftalent(self,other,NPC_TALENT_ACROBAT);
};

func void ch_training_smith_common()
{
	b_teachplayertalentsmith(self,other,WEAPON_COMMON);
};

func void ch_training_smith_1hspecial1()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_01);
};

func void ch_training_smith_2hspecial1()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_01);
};

func void ch_training_smith_1hspecial2()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_02);
};

func void ch_training_smith_2hspecial2()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_02);
};

func void ch_training_smith_1hspecial3()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_03);
};

func void ch_training_smith_2hspecial3()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_03);
};

func void ch_training_smith_1hspecial4()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_04);
};

func void ch_training_smith_2hspecial4()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_04);
};

func void ch_training_alchemy_potion_health_01()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_01);
};

func void ch_training_alchemy_potion_health_02()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_02);
};

func void ch_training_alchemy_potion_health_03()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_03);
};

func void ch_training_alchemy_potion_mana_01()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_01);
};

func void ch_training_alchemy_potion_mana_02()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_02);
};

func void ch_training_alchemy_potion_mana_03()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_03);
};

func void ch_training_alchemy_potion_speed()
{
	b_teachplayertalentalchemy(self,other,POTION_SPEED);
};

func void ch_training_alchemy_potion_perm_str()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_STR);
};

func void ch_training_alchemy_potion_perm_dex()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_DEX);
};

func void ch_training_alchemy_potion_perm_mana()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_MANA);
};

func void ch_training_alchemy_potion_perm_health()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_HEALTH);
};

func void ch_training_alchemy_charge_innoseye()
{
	b_teachplayertalentalchemy(self,other,CHARGE_INNOSEYE);
};

func void ch_training_runen_paladin()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	if(PLAYER_TALENT_RUNES[SPL_PALLIGHT] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_PALLIGHT,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_paladin_spl_pallight);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALLIGHTHEAL] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_PALLIGHTHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_paladin_spl_pallightheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALHOLYBOLT] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_PALHOLYBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_paladin_spl_palholybolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALMEDIUMHEAL] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_PALMEDIUMHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_paladin_spl_palmediumheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALREPELEVIL] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_PALREPELEVIL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_paladin_spl_palrepelevil);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALFULLHEAL] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_PALFULLHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_paladin_spl_palfullheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALDESTROYEVIL] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_PALDESTROYEVIL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_paladin_spl_paldestroyevil);
	};
};

func void ch_training_runen_paladin_spl_pallight()
{
	b_teachplayertalentrunes(self,other,SPL_PALLIGHT);
};

func void ch_training_runen_paladin_spl_pallightheal()
{
	b_teachplayertalentrunes(self,other,SPL_PALLIGHTHEAL);
};

func void ch_training_runen_paladin_spl_palholybolt()
{
	b_teachplayertalentrunes(self,other,SPL_PALHOLYBOLT);
};

func void ch_training_runen_paladin_spl_palmediumheal()
{
	b_teachplayertalentrunes(self,other,SPL_PALMEDIUMHEAL);
};

func void ch_training_runen_paladin_spl_palrepelevil()
{
	b_teachplayertalentrunes(self,other,SPL_PALREPELEVIL);
};

func void ch_training_runen_paladin_spl_palfullheal()
{
	b_teachplayertalentrunes(self,other,SPL_PALFULLHEAL);
};

func void ch_training_runen_paladin_spl_paldestroyevil()
{
	b_teachplayertalentrunes(self,other,SPL_PALDESTROYEVIL);
};

func void ch_training_runen_circle_1()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	if(PLAYER_TALENT_RUNES[SPL_LIGHT] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_LIGHT,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_1_spl_light);
	};
	if(PLAYER_TALENT_RUNES[SPL_FIREBOLT] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_FIREBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_1_spl_firebolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_ZAP] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_ZAP,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_2_spl_zap);
	};
	if(PLAYER_TALENT_RUNES[SPL_LIGHTHEAL] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_LIGHTHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_1_spl_lightheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_SUMMONGOBLINSKELETON] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_SUMMONGOBLINSKELETON,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_1_spl_summongoblinskeleton);
	};
};

func void ch_training_runen_circle_1_spl_light()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHT);
};

func void ch_training_runen_circle_1_spl_firebolt()
{
	b_teachplayertalentrunes(self,other,SPL_FIREBOLT);
};

func void ch_training_runen_circle_1_spl_icebolt()
{
	b_teachplayertalentrunes(self,other,SPL_ZAP);
};

func void ch_training_runen_circle_1_spl_lightheal()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHTHEAL);
};

func void ch_training_runen_circle_1_spl_summongoblinskeleton()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONGOBLINSKELETON);
};

func void ch_training_runen_circle_2()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	if(PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_INSTANTFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_2_spl_instantfireball);
	};
	if(PLAYER_TALENT_RUNES[SPL_ICEBOLT] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_ICEBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_1_spl_icebolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_SUMMONWOLF] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_SUMMONWOLF,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_2_spl_summonwolf);
	};
	if(PLAYER_TALENT_RUNES[SPL_WINDFIST] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_WINDFIST,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_2_spl_windfist);
	};
	if(PLAYER_TALENT_RUNES[SPL_SLEEP] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_SLEEP,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_2_spl_sleep);
	};
};

func void ch_training_runen_circle_2_spl_instantfireball()
{
	b_teachplayertalentrunes(self,other,SPL_INSTANTFIREBALL);
};

func void ch_training_runen_circle_2_spl_zap()
{
	b_teachplayertalentrunes(self,other,SPL_ICEBOLT);
};

func void ch_training_runen_circle_2_spl_summonwolf()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONWOLF);
};

func void ch_training_runen_circle_2_spl_windfist()
{
	b_teachplayertalentrunes(self,other,SPL_WINDFIST);
};

func void ch_training_runen_circle_2_spl_sleep()
{
	b_teachplayertalentrunes(self,other,SPL_SLEEP);
};

func void ch_training_runen_circle_3()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	if(PLAYER_TALENT_RUNES[SPL_MEDIUMHEAL] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_MEDIUMHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_3_spl_mediumheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_CHARGEZAP] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_CHARGEZAP,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_4_spl_thunderball);
	};
	if(PLAYER_TALENT_RUNES[SPL_FIRESTORM] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_FIRESTORM,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_5_spl_firestorm);
	};
	if(PLAYER_TALENT_RUNES[SPL_SUMMONSKELETON] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_SUMMONSKELETON,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_3_spl_summonskeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_FEAR] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_FEAR,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_3_spl_fear);
	};
	if(PLAYER_TALENT_RUNES[SPL_ICECUBE] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_ICECUBE,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_3_spl_icecube);
	};
};

func void ch_training_runen_circle_3_spl_mediumheal()
{
	b_teachplayertalentrunes(self,other,SPL_MEDIUMHEAL);
};

func void ch_training_runen_circle_3_spl_lightningflash()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHTNINGFLASH);
};

func void ch_training_runen_circle_3_spl_chargefireball()
{
	b_teachplayertalentrunes(self,other,SPL_CHARGEFIREBALL);
};

func void ch_training_runen_circle_3_spl_summonskeleton()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONSKELETON);
};

func void ch_training_runen_circle_3_spl_fear()
{
	b_teachplayertalentrunes(self,other,SPL_FEAR);
};

func void ch_training_runen_circle_3_spl_icecube()
{
	b_teachplayertalentrunes(self,other,SPL_ICECUBE);
};

func void ch_training_runen_circle_4()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	if(PLAYER_TALENT_RUNES[SPL_SUMMONGOLEM] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_SUMMONGOLEM,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_4_spl_summongolem);
	};
	if(PLAYER_TALENT_RUNES[SPL_DESTROYUNDEAD] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_DESTROYUNDEAD,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_4_spl_destroyundead);
	};
	if(PLAYER_TALENT_RUNES[SPL_LIGHTNINGFLASH] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_LIGHTNINGFLASH,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_3_spl_lightningflash);
	};
	if(PLAYER_TALENT_RUNES[SPL_CHARGEFIREBALL] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_CHARGEFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_3_spl_chargefireball);
	};
};

func void ch_training_runen_circle_4_spl_thunderball()
{
	b_teachplayertalentrunes(self,other,SPL_CHARGEZAP);
};

func void ch_training_runen_circle_4_spl_summongolem()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONGOLEM);
};

func void ch_training_runen_circle_4_spl_destroyundead()
{
	b_teachplayertalentrunes(self,other,SPL_DESTROYUNDEAD);
};

func void ch_training_runen_circle_4_spl_pyrokinesis()
{
	b_teachplayertalentrunes(self,other,SPL_PYROKINESIS);
};

func void ch_training_runen_circle_5()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	if(PLAYER_TALENT_RUNES[SPL_ICEWAVE] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_ICEWAVE,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_5_spl_icewave);
	};
	if(PLAYER_TALENT_RUNES[SPL_SUMMONDEMON] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_SUMMONDEMON,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_5_spl_summondemon);
	};
	if(PLAYER_TALENT_RUNES[SPL_FULLHEAL] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_FULLHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_5_spl_fullheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PYROKINESIS] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_PYROKINESIS,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_4_spl_pyrokinesis);
	};
};

func void ch_training_runen_circle_5_spl_firestorm()
{
	b_teachplayertalentrunes(self,other,SPL_FIRESTORM);
};

func void ch_training_runen_circle_5_spl_icewave()
{
	b_teachplayertalentrunes(self,other,SPL_ICEWAVE);
};

func void ch_training_runen_circle_5_spl_summondemon()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONDEMON);
};

func void ch_training_runen_circle_5_spl_fullheal()
{
	b_teachplayertalentrunes(self,other,SPL_FULLHEAL);
};

func void ch_training_runen_circle_6()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,DIALOG_BACK,ch_training_talente_back);
	if(PLAYER_TALENT_RUNES[SPL_FIRERAIN] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_FIRERAIN,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_6_spl_firerain);
	};
	if(PLAYER_TALENT_RUNES[SPL_BREATHOFDEATH] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_BREATHOFDEATH,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_6_spl_breathofdeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_MASSDEATH] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_MASSDEATH,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_6_spl_massdeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_ARMYOFDARKNESS] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_ARMYOFDARKNESS,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_6_spl_armyofdarkness);
	};
	if(PLAYER_TALENT_RUNES[SPL_SHRINK] == FALSE)
	{
		Info_AddChoice(ch_training_talente,b_buildlearnstring(NAME_SPL_SHRINK,b_getlearncosttalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_6_spl_shrink);
	};
};

func void ch_training_runen_circle_6_spl_firerain()
{
	b_teachplayertalentrunes(self,other,SPL_FIRERAIN);
};

func void ch_training_runen_circle_6_spl_breathofdeath()
{
	b_teachplayertalentrunes(self,other,SPL_BREATHOFDEATH);
};

func void ch_training_runen_circle_6_spl_massdeath()
{
	b_teachplayertalentrunes(self,other,SPL_MASSDEATH);
};

func void ch_training_runen_circle_6_spl_armyofdarkness()
{
	b_teachplayertalentrunes(self,other,SPL_ARMYOFDARKNESS);
};

func void ch_training_runen_circle_6_spl_shrink()
{
	b_teachplayertalentrunes(self,other,SPL_SHRINK);
};

func void ch_training_trophys_back()
{
	Info_ClearChoices(ch_training_talente);
};

func void ch_training_trophys_teeth()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH);
};

func void ch_training_trophys_claws()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS);
};

func void ch_training_trophys_fur()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR);
};

func void ch_training_trophys_heart()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_HEART);
};

func void ch_training_trophys_shadowhorn()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_SHADOWHORN);
};

func void ch_training_trophys_firetongue()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FIRETONGUE);
};

func void ch_training_trophys_bfsting()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFWING);
};

func void ch_training_trophys_bfwing()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFSTING);
};

func void ch_training_trophys_crawlerplate()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_MANDIBLES);
};

func void ch_training_trophys_mandibles()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CRAWLERPLATE);
};

func void ch_training_trophys_drgsnapperhorn()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRGSNAPPERHORN);
};

func void ch_training_trophys_dragonscale()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRAGONSCALE);
};

func void ch_training_trophys_dragonblood()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRAGONBLOOD);
};

