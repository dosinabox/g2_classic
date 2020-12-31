
instance DIA_BROMOR_EXIT(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 999;
	condition = dia_bromor_exit_condition;
	information = dia_bromor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bromor_exit_condition()
{
	return TRUE;
};

func void dia_bromor_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_BROMOR_GIRLS(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 2;
	condition = dia_bromor_girls_condition;
	information = dia_bromor_girls_info;
	permanent = FALSE;
	description = "Я хочу развлечься.";
};


func int dia_bromor_girls_condition()
{
	if(NPCOBSESSEDBYDMT_BROMOR == FALSE)
	{
		return TRUE;
	};
};

func void dia_bromor_girls_info()
{
	AI_Output(other,self,"DIA_Bromor_Pay_15_00");	//Я хочу развлечься.
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_01");	//Ну да, все сюда за этим приходят.
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_02");	//Я Бромор. Это мой дом, а это мои девочки. Я люблю моих девочек.
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_03");	//А если ты любишь моих девочек тоже, ты должен заплатить за это 50 золотых монет.
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_04");	//Смотри только, чтобы никаких проблем.
};


instance DIA_BROMOR_PAY(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 2;
	condition = dia_bromor_pay_condition;
	information = dia_bromor_pay_info;
	permanent = TRUE;
	description = "Я хочу развлечься (заплатить 50 золотых).";
};


func int dia_bromor_pay_condition()
{
	if((BROMOR_PAY == FALSE) && Npc_KnowsInfo(other,dia_bromor_girls) && (NPCOBSESSEDBYDMT_BROMOR == FALSE) && (Npc_IsDead(nadja) == FALSE))
	{
		return TRUE;
	};
};


var int dia_bromor_pay_onetime;

func void dia_bromor_pay_info()
{
	AI_Output(other,self,"DIA_Bromor_Pay_15_00");	//Я хочу развлечься.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Bromor_Pay_07_01");	//Отлично. (ухмыляется) Ты долго не забудешь следующие несколько часов твоей жизни.
		AI_Output(self,other,"DIA_Bromor_Pay_07_02");	//Иди наверх с Надей. Удачи.
		if(DIA_BROMOR_PAY_ONETIME == FALSE)
		{
			DIA_BROMOR_PAY_ONETIME = TRUE;
		};
		BROMOR_PAY = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Bromor_Pay_07_03");	//Я не выношу, когда кто-нибудь пытается надуть меня. Убирайся отсюда, если не можешь заплатить.
	};
	b_npcclearobsessionbydmt(self);
};


instance DIA_BROMOR_DOPE(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 3;
	condition = dia_bromor_dope_condition;
	information = dia_bromor_dope_info;
	permanent = FALSE;
	description = "А могу я рассчитывать на 'особые' услуги, а?";
};


func int dia_bromor_dope_condition()
{
	if((MIS_ANDRE_REDLIGHT == LOG_RUNNING) && (NPCOBSESSEDBYDMT_BROMOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_bromor_dope_info()
{
	AI_Output(other,self,"DIA_Bromor_DOPE_15_00");	//А могу я рассчитывать на 'особые' услуги, а?
	AI_Output(self,other,"DIA_Bromor_DOPE_07_01");	//Конечно, все мои девочки особенные. (ухмыляется)
	AI_Output(self,other,"DIA_Bromor_DOPE_07_02");	//Если у тебя есть деньги, ты можешь пойти наверх с Надей.
};


instance DIA_BROMOR_OBSESSION(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 30;
	condition = dia_bromor_obsession_condition;
	information = dia_bromor_obsession_info;
	description = "Все в порядке?";
};


func int dia_bromor_obsession_condition()
{
	if((KAPITEL >= 3) && (NPCOBSESSEDBYDMT_BROMOR == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int dia_bromor_obsession_gotmoney;

func void dia_bromor_obsession_info()
{
	b_npcobsessedbydmt(self);
};


instance DIA_BROMOR_HEILUNG(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 55;
	condition = dia_bromor_heilung_condition;
	information = dia_bromor_heilung_info;
	permanent = TRUE;
	description = "Ты одержим.";
};


func int dia_bromor_heilung_condition()
{
	if((NPCOBSESSEDBYDMT_BROMOR == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_bromor_heilung_info()
{
	AI_Output(other,self,"DIA_Bromor_Heilung_15_00");	//Ты одержим.
	AI_Output(self,other,"DIA_Bromor_Heilung_07_01");	//Что? О чем это ты? Убирайся отсюда.
	b_npcclearobsessionbydmt(self);
};


instance DIA_BROMOR_PICKPOCKET(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 900;
	condition = dia_bromor_pickpocket_condition;
	information = dia_bromor_pickpocket_info;
	permanent = TRUE;
	description = "(воровать этот ключ рискованно)";
};


func int dia_bromor_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_bromor) >= 1) && (other.attribute[ATR_DEXTERITY] >= (50 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_bromor_pickpocket_info()
{
	Info_ClearChoices(dia_bromor_pickpocket);
	Info_AddChoice(dia_bromor_pickpocket,DIALOG_BACK,dia_bromor_pickpocket_back);
	Info_AddChoice(dia_bromor_pickpocket,DIALOG_PICKPOCKET,dia_bromor_pickpocket_doit);
};

func void dia_bromor_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		b_giveinvitems(self,other,itke_bromor,1);
		b_givethiefxp();
		Info_ClearChoices(dia_bromor_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_bromor_pickpocket_back()
{
	Info_ClearChoices(dia_bromor_pickpocket);
};

