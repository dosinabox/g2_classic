
instance DIA_1015_BANDIT_EXIT(C_INFO)
{
	npc = bdt_1015_bandit_l;
	nr = 999;
	condition = dia_1015_bandit_exit_condition;
	information = dia_1015_bandit_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_1015_bandit_exit_condition()
{
	return TRUE;
};

func void dia_1015_bandit_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_1015_BANDIT_AMBUSH(C_INFO)
{
	npc = bdt_1015_bandit_l;
	nr = 2;
	condition = dia_1015_bandit_ambush_condition;
	information = dia_1015_bandit_ambush_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_1015_bandit_ambush_condition()
{
	if(Npc_IsDead(ambusher_1014) || Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_1015_bandit_ambush_info()
{
	AI_Output(self,other,"DIA_1015_BANDIT_AMBUSH_06_00");	//Ёй, € нигде не видел твою рожу раньше?
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

