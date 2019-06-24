
instance DIA_AKILSSCHAF_KOMMMIT(C_INFO)
{
	npc = follow_sheep_akil;
	nr = 1;
	condition = dia_akilsschaf_kommmit_condition;
	information = dia_akilsschaf_kommmit_info;
	description = "Пойдем со мной!";
};


func int dia_akilsschaf_kommmit_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_akilsschaf_kommmit_info()
{
	b_kommmit();
	b_lieselmaeh();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	if(Npc_IsDead(bdt_1025_bandit_h) == FALSE)
	{
		bdt_1025_bandit_h.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	};
	if(Npc_IsDead(bdt_1026_bandit_h) == FALSE)
	{
		bdt_1026_bandit_h.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	};
	AI_StopProcessInfos(self);
};

