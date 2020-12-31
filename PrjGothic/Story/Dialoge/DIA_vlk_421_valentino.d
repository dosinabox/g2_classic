
instance DIA_VALENTINO_EXIT(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 999;
	condition = dia_valentino_exit_condition;
	information = dia_valentino_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_valentino_exit_condition()
{
	return TRUE;
};

func void dia_valentino_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VALENTINO_HALLO(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 1;
	condition = dia_valentino_hallo_condition;
	information = dia_valentino_hallo_info;
	permanent = FALSE;
	description = "Так, и что у нас здесь?";
};


func int dia_valentino_hallo_condition()
{
	return TRUE;
};

func void dia_valentino_hallo_info()
{
	AI_Output(other,self,"DIA_Valentino_HALLO_15_00");	//Так, и что у нас здесь?
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Valentino_HALLO_03_01");	//Меня зовут Валентино. Я пытаюсь не осквернить этот день, данный мне Инносом, своей работой.
		AI_Output(other,self,"DIA_Valentino_HALLO_15_02");	//Придержи язык.
		AI_Output(self,other,"DIA_Valentino_HALLO_03_03");	//Ох, прошу прощения, я не хотел оскорбить нашего Владыку. Еще раз прошу простить меня.
	}
	else
	{
		AI_Output(self,other,"DIA_Valentino_HALLO_03_04");	//Ты незнаком с хорошими манерами? Это отвратительно!
		AI_Output(self,other,"DIA_Valentino_HALLO_03_05");	//Повсюду этот грязный сброд. У тебя что, нет работы, которой ты должен заниматься?
		AI_Output(self,other,"DIA_Valentino_HALLO_03_06");	//Но, я полагаю, никто не хватится такого бездельника как ты, да?
		AI_Output(self,other,"DIA_Valentino_HALLO_03_07");	//Ну, если бы у тебя было столько же золота, сколько у меня, ты бы уж тоже не работал. Но тебе никогда не стать таким богатым.
		AI_Output(other,self,"DIA_Valentino_HALLO_15_08");	//Ты такой забавный.
	};
};


instance DIA_VALENTINO_WHOAGAIN(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 2;
	condition = dia_valentino_whoagain_condition;
	information = dia_valentino_whoagain_info;
	permanent = FALSE;
	description = "Я спросил тебя, кто ты такой!";
};


func int dia_valentino_whoagain_condition()
{
	if(Npc_KnowsInfo(other,dia_valentino_hallo) && (other.guild != GIL_KDF) && (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_valentino_whoagain_info()
{
	AI_Output(other,self,"DIA_Valentino_Add_15_01");	//Я спросил тебя, кто ты такой!
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_01");	//Я Валентино Великолепный. Бонвиан и любимчик женщин.
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_02");	//Бедный заботами, богатый мудростью и золотом, женщины так и бросаются на меня.
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_03");	//Если у тебя есть проблемы, держи их при себе. Мне они не нужны.
};


instance DIA_VALENTINO_MANIEREN(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 3;
	condition = dia_valentino_manieren_condition;
	information = dia_valentino_manieren_info;
	permanent = FALSE;
	description = "Похоже, мне придется поучить тебя хорошим манерам!";
};


func int dia_valentino_manieren_condition()
{
	if(Npc_KnowsInfo(other,dia_valentino_hallo) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_valentino_manieren_info()
{
	AI_Output(other,self,"DIA_Valentino_Add_15_02");	//Похоже, мне придется поучить тебя хорошим манерам!
	AI_Output(self,other,"DIA_Valentino_HALLO_klappe_03_01");	//Меня это не волнует! Молоти меня, сколько хочешь. А когда я встану завтра утром, я опять буду красавчиком.
	AI_Output(self,other,"DIA_Valentino_HALLO_klappe_03_02");	//Но тебе придется жить дальше с этим преступлением до конца своих дней
};


var int valentino_lo_perm;
var int valentino_hi_perm;

instance DIA_VALENTINO_WASNUETZLICHES(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 4;
	condition = dia_valentino_wasnuetzliches_condition;
	information = dia_valentino_wasnuetzliches_info;
	permanent = TRUE;
	description = "Ты еще что-нибудь можешь сказать мне?";
};


func int dia_valentino_wasnuetzliches_condition()
{
	if(Npc_KnowsInfo(other,dia_valentino_hallo))
	{
		return TRUE;
	};
};

func void dia_valentino_wasnuetzliches_info()
{
	AI_Output(other,self,"DIA_Valentino_Add_15_03");	//(спокойно) Ты еще что-нибудь можешь сказать мне?
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		b_say(self,other,"$NOTNOW");
	}
	else if((VALENTINO_LO_PERM == FALSE) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_01");	//Стань популярным, никогда ничего никому не обещай, бери то, что можешь, и смотри, чтобы не ввязаться в драку с ополчением.
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_02");	//Или с ревнивым мужем, конечно. Это хуже всего, уж поверь мне.
		VALENTINO_LO_PERM = TRUE;
	}
	else if((VALENTINO_HI_PERM == FALSE) && ((other.guild == GIL_PAL) || (other.guild == GIL_KDF)))
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_03");	//Для человека в твоем положении нет ничего невозможного. Ты просто должен знать, когда нужно действовать.
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_04");	//Так что не теряй времени и действуй.
		VALENTINO_HI_PERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_05");	//Я сказал тебе все, что тебе нужно знать. Остальное за тобой.
	};
};


instance DIA_VALENTINO_PICKPOCKET(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 900;
	condition = dia_valentino_pickpocket_condition;
	information = dia_valentino_pickpocket_info;
	permanent = TRUE;
	description = "(украсть этот ключ будет легко)";
};


func int dia_valentino_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_valentino) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_valentino_pickpocket_info()
{
	Info_ClearChoices(dia_valentino_pickpocket);
	Info_AddChoice(dia_valentino_pickpocket,DIALOG_BACK,dia_valentino_pickpocket_back);
	Info_AddChoice(dia_valentino_pickpocket,DIALOG_PICKPOCKET,dia_valentino_pickpocket_doit);
};

func void dia_valentino_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		b_giveinvitems(self,other,itke_valentino,1);
		b_givethiefxp();
		Info_ClearChoices(dia_valentino_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_valentino_pickpocket_back()
{
	Info_ClearChoices(dia_valentino_pickpocket);
};

