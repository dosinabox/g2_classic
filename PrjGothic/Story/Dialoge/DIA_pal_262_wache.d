
instance DIA_PAL_262_EXIT(C_INFO)
{
	npc = pal_262_wache;
	nr = 999;
	condition = dia_pal_262_exit_condition;
	information = dia_pal_262_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_262_exit_condition()
{
	return TRUE;
};

func void dia_pal_262_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_262_GREET(C_INFO)
{
	npc = pal_262_wache;
	nr = 2;
	condition = dia_pal_262_greet_condition;
	information = dia_pal_262_greet_info;
	important = TRUE;
};


func int dia_pal_262_greet_condition()
{
	return TRUE;
};

func void dia_pal_262_greet_info()
{
	AI_Output(self,other,"DIA_PAL_262_GREET_10_00");	//Стой - ты кто такой?
	AI_Output(other,self,"DIA_PAL_262_GREET_15_01");	//Вопрос не в том, кто я такой, а откуда я пришел. А пришел я через Проход.
	AI_Output(other,self,"DIA_PAL_262_GREET_15_02");	//Ты все еще хочешь остановить меня, или, может, я все же пройду?
	AI_Output(self,other,"DIA_PAL_262_GREET_10_03");	//Ну, откуда же я мог знать? Конечно же, ты можешь пройти.
	AI_StopProcessInfos(self);
};


instance DIA_WACHE_PERM(C_INFO)
{
	npc = pal_262_wache;
	nr = 3;
	condition = dia_wache_perm_condition;
	information = dia_wache_perm_info;
	permanent = TRUE;
	description = "Кто командует здесь?";
};


func int dia_wache_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_262_greet))
	{
		return TRUE;
	};
};

func void dia_wache_perm_info()
{
	AI_Output(other,self,"DIA_Wache_PERM_15_00");	//Кто командует здесь?
	AI_Output(self,other,"DIA_Wache_PERM_10_01");	//Наш командующий Гаронд и два его советника, паладины Орик и Парсиваль.
	AI_Output(self,other,"DIA_Wache_PERM_10_02");	//Днем ты можешь застать их в тронном зале на первом этаже.
};

