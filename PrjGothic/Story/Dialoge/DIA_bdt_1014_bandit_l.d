
instance DIA_BDT_1014_BANDIT_EXIT(C_INFO)
{
	npc = bdt_1014_bandit_l;
	nr = 999;
	condition = dia_bdt_1014_bandit_exit_condition;
	information = dia_bdt_1014_bandit_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1014_bandit_exit_condition()
{
	return TRUE;
};

func void dia_bdt_1014_bandit_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1014_BANDIT_KILLER(C_INFO)
{
	npc = bdt_1014_bandit_l;
	nr = 1;
	condition = dia_bdt_1014_bandit_killer_condition;
	information = dia_bdt_1014_bandit_killer_info;
	important = TRUE;
};


func int dia_bdt_1014_bandit_killer_condition()
{
	if(Npc_KnowsInfo(other,dia_1013_bandit_ambush) || Npc_IsDead(ambusher_1013) || (BDT13_FRIEND == TRUE) || Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1014_bandit_killer_info()
{
	AI_Output(self,other,"DIA_BDT_1014_BANDIT_KILLER_06_00");	//Это он, точно! Держи его!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

