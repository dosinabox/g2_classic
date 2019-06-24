
instance DIA_BULLCO_EXIT(C_INFO)
{
	npc = sld_807_bullco;
	nr = 999;
	condition = dia_bullco_exit_condition;
	information = dia_bullco_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bullco_exit_condition()
{
	return TRUE;
};

func void dia_bullco_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BULLCO_HALLO(C_INFO)
{
	npc = sld_807_bullco;
	nr = 1;
	condition = dia_bullco_hallo_condition;
	information = dia_bullco_hallo_info;
	permanent = TRUE;
	description = "Нам двоим нужно поболтать...";
};


func int dia_bullco_hallo_condition()
{
	return TRUE;
};

func void dia_bullco_hallo_info()
{
	AI_Output(other,self,"DIA_Bullco_HALLO_15_00");	//Нам двоим нужно поболтать...
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Bullco_HALLO_06_01");	//Послушай, ты победил! Теперь оставь меня в покое.
	}
	else
	{
		AI_Output(self,other,"DIA_Bullco_HALLO_06_02");	//Я ничего не хочу знать об этом.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BULLCO_QUATSCHER(C_INFO)
{
	npc = sld_807_bullco;
	nr = 2;
	condition = dia_bullco_quatscher_condition;
	information = dia_bullco_quatscher_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bullco_quatscher_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (SYLVIO_ANGEQUATSCHT >= 2))
	{
		return TRUE;
	};
};

func void dia_bullco_quatscher_info()
{
	AI_Output(self,other,"DIA_Bullco_Quatscher_06_00");	//Сильвио не любит болтунов. Ты мог бы понять это уже.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PEE");
	b_attack(self,other,AR_NONE,1);
};


var int bullco_leave_day;
var int bullco_scharf;

instance DIA_BULLCO_PLEASELEAVE(C_INFO)
{
	npc = sld_807_bullco;
	nr = 3;
	condition = dia_bullco_pleaseleave_condition;
	information = dia_bullco_pleaseleave_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bullco_pleaseleave_condition()
{
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE) || (SYLVIO_MENDEFEATED == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_bullco_pleaseleave_info()
{
	AI_Output(self,other,"DIA_Bullco_PleaseLeave_06_00");	//Нам нужно поговорить. Тебе и мне.
	AI_Output(other,self,"DIA_Bullco_PleaseLeave_15_01");	//Что тебе нужно?
	AI_Output(self,other,"DIA_Bullco_PleaseLeave_06_02");	//Я думаю, будет лучше для всех, если твоя физиономия больше не будет маячить на этой ферме.
	AI_Output(self,other,"DIA_Bullco_PleaseLeave_06_03");	//Чтобы завтра утром тебя здесь не было. Мы поняли друг друга?
	BULLCO_LEAVE_DAY = b_getdayplus();
	BULLCO_SCHARF = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PEE");
};


var int bullco_hitcounter;

instance DIA_BULLCO_DAILYCHECK(C_INFO)
{
	npc = sld_807_bullco;
	nr = 4;
	condition = dia_bullco_dailycheck_condition;
	information = dia_bullco_dailycheck_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bullco_dailycheck_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (BULLCO_SCHARF == TRUE) && (Wld_GetDay() > BULLCO_LEAVE_DAY))
	{
		return TRUE;
	};
};

func void dia_bullco_dailycheck_info()
{
	if(BULLCO_HITCOUNTER == 0)
	{
		AI_Output(self,other,"DIA_Bullco_DailyCheck_06_00");	//Ты все еще здесь...
		AI_Output(self,other,"DIA_Bullco_DailyCheck_06_01");	//А я-то думал, мы договорились, что я позволю тебе уйти с миром.
		AI_Output(self,other,"DIA_Bullco_DailyCheck_06_02");	//Тебе стоило прислушаться к моим словам.
	}
	else
	{
		AI_Output(self,other,"DIA_Bullco_DailyCheck_06_03");	//Глазам своим не верю! Этот урод все еще здесь!
	};
	Bullco_HitCounter += 1;
	BULLCO_LEAVE_DAY = b_getdayplus();
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_BULLCO_WONTLEAVE(C_INFO)
{
	npc = sld_807_bullco;
	nr = 5;
	condition = dia_bullco_wontleave_condition;
	information = dia_bullco_wontleave_info;
	permanent = FALSE;
	description = "Я НЕ СОБИРАЮСЬ уходить отсюда!";
};


func int dia_bullco_wontleave_condition()
{
	if(BULLCO_SCHARF == TRUE)
	{
		return TRUE;
	};
};

func void dia_bullco_wontleave_info()
{
	AI_Output(other,self,"DIA_Bullco_WontLeave_15_00");	//Я НЕ СОБИРАЮСЬ уходить отсюда!
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Bullco_WontLeave_06_01");	//(вздыхает) Похоже, нам придется обсудить этот вопрос опять.
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Bullco_WontLeave_06_02");	//(ворчливо) Да, да, иди, расскажи это кому-нибудь, кому это интересно.
		BULLCO_SCHARF = FALSE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_BULLCO_PEPESSCHAFE(C_INFO)
{
	npc = sld_807_bullco;
	nr = 6;
	condition = dia_bullco_pepesschafe_condition;
	information = dia_bullco_pepesschafe_info;
	permanent = FALSE;
	description = "Тебе имя Пепе говорит о чем-нибудь?";
};


func int dia_bullco_pepesschafe_condition()
{
	if((MIS_PEPE_KILLWOLVES == LOG_SUCCESS) && (BULLCO_SCHARF == TRUE) && (ONAR_WEGENPEPE == TRUE))
	{
		return TRUE;
	};
};

func void dia_bullco_pepesschafe_info()
{
	AI_Output(other,self,"DIA_Bullco_PepesSchafe_15_00");	//Тебе имя Пепе говорит о чем-нибудь?
	AI_Output(self,other,"DIA_Bullco_PepesSchafe_06_01");	//Я абсолютно не понимаю, о чем ты говоришь, но твой тон мне не нравится!
	AI_Output(other,self,"DIA_Bullco_PepesSchafe_15_02");	//Ты должен был охранять овец.
	AI_Output(self,other,"DIA_Bullco_PepesSchafe_06_03");	//Какое мне дело до овец?
	AI_Output(other,self,"DIA_Bullco_PepesSchafe_15_04");	//До них есть дело Ли.
	AI_Output(self,other,"DIA_Bullco_PepesSchafe_06_05");	//На что ты намекаешь?
	AI_Output(other,self,"DIA_Bullco_PepesSchafe_15_06");	//Если ты продолжишь действовать мне на нервы, я позабочусь, чтобы тебе пришлось заплатить за овец.
	AI_Output(other,self,"DIA_Bullco_PepesSchafe_15_07");	//Так что если тебя волнует твое жалование, оставь меня в покое!
	AI_Output(self,other,"DIA_Bullco_PepesSchafe_06_08");	//(в ярости) Ты, ты...
	AI_Output(other,self,"DIA_Bullco_PepesSchafe_15_09");	//(спокойно) Да?
	AI_Output(self,other,"DIA_Bullco_PepesSchafe_06_10");	//(себе под нос) Мерзкий коварный ублюдок...
	BULLCO_SCHARF = FALSE;
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};


instance DIA_BULLCOSLD_PICKPOCKET(C_INFO)
{
	npc = sld_807_bullco;
	nr = 900;
	condition = dia_bullcosld_pickpocket_condition;
	information = dia_bullcosld_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_bullcosld_pickpocket_condition()
{
	return c_beklauen(56,35);
};

func void dia_bullcosld_pickpocket_info()
{
	Info_ClearChoices(dia_bullcosld_pickpocket);
	Info_AddChoice(dia_bullcosld_pickpocket,DIALOG_BACK,dia_bullcosld_pickpocket_back);
	Info_AddChoice(dia_bullcosld_pickpocket,DIALOG_PICKPOCKET,dia_bullcosld_pickpocket_doit);
};

func void dia_bullcosld_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bullcosld_pickpocket);
};

func void dia_bullcosld_pickpocket_back()
{
	Info_ClearChoices(dia_bullcosld_pickpocket);
};

