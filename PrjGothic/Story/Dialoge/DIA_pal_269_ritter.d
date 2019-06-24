
instance DIA_PAL_269_EXIT(C_INFO)
{
	npc = pal_269_ritter;
	nr = 999;
	condition = dia_pal_269_exit_condition;
	information = dia_pal_269_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_269_exit_condition()
{
	return TRUE;
};

func void dia_pal_269_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RITTER_HERO(C_INFO)
{
	npc = pal_269_ritter;
	condition = dia_pal_269_hero_condition;
	information = dia_pal_269_hero_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_269_hero_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};


var int dia_ritter_hero_noperm;

func void dia_pal_269_hero_info()
{
	AI_Output(self,other,"DIA_Ritter_HERO_04_00");	//“вое по€вление здесь хороший знак дл€ нас всех. ћы все воспр€ли духом.
	if(DIA_RITTER_HERO_NOPERM == FALSE)
	{
		AI_Output(self,other,"DIA_Ritter_HERO_04_01");	//ћы знаем, что наши товарищи в городе не забыли о нас. √лаз »нноса наблюдает за всеми нами.
		AI_Output(self,other,"DIA_Ritter_HERO_04_02");	//» если орки и драконы будут ломитьс€ в ворота, мы встретим их с подн€тым забралом и будем сражатьс€ до победы или смерти.
		DIA_RITTER_HERO_NOPERM = TRUE;
	};
};

