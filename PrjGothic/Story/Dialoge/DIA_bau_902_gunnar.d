
instance DIA_GUNNAR_EXIT(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 999;
	condition = dia_gunnar_exit_condition;
	information = dia_gunnar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gunnar_exit_condition()
{
	return TRUE;
};

func void dia_gunnar_exit_info()
{
	AI_StopProcessInfos(self);
};


var int gunnar_hallogesagt;

instance DIA_GUNNAR_HALLO(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 1;
	condition = dia_gunnar_hallo_condition;
	information = dia_gunnar_hallo_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int dia_gunnar_hallo_condition()
{
	return TRUE;
};

func void dia_gunnar_hallo_info()
{
	AI_Output(other,self,"DIA_Gunnar_Hallo_15_00");	//Как дела?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_01");	//С тех пор, как Онар объявил, что набирает наемников, здесь все кишит бандитами.
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_02");	//Весь сброд, у которого раньше не хватало мужества выйти из леса, теперь собрался здесь.
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_03");	//Эти ублюдки приходят отовсюду...
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_04");	//Так ты теперь тоже наемник, хм?
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_05");	//Да пребудет с тобой Иннос!
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_06");	//Людей из города здесь не жалуют.
	};
	GUNNAR_HALLOGESAGT = TRUE;
};


instance DIA_GUNNAR_EVERYWHERE(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 2;
	condition = dia_gunnar_everywhere_condition;
	information = dia_gunnar_everywhere_info;
	permanent = FALSE;
	description = "Наемники приходят отовсюду?";
};


func int dia_gunnar_everywhere_condition()
{
	if(GUNNAR_HALLOGESAGT == TRUE)
	{
		return TRUE;
	};
};

func void dia_gunnar_everywhere_info()
{
	AI_Output(other,self,"DIA_Gunnar_Everywhere_15_00");	//Наемники приходят отовсюду?
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_01");	//Большинство из них пришло из колонии.
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_02");	//Еще одна группа наемников пришла с юга, там они, вероятно, охотились на орков.
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_03");	//И я готов поклясться, что несколько бандитов с гор тоже пришли сюда, чтобы получить бесплатную еду!
};


instance DIA_GUNNAR_SOUTH(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 3;
	condition = dia_gunnar_south_condition;
	information = dia_gunnar_south_info;
	permanent = TRUE;
	description = "Что ты знаешь о наемниках с юга?";
};


func int dia_gunnar_south_condition()
{
	if(Npc_KnowsInfo(other,dia_gunnar_everywhere))
	{
		return TRUE;
	};
};

func void dia_gunnar_south_info()
{
	AI_Output(other,self,"DIA_Gunnar_South_15_00");	//Что ты знаешь о наемниках с юга?
	AI_Output(self,other,"DIA_Gunnar_South_10_01");	//Немногое. Насколько мне известно, они охотились там на орков.
	AI_Output(self,other,"DIA_Gunnar_South_10_02");	//Их босс - Сильвио. Булко, Сентенза, Рауль и еще несколько парней работают на него...
};


instance DIA_GUNNAR_COLONY(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 4;
	condition = dia_gunnar_colony_condition;
	information = dia_gunnar_colony_info;
	permanent = TRUE;
	description = "А кто пришел из колонии?";
};


func int dia_gunnar_colony_condition()
{
	if(Npc_KnowsInfo(other,dia_gunnar_everywhere))
	{
		return TRUE;
	};
};

func void dia_gunnar_colony_info()
{
	AI_Output(other,self,"DIA_Gunnar_Colony_15_00");	//А кто пришел из колонии?
	AI_Output(self,other,"DIA_Gunnar_Colony_10_01");	//Ли и его люди. Торлоф, Корд, Джарвис, Вольф и кое-кто еще.
};


instance DIA_GUNNAR_BANDITS(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 5;
	condition = dia_gunnar_bandits_condition;
	information = dia_gunnar_bandits_info;
	permanent = TRUE;
	description = "А что это за бандиты, о которых ты говоришь?";
};


func int dia_gunnar_bandits_condition()
{
	if(Npc_KnowsInfo(other,dia_gunnar_everywhere))
	{
		return TRUE;
	};
};

func void dia_gunnar_bandits_info()
{
	AI_Output(other,self,"DIA_Gunnar_Bandits_15_00");	//А что это за бандиты, о которых ты говоришь?
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_01");	//А, это я просто так. Если честно, я не совсем уверен в этом.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_02");	//К югу от этой долины находятся горы с заброшенными шахтами. Там прячутся какие-то бандиты.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_03");	//Они тоже каторжники из колонии, как и большинство наемников здесь.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_04");	//Единственная разница - что там совсем отъявленные головорезы. Они убивают всех, кто подходит слишком близко.
};


instance DIA_GUNNAR_PICKPOCKET(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 900;
	condition = dia_gunnar_pickpocket_condition;
	information = dia_gunnar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_gunnar_pickpocket_condition()
{
	return c_beklauen(45,70);
};

func void dia_gunnar_pickpocket_info()
{
	Info_ClearChoices(dia_gunnar_pickpocket);
	Info_AddChoice(dia_gunnar_pickpocket,DIALOG_BACK,dia_gunnar_pickpocket_back);
	Info_AddChoice(dia_gunnar_pickpocket,DIALOG_PICKPOCKET,dia_gunnar_pickpocket_doit);
};

func void dia_gunnar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_gunnar_pickpocket);
};

func void dia_gunnar_pickpocket_back()
{
	Info_ClearChoices(dia_gunnar_pickpocket);
};

