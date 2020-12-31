
instance DIA_DOBAR_EXIT(C_INFO)
{
	npc = vlk_4106_dobar;
	nr = 999;
	condition = dia_dobar_exit_condition;
	information = dia_dobar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dobar_exit_condition()
{
	return TRUE;
};

func void dia_dobar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DOBAR_HALLO(C_INFO)
{
	npc = vlk_4106_dobar;
	nr = 2;
	condition = dia_dobar_hallo_condition;
	information = dia_dobar_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dobar_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_dobar_hallo_info()
{
	AI_Output(self,other,"DIA_Dobar_HALLO_08_00");	//(раздражительно) Что тебе нужно?
};


instance DIA_DOBAR_TALENT(C_INFO)
{
	npc = vlk_4106_dobar;
	nr = 3;
	condition = dia_dobar_talent_condition;
	information = dia_dobar_talent_info;
	permanent = FALSE;
	description = "Я немного знаю кузнечное дело.";
};


func int dia_dobar_talent_condition()
{
	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		return TRUE;
	};
};

func void dia_dobar_talent_info()
{
	AI_Output(other,self,"DIA_Dobar_Talent_15_00");	//Я немного знаю кузнечное дело.
	AI_Output(self,other,"DIA_Dobar_Talent_08_01");	//Хорошо... и что?
};


instance DIA_DOBAR_SCHMIEDE(C_INFO)
{
	npc = vlk_4106_dobar;
	nr = 3;
	condition = dia_dobar_schmiede_condition;
	information = dia_dobar_schmiede_info;
	permanent = FALSE;
	description = "Могу я воспользоваться твоей кузницей?";
};


func int dia_dobar_schmiede_condition()
{
	if(Npc_KnowsInfo(other,dia_dobar_talent))
	{
		return TRUE;
	};
};

func void dia_dobar_schmiede_info()
{
	AI_Output(other,self,"DIA_Dobar_Schmiede_15_00");	//Могу я воспользоваться твоей кузницей?
	AI_Output(self,other,"DIA_Dobar_Schmiede_08_01");	//У меня много работы. Мы будем только мешать друг другу. Лучше дождись темноты.
	AI_Output(self,other,"DIA_Dobar_Schmiede_08_02");	//Тогда Парлаф и я пойдем спать, и ты сможешь спокойно поработать.
};


instance DIA_DOBAR_BEIBRINGEN(C_INFO)
{
	npc = vlk_4106_dobar;
	nr = 2;
	condition = dia_dobar_beibringen_condition;
	information = dia_dobar_beibringen_info;
	permanent = FALSE;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int dia_dobar_beibringen_condition()
{
	if(Npc_KnowsInfo(other,dia_dobar_talent))
	{
		return TRUE;
	};
};

func void dia_dobar_beibringen_info()
{
	AI_Output(other,self,"DIA_Dobar_beibringen_15_00");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"DIA_Dobar_beibringen_08_01");	//Ты уже знаешь основы. Я могу показать тебе, как улучшить твою работу.
	AI_Output(self,other,"DIA_Dobar_beibringen_08_02");	//И ты сможешь ковать более совершенное оружие.
	DOBAR_LEARNSMITH = TRUE;
	Log_CreateTopic(TOPIC_TEACHER_OC,LOG_NOTE);
	b_logentry(TOPIC_TEACHER_OC,"Добар может обучить меня ковать хорошее оружие.");
};


instance DIA_DOBAR_TEACH(C_INFO)
{
	npc = vlk_4106_dobar;
	nr = 3;
	condition = dia_dobar_teach_condition;
	information = dia_dobar_teach_info;
	description = b_buildlearnstring("Покажи мне, как выковать хороший меч!",b_getlearncosttalent(other,NPC_TALENT_SMITH));
	permanent = TRUE;
};


func int dia_dobar_teach_condition()
{
	if((DOBAR_LEARNSMITH == TRUE) && (PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_01] == FALSE))
	{
		return TRUE;
	};
};

func void dia_dobar_teach_info()
{
	AI_Output(other,self,"DIA_Dobar_Teach_15_00");	//Покажи мне, как выковать хороший меч!
	if(b_teachplayertalentsmith(self,hero,WEAPON_1H_SPECIAL_01))
	{
		AI_Output(self,other,"DIA_Dobar_Teach_08_01");	//Разогрей сталь, чтобы она равномерно светилась по всей длине, без этого хороший меч не выковать.
		AI_Output(self,other,"DIA_Dobar_Teach_08_02");	//Если ты будешь помнить это, сделанные тобой клинки будут прочнее и острее.
		AI_Output(self,other,"DIA_Dobar_Teach_08_03");	//Это все, что тебе нужно знать. Если тебе нужна сырая сталь, поговори с Энгором.
	};
};


instance DIA_DOBAR_WAFFE(C_INFO)
{
	npc = vlk_4106_dobar;
	nr = 80;
	condition = dia_dobar_waffe_condition;
	information = dia_dobar_waffe_info;
	permanent = FALSE;
	description = "Ты можешь сделать оружие для меня?";
};


func int dia_dobar_waffe_condition()
{
	return TRUE;
};

func void dia_dobar_waffe_info()
{
	AI_Output(other,self,"DIA_Dobar_Waffe_15_00");	//Ты можешь сделать оружие для меня?
	AI_Output(self,other,"DIA_Dobar_Waffe_08_01");	//У меня нет времени на это. Тандор распоряжается всем оружием - я только кую его, а Парлаф затачивает.
	Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
	b_logentry(TOPIC_TRADER_OC,"Тандор торгует оружием в замке.");
};


instance DIA_DOBAR_NEWS(C_INFO)
{
	npc = vlk_4106_dobar;
	nr = 900;
	condition = dia_dobar_news_condition;
	information = dia_dobar_news_info;
	permanent = TRUE;
	description = "Как работа?";
};


func int dia_dobar_news_condition()
{
	return TRUE;
};

func void dia_dobar_news_info()
{
	AI_Output(other,self,"DIA_Dobar_NEWS_15_00");	//Как работа?
	if(DOBAR_EINMALIG == FALSE)
	{
		AI_Output(self,other,"DIA_Dobar_NEWS_08_01");	//Я кую оружие для рыцарей замка. С тех пор, как мы прибыли сюда, я не отхожу от кузницы.
		AI_Output(self,other,"DIA_Dobar_NEWS_08_02");	//Это оружие нам очень пригодится. Мы еще покажем этим проклятым оркам!
		if(Npc_IsDead(parlaf) == FALSE)
		{
			b_turntonpc(self,parlaf);
			AI_Output(self,other,"DIA_Dobar_NEWS_08_03");	//(зовет) Эй, Парлаф - затачивай эти мечи получше - орки чертовски сильные противники!
			b_turntonpc(self,other);
		};
		DOBAR_EINMALIG = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Dobar_NEWS_08_04");	//Могло бы быть и лучше. Если бы ты постоянно не отвлекал меня, работа продвигалась бы быстрее.
	};
};


instance DIA_DOBAR_PICKPOCKET(C_INFO)
{
	npc = vlk_4106_dobar;
	nr = 900;
	condition = dia_dobar_pickpocket_condition;
	information = dia_dobar_pickpocket_info;
	permanent = TRUE;
	description = "(украсть его кусок руды будет сложно)";
};


func int dia_dobar_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itmi_nugget) >= 1) && (other.attribute[ATR_DEXTERITY] >= (79 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_dobar_pickpocket_info()
{
	Info_ClearChoices(dia_dobar_pickpocket);
	Info_AddChoice(dia_dobar_pickpocket,DIALOG_BACK,dia_dobar_pickpocket_back);
	Info_AddChoice(dia_dobar_pickpocket,DIALOG_PICKPOCKET,dia_dobar_pickpocket_doit);
};

func void dia_dobar_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 79)
	{
		b_giveinvitems(self,other,itmi_nugget,1);
		b_givethiefxp();
		Info_ClearChoices(dia_dobar_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_dobar_pickpocket_back()
{
	Info_ClearChoices(dia_dobar_pickpocket);
};

