
instance DIA_ZURIS_EXIT(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 999;
	condition = dia_zuris_exit_condition;
	information = dia_zuris_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_zuris_exit_condition()
{
	return TRUE;
};

func void dia_zuris_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ZURIS_PICKPOCKET(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 900;
	condition = dia_zuris_pickpocket_condition;
	information = dia_zuris_pickpocket_info;
	permanent = TRUE;
	description = "(Его зелье будет украсть легко)";
};


func int dia_zuris_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (40 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_zuris_pickpocket_info()
{
	Info_ClearChoices(dia_zuris_pickpocket);
	Info_AddChoice(dia_zuris_pickpocket,DIALOG_BACK,dia_zuris_pickpocket_back);
	Info_AddChoice(dia_zuris_pickpocket,DIALOG_PICKPOCKET,dia_zuris_pickpocket_doit);
};

func void dia_zuris_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		CreateInvItems(self,itpo_health_03,1);
		b_giveinvitems(self,other,itpo_health_03,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_giveplayerxp(XP_AMBIENT);
		Info_ClearChoices(dia_zuris_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_zuris_pickpocket_back()
{
	Info_ClearChoices(dia_zuris_pickpocket);
};


instance DIA_ZURIS_SPERRE(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 2;
	condition = dia_zuris_sperre_condition;
	information = dia_zuris_sperre_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_zuris_sperre_condition()
{
	if((CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_zuris_sperre_info()
{
	AI_Output(self,other,"DIA_Zuris_Sperre_14_00");	//Ты заключенный, сбежавший из горнодобывающей колонии. Проваливай!
	AI_StopProcessInfos(self);
};


instance DIA_ZURIS_GREET(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 2;
	condition = dia_zuris_greet_condition;
	information = dia_zuris_greet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_zuris_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CANTHAR_SPERRE == FALSE) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_zuris_greet_info()
{
	AI_Output(self,other,"DIA_Zuris_GREET_14_00");	//Я Зурис, специалист по зельям.
	AI_Output(self,other,"DIA_Zuris_GREET_14_01");	//Тебе нужна лечебная эссенция или магический эликсир? Тогда ты обратился по адресу.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Зурис торгует зельями на рыночной площади.");
};


var int zuris_einmal;

instance DIA_ZURIS_WAREZ(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 2;
	condition = dia_zuris_warez_condition;
	information = dia_zuris_warez_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи мне свои товары.";
};


func int dia_zuris_warez_condition()
{
	return TRUE;
};

func void dia_zuris_warez_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Zuris_WAREZ_15_00");	//Покажи мне свои товары.
	if((ZURIS_EINMAL == FALSE) && !Npc_KnowsInfo(other,dia_zuris_potions))
	{
		AI_Output(self,other,"DIA_Zuris_GREET_14_02");	//Я только что получил несколько новых зелий. Мой гость, Мастер Дарон, Маг Огня, принес мне их из монастыря.
		ZURIS_EINMAL = TRUE;
	};
};


instance DIA_ZURIS_POTIONS(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 2;
	condition = dia_zuris_potions_condition;
	information = dia_zuris_potions_info;
	permanent = FALSE;
	description = "Ты сам готовишь свои зелья?";
};


func int dia_zuris_potions_condition()
{
	if(Npc_KnowsInfo(hero,dia_zuris_greet))
	{
		return TRUE;
	};
};

func void dia_zuris_potions_info()
{
	AI_Output(other,self,"DIA_Zuris_POTIONS_15_00");	//Ты сам готовишь свои зелья?
	AI_Output(self,other,"DIA_Zuris_POTIONS_14_01");	//Нет, я получаю их из монастыря или покупаю у Константино, алхимика.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Zuris_POTIONS_14_02");	//Если тебя интересуют рецепты приготовления зелий, тебе нужно поговорить с ним. Ему как раз нужен помощник.
		AI_Output(self,other,"DIA_Zuris_POTIONS_14_03");	//Но он слишком туп, чтобы нанять кого-нибудь самому. И к тому же, упрям как мул.
	};
	AI_Output(self,other,"DIA_Zuris_Add_14_00");	//Он всегда проходит мимо меня, когда выходит через восточные ворота собирать растения для своих зелий.
};


instance DIA_ZURIS_KRAUT(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 2;
	condition = dia_zuris_kraut_condition;
	information = dia_zuris_kraut_info;
	permanent = FALSE;
	description = "А где именно Константино собирает травы?";
};


func int dia_zuris_kraut_condition()
{
	if(Npc_KnowsInfo(other,dia_zuris_potions))
	{
		return TRUE;
	};
};

func void dia_zuris_kraut_info()
{
	AI_Output(other,self,"DIA_Zuris_Add_15_01");	//А где именно Константино собирает травы?
	AI_Output(self,other,"DIA_Zuris_Add_14_02");	//Он всегда выходит через восточные ворота города, а затем исчезает в лесу налево.
	AI_Output(self,other,"DIA_Zuris_Add_14_03");	//Он как-то сказал мне, что почти все, что ему нужно, растет там, за исключением царского щавеля.
	Wld_InsertItem(itpl_mana_herb_01,"FP_ITEM_HERB_01");
	Wld_InsertItem(itpl_mana_herb_02,"FP_ITEM_HERB_02");
	Wld_InsertItem(itpl_mana_herb_03,"FP_ITEM_HERB_03");
	Wld_InsertItem(itpl_health_herb_01,"FP_ITEM_HERB_04");
	Wld_InsertItem(itpl_health_herb_02,"FP_ITEM_HERB_05");
	Wld_InsertItem(itpl_health_herb_03,"FP_ITEM_HERB_06");
	Wld_InsertItem(itpl_speed_herb_01,"FP_ITEM_HERB_07");
	Wld_InsertItem(itpl_temp_herb,"FP_ITEM_HERB_08");
	Wld_InsertItem(itpl_strength_herb_01,"FP_ITEM_HERB_09");
	Wld_InsertItem(itpl_dex_herb_01,"FP_ITEM_HERB_10");
};


instance DIA_ZURIS_KRONSTOECKEL(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 2;
	condition = dia_zuris_kronstoeckel_condition;
	information = dia_zuris_kronstoeckel_info;
	permanent = FALSE;
	description = "Константино говорил тебе, где можно найти царский щавель?";
};


func int dia_zuris_kronstoeckel_condition()
{
	if(Npc_KnowsInfo(other,dia_zuris_kraut))
	{
		return TRUE;
	};
};

func void dia_zuris_kronstoeckel_info()
{
	AI_Output(other,self,"DIA_Zuris_Add_15_04");	//Константино говорил тебе, где можно найти царский щавель?
	AI_Output(self,other,"DIA_Zuris_Add_14_05");	//Он как-то упоминал, что он растет около каменных кругов.
	AI_Output(self,other,"DIA_Zuris_Add_14_06");	//Около фермы Лобарта, эта ферма находится неподалеку от других ворот, есть один из таких каменных кругов.
	AI_Output(self,other,"DIA_Zuris_Add_14_07");	//Насколько я помню, он стоит на холме. Там когда-то была могила, или что-то вроде этого.
	Wld_InsertItem(itpl_perm_herb,"FP_ITEM_HERB_11");
};


instance DIA_ZURIS_WHERE(C_INFO)
{
	npc = vlk_409_zuris;
	condition = dia_zuris_where_condition;
	information = dia_zuris_where_info;
	permanent = FALSE;
	description = "Где я могу найти Константино?";
};


func int dia_zuris_where_condition()
{
	if(Npc_KnowsInfo(hero,dia_zuris_potions) && (constantino.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_zuris_where_info()
{
	AI_Output(other,self,"DIA_Zuris_WHERE_15_00");	//Где я могу найти Константино?
	AI_Output(self,other,"DIA_Zuris_WHERE_14_01");	//Его дом находится в туннеле около кузницы Гарада. Его будет нетрудно найти.
};


instance DIA_ZURIS_KLOSTER(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 2;
	condition = dia_zuris_kloster_condition;
	information = dia_zuris_kloster_info;
	description = "Расскажи мне о монастыре.";
};


func int dia_zuris_kloster_condition()
{
	if(ZURIS_EINMAL == TRUE)
	{
		return FALSE;
	};
};

func void dia_zuris_kloster_info()
{
	AI_Output(other,self,"DIA_Zuris_Kloster_14_00");	//Расскажи мне о монастыре.
	AI_Output(self,other,"DIA_Zuris_Kloster_14_01");	//Тебе лучше поговорить об этом с самим Мастером Дароном. Он знает больше меня.
};


instance DIA_ZURIS_MINENANTEIL(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 3;
	condition = dia_zuris_minenanteil_condition;
	information = dia_zuris_minenanteil_info;
	description = "Ты продаешь шахтерские акции?";
};


func int dia_zuris_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_zuris_minenanteil_info()
{
	AI_Output(other,self,"DIA_Zuris_Minenanteil_15_00");	//Ты продаешь шахтерские акции?
	AI_Output(self,other,"DIA_Zuris_Minenanteil_14_01");	//Да. Это оказалось не самое выгодное дело. Это последний раз, когда я ввязываюсь в подобное сомнительное предприятие!
	b_giveplayerxp(XP_AMBIENT);
};

