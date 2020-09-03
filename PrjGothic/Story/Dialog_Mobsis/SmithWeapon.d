
instance PC_SMITHWEAPON_END(C_INFO)
{
	npc = pc_hero;
	nr = 999;
	condition = pc_smithweapon_end_condition;
	information = pc_smithweapon_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int pc_smithweapon_end_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON)
	{
		return TRUE;
	};
};

func void pc_smithweapon_end_info()
{
	CreateInvItems(self,itmiswordraw,1);
	b_endproductiondialog();
};


instance PC_ITMW_1H_COMMON(C_INFO)
{
	npc = pc_hero;
	condition = pc_itmw_1h_common_condition;
	information = pc_itmw_1h_common_info;
	permanent = TRUE;
};


func int pc_itmw_1h_common_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (PLAYER_TALENT_SMITH[WEAPON_COMMON] == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmw_1h_common_info()
{
	CreateInvItems(hero,itmw_1h_common_01,1);
	Print(PRINT_SMITHSUCCESS);
	b_endproductiondialog();
};


instance PC_ITMW_1H_SPECIAL_01(C_INFO)
{
	npc = pc_hero;
	condition = pc_itmw_1h_special_01_condition;
	information = pc_itmw_1h_special_01_info;
	permanent = TRUE;
};


func int pc_itmw_1h_special_01_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_01] == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmw_1h_special_01_info()
{
	if(Npc_HasItems(hero,itmi_nugget) >= 1)
	{
		Npc_RemoveInvItems(hero,itmi_nugget,1);
		CreateInvItems(hero,itmw_1h_special_01,1);
		Print(PRINT_SMITHSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmiswordraw,1);
	};
	b_endproductiondialog();
};


instance PC_ITMW_2H_SPECIAL_01(C_INFO)
{
	npc = pc_hero;
	condition = pc_itmw_2h_special_01_condition;
	information = pc_itmw_2h_special_01_info;
	permanent = TRUE;
};


func int pc_itmw_2h_special_01_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_01] == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmw_2h_special_01_info()
{
	if(Npc_HasItems(hero,itmi_nugget) >= 2)
	{
		Npc_RemoveInvItems(hero,itmi_nugget,2);
		CreateInvItems(hero,itmw_2h_special_01,1);
		Print(PRINT_SMITHSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmiswordraw,1);
	};
	b_endproductiondialog();
};


instance PC_ITMW_1H_SPECIAL_02(C_INFO)
{
	npc = pc_hero;
	condition = pc_itmw_1h_special_02_condition;
	information = pc_itmw_1h_special_02_info;
	permanent = TRUE;
};


func int pc_itmw_1h_special_02_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_02] == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmw_1h_special_02_info()
{
	if(Npc_HasItems(hero,itmi_nugget) >= 2)
	{
		Npc_RemoveInvItems(hero,itmi_nugget,2);
		CreateInvItems(hero,itmw_1h_special_02,1);
		Print(PRINT_SMITHSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmiswordraw,1);
	};
	b_endproductiondialog();
};


instance PC_ITMW_2H_SPECIAL_02(C_INFO)
{
	npc = pc_hero;
	condition = pc_itmw_2h_special_02_condition;
	information = pc_itmw_2h_special_02_info;
	permanent = TRUE;
};


func int pc_itmw_2h_special_02_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_02] == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmw_2h_special_02_info()
{
	if(Npc_HasItems(hero,itmi_nugget) >= 3)
	{
		Npc_RemoveInvItems(hero,itmi_nugget,3);
		CreateInvItems(hero,itmw_2h_special_02,1);
		Print(PRINT_SMITHSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmiswordraw,1);
	};
	b_endproductiondialog();
};


instance PC_ITMW_1H_SPECIAL_03(C_INFO)
{
	npc = pc_hero;
	condition = pc_itmw_1h_special_03_condition;
	information = pc_itmw_1h_special_03_info;
	permanent = TRUE;
};


func int pc_itmw_1h_special_03_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_03] == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmw_1h_special_03_info()
{
	if(Npc_HasItems(hero,itmi_nugget) >= 3)
	{
		Npc_RemoveInvItems(hero,itmi_nugget,3);
		CreateInvItems(hero,itmw_1h_special_03,1);
		Print(PRINT_SMITHSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmiswordraw,1);
	};
	b_endproductiondialog();
};


instance PC_ITMW_2H_SPECIAL_03(C_INFO)
{
	npc = pc_hero;
	condition = pc_itmw_2h_special_03_condition;
	information = pc_itmw_2h_special_03_info;
	permanent = TRUE;
};


func int pc_itmw_2h_special_03_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_03] == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmw_2h_special_03_info()
{
	if(Npc_HasItems(hero,itmi_nugget) >= 4)
	{
		Npc_RemoveInvItems(hero,itmi_nugget,4);
		CreateInvItems(hero,itmw_2h_special_03,1);
		Print(PRINT_SMITHSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmiswordraw,1);
	};
	b_endproductiondialog();
};


instance PC_ITMW_1H_SPECIAL_04(C_INFO)
{
	npc = pc_hero;
	condition = pc_itmw_1h_special_04_condition;
	information = pc_itmw_1h_special_04_info;
	permanent = TRUE;
};


func int pc_itmw_1h_special_04_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_04] == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmw_1h_special_04_info()
{
	if((Npc_HasItems(hero,itmi_nugget) >= 4) && (Npc_HasItems(hero,itat_dragonblood) >= 5))
	{
		Npc_RemoveInvItems(hero,itmi_nugget,4);
		Npc_RemoveInvItems(hero,itat_dragonblood,5);
		CreateInvItems(hero,itmw_1h_special_04,1);
		Print(PRINT_SMITHSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmiswordraw,1);
	};
	b_endproductiondialog();
};


instance PC_ITMW_2H_SPECIAL_04(C_INFO)
{
	npc = pc_hero;
	condition = pc_itmw_2h_special_04_condition;
	information = pc_itmw_2h_special_04_info;
	permanent = TRUE;
};


func int pc_itmw_2h_special_04_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_04] == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmw_2h_special_04_info()
{
	if((Npc_HasItems(hero,itmi_nugget) >= 5) && (Npc_HasItems(hero,itat_dragonblood) >= 5))
	{
		Npc_RemoveInvItems(hero,itmi_nugget,5);
		Npc_RemoveInvItems(hero,itat_dragonblood,5);
		CreateInvItems(hero,itmw_2h_special_04,1);
		Print(PRINT_SMITHSUCCESS);
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,itmiswordraw,1);
	};
	b_endproductiondialog();
};

func void smithweapon_s1()
{
	var C_NPC her;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_SMITHWEAPON;
		AI_ProcessInfos(self);
	};
	pc_itmw_1h_common.description = NAME_ITMW_1H_COMMON_01;
	pc_itmw_1h_special_01.description = ConcatStrings(NAME_ITMW_1H_SPECIAL_01,PRINT_SMITH_1H_SPECIAL_01);
	pc_itmw_2h_special_01.description = ConcatStrings(NAME_ITMW_2H_SPECIAL_01,PRINT_SMITH_2H_SPECIAL_01);
	pc_itmw_1h_special_02.description = ConcatStrings(NAME_ITMW_1H_SPECIAL_02,PRINT_SMITH_1H_SPECIAL_02);
	pc_itmw_2h_special_02.description = ConcatStrings(NAME_ITMW_2H_SPECIAL_02,PRINT_SMITH_2H_SPECIAL_02);
	pc_itmw_1h_special_03.description = ConcatStrings(NAME_ITMW_1H_SPECIAL_03,PRINT_SMITH_1H_SPECIAL_03);
	pc_itmw_2h_special_03.description = ConcatStrings(NAME_ITMW_2H_SPECIAL_03,PRINT_SMITH_2H_SPECIAL_03);
	pc_itmw_1h_special_04.description = ConcatStrings(NAME_ITMW_1H_SPECIAL_04,PRINT_SMITH_1H_SPECIAL_04);
	pc_itmw_2h_special_04.description = ConcatStrings(NAME_ITMW_2H_SPECIAL_04,PRINT_SMITH_2H_SPECIAL_04);
};

