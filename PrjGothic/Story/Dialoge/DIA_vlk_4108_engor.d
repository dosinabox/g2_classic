
instance DIA_ENGOR_EXIT(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 999;
	condition = dia_engor_exit_condition;
	information = dia_engor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_engor_exit_condition()
{
	return TRUE;
};

func void dia_engor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ENGOR_HALLO(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 2;
	condition = dia_engor_hallo_condition;
	information = dia_engor_hallo_info;
	important = TRUE;
};


func int dia_engor_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_engor_hallo_info()
{
	AI_Output(self,other,"DIA_Engor_HALLO_13_00");	//А, ты тот парень, которому удалось пройти через Проход?
	AI_Output(other,self,"DIA_Engor_HALLO_15_01");	//Да.
	AI_Output(self,other,"DIA_Engor_HALLO_13_02");	//Отлично. Я Энгор - я обеспечиваю эту экспедицию.
	AI_Output(self,other,"DIA_Engor_HALLO_13_03");	//Только не думай, что можешь получить от меня что-нибудь бесплатно!
	AI_Output(self,other,"DIA_Engor_HALLO_13_04");	//Но если в твоих карманах позванивает золото, мы всегда договоримся.
	Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
	b_logentry(TOPIC_TRADER_OC,"Энгор заведует припасами замка и ведет небольшой бизнес на стороне.");
};


instance DIA_ENGOR_HANDELN(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 10;
	condition = dia_engor_handeln_condition;
	information = dia_engor_handeln_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи мне свои товары.";
};


func int dia_engor_handeln_condition()
{
	if(Npc_KnowsInfo(hero,dia_engor_hallo))
	{
		return TRUE;
	};
};

func void dia_engor_handeln_info()
{
	var int mcbolzenamount;
	var int mcarrowamount;
	b_givetradeinv(self);
	Npc_RemoveInvItems(self,itrw_bolt,Npc_HasItems(self,itrw_bolt));
	mcbolzenamount = KAPITEL * 50;
	CreateInvItems(self,itrw_bolt,mcbolzenamount);
	Npc_RemoveInvItems(self,itrw_arrow,Npc_HasItems(self,itrw_arrow));
	mcarrowamount = KAPITEL * 50;
	CreateInvItems(self,itrw_arrow,mcarrowamount);
	AI_Output(other,self,"DIA_Engor_HANDELN_15_00");	//Покажи мне свои товары.
};


instance DIA_ENGOR_ABOUTPARLAF(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 2;
	condition = dia_engor_aboutparlaf_condition;
	information = dia_engor_aboutparlaf_info;
	description = "Ты распределяешь пайки, как я слышал?";
};


func int dia_engor_aboutparlaf_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlaf_engor))
	{
		return TRUE;
	};
};

func void dia_engor_aboutparlaf_info()
{
	AI_Output(other,self,"DIA_Engor_ABOUTPARLAF_15_00");	//Ты распределяешь пайки, как я слышал?
	AI_Output(self,other,"DIA_Engor_ABOUTPARLAF_13_01");	//Это так. А что? Мне теперь и тебя кормить придется?
	AI_Output(self,other,"DIA_Engor_ABOUTPARLAF_13_02");	//Если тебе что-то нужно, тебе придется платить за это - как и всем остальным.
};


instance DIA_ENGOR_RUESTUNG(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 2;
	condition = dia_engor_ruestung_condition;
	information = dia_engor_ruestung_info;
	permanent = FALSE;
	description = "У тебя есть что-нибудь интересное для меня?";
};


func int dia_engor_ruestung_condition()
{
	if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void dia_engor_ruestung_info()
{
	AI_Output(other,self,"DIA_Engor_Ruestung_15_00");	//У тебя есть что-нибудь интересное для меня?
	AI_Output(self,other,"DIA_Engor_Ruestung_13_01");	//Я могу продать тебе хорошие доспехи - тяжелые доспехи ополчения. Если, конечно, тебе это интересно.
	AI_Output(self,other,"DIA_Engor_Ruestung_13_02");	//Они недешевы, конечно же. Но если у тебя есть золото, ты получишь их.
};


instance DIA_ENGOR_RSKAUFEN(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 2;
	condition = dia_engor_rskaufen_condition;
	information = dia_engor_rskaufen_info;
	permanent = TRUE;
	description = "Купить тяжелые доспехи ополчения (2500 золота)";
};


var int dia_engor_rskaufen_perm;

func int dia_engor_rskaufen_condition()
{
	if((other.guild == GIL_MIL) && Npc_KnowsInfo(other,dia_engor_ruestung) && (DIA_ENGOR_RSKAUFEN_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_engor_rskaufen_info()
{
	if(b_giveinvitems(other,self,itmi_gold,2500))
	{
		AI_Output(other,self,"DIA_Engor_RSkaufen_15_00");	//Дай мне доспехи.
		AI_Output(self,other,"DIA_Engor_RSkaufen_13_01");	//Вот, держи, они надежно защитят тебя - это чертовски хорошие доспехи.
		b_giveinvitems(self,other,itar_mil_m,1);
		DIA_ENGOR_RSKAUFEN_PERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Engor_RSkaufen_13_02");	//Сначала принеси золото.
	};
};


instance DIA_ENGOR_HELP(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 3;
	condition = dia_engor_help_condition;
	information = dia_engor_help_info;
	description = "Может, я смогу помочь тебе в твоей работе?";
};


func int dia_engor_help_condition()
{
	if(Npc_KnowsInfo(hero,dia_engor_aboutparlaf))
	{
		return TRUE;
	};
};

func void dia_engor_help_info()
{
	AI_Output(other,self,"DIA_Engor_HELP_15_00");	//Может, я смогу помочь тебе в твоей работе?
	AI_Output(self,other,"DIA_Engor_HELP_13_01");	//Хмм... Конечно, почему нет? Мне не помешала бы помощь.
	AI_Output(other,self,"DIA_Engor_HELP_15_02");	//Так что нужно сделать?
	AI_Output(self,other,"DIA_Engor_HELP_13_03");	//Наши запасы продовольствия на исходе. Хуже всего, что у нас почти не осталось мяса.
	AI_Output(self,other,"DIA_Engor_HELP_13_04");	//Так что если сможешь раздобыть мясо, сырое или приготовленное, окорока или колбасу, я был бы очень благодарен. Ну, как? Ты поможешь нам?
	Info_ClearChoices(dia_engor_help);
	Info_AddChoice(dia_engor_help,"У меня нет времени на это.",dia_engor_help_no);
	Info_AddChoice(dia_engor_help,"Не волнуйся, я принесу тебе мясо.",dia_engor_help_yes);
};

func void dia_engor_help_no()
{
	AI_Output(other,self,"DIA_Engor_HELP_NO_15_00");	//У меня нет времени на это.
	AI_Output(self,other,"DIA_Engor_HELP_NO_13_01");	//Тогда зачем ты тратишь мое время попусту?
	MIS_ENGOR_BRINGMEAT = LOG_OBSOLETE;
	AI_StopProcessInfos(self);
};

func void dia_engor_help_yes()
{
	AI_Output(other,self,"DIA_Engor_HELP_YES_15_00");	//Не волнуйся, я принесу тебе мясо.
	AI_Output(self,other,"DIA_Engor_HELP_YES_13_01");	//Две дюжины кусков хватило бы, чтобы накормить все эти голодные рты. Возвращайся, когда у тебя будет это мясо. А мне нужно работать.
	Log_CreateTopic(TOPIC_BRINGMEAT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BRINGMEAT,LOG_RUNNING);
	b_logentry(TOPIC_BRINGMEAT,"Энгору нужно две дюжины кусков мяса, чтобы накормить людей в замке.");
	b_logentry(TOPIC_BRINGMEAT,"Неважно, что это будет - колбаса, окорок, сырое или жареное мясо. Что угодно, лишь бы это можно было жевать.");
	MIS_ENGOR_BRINGMEAT = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_ENGOR_BRINGMEAT(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 4;
	condition = dia_engor_bringmeat_condition;
	information = dia_engor_bringmeat_info;
	permanent = TRUE;
	description = "Вот, я принес тебе кое-что. (дать мясо).";
};


func int dia_engor_bringmeat_condition()
{
	if((MIS_ENGOR_BRINGMEAT == LOG_RUNNING) && (MEAT_COUNTER < MEAT_AMOUNT) && ((Npc_HasItems(hero,itfo_bacon) >= 1) || (Npc_HasItems(hero,itfomuttonraw) >= 1) || (Npc_HasItems(hero,itfomutton) >= 1) || (Npc_HasItems(hero,itfo_sausage) >= 1)))
	{
		return TRUE;
	};
};

func void dia_engor_bringmeat_info()
{
	AI_Output(other,self,"DIA_Engor_BRINGMEAT_15_00");	//Вот, я принес тебе кое-что.
	if(Npc_HasItems(hero,itfomuttonraw) >= 1)
	{
		if((Npc_HasItems(hero,itfomuttonraw) >= MEAT_AMOUNT) && (MEAT_COUNTER < MEAT_AMOUNT))
		{
			b_giveinvitems(hero,self,itfomuttonraw,MEAT_AMOUNT - MEAT_COUNTER);
			MEAT_COUNTER = MEAT_COUNTER + (MEAT_AMOUNT - MEAT_COUNTER);
		}
		else if((Npc_HasItems(hero,itfomuttonraw) < MEAT_AMOUNT) && (MEAT_COUNTER < MEAT_AMOUNT))
		{
			MEAT_COUNTER = MEAT_COUNTER + Npc_HasItems(hero,itfomuttonraw);
			b_giveinvitems(hero,self,itfomuttonraw,Npc_HasItems(hero,itfomuttonraw));
		};
	};
	if(Npc_HasItems(hero,itfomutton) >= 1)
	{
		if((Npc_HasItems(hero,itfomutton) >= MEAT_AMOUNT) && (MEAT_COUNTER < MEAT_AMOUNT))
		{
			b_giveinvitems(hero,self,itfomutton,MEAT_AMOUNT - MEAT_COUNTER);
			MEAT_COUNTER = MEAT_COUNTER + (MEAT_AMOUNT - MEAT_COUNTER);
		}
		else if((Npc_HasItems(hero,itfomutton) < MEAT_AMOUNT) && (MEAT_COUNTER < MEAT_AMOUNT))
		{
			MEAT_COUNTER = MEAT_COUNTER + Npc_HasItems(hero,itfomutton);
			b_giveinvitems(hero,self,itfomutton,Npc_HasItems(hero,itfomutton));
		};
	};
	if(Npc_HasItems(hero,itfo_bacon) >= 1)
	{
		if((Npc_HasItems(hero,itfo_bacon) >= MEAT_AMOUNT) && (MEAT_COUNTER < MEAT_AMOUNT))
		{
			b_giveinvitems(hero,self,itfo_bacon,MEAT_AMOUNT - MEAT_COUNTER);
			MEAT_COUNTER = MEAT_COUNTER + (MEAT_AMOUNT - MEAT_COUNTER);
		}
		else if((Npc_HasItems(hero,itfo_bacon) < MEAT_AMOUNT) && (MEAT_COUNTER < MEAT_AMOUNT))
		{
			MEAT_COUNTER = MEAT_COUNTER + Npc_HasItems(hero,itfo_bacon);
			b_giveinvitems(hero,self,itfo_bacon,Npc_HasItems(hero,itfo_bacon));
		};
	};
	if(Npc_HasItems(hero,itfo_sausage) >= 1)
	{
		if((Npc_HasItems(hero,itfo_sausage) >= MEAT_AMOUNT) && (MEAT_COUNTER < MEAT_AMOUNT))
		{
			b_giveinvitems(hero,self,itfo_sausage,MEAT_AMOUNT - MEAT_COUNTER);
			MEAT_COUNTER = MEAT_COUNTER + (MEAT_AMOUNT - MEAT_COUNTER);
		}
		else if((Npc_HasItems(hero,itfo_sausage) < MEAT_AMOUNT) && (MEAT_COUNTER < MEAT_AMOUNT))
		{
			MEAT_COUNTER = MEAT_COUNTER + Npc_HasItems(hero,itfo_sausage);
			b_giveinvitems(hero,self,itfo_sausage,Npc_HasItems(hero,itfo_sausage));
		};
	};
	if(MEAT_AMOUNT > MEAT_COUNTER)
	{
		AI_Output(self,other,"DIA_Engor_BRINGMEAT_13_01");	//Для начала и это неплохо, но мне нужно больше.
	};
	if(MEAT_COUNTER == MEAT_AMOUNT)
	{
		AI_Output(self,other,"DIA_Engor_BRINGMEAT_13_02");	//Отлично, ты принес достаточно мяса. Этого хватит на некоторое время.
		AI_Output(self,other,"DIA_Engor_BRINGMEAT_13_03");	//Но даже не надейся, что я теперь буду давать тебе что-нибудь бесплатно!
		MIS_ENGOR_BRINGMEAT = LOG_SUCCESS;
		b_giveplayerxp(XP_BRINGMEAT);
		Log_AddEntry(TOPIC_BRINGMEAT,"Энгор получил свое мясо. Он разделит его между защитниками замка.");
	};
};


instance DIA_ENGOR_BUSINESS(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 1;
	condition = dia_engor_business_condition;
	information = dia_engor_business_info;
	permanent = FALSE;
	description = "Как торговля?";
};


func int dia_engor_business_condition()
{
	if((KAPITEL >= 4) && (MIS_ENGOR_BRINGMEAT == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_engor_business_info()
{
	AI_Output(other,self,"DIA_Engor_Business_15_00");	//Как бизнес?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Engor_Business_13_01");	//Неважно. Я надеюсь, что хотя бы у этих охотников на драконов есть какое-нибудь золото.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Engor_Business_13_02");	//Паршиво! Паладины ничего не покупают.
	};
	AI_Output(self,other,"DIA_Engor_Business_13_03");	//А как насчет тебя? Ты хочешь что-нибудь купить?
};


instance DIA_ENGOR_PICKPOCKET(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 900;
	condition = dia_engor_pickpocket_condition;
	information = dia_engor_pickpocket_info;
	permanent = TRUE;
	description = "(украсть его карту будет довольно просто)";
};


func int dia_engor_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itwr_map_oldworld) >= 1) && (other.attribute[ATR_DEXTERITY] >= (40 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_engor_pickpocket_info()
{
	Info_ClearChoices(dia_engor_pickpocket);
	Info_AddChoice(dia_engor_pickpocket,DIALOG_BACK,dia_engor_pickpocket_back);
	Info_AddChoice(dia_engor_pickpocket,DIALOG_PICKPOCKET,dia_engor_pickpocket_doit);
};

func void dia_engor_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		b_giveinvitems(self,other,itwr_map_oldworld,1);
		b_givethiefxp();
		Info_ClearChoices(dia_engor_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_engor_pickpocket_back()
{
	Info_ClearChoices(dia_engor_pickpocket);
};

