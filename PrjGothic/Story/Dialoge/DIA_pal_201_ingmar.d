
instance DIA_INGMAR_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_exit_condition;
	information = dia_ingmar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_ingmar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_HALLO(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 2;
	condition = dia_ingmar_hallo_condition;
	information = dia_ingmar_hallo_info;
	permanent = TRUE;
	important = TRUE;
};


var int dia_ingmar_hallo_permanent;

func int dia_ingmar_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_INGMAR_HALLO_PERMANENT == FALSE) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_ingmar_hallo_info()
{
	if((ENTEROW_KAPITEL2 == FALSE) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_00");	//Согласно полученным мной сообщениям, Долина Рудников - опасное место.
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_01");	//Позаботься о своем снаряжении, прежде чем отправляться туда.
	}
	else if((MIS_OLDWORLD == LOG_SUCCESS) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_02");	//Обстановка в Долине Рудников очень тревожит меня. Но мы разработаем план, чтобы преодолеть все опасности и вытащить наших парней оттуда вместе с рудой.
		DIA_INGMAR_HALLO_PERMANENT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_03");	//Я думал, ты пришел поговорить с лордом Хагеном. Так иди же к нему.
	};
};


instance DIA_INGMAR_KRIEG(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 99;
	condition = dia_ingmar_krieg_condition;
	information = dia_ingmar_krieg_info;
	permanent = FALSE;
	description = "Как дела на материке?";
};


func int dia_ingmar_krieg_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_ingmar_krieg_info()
{
	AI_Output(other,self,"DIA_Ingmar_Krieg_15_00");	//Как дела на материке?
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_01");	//Война еще не выиграна, хотя королевские войска уже теснят орков.
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_02");	//Но мелкие отряды орков появляются то здесь, то там, пытаясь рассредоточить нашу армию.
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_03");	//Они сражаются без мужества и без веры, и поэтому в конце концов мы обязательно победим.
};


instance DIA_INGMAR_CANTEACH(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 100;
	condition = dia_ingmar_canteach_condition;
	information = dia_ingmar_canteach_info;
	permanent = TRUE;
	description = "Ты можешь обучить меня?";
};


func int dia_ingmar_canteach_condition()
{
	if(INGMAR_TEACHSTR == FALSE)
	{
		return TRUE;
	};
};

func void dia_ingmar_canteach_info()
{
	AI_Output(other,self,"DIA_Ingmar_CanTeach_15_00");	//Ты можешь научить меня чему-нибудь?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeach_06_01");	//Я могу научить тебя как стать сильнее, чтобы ты мог эффективнее действовать своим оружием.
		INGMAR_TEACHSTR = TRUE;
		b_logentry(TOPIC_CITYTEACHER,"Паладин Ингмар может помочь мне стать сильнее.");
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeach_06_02");	//Я обучаю только последователей нашего ордена.
	};
};


instance DIA_INGMAR_TEACH(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 6;
	condition = dia_ingmar_teach_condition;
	information = dia_ingmar_teach_info;
	permanent = TRUE;
	description = "Я хочу стать сильнее.";
};


func int dia_ingmar_teach_condition()
{
	if(INGMAR_TEACHSTR == TRUE)
	{
		return TRUE;
	};
};

func void dia_ingmar_teach_info()
{
	AI_Output(other,self,"DIA_Ingmar_Teach_15_00");	//Я хочу стать сильнее.
	Info_ClearChoices(dia_ingmar_teach);
	Info_AddChoice(dia_ingmar_teach,DIALOG_BACK,dia_ingmar_teach_back);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ingmar_teach_1);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ingmar_teach_5);
};

func void dia_ingmar_teach_back()
{
	if(other.attribute[ATR_STRENGTH] >= 90)
	{
		AI_Output(self,other,"DIA_Ingmar_Teach_06_00");	//Ты и так силен как тролль. Мне нечему учить тебя.
	};
	Info_ClearChoices(dia_ingmar_teach);
};

func void dia_ingmar_teach_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,90);
	Info_ClearChoices(dia_ingmar_teach);
	Info_AddChoice(dia_ingmar_teach,DIALOG_BACK,dia_ingmar_teach_back);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ingmar_teach_1);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ingmar_teach_5);
};

func void dia_ingmar_teach_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,90);
	Info_ClearChoices(dia_ingmar_teach);
	Info_AddChoice(dia_ingmar_teach,DIALOG_BACK,dia_ingmar_teach_back);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ingmar_teach_1);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ingmar_teach_5);
};


instance DIA_INGMAR_KAP3_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_kap3_exit_condition;
	information = dia_ingmar_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_ingmar_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_KAP4_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_kap4_exit_condition;
	information = dia_ingmar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_ingmar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_ORKELITE(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 40;
	condition = dia_ingmar_orkelite_condition;
	information = dia_ingmar_orkelite_info;
	description = "Орки готовят массированное наступление.";
};


func int dia_ingmar_orkelite_condition()
{
	if(((TALKEDTO_ANTIPALADIN == TRUE) || Npc_HasItems(other,itri_orcelitering) || (HAGEN_SAWORCRING == TRUE)) && (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_ingmar_orkelite_info()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_00");	//Орки готовят массированное наступление.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_06_01");	//Да ну? Что ж, это очень интересно. А откуда тебе это известно?
	if(TALKEDTO_ANTIPALADIN == TRUE)
	{
		AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_02");	//Я говорил с ними.
	};
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_03");	//Их лидеры появились в этой местности.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_06_04");	//Ммм. Это не похоже на типичную стратегию орков.
	Info_ClearChoices(dia_ingmar_orkelite);
	Info_AddChoice(dia_ingmar_orkelite,"Тебе нужно найти способ избавить нас от них.",dia_ingmar_orkelite_loswerden);
	Info_AddChoice(dia_ingmar_orkelite,"Что нам делать теперь?",dia_ingmar_orkelite_wastun);
	Info_AddChoice(dia_ingmar_orkelite,"Что это значит?",dia_ingmar_orkelite_wieso);
	Log_CreateTopic(TOPIC_ORCELITE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORCELITE,LOG_RUNNING);
	b_logentry(TOPIC_ORCELITE,"Ингмар был очень заинтересован историей об элитных воинах орков.");
	MIS_KILLORKOBERST = LOG_RUNNING;
};

func void dia_ingmar_orkelite_loswerden()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_loswerden_15_00");	//Тебе нужно найти способ избавить нас от них.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_loswerden_06_01");	//Было бы неплохо, если бы у нас была более подробная информация. Я пошлю кого-нибудь разведать окрестности.
	Info_ClearChoices(dia_ingmar_orkelite);
};

func void dia_ingmar_orkelite_wieso()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_wieso_15_00");	//Что это значит?
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_01");	//Если то, что ты говоришь, правда, это означает, что они надеются ослабить нас изнутри, нанеся удар своими лучшими воинами.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_02");	//Обычно каждую орду орков возглавляет один предводитель. Крайне редко можно встретить двоих или больше вместе.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_03");	//На это есть причина. Их лидеры - ядро их атакующей стратегии, и обычно окружены простыми воинами-орками.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_04");	//Поэтому очень трудно подобраться к кому-нибудь из них, не пробившись через орду не менее чем из 30 воинов.
	b_logentry(TOPIC_ORCELITE,"Ингмар сказал, что-то о главе предводителей орков.");
};

func void dia_ingmar_orkelite_wastun()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_wasTun_15_00");	//Что нам делать теперь?
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_01");	//Когда они встречаются в таком количестве, это обычно диверсионная группа, возглавляемая старшим по званию.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_02");	//Этот высокопоставленный предводитель устраивает себе штаб-квартиру в одной из пещер, откуда направляет свои войска в бой.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_03");	//Если бы мы смогли добраться до этого военачальника орков, мы получили бы решающее преимущество.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_04");	//Военачальник орков обычно предпочитает находиться в непосредственной близости от своих врагов. Я бы посоветовал поискать его пещеру где-нибудь неподалеку от города.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_05");	//Несколько орков было замечено у фермы Лобарта. Может быть, тебе попробовать начать поиски именно оттуда?
	b_logentry(TOPIC_ORCELITE,"Согласно Ингмару, я должен найти полковника орков в пещере где-то неподалеку от фермы Лобарта. Ингмар хочет, чтобы я нашел и убил его.");
	Info_ClearChoices(dia_ingmar_orkelite);
};


instance DIA_INGMAR_HAUPTQUARTIER(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 41;
	condition = dia_ingmar_hauptquartier_condition;
	information = dia_ingmar_hauptquartier_info;
	permanent = FALSE;
	description = "Я смог найти штаб-квартиру орков.";
};


func int dia_ingmar_hauptquartier_condition()
{
	if(Npc_IsDead(orkelite_antipaladinorkoberst) && Npc_KnowsInfo(other,dia_ingmar_orkelite))
	{
		return TRUE;
	};
};

func void dia_ingmar_hauptquartier_info()
{
	AI_Output(other,self,"DIA_Ingmar_HAUPTQUARTIER_15_00");	//Я смог найти штаб-квартиру орков. Их военачальник пал.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_01");	//Это отличные новости. Теперь орки некоторое время будут пребывать в растерянности.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_02");	//Это неплохо. Если бы у нас было побольше рыцарей вроде тебя, за исход грядущей битвы можно было бы не волноваться.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_03");	//Вот. Возьми это золото. Надеюсь, оно поможет тебе купить хорошее снаряжение.
	b_giveplayerxp(XP_KILLEDORKOBERST);
	CreateInvItems(self,itmi_gold,300);
	b_giveinvitems(self,other,itmi_gold,300);
	MIS_KILLORKOBERST = LOG_SUCCESS;
};


instance DIA_INGMAR_KAP5_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_kap5_exit_condition;
	information = dia_ingmar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_ingmar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_KAP6_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_kap6_exit_condition;
	information = dia_ingmar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_ingmar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_PICKPOCKET(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 900;
	condition = dia_ingmar_pickpocket_condition;
	information = dia_ingmar_pickpocket_info;
	permanent = TRUE;
	description = "(украсть этот свиток практически невозможно)";
};


func int dia_ingmar_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (105 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_ingmar_pickpocket_info()
{
	Info_ClearChoices(dia_ingmar_pickpocket);
	Info_AddChoice(dia_ingmar_pickpocket,DIALOG_BACK,dia_ingmar_pickpocket_back);
	Info_AddChoice(dia_ingmar_pickpocket,DIALOG_PICKPOCKET,dia_ingmar_pickpocket_doit);
};

func void dia_ingmar_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 105)
	{
		b_giveinvitems(self,other,itwr_manowar,1);
		b_givethiefxp();
		Info_ClearChoices(dia_ingmar_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_ingmar_pickpocket_back()
{
	Info_ClearChoices(dia_ingmar_pickpocket);
};

