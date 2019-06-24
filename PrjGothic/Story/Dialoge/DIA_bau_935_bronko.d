
instance DIA_BRONKO_EXIT(C_INFO)
{
	npc = bau_935_bronko;
	nr = 999;
	condition = dia_bronko_exit_condition;
	information = dia_bronko_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bronko_exit_condition()
{
	return TRUE;
};

func void dia_bronko_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BRONKO_HALLO(C_INFO)
{
	npc = bau_935_bronko;
	nr = 1;
	condition = dia_bronko_hallo_condition;
	information = dia_bronko_hallo_info;
	important = TRUE;
};


func int dia_bronko_hallo_condition()
{
	return TRUE;
};

func void dia_bronko_hallo_info()
{
	AI_Output(self,other,"DIA_Bronko_HALLO_06_00");	//(отечески) И куда это мы направляемся, а?
	AI_Output(other,self,"DIA_Bronko_HALLO_15_01");	//А ты что, здесь старший?
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bronko_HALLO_06_02");	//Сейчас в морду получишь, придурок.
	};
	AI_Output(self,other,"DIA_Bronko_HALLO_06_03");	//Если ты хочешь свободно ходить по моей земле, ты должен заплатить мне 5 золотых, или душу из тебя вытрясу!
	Info_ClearChoices(dia_bronko_hallo);
	Info_AddChoice(dia_bronko_hallo,"Забудь об этом. Ты ничего не получишь от меня.",dia_bronko_hallo_vergisses);
	Info_AddChoice(dia_bronko_hallo,"Похоже, у меня нет выбора - вот твои деньги.",dia_bronko_hallo_hiergeld);
	Info_AddChoice(dia_bronko_hallo,"Твоей земле? Ты что, местный фермер?",dia_bronko_hallo_deinland);
};

func void dia_bronko_hallo_deinland()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_deinland_15_00");	//Твоей земле? Ты что, местный фермер?
	AI_Output(self,other,"DIA_Bronko_HALLO_deinland_06_01");	//Естественно. А почему еще ты должен платить мне пошлину?
	AI_Output(self,other,"DIA_Bronko_HALLO_deinland_06_02");	//Я не возражаю, если ты поспрашиваешь остальных обо мне. Хе-хе!
};

func void dia_bronko_hallo_hiergeld()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_hiergeld_15_00");	//Похоже, у меня нет выбора - вот твои деньги.
	if(Npc_HasItems(other,itmi_gold) >= 5)
	{
		b_giveinvitems(other,self,itmi_gold,5);
		AI_Output(self,other,"DIA_Bronko_HALLO_hiergeld_06_01");	//(притворно) Спасибо. Удачного пути.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Bronko_HALLO_hiergeld_06_02");	//У тебя нет даже 5 монет. Ты хочешь надуть меня?
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	};
};

func void dia_bronko_hallo_vergisses()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_vergisses_15_00");	//Забудь об этом. Ты ничего не получишь от меня.
	if((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bronko_HALLO_vergisses_06_01");	//Тогда, боюсь, мне придется набить тебе морду.
	}
	else
	{
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Bronko_HALLO_vergisses_06_02");	//У вас, парней из городской стражи, плохо с финансами, ха?
		};
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Bronko_HALLO_vergisses_06_03");	//Меня не волнует, что ты маг. Тебе придется заплатить. Понятно?
		};
	};
	Info_ClearChoices(dia_bronko_hallo);
	Info_AddChoice(dia_bronko_hallo,"Похоже, у меня нет выбора - вот твои деньги.",dia_bronko_hallo_hiergeld);
	Info_AddChoice(dia_bronko_hallo,"Тогда попробуй, возьми их сам.",dia_bronko_hallo_attack);
};

func void dia_bronko_hallo_attack()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_attack_15_00");	//Тогда попробуй, возьми их сам.
	AI_Output(self,other,"DIA_Bronko_HALLO_attack_06_01");	//Ну, раз ты так...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_BRONKO_KEINBAUER(C_INFO)
{
	npc = bau_935_bronko;
	nr = 2;
	condition = dia_bronko_keinbauer_condition;
	information = dia_bronko_keinbauer_info;
	permanent = TRUE;
	description = "Ты?! Фермер?! Не смеши меня.";
};


var int dia_bronko_keinbauer_noperm;

func int dia_bronko_keinbauer_condition()
{
	if(((MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_RUNNING) || (BABERA_BRONKOKEINBAUER == TRUE)) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_LOST) && (DIA_BRONKO_KEINBAUER_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_bronko_keinbauer_info()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_15_00");	//Ты?! Фермер?! Не смеши меня. Да ты вообще никто.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_06_01");	//Чтоооо? Хочешь получить по морде?
	Info_ClearChoices(dia_bronko_keinbauer);
	if(hero.guild == GIL_NONE)
	{
		if(BABERA_BRONKOKEINBAUER == TRUE)
		{
			Info_AddChoice(dia_bronko_keinbauer,"(пригрозить Бронко наемниками)",dia_bronko_keinbauer_sld);
		};
		if(MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_RUNNING)
		{
			Info_AddChoice(dia_bronko_keinbauer,"Фермер здесь - Секоб, а ты просто мелкий жулик.",dia_bronko_keinbauer_sekobderbauer);
		};
	};
	Info_AddChoice(dia_bronko_keinbauer,"Ну... Давай посмотрим, что ты можешь.",dia_bronko_keinbauer_attack);
	Info_AddChoice(dia_bronko_keinbauer,"Забудь!",dia_bronko_keinbauer_schongut);
};

func void dia_bronko_keinbauer_attack()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_attack_15_00");	//Ну... Давай посмотрим, что ты можешь.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_attack_06_01");	//Я надеялся, что ты скажешь это.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_bronko_keinbauer_sekobderbauer()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_sekobderbauer_15_00");	//Фермер здесь - Секоб, а ты просто мелкий жулик, который пытается обманом вытянуть деньги из кошельков простых людей.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_sekobderbauer_06_01");	//Кто это сказал?
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_sekobderbauer_15_02");	//Я сказал. Секоб хочет, чтобы ты вернулся к работе, а не шлялся здесь без дела.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_sekobderbauer_06_03");	//И что? Что ты теперь будешь делать?
};

func void dia_bronko_keinbauer_schongut()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_schongut_15_00");	//Забудь!
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_schongut_06_01");	//Проваливай!
	AI_StopProcessInfos(self);
};

func void dia_bronko_keinbauer_sld()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_SLD_15_00");	//Хорошо, тогда, пожалуй, мне придется сказать Онару, что здесь есть наглый фермер, который отказывается платить ренту.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_01");	//Черт. Подожди минутку. Онар пошлет сюда наемников.
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_SLD_15_02");	//И что?
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_03");	//Хорошо, хорошо. Я дам тебе все, что ты захочешь, но только не вмешивай в это дело наемников, хорошо?
	if(b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold)))
	{
		AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_04");	//Вот, я даже отдам тебе все мое золото.
	};
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_05");	//И я вернусь в поле и буду работать. Все, что угодно, только не надо наемников.
	AI_StopProcessInfos(self);
	DIA_BRONKO_KEINBAUER_NOPERM = TRUE;
	Npc_ExchangeRoutine(self,"Start");
	MIS_SEKOB_BRONKO_EINGESCHUECHTERT = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BRONKO_FLEISSIG(C_INFO)
{
	npc = bau_935_bronko;
	nr = 3;
	condition = dia_bronko_fleissig_condition;
	information = dia_bronko_fleissig_info;
	permanent = TRUE;
	description = "(подразнить Бронко)";
};


func int dia_bronko_fleissig_condition()
{
	if((MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_SUCCESS) || (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST))
	{
		return TRUE;
	};
};

func void dia_bronko_fleissig_info()
{
	if(MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Bronko_FLEISSIG_15_00");	//Как дела? Работаешь как пчелка, да?
	}
	else
	{
		AI_Output(other,self,"DIA_Bronko_FLEISSIG_15_01");	//Как дела? Желание трепаться еще не пропало?
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_02");	//Ты наемник, да? Я мог бы догадаться.
	}
	else if(MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_03");	//(в страхе) Ты ведь не приведешь сюда этих наемников, да?
	};
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_04");	//Не бей меня, пожалуйста.
	};
	AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_05");	//Я даже вернусь к работе, хорошо?
	MIS_SEKOB_BRONKO_EINGESCHUECHTERT = LOG_SUCCESS;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_BRONKO_PICKPOCKET(C_INFO)
{
	npc = bau_935_bronko;
	nr = 900;
	condition = dia_bronko_pickpocket_condition;
	information = dia_bronko_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_bronko_pickpocket_condition()
{
	return c_beklauen(54,80);
};

func void dia_bronko_pickpocket_info()
{
	Info_ClearChoices(dia_bronko_pickpocket);
	Info_AddChoice(dia_bronko_pickpocket,DIALOG_BACK,dia_bronko_pickpocket_back);
	Info_AddChoice(dia_bronko_pickpocket,DIALOG_PICKPOCKET,dia_bronko_pickpocket_doit);
};

func void dia_bronko_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bronko_pickpocket);
};

func void dia_bronko_pickpocket_back()
{
	Info_ClearChoices(dia_bronko_pickpocket);
};

