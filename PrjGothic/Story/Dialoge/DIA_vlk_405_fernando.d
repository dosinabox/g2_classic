
instance DIA_FERNANDO_EXIT(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 999;
	condition = dia_fernando_exit_condition;
	information = dia_fernando_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_fernando_exit_condition()
{
	return TRUE;
};

func void dia_fernando_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_FERNANDO_PICKPOCKET(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 900;
	condition = dia_fernando_pickpocket_condition;
	information = dia_fernando_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_fernando_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itse_goldpocket100) >= 1) && (other.attribute[ATR_DEXTERITY] >= (50 - THEFTDIFF)) && (NPCOBSESSEDBYDMT_FERNANDO == FALSE))
	{
		return TRUE;
	};
};

func void dia_fernando_pickpocket_info()
{
	Info_ClearChoices(dia_fernando_pickpocket);
	Info_AddChoice(dia_fernando_pickpocket,DIALOG_BACK,dia_fernando_pickpocket_back);
	Info_AddChoice(dia_fernando_pickpocket,DIALOG_PICKPOCKET,dia_fernando_pickpocket_doit);
};

func void dia_fernando_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		b_giveinvitems(self,other,itse_goldpocket100,1);
		TotalTheftGold += 100;
		b_givethiefxp();
		Info_ClearChoices(dia_fernando_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_fernando_pickpocket_back()
{
	Info_ClearChoices(dia_fernando_pickpocket);
};


instance DIA_FERNANDO_HELLO(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 5;
	condition = dia_fernando_hello_condition;
	information = dia_fernando_hello_info;
	permanent = FALSE;
	description = "Как торговля?";
};


func int dia_fernando_hello_condition()
{
	if(NPCOBSESSEDBYDMT_FERNANDO == FALSE)
	{
		return TRUE;
	};
};

func void dia_fernando_hello_info()
{
	AI_Output(other,self,"DIA_Fernando_Hello_15_00");	//Как идут дела?
	AI_Output(self,other,"DIA_Fernando_Hello_14_01");	//Не сказать, чтобы очень хорошо. Когда Барьер все еще стоял, времена были получше.
	AI_Output(self,other,"DIA_Fernando_Hello_14_02");	//Заключенные добывали руду в шахтах, а мои корабли доставляли ее на материк.
	AI_Output(self,other,"DIA_Fernando_Hello_14_03");	//А на обратном пути они доставляли пищу и другие товары.
	AI_Output(self,other,"DIA_Fernando_Hello_14_04");	//Но сейчас мы отрезаны от материка, и нам приходится рассчитывать только на фермеров в том, что касается припасов.
};


instance DIA_FERNANDO_PERM(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 850;
	condition = dia_fernando_perm_condition;
	information = dia_fernando_perm_info;
	permanent = TRUE;
	description = "И чем ты сейчас зарабатываешь на жизнь?";
};


func int dia_fernando_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_fernando_hello) && (NPCOBSESSEDBYDMT_FERNANDO == FALSE))
	{
		return TRUE;
	};
};

func void dia_fernando_perm_info()
{
	AI_Output(other,self,"DIA_Fernando_Perm_15_00");	//И чем ты сейчас зарабатываешь на жизнь?
	if(Npc_KnowsInfo(other,dia_fernando_success) == FALSE)
	{
		AI_Output(self,other,"DIA_Fernando_Perm_14_01");	//Ничем! Сейчас я живу только за счет накопленного ранее. Но если я не смогу найти источник дохода, скоро для меня настанут тяжелые времена.
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Perm_14_02");	//Я разорен. Мне стоило послушать моего отца и держаться подальше от этого горнодобывающего бизнеса.
	};
};


instance DIA_FERNANDO_MINENTAL(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 2;
	condition = dia_fernando_minental_condition;
	information = dia_fernando_minental_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_fernando_minental_condition()
{
	if((NPCOBSESSEDBYDMT_FERNANDO == FALSE) && (MIS_OLDWORLD == LOG_RUNNING) && (KAPITEL == 2) && (ENTEROW_KAPITEL2 == FALSE))
	{
		return TRUE;
	};
};

func void dia_fernando_minental_info()
{
	AI_Output(self,other,"DIA_Fernando_Minental_14_00");	//Эй, ты - подожди минутку. Ты ведь направляешься в Долину Рудников, да?
	AI_Output(other,self,"DIA_Fernando_Minental_15_01");	//И?
	AI_Output(self,other,"DIA_Fernando_Minental_14_02");	//Я хочу предложить тебе сделку. Ты приносишь мне доклад о том, что там происходит с рудой, а за это я дам тебе...
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_03");	//... рунный камень.
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_04");	//... кольцо, которое повысит твои жизненные силы.
	};
	AI_Output(other,self,"DIA_Fernando_Minental_15_05");	//Я посмотрю, что можно сделать.
	b_npcclearobsessionbydmt(self);
	Npc_ExchangeRoutine(self,"START");
	Log_CreateTopic(TOPIC_FERNANDO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FERNANDO,LOG_RUNNING);
	b_logentry(TOPIC_FERNANDO,"Торговец Фернандо хочет знать обстановку с рудой в Долине рудников.");
};


instance DIA_FERNANDO_SUCCESS(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 5;
	condition = dia_fernando_success_condition;
	information = dia_fernando_success_info;
	permanent = FALSE;
	description = "Я был в Долине Рудников.";
};


func int dia_fernando_success_condition()
{
	if((NPCOBSESSEDBYDMT_FERNANDO == FALSE) && (KAPITEL >= 3) && Npc_KnowsInfo(other,dia_fernando_minental))
	{
		return TRUE;
	};
};

func void dia_fernando_success_info()
{
	AI_Output(other,self,"DIA_Fernando_Success_15_00");	//Я был в Долине Рудников.
	FERNANDO_ERZ = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(self,other,"DIA_Fernando_Success_14_01");	//И? Как там обстоят дела?
	AI_Output(other,self,"DIA_Fernando_Success_15_02");	//Шахты истощены, там можно добыть всего каких-нибудь несколько ящиков руды. Вряд ли эта овчинка стоит выделки.
	AI_Output(self,other,"DIA_Fernando_Success_14_03");	//Этого не может быть! Это означает, что я разорен...
	AI_Output(other,self,"DIA_Fernando_Success_15_04");	//Что насчет нашей сделки?
	AI_Output(self,other,"DIA_Fernando_Success_14_05");	//Ах, да, твое вознаграждение...
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_06");	//Вот, держи этот рунный камень.
		b_giveinvitems(self,other,itmi_runeblank,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_07");	//Вот твое кольцо.
		b_giveinvitems(self,other,itri_hp_02,1);
	};
};


instance DIA_FERNANDO_OBSESSION(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 30;
	condition = dia_fernando_obsession_condition;
	information = dia_fernando_obsession_info;
	description = "Все в порядке?";
};


func int dia_fernando_obsession_condition()
{
	if((KAPITEL >= 3) && (NPCOBSESSEDBYDMT_FERNANDO == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};


func void dia_fernando_obsession_info()
{
	b_npcobsessedbydmt(self);
};


instance DIA_FERNANDO_HEILUNG(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 55;
	condition = dia_fernando_heilung_condition;
	information = dia_fernando_heilung_info;
	permanent = TRUE;
	description = "Да ты одержим!";
};


func int dia_fernando_heilung_condition()
{
	if((NPCOBSESSEDBYDMT_FERNANDO == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_fernando_heilung_info()
{
	AI_Output(other,self,"DIA_Fernando_Heilung_15_00");	//Ты одержим!
	AI_Output(self,other,"DIA_Fernando_Heilung_14_01");	//Уходи. Уходи немедленно.
	b_npcclearobsessionbydmt(self);
};

