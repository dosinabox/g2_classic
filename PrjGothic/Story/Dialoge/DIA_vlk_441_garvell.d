
instance DIA_GARVELL_EXIT(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 999;
	condition = dia_garvell_exit_condition;
	information = dia_garvell_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garvell_exit_condition()
{
	return TRUE;
};

func void dia_garvell_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GARVELL_PICKPOCKET(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 900;
	condition = dia_garvell_pickpocket_condition;
	information = dia_garvell_pickpocket_info;
	permanent = TRUE;
	description = "(Украсть его кошелек легче легкого)";
};


func int dia_garvell_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itse_goldpocket25) >= 1) && (other.attribute[ATR_DEXTERITY] >= (10 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_garvell_pickpocket_info()
{
	Info_ClearChoices(dia_garvell_pickpocket);
	Info_AddChoice(dia_garvell_pickpocket,DIALOG_BACK,dia_garvell_pickpocket_back);
	Info_AddChoice(dia_garvell_pickpocket,DIALOG_PICKPOCKET,dia_garvell_pickpocket_doit);
};

func void dia_garvell_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 10)
	{
		b_giveinvitems(self,other,itse_goldpocket25,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_giveplayerxp(XP_AMBIENT);
		Info_ClearChoices(dia_garvell_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_garvell_pickpocket_back()
{
	Info_ClearChoices(dia_garvell_pickpocket);
};


instance DIA_GARVELL_GREET(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 2;
	condition = dia_garvell_greet_condition;
	information = dia_garvell_greet_info;
	description = "Что ты делаешь здесь?";
};


func int dia_garvell_greet_condition()
{
	if(Wld_IsTime(5,0,19,0))
	{
		return TRUE;
	};
};

func void dia_garvell_greet_info()
{
	AI_Output(other,self,"DIA_Garvell_GREET_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Garvell_GREET_04_01");	//Я строю корабль, потому что я хочу убраться отсюда - и чем быстрее, тем лучше.
	AI_Output(self,other,"DIA_Garvell_GREET_04_02");	//Но судя по тому, как идет работа, этот корабль никогда не будет закончен.
};


instance DIA_GARVELL_EILIG(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 2;
	condition = dia_garvell_eilig_condition;
	information = dia_garvell_eilig_info;
	description = "Почему ты так торопишься?";
};


func int dia_garvell_eilig_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_greet))
	{
		return TRUE;
	};
};

func void dia_garvell_eilig_info()
{
	AI_Output(other,self,"DIA_Garvell_eilig_15_00");	//Почему ты так торопишься?
	AI_Output(self,other,"DIA_Garvell_eilig_04_01");	//Скоро придут орки и сожгут город дотла.
	AI_Output(other,self,"DIA_Garvell_eilig_15_02");	//Почему ты так думаешь?
	AI_Output(self,other,"DIA_Garvell_eilig_04_03");	//Парень, ты видишь, что паладины теперь повсюду? Почему, как ты думаешь, они здесь?
	AI_Output(self,other,"DIA_Garvell_eilig_04_04");	//Я сажу тебе. Они здесь, потому что скоро на нас нападут орки. А это не доставит нам радости.
};


instance DIA_GARVELL_SCHIFF(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 99;
	condition = dia_garvell_schiff_condition;
	information = dia_garvell_schiff_info;
	description = "Почему ты не можешь закончить корабль?";
};


func int dia_garvell_schiff_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_greet))
	{
		return TRUE;
	};
};

func void dia_garvell_schiff_info()
{
	AI_Output(other,self,"DIA_Garvell_Schiff_15_00");	//Почему ты не можешь закончить корабль?
	AI_Output(self,other,"DIA_Garvell_Schiff_04_01");	//Ох, у нас тысячи проблем. Остов пока еще не очень стабилен и не хватает досок на обшивку.
	AI_Output(self,other,"DIA_Garvell_Schiff_04_02");	//У меня почти не осталось средств на покупку материалов, а последняя партия вся была поедена жучком.
	AI_Output(self,other,"DIA_Garvell_Schiff_04_03");	//Мои парни работают не очень эффективно. Один хочет построить быстрый корабль, а другого волнует только резная фигура, которая будет установлена на носу судна
	AI_Output(self,other,"DIA_Garvell_Schiff_04_04");	//Как будто нам больше нечем заняться!
};


instance DIA_GARVELL_MISSION(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 2;
	condition = dia_garvell_mission_condition;
	information = dia_garvell_mission_info;
	permanent = FALSE;
	description = "Могу я чем-нибудь помочь?";
};


func int dia_garvell_mission_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_eilig) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_garvell_mission_info()
{
	AI_Output(other,self,"DIA_Garvell_MISSION_15_00");	//Могу я чем-нибудь помочь?
	AI_Output(self,other,"DIA_Garvell_MISSION_04_01");	//Да, можешь. Выясни, что планируют паладины. Я хочу знать, зачем они здесь.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_02");	//И я должен знать, действительно ли орки собираются напасть на нас и как далеко от города они находятся.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_03");	//Одного из этих отродий видели совсем неподалеку от города.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_04");	//Просто сообщай мне всю информацию, что раздобудешь.
	AI_Output(self,other,"DIA_Garvell_Add_04_00");	//Я должен знать, сколько у меня осталось времени на постройку судна.
	MIS_GARVELL_INFOS = LOG_RUNNING;
	KNOWS_ORK = TRUE;
	Log_CreateTopic(TOPIC_GARVELL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GARVELL,LOG_RUNNING);
	b_logentry(TOPIC_GARVELL,"Гарвелл хочет получить информацию об орках, и хочет знать, зачем паладины в городе.");
};

func void b_garvellweiter()
{
	AI_Output(self,other,"DIA_Garvell_Weiter_04_00");	//Хорошо. Если еще что-нибудь выяснишь, дай мне знать.
};

func void b_garvellsuccess()
{
	AI_Output(self,other,"DIA_Garvell_Success_04_00");	//Спасибо за информацию. Судя по всему, у нас сколько угодно времени на постройку судна.
	MIS_GARVELL_INFOS = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GARVELL_ORKS(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 3;
	condition = dia_garvell_orks_condition;
	information = dia_garvell_orks_info;
	permanent = FALSE;
	description = "У меня есть информация об орках.";
};


func int dia_garvell_orks_condition()
{
	if((MIS_GARVELL_INFOS == LOG_RUNNING) && (KNOWS_PALADINS >= 1))
	{
		return TRUE;
	};
};

func void dia_garvell_orks_info()
{
	AI_Output(other,self,"DIA_Garvell_Orks_15_00");	//У меня есть информация об орках.
	AI_Output(self,other,"DIA_Garvell_Orks_04_01");	//Выкладывай.
	AI_Output(other,self,"DIA_Garvell_Orks_15_02");	//Они застряли в Долине Рудников, и, похоже, они собираются остаться там.
	AI_Output(other,self,"DIA_Garvell_Orks_15_03");	//Чтобы здесь было безопасно, паладины охраняют Проход.
	TELL_GARVELL = TELL_GARVELL + 1;
	b_giveplayerxp(XP_AMBIENT);
	if(TELL_GARVELL >= 3)
	{
		b_garvellsuccess();
	}
	else
	{
		b_garvellweiter();
	};
};


instance DIA_GARVELL_PALADINE(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 2;
	condition = dia_garvell_paladine_condition;
	information = dia_garvell_paladine_info;
	permanent = FALSE;
	description = "Я знаю, зачем паладины здесь.";
};


func int dia_garvell_paladine_condition()
{
	if((MIS_GARVELL_INFOS == LOG_RUNNING) && (KNOWSPALADINS_ORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_garvell_paladine_info()
{
	AI_Output(other,self,"DIA_Garvell_Paladine_15_00");	//Я знаю, зачем паладины здесь.
	AI_Output(self,other,"DIA_Garvell_Paladine_04_01");	//Правда? Скажи мне!
	AI_Output(other,self,"DIA_Garvell_Paladine_15_02");	//Паладины здесь, чтобы добывать магическую руду в Долине Рудников, а не потому, что они ожидают нападения орков на город.
	AI_Output(other,self,"DIA_Garvell_Paladine_15_03");	//Как только они добудут руду, они вернутся на материк.
	TELL_GARVELL = TELL_GARVELL + 1;
	b_giveplayerxp(XP_AMBIENT);
	if(TELL_GARVELL >= 3)
	{
		b_garvellsuccess();
	}
	else
	{
		b_garvellweiter();
	};
};


instance DIA_GARVELL_CITY(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 4;
	condition = dia_garvell_city_condition;
	information = dia_garvell_city_info;
	permanent = FALSE;
	description = "Что касается орка около города...";
};


func int dia_garvell_city_condition()
{
	if((MIS_GARVELL_INFOS == LOG_RUNNING) && (KNOWS_PALADINS >= 2))
	{
		return TRUE;
	};
};

func void dia_garvell_city_info()
{
	AI_Output(other,self,"DIA_Garvell_City_15_00");	//Что касается орка около города...
	AI_Output(self,other,"DIA_Garvell_City_04_01");	//Дааа?..
	AI_Output(other,self,"DIA_Garvell_City_15_02");	//Не волнуйся насчет него. Городская стража позаботится о нем.
	TELL_GARVELL = TELL_GARVELL + 1;
	b_giveplayerxp(XP_AMBIENT);
	if(TELL_GARVELL >= 3)
	{
		b_garvellsuccess();
	}
	else
	{
		b_garvellweiter();
	};
};


instance DIA_GARVELL_PERM(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 13;
	condition = dia_garvell_perm_condition;
	information = dia_garvell_perm_info;
	permanent = TRUE;
	description = "Что происходит в гавани?";
};


func int dia_garvell_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_mission))
	{
		return TRUE;
	};
};

func void dia_garvell_perm_info()
{
	AI_Output(other,self,"DIA_Garvell_Perm_15_00");	//Что происходит в гавани?
	if(MIS_GARVELL_INFOS != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Garvell_Perm_04_01");	//Орки дышат нам в спину, а ты спрашиваешь о гавани?
		AI_Output(other,self,"DIA_Garvell_Perm_15_02");	//Я только хотел...
		AI_Output(self,other,"DIA_Garvell_Perm_04_03");	//Самая большая проблема в том, что в гавани недостаточно кораблей, чтобы вывезти нас отсюда.
		AI_Output(self,other,"DIA_Garvell_Perm_04_04");	//Если честно, здесь всего один корабль, и он принадлежит паладинам. А они уж точно не позволят нам воспользоваться им.
	}
	else
	{
		AI_Output(self,other,"DIA_Garvell_Perm_04_05");	//Оглянись вокруг, здесь давно уже ничего не происходит.
	};
};

