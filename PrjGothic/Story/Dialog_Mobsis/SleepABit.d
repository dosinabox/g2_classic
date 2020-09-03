
func void pc_sleep(var int t)
{
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
	if(Wld_IsTime(0,0,t,0))
	{
		Wld_SetTime(t,0);
	}
	else
	{
		t = t + 24;
		Wld_SetTime(t,0);
	};
	Wld_StopEffect("DEMENTOR_FX");
	if(SC_ISOBSESSED == TRUE)
	{
		PrintScreen(PRINT_SLEEPOVEROBSESSED,-1,-1,FONT_SCREEN,3);
	}
	else
	{
		PrintScreen(PRINT_SLEEPOVER,-1,-1,FONT_SCREEN,3);
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
	};
	printglobals(PD_ITEM_MOBSI);
	Npc_SendPassivePerc(hero,PERC_ASSESSENTERROOM,NULL,hero);
};

func void sleepabit_s1()
{
	var C_NPC her;
	var C_NPC rock;
	her = Hlp_GetNpc(pc_hero);
	rock = Hlp_GetNpc(pc_rockefeller);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(rock)))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_SLEEPABIT;
		AI_ProcessInfos(self);
		if(SC_ISOBSESSED == TRUE)
		{
			Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
		};
	};
};


instance PC_NOSLEEP(C_INFO)
{
	npc = pc_hero;
	nr = 999;
	condition = pc_nosleep_condition;
	information = pc_nosleep_info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int pc_nosleep_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SLEEPABIT)
	{
		return TRUE;
	};
};

func void pc_nosleep_info()
{
	AI_StopProcessInfos(self);
	Wld_StopEffect("DEMENTOR_FX");
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
};


instance PC_SLEEPTIME_MORNING(C_INFO)
{
	npc = pc_hero;
	condition = pc_sleeptime_morning_condition;
	information = pc_sleeptime_morning_info;
	important = FALSE;
	permanent = TRUE;
	description = "Спать до следующего утра";
};


func int pc_sleeptime_morning_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SLEEPABIT)
	{
		return TRUE;
	};
};

func void pc_sleeptime_morning_info()
{
	pc_sleep(8);
};


instance PC_SLEEPTIME_NOON(C_INFO)
{
	npc = pc_hero;
	condition = pc_sleeptime_noon_condition;
	information = pc_sleeptime_noon_info;
	important = FALSE;
	permanent = TRUE;
	description = "Спать до полудня";
};


func int pc_sleeptime_noon_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SLEEPABIT)
	{
		return TRUE;
	};
};

func void pc_sleeptime_noon_info()
{
	pc_sleep(12);
};


instance PC_SLEEPTIME_EVENING(C_INFO)
{
	npc = pc_hero;
	condition = pc_sleeptime_evening_condition;
	information = pc_sleeptime_evening_info;
	important = FALSE;
	permanent = TRUE;
	description = "Спать до следующего вечера";
};


func int pc_sleeptime_evening_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SLEEPABIT)
	{
		return TRUE;
	};
};

func void pc_sleeptime_evening_info()
{
	pc_sleep(20);
};


instance PC_SLEEPTIME_MIDNIGHT(C_INFO)
{
	npc = pc_hero;
	condition = pc_sleeptime_midnight_condition;
	information = pc_sleeptime_midnight_info;
	important = FALSE;
	permanent = TRUE;
	description = "Спать до полуночи";
};


func int pc_sleeptime_midnight_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SLEEPABIT)
	{
		return TRUE;
	};
};

func void pc_sleeptime_midnight_info()
{
	pc_sleep(0);
};

