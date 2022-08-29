
func void potionalchemy_s1()
{
	var C_NPC her;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_POTIONALCHEMY;
		AI_ProcessInfos(self);
	};
};


instance PC_POTIONALCHEMY_END(C_INFO)
{
	npc = pc_hero;
	nr = 999;
	condition = pc_potionalchemy_end_condition;
	information = pc_potionalchemy_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int pc_potionalchemy_end_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY)
	{
		return TRUE;
	};
};

func void pc_potionalchemy_end_info()
{
	CreateInvItems(self,itmi_flask,1);
	b_endproductiondialog();
};


instance PC_CHARGE_INNOSEYE(C_INFO)
{
	nr = 1;
	npc = pc_hero;
	condition = pc_charge_innoseye_condition;
	information = pc_charge_innoseye_info;
	permanent = TRUE;
	description = "«ар€дить √лаз »нноса";
};


func int pc_charge_innoseye_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[CHARGE_INNOSEYE] == TRUE) && (Npc_HasItems(hero,itmi_innoseye_discharged_mis) >= 1))
	{
		return TRUE;
	};
};

func void pc_charge_innoseye_info()
{
	if(((Npc_HasItems(hero,itat_icedragonheart) >= 1) || (Npc_HasItems(hero,itat_rockdragonheart) >= 1) || (Npc_HasItems(hero,itat_firedragonheart) >= 1) || (Npc_HasItems(hero,itat_swampdragonheart) >= 1)) && (Npc_HasItems(hero,itmi_innoseye_discharged_mis) >= 1))
	{
		if(Npc_HasItems(hero,itat_swampdragonheart) >= 1)
		{
			Npc_RemoveInvItems(hero,itat_swampdragonheart,1);
		}
		else if(Npc_HasItems(hero,itat_rockdragonheart) >= 1)
		{
			Npc_RemoveInvItems(hero,itat_rockdragonheart,1);
		}
		else if(Npc_HasItems(hero,itat_firedragonheart) >= 1)
		{
			Npc_RemoveInvItems(hero,itat_firedragonheart,1);
		}
		else if(Npc_HasItems(hero,itat_icedragonheart) >= 1)
		{
			Npc_RemoveInvItems(hero,itat_icedragonheart,1);
		};
		Npc_RemoveInvItems(hero,itmi_innoseye_discharged_mis,1);
		CreateInvItems(hero,itmi_innoseye_mis,1);
		Print(PRINT_ALCHEMYSUCCESSINNOSEYE);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_MANA_01(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_mana_01_condition;
	information = pc_itpo_mana_01_info;
	permanent = TRUE;
	description = "Ёссенци€ маны (2 огненных крапивы и 1 луговой горец)";
};


func int pc_itpo_mana_01_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_mana_01_info()
{
	if((Npc_HasItems(hero,itpl_mana_herb_01) >= 2) && (Npc_HasItems(hero,itpl_temp_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpl_mana_herb_01,2);
		Npc_RemoveInvItems(hero,itpl_temp_herb,1);
		CreateInvItems(hero,itpo_mana_01,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_MANA_02(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_mana_02_condition;
	information = pc_itpo_mana_02_info;
	permanent = TRUE;
	description = "Ёкстракт маны (2 огненных травы и 1 луговой горец) ";
};


func int pc_itpo_mana_02_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_mana_02_info()
{
	if((Npc_HasItems(hero,itpl_mana_herb_02) >= 2) && (Npc_HasItems(hero,itpl_temp_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpl_mana_herb_02,2);
		Npc_RemoveInvItems(hero,itpl_temp_herb,1);
		CreateInvItems(hero,itpo_mana_02,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_MANA_03(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_mana_03_condition;
	information = pc_itpo_mana_03_info;
	permanent = TRUE;
	description = "Ёлексир маны (2 огненных корн€ и 1 луговой горец)";
};


func int pc_itpo_mana_03_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_mana_03_info()
{
	if((Npc_HasItems(hero,itpl_mana_herb_03) >= 2) && (Npc_HasItems(hero,itpl_temp_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpl_mana_herb_03,2);
		Npc_RemoveInvItems(hero,itpl_temp_herb,1);
		CreateInvItems(hero,itpo_mana_03,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_HEALTH_01(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_health_01_condition;
	information = pc_itpo_health_01_info;
	permanent = TRUE;
	description = "Ћечебна€ эссенци€ (2 лечебные травы и 1 луговой горец)";
};


func int pc_itpo_health_01_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_health_01_info()
{
	if((Npc_HasItems(hero,itpl_health_herb_01) >= 2) && (Npc_HasItems(hero,itpl_temp_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpl_health_herb_01,2);
		Npc_RemoveInvItems(hero,itpl_temp_herb,1);
		CreateInvItem(hero,itpo_health_01);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_HEALTH_02(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_health_02_condition;
	information = pc_itpo_health_02_info;
	permanent = TRUE;
	description = "Ћечебный экстракт (2 лечебных растени€ и 1 луговой горец)";
};


func int pc_itpo_health_02_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_health_02_info()
{
	if((Npc_HasItems(hero,itpl_health_herb_02) >= 2) && (Npc_HasItems(hero,itpl_temp_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpl_health_herb_02,2);
		Npc_RemoveInvItems(hero,itpl_temp_herb,1);
		CreateInvItems(hero,itpo_health_02,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_HEALTH_03(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_health_03_condition;
	information = pc_itpo_health_03_info;
	permanent = TRUE;
	description = "Ћечебный эликсир (2 лечебных корн€ и 1 луговой горец)";
};


func int pc_itpo_health_03_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_health_03_info()
{
	if((Npc_HasItems(hero,itpl_health_herb_03) >= 2) && (Npc_HasItems(hero,itpl_temp_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpl_health_herb_03,2);
		Npc_RemoveInvItems(hero,itpl_temp_herb,1);
		CreateInvItems(hero,itpo_health_03,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_PERM_HEALTH(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_perm_health_condition;
	information = pc_itpo_perm_health_info;
	permanent = TRUE;
	description = "Ёликсир жизни (1 лечебный корень и 1 царский щавель)";
};


func int pc_itpo_perm_health_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_perm_health_info()
{
	if((Npc_HasItems(hero,itpl_health_herb_03) >= 1) && (Npc_HasItems(hero,itpl_perm_herb) >= 1))
	{
		TotalPermEaten += 1;
		Npc_RemoveInvItems(hero,itpl_health_herb_03,1);
		Npc_RemoveInvItems(hero,itpl_perm_herb,1);
		CreateInvItems(hero,itpo_perm_health,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_PERM_MANA(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_perm_mana_condition;
	information = pc_itpo_perm_mana_info;
	permanent = TRUE;
	description = "Ёликсир духа (1 огненный корень и 1 царский щавель)";
};


func int pc_itpo_perm_mana_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_perm_mana_info()
{
	if((Npc_HasItems(hero,itpl_mana_herb_03) >= 1) && (Npc_HasItems(hero,itpl_perm_herb) >= 1))
	{
		TotalPermEaten += 1;
		Npc_RemoveInvItems(hero,itpl_mana_herb_03,1);
		Npc_RemoveInvItems(hero,itpl_perm_herb,1);
		CreateInvItems(hero,itpo_perm_mana,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_DEX(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_dex_condition;
	information = pc_itpo_dex_info;
	permanent = TRUE;
	description = "Ёликсир ловкости (1 гоблинска€ €года и 1 царский щавель)";
};


func int pc_itpo_dex_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_dex_info()
{
	if((Npc_HasItems(hero,itpl_dex_herb_01) >= 1) && (Npc_HasItems(hero,itpl_perm_herb) >= 1))
	{
		TotalDexEaten += 1;
		TotalPermEaten += 1;
		Npc_RemoveInvItems(hero,itpl_dex_herb_01,1);
		Npc_RemoveInvItems(hero,itpl_perm_herb,1);
		CreateInvItems(hero,itpo_perm_dex,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_STRG(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_strg_condition;
	information = pc_itpo_strg_info;
	permanent = TRUE;
	description = "Ёликсир силы (1 драконий корень и 1 царский щавель)";
};


func int pc_itpo_strg_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_strg_info()
{
	if((Npc_HasItems(hero,itpl_strength_herb_01) >= 1) && (Npc_HasItems(hero,itpl_perm_herb) >= 1))
	{
		TotalStrEaten += 1;
		TotalPermEaten += 1;
		Npc_RemoveInvItems(hero,itpl_strength_herb_01,1);
		Npc_RemoveInvItems(hero,itpl_perm_herb,1);
		CreateInvItems(hero,itpo_perm_str,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_SPEED(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_speed_condition;
	information = pc_itpo_speed_info;
	permanent = TRUE;
	description = "«елье ускорени€ (1 снеппер-трава и 1 луговой горец)";
};


func int pc_itpo_speed_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_SPEED] == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_speed_info()
{
	if((Npc_HasItems(hero,itpl_speed_herb_01) >= 1) && (Npc_HasItems(hero,itpl_temp_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpl_speed_herb_01,1);
		Npc_RemoveInvItems(hero,itpl_temp_herb,1);
		CreateInvItems(hero,itpo_speed,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITMI_JOINT(C_INFO)
{
	nr = 10;
	npc = pc_hero;
	condition = pc_itmi_joint_condition;
	information = pc_itmi_joint_info;
	permanent = TRUE;
	description = "ќбработать болотную траву (1 кос€к)";
};


func int pc_itmi_joint_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (Npc_HasItems(hero,itpl_swampherb) >= 1) && (Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) >= 1))
	{
		return TRUE;
	};
};

func void pc_itmi_joint_info()
{
	Npc_RemoveInvItems(hero,itpl_swampherb,1);
	CreateInvItems(hero,itmi_joint,1);
	Print(PRINT_JOINTSUCCESS);
	b_endproductiondialog();
};


instance PC_ITMI_TABAK(C_INFO)
{
	nr = 10;
	npc = pc_hero;
	condition = pc_itmi_tabak_condition;
	information = pc_itmi_tabak_info;
	permanent = TRUE;
	description = "—мешать табак...";
};


func int pc_itmi_tabak_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (Npc_HasItems(hero,itmi_apfeltabak) >= 1) && (Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) >= 1))
	{
		return TRUE;
	};
};

func void pc_itmi_tabak_info()
{
	Npc_RemoveInvItems(hero,itmi_apfeltabak,1);
	Info_ClearChoices(pc_itmi_tabak);
	Info_AddChoice(pc_itmi_tabak,DIALOG_BACK,pc_itmi_tabak_back);
	if(Npc_HasItems(hero,itfo_honey) >= 1)
	{
		Info_AddChoice(pc_itmi_tabak,"...с медом",pc_itmi_tabak_honey);
	};
	if(Npc_HasItems(hero,itpl_swampherb) >= 1)
	{
		Info_AddChoice(pc_itmi_tabak,"...с болотной травой",pc_itmi_tabak_swampherb);
	};
	if(Npc_HasItems(hero,itpl_mushroom_01) >= 1)
	{
		Info_AddChoice(pc_itmi_tabak,"...с черным грибом",pc_itmi_tabak_mushroom_01);
	};
};

func void pc_itmi_tabak_back()
{
	Info_ClearChoices(pc_itmi_tabak);
};

func void pc_itmi_tabak_honey()
{
	CreateInvItems(hero,itmi_honigtabak,1);
	Print(PRINT_TABAKSUCCESS);
	b_endproductiondialog();
};

func void pc_itmi_tabak_swampherb()
{
	CreateInvItems(hero,itmi_sumpftabak,1);
	Print(PRINT_TABAKSUCCESS);
	b_endproductiondialog();
};

func void pc_itmi_tabak_mushroom_01()
{
	CreateInvItems(hero,itmi_pilztabak,1);
	Print(PRINT_TABAKSUCCESS);
	b_endproductiondialog();
};


instance PC_ITPO_MEGADRINK(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_megadrink_condition;
	information = pc_itpo_megadrink_info;
	permanent = TRUE;
	description = "«елье из драконьих €иц (10 драконьих €иц, 1 черна€ жемчужина, 1 сера)";
};


func int pc_itpo_megadrink_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_MEGADRINK] == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_megadrink_info()
{
	if((Npc_HasItems(hero,itat_dragonegg_mis) >= 10) && (Npc_HasItems(hero,itmi_darkpearl) >= 1) && (Npc_HasItems(hero,itmi_sulfur) >= 1))
	{
		Npc_RemoveInvItems(hero,itat_dragonegg_mis,10);
		Npc_RemoveInvItems(hero,itmi_darkpearl,1);
		Npc_RemoveInvItems(hero,itmi_sulfur,1);
		CreateInvItems(hero,itpo_megadrink,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};

