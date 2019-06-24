
instance DIA_RUMBOLD_EXIT(C_INFO)
{
	npc = mil_335_rumbold;
	nr = 999;
	condition = dia_rumbold_exit_condition;
	information = dia_rumbold_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rumbold_exit_condition()
{
	return TRUE;
};

func void dia_rumbold_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RUMBOLD_PREPERM(C_INFO)
{
	npc = mil_335_rumbold;
	nr = 1;
	condition = dia_rumbold_preperm_condition;
	information = dia_rumbold_preperm_info;
	permanent = TRUE;
	description = "Что ты делаешь здесь?";
};


func int dia_rumbold_preperm_condition()
{
	if(!Npc_KnowsInfo(other,dia_bengar_milizklatschen))
	{
		return TRUE;
	};
};

func void dia_rumbold_preperm_info()
{
	AI_Output(other,self,"DIA_Rumbold_PrePerm_15_00");	//Что вы делаете здесь?
	AI_Output(self,other,"DIA_Rumbold_PrePerm_10_01");	//Проваливай! Понял?
	AI_StopProcessInfos(self);
};


instance DIA_RUMBOLD_HALLO(C_INFO)
{
	npc = mil_335_rumbold;
	nr = 1;
	condition = dia_rumbold_hallo_condition;
	information = dia_rumbold_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_rumbold_hallo_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_milizklatschen))
	{
		return TRUE;
	};
};

func void dia_rumbold_hallo_info()
{
	AI_Output(self,other,"DIA_Rumbold_Hallo_10_00");	//Посмотрите на него! Еще один клоун! Что ты здесь делаешь, а?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Rumbold_Hallo_10_01");	//Кто ты, черт тебя побери?
	}
	else
	{
		AI_Output(self,other,"DIA_Rumbold_Hallo_10_02");	//Еще один из этих грязных наемников!
	};
	Info_ClearChoices(dia_rumbold_hallo);
	Info_AddChoice(dia_rumbold_hallo,"Я никто.",dia_rumbold_hallo_schwanzeinziehen);
	Info_AddChoice(dia_rumbold_hallo,"Я хочу, чтобы вы исчезли отсюда.",dia_rumbold_hallo_verschwindet);
	Info_AddChoice(dia_rumbold_hallo,"Я твой худший кошмар.",dia_rumbold_hallo_attack);
};

func void dia_rumbold_hallo_attack()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_Attack_15_00");	//Я твой худший кошмар.
	AI_Output(self,other,"DIA_Rumbold_HALLO_Attack_10_01");	//Считай, что ты уже труп!
	Info_ClearChoices(dia_rumbold_hallo);
	Info_AddChoice(dia_rumbold_hallo,DIALOG_ENDE,dia_rumbold_hallo_endattack);
};

func void dia_rumbold_hallo_verschwindet()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_verschwindet_15_00");	//Я хочу, чтобы вы исчезли отсюда.
	AI_Output(self,other,"DIA_Rumbold_HALLO_verschwindet_10_01");	//Так-так. То есть, ты хочешь, чтобы мы исчезли?
	AI_Output(self,other,"DIA_Rumbold_HALLO_verschwindet_10_02");	//(угрожающе) А что будет, если мы этого не сделаем, эй?
	Info_ClearChoices(dia_rumbold_hallo);
	Info_AddChoice(dia_rumbold_hallo,"А что если я заплачу вам, чтобы вы убрались отсюда?",dia_rumbold_hallo_geld);
	Info_AddChoice(dia_rumbold_hallo,"В таком случае, вы больше никогда не сможете беспокоить этих фермеров.",dia_rumbold_hallo_aufsmaul);
};

func void dia_rumbold_hallo_aufsmaul()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_AufsMaul_15_00");	//В таком случае, вы больше никогда не сможете беспокоить этих фермеров.
	AI_Output(self,other,"DIA_Rumbold_HALLO_AufsMaul_10_01");	//Ты откусил больше, чем можешь проглотить, кретин!
	Info_ClearChoices(dia_rumbold_hallo);
	Info_AddChoice(dia_rumbold_hallo,DIALOG_ENDE,dia_rumbold_hallo_endattack);
};

func void dia_rumbold_hallo_geld()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_geld_15_00");	//А что если я заплачу вам, чтобы вы убрались отсюда?
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_01");	//Ты хочешь заплатить за Бенгара? Это другое дело.
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_02");	//Дай подумать. Учитывая все, что он нам задолжал, это будет 65 золотых монет.
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_03");	//Либо плати, либо убирайся с дороги.
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_04");	//Ох. А ты что, казначей Бенгара?
	Info_ClearChoices(dia_rumbold_hallo);
	Info_AddChoice(dia_rumbold_hallo,"Ты с ума сошел? Это слишком много.",dia_rumbold_hallo_geld_toomuch);
	if(Npc_HasItems(other,itmi_gold) >= 65)
	{
		Info_AddChoice(dia_rumbold_hallo,"Вот деньги. А теперь проваливайте.",dia_rumbold_hallo_geld_ok);
	};
};

func void dia_rumbold_hallo_geld_ok()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_geld_ok_15_00");	//Вот деньги. А теперь проваливайте.
	b_giveinvitems(other,self,itmi_gold,65);
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_ok_10_01");	//Меня не волнует, кто платит за Бенгара. Удачи. (себе под нос) Кретин!
	AI_StopProcessInfos(self);
	RUMBOLD_BEZAHLT = TRUE;
	Npc_ExchangeRoutine(self,"Start");
	if(Hlp_IsValidNpc(rick) && !Npc_IsDead(rick))
	{
		Npc_ExchangeRoutine(rick,"Start");
		AI_ContinueRoutine(rick);
	};
	if(Hlp_IsValidNpc(bengar) && !Npc_IsDead(bengar))
	{
		Npc_ExchangeRoutine(bengar,"Start");
		AI_ContinueRoutine(bengar);
	};
};

func void dia_rumbold_hallo_geld_toomuch()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_geld_TooMuch_15_00");	//Ты с ума сошел? Это слишком много.
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_TooMuch_10_01");	//Тогда прочь с дороги!
	AI_StopProcessInfos(self);
};

func void dia_rumbold_hallo_schwanzeinziehen()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_schwanzeinziehen_15_00");	//Я никто.
	AI_Output(self,other,"DIA_Rumbold_HALLO_schwanzeinziehen_10_01");	//Тогда убирайся с моей дороги!
	AI_StopProcessInfos(self);
};

func void dia_rumbold_hallo_endattack()
{
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,1);
	if(Hlp_IsValidNpc(rick) && !c_npcisdown(rick))
	{
		b_attack(rick,other,AR_KILL,1);
	};
};


instance DIA_RUMBOLD_FIGHTNOW(C_INFO)
{
	npc = mil_335_rumbold;
	nr = 1;
	condition = dia_rumbold_fightnow_condition;
	information = dia_rumbold_fightnow_info;
	permanent = TRUE;
	description = "Оставьте этого фермера в покое!";
};


func int dia_rumbold_fightnow_condition()
{
	if(Npc_KnowsInfo(other,dia_rumbold_hallo) && (RUMBOLD_BEZAHLT == FALSE))
	{
		return TRUE;
	};
};

func void dia_rumbold_fightnow_info()
{
	AI_Output(other,self,"DIA_Rumbold_FightNow_15_00");	//Оставьте этого фермера в покое!
	AI_Output(self,other,"DIA_Rumbold_FightNow_10_01");	//Ты что, оглох, сынок?
	Info_ClearChoices(dia_rumbold_fightnow);
	Info_AddChoice(dia_rumbold_fightnow,DIALOG_ENDE,dia_rumbold_fightnow_endattack);
};

func void dia_rumbold_fightnow_endattack()
{
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,1);
	if(Hlp_IsValidNpc(rick) && !c_npcisdown(rick))
	{
		b_attack(rick,other,AR_KILL,1);
	};
};


instance DIA_RUMBOLD_STILLTHERE(C_INFO)
{
	npc = mil_335_rumbold;
	nr = 1;
	condition = dia_rumbold_stillthere_condition;
	information = dia_rumbold_stillthere_info;
	permanent = TRUE;
	description = "Вы еще здесь?!";
};


func int dia_rumbold_stillthere_condition()
{
	if(Npc_KnowsInfo(other,dia_rumbold_hallo) && (RUMBOLD_BEZAHLT == TRUE))
	{
		return TRUE;
	};
};

func void dia_rumbold_stillthere_info()
{
	AI_Output(other,self,"DIA_Rumbold_StillThere_15_00");	//Вы еще здесь?!
	AI_Output(self,other,"DIA_Rumbold_StillThere_10_01");	//Сейчас ты у меня попляшешь!
	Info_ClearChoices(dia_rumbold_stillthere);
	Info_AddChoice(dia_rumbold_stillthere,DIALOG_ENDE,dia_rumbold_stillthere_endattack);
};

func void dia_rumbold_stillthere_endattack()
{
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,1);
	if(Hlp_IsValidNpc(rick) && !c_npcisdown(rick))
	{
		b_attack(rick,other,AR_KILL,1);
	};
};


instance DIA_RUMBOLD_PICKPOCKET(C_INFO)
{
	npc = mil_335_rumbold;
	nr = 900;
	condition = dia_rumbold_pickpocket_condition;
	information = dia_rumbold_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_rumbold_pickpocket_condition()
{
	return c_beklauen(24,45);
};

func void dia_rumbold_pickpocket_info()
{
	Info_ClearChoices(dia_rumbold_pickpocket);
	Info_AddChoice(dia_rumbold_pickpocket,DIALOG_BACK,dia_rumbold_pickpocket_back);
	Info_AddChoice(dia_rumbold_pickpocket,DIALOG_PICKPOCKET,dia_rumbold_pickpocket_doit);
};

func void dia_rumbold_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rumbold_pickpocket);
};

func void dia_rumbold_pickpocket_back()
{
	Info_ClearChoices(dia_rumbold_pickpocket);
};

