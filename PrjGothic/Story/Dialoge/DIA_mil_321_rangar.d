
instance DIA_RANGAR_EXIT(C_INFO)
{
	npc = mil_321_rangar;
	nr = 999;
	condition = dia_rangar_exit_condition;
	information = dia_rangar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rangar_exit_condition()
{
	return TRUE;
};

func void dia_rangar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RANGAR_PICKPOCKET(C_INFO)
{
	npc = mil_321_rangar;
	nr = 900;
	condition = dia_rangar_pickpocket_condition;
	information = dia_rangar_pickpocket_info;
	permanent = TRUE;
	description = "(украсть этот ключ будет легко)";
};


func int dia_rangar_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_city_tower_02) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_rangar_pickpocket_info()
{
	Info_ClearChoices(dia_rangar_pickpocket);
	Info_AddChoice(dia_rangar_pickpocket,DIALOG_BACK,dia_rangar_pickpocket_back);
	Info_AddChoice(dia_rangar_pickpocket,DIALOG_PICKPOCKET,dia_rangar_pickpocket_doit);
};

func void dia_rangar_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		b_giveinvitems(self,other,itke_city_tower_02,1);
		b_givethiefxp();
		Info_ClearChoices(dia_rangar_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_rangar_pickpocket_back()
{
	Info_ClearChoices(dia_rangar_pickpocket);
};


instance DIA_RANGAR_HALLO(C_INFO)
{
	npc = mil_321_rangar;
	nr = 2;
	condition = dia_rangar_hallo_condition;
	information = dia_rangar_hallo_info;
	permanent = FALSE;
	description = "Эй, ты что делаешь тут?";
};


func int dia_rangar_hallo_condition()
{
	return TRUE;
};

func void dia_rangar_hallo_info()
{
	AI_Output(other,self,"DIA_Rangar_Hallo_15_00");	//Эй, как дела?
	AI_Output(self,other,"DIA_Rangar_Hallo_07_01");	//Пока у паладинов нет никаких заданий для меня, я могу расслабиться и попить пивка. А что еще делать? (усмехается)
	AI_Output(other,self,"DIA_Rangar_Hallo_15_02");	//Ты работаешь на паладинов?
	AI_Output(self,other,"DIA_Rangar_Hallo_07_03");	//Да, я докладываю им о ситуации в городе. В настоящий момент все спокойно.
};


instance DIA_RANGAR_ORK(C_INFO)
{
	npc = mil_321_rangar;
	nr = 3;
	condition = dia_rangar_ork_condition;
	information = dia_rangar_ork_info;
	permanent = FALSE;
	description = "А как ситуация с орками?";
};


func int dia_rangar_ork_condition()
{
	if(Npc_KnowsInfo(other,dia_rangar_hallo))
	{
		return TRUE;
	};
};

func void dia_rangar_ork_info()
{
	AI_Output(other,self,"DIA_Rangar_Ork_15_00");	//А как ситуация с орками?
	AI_Output(self,other,"DIA_Rangar_Ork_07_01");	//Нет причин для беспокойства - городская стража и паладины держат ситуацию под контролем.
	AI_Output(self,other,"DIA_Rangar_Ork_07_02");	//Иди спокойно домой и оставь нашу работу нам. Мы отвечаем за город и его граждан. -ИК-
};


instance DIA_RANGAR_BIER(C_INFO)
{
	npc = mil_321_rangar;
	nr = 4;
	condition = dia_rangar_bier_condition;
	information = dia_rangar_bier_info;
	permanent = TRUE;
	description = "Хочешь еще пива?";
};


func int dia_rangar_bier_condition()
{
	if(Npc_KnowsInfo(other,dia_rangar_hallo))
	{
		return TRUE;
	};
};

func void dia_rangar_bier_info()
{
	AI_Output(other,self,"DIA_Rangar_Bier_15_00");	//Хочешь еще пива?
	if(b_giveinvitems(other,self,itfo_beer,1))
	{
		if(KNOWS_PALADINS == FALSE)
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_01");	//Ах, нет ничего лучше, чем холодный эль.
			CreateInvItems(self,itfo_booze,1);
			b_useitem(self,itfo_booze);
			AI_Output(other,self,"DIA_Rangar_Bier_15_02");	//Ты что-то хотел сказать насчет орков...
			AI_Output(self,other,"DIA_Rangar_Bier_07_03");	//Ах, да, точно. Орки не представляют угрозы для города.
			AI_Output(self,other,"DIA_Rangar_Bier_07_04");	//Они застряли в Долине Рудников. А Проход охраняется паладинами.
			AI_Output(self,other,"DIA_Rangar_Bier_07_05");	//Даже мясной жук не просочится там.
			KNOWS_PALADINS = 1;
			Info_ClearChoices(dia_rangar_bier);
		}
		else if((KNOWS_PALADINS == 1) && (KNOWS_ORK == TRUE))
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_06");	//Я бы не отказался еще от одной пинты.
			CreateInvItems(self,itfo_booze,1);
			b_useitem(self,itfo_booze);
			AI_Output(other,self,"DIA_Rangar_Bier_15_07");	//Говорят, орков видели у самого города.
			AI_Output(self,other,"DIA_Rangar_Bier_07_08");	//Да, точно, опасный орк около города. Этот орк - настоящий монстр. Он скоро нападет на город.
			AI_Output(self,other,"DIA_Rangar_Bier_07_09");	//Послушай, мы порвем этого орка как тузик тряпку, если он подойдет близко к городу. Понял?
			AI_Output(other,self,"DIA_Rangar_Bier_15_10");	//Понял.
			KNOWS_PALADINS = 2;
			Info_ClearChoices(dia_rangar_bier);
		}
		else
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_11");	//Горький эль - однозначно лучший.
			CreateInvItems(self,itfo_booze,1);
			b_useitem(self,itfo_booze);
			AI_Output(self,other,"DIA_Rangar_Bier_07_12");	//Знаешь, нечасто встретишь парня, готового угостить тебя пивом. Ты наш человек.
			Info_ClearChoices(dia_rangar_bier);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Rangar_Bier_07_13");	//Я хочу еще пива.
		AI_StopProcessInfos(self);
	};
};

