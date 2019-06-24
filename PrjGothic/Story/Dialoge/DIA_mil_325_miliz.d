
instance DIA_MIL_325_MILIZ_EXIT(C_INFO)
{
	npc = mil_325_miliz;
	nr = 999;
	condition = dia_mil_325_miliz_exit_condition;
	information = dia_mil_325_miliz_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_325_miliz_exit_condition()
{
	return TRUE;
};

func void dia_mil_325_miliz_exit_info()
{
	AI_StopProcessInfos(self);
};


const string MIL_325_CHECKPOINT = "NW_CITY_MERCHANT_PATH_03";

instance DIA_MIL_325_MILIZ_FIRSTWARN(C_INFO)
{
	npc = mil_325_miliz;
	nr = 1;
	condition = dia_mil_325_miliz_firstwarn_condition;
	information = dia_mil_325_miliz_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_325_miliz_firstwarn_condition()
{
	if(Npc_GetDistToWP(other,MIL_325_CHECKPOINT) < 650)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_mil_325_miliz_firstwarn_info()
{
	AI_Output(self,other,"DIA_Mil_325_Miliz_FirstWarn_12_00");	//СТОЙ!
	AI_Output(self,other,"DIA_Mil_325_Miliz_FirstWarn_12_01");	//Сюда вход запрещен!
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,MIL_325_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
};


instance DIA_MIL_325_MILIZ_SECONDWARN(C_INFO)
{
	npc = mil_325_miliz;
	nr = 2;
	condition = dia_mil_325_miliz_secondwarn_condition;
	information = dia_mil_325_miliz_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_325_miliz_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,MIL_325_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_mil_325_miliz_secondwarn_info()
{
	AI_Output(self,other,"DIA_Mil_325_Miliz_SecondWarn_12_00");	//Ты что, оглох? Еще один шаг, и я порублю тебя в капусту!
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,MIL_325_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_MIL_325_MILIZ_ATTACK(C_INFO)
{
	npc = mil_325_miliz;
	nr = 3;
	condition = dia_mil_325_miliz_attack_condition;
	information = dia_mil_325_miliz_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_325_miliz_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,MIL_325_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_mil_325_miliz_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_Output(self,other,"DIA_Mil_325_Miliz_Attack_12_00");	//Это была твоя ошибка!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,0);
};


instance DIA_MIL_325_MILIZ_PASS(C_INFO)
{
	npc = mil_325_miliz;
	nr = 5;
	condition = dia_mil_325_miliz_pass_condition;
	information = dia_mil_325_miliz_pass_info;
	permanent = FALSE;
	description = "Я состою в королевской армии. Я хочу взять снаряжение!";
};


func int dia_mil_325_miliz_pass_condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_mil_325_miliz_pass_info()
{
	AI_Output(other,self,"DIA_Mil_325_Miliz_Pass_15_00");	//Я состою в королевской армии. Я хочу взять снаряжение!
	AI_Output(self,other,"DIA_Mil_325_Miliz_Pass_12_01");	//У тебя есть разрешение на это?
	Info_ClearChoices(dia_mil_325_miliz_pass);
	Info_AddChoice(dia_mil_325_miliz_pass,"Нет.",dia_mil_325_miliz_pass_no);
	Info_AddChoice(dia_mil_325_miliz_pass,"Конечно.",dia_mil_325_miliz_pass_yes);
};

func void dia_mil_325_miliz_pass_yes()
{
	AI_Output(other,self,"DIA_Mil_325_Miliz_Pass_Yes_15_00");	//Конечно.
	AI_Output(self,other,"DIA_Mil_325_Miliz_Pass_Yes_12_01");	//Хорошо, ты можешь войти!
	self.aivar[AIV_PASSGATE] = TRUE;
	Info_ClearChoices(dia_mil_325_miliz_pass);
	AI_StopProcessInfos(self);
};

func void dia_mil_325_miliz_pass_no()
{
	AI_Output(other,self,"DIA_Mil_325_Miliz_Pass_No_15_00");	//Нет.
	AI_Output(self,other,"DIA_Mil_325_Miliz_Pass_No_12_01");	//Тогда убирайся отсюда.
	Info_ClearChoices(dia_mil_325_miliz_pass);
	AI_StopProcessInfos(self);
};


instance DIA_MIL_325_MILIZ_PERM(C_INFO)
{
	npc = mil_325_miliz;
	nr = 5;
	condition = dia_mil_325_miliz_perm_condition;
	information = dia_mil_325_miliz_perm_info;
	permanent = TRUE;
	description = "Почему никому нельзя входить на этот склад?";
};


func int dia_mil_325_miliz_perm_condition()
{
	return TRUE;
};

func void dia_mil_325_miliz_perm_info()
{
	AI_Output(other,self,"DIA_Mil_325_Miliz_PERM_15_00");	//Почему никому нельзя входить на этот склад?
	AI_Output(self,other,"DIA_Mil_325_Miliz_PERM_12_01");	//Достопочтенный лорд Хаген хранит здесь товары, конфискованные для королевской армии.
};

