
instance DIA_BARTOK_EXIT(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 999;
	condition = dia_bartok_exit_condition;
	information = dia_bartok_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bartok_exit_condition()
{
	return TRUE;
};

func void dia_bartok_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BARTOK_PICKPOCKET(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 900;
	condition = dia_bartok_pickpocket_condition;
	information = dia_bartok_pickpocket_info;
	permanent = TRUE;
	description = "(украсть его колчан со стрелами будет просто)";
};


func int dia_bartok_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itrw_arrow) >= 40) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_bartok_pickpocket_info()
{
	Info_ClearChoices(dia_bartok_pickpocket);
	Info_AddChoice(dia_bartok_pickpocket,DIALOG_BACK,dia_bartok_pickpocket_back);
	Info_AddChoice(dia_bartok_pickpocket,DIALOG_PICKPOCKET,dia_bartok_pickpocket_doit);
};

func void dia_bartok_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		b_giveinvitems(self,other,itrw_arrow,40);
		b_givethiefxp();
		Info_ClearChoices(dia_bartok_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_bartok_pickpocket_back()
{
	Info_ClearChoices(dia_bartok_pickpocket);
};


instance DIA_BARTOK_HALLO(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 1;
	condition = dia_bartok_hallo_condition;
	information = dia_bartok_hallo_info;
	permanent = FALSE;
	description = "Как дела?";
};


func int dia_bartok_hallo_condition()
{
	return TRUE;
};

func void dia_bartok_hallo_info()
{
	AI_Output(other,self,"DIA_Bartok_Hello_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Bartok_Hello_04_01");	//Ты ведь нездешний, да? Ничего - я тоже.
	AI_Output(other,self,"DIA_Bartok_Hello_15_02");	//А откуда ты пришел?
	AI_Output(self,other,"DIA_Bartok_Hello_04_03");	//Из леса, я там охотился на падальщиков и волков вместе с другими охотниками.
	AI_Output(self,other,"DIA_Bartok_Hello_04_04");	//Но я бросил это занятие. Настали опасные времена. Повсюду шатается всякий сброд...
};


instance DIA_BARTOK_JAEGER(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 2;
	condition = dia_bartok_jaeger_condition;
	information = dia_bartok_jaeger_info;
	permanent = FALSE;
	description = "Где мне найти других охотников?";
};


func int dia_bartok_jaeger_condition()
{
	if(Npc_KnowsInfo(other,dia_bartok_hallo))
	{
		return TRUE;
	};
};

func void dia_bartok_jaeger_info()
{
	AI_Output(other,self,"DIA_Bartok_Jager_15_00");	//Где мне найти других охотников?
	AI_Output(self,other,"DIA_Bartok_Jager_04_01");	//У нас был лагерь около таверны, на полпути к ферме Онара.
	AI_Output(self,other,"DIA_Bartok_Jager_04_02");	//Но я не знаю, остался ли там кто еще.
};


instance DIA_BARTOK_BOSPER(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 3;
	condition = dia_bartok_bosper_condition;
	information = dia_bartok_bosper_info;
	permanent = FALSE;
	description = "Боспер говорит, что ты работал на него...";
};


func int dia_bartok_bosper_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_bartok) && Npc_KnowsInfo(other,dia_bartok_hallo))
	{
		return TRUE;
	};
};

func void dia_bartok_bosper_info()
{
	AI_Output(other,self,"DIA_Bartok_Bosper_15_00");	//Боспер говорит, что ты работал на него...
	AI_Output(self,other,"DIA_Bartok_Bosper_04_01");	//Да, было дело. Но его интересовали только эти чертовы шкуры.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_02");	//Я говорил ему, как опасно стало охотиться. Но он не хотел ничего слушать.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_03");	//Правда, платил он хорошо - грех жаловаться.
	AI_Output(other,self,"DIA_Bartok_Bosper_15_04");	//Ты можешь рассказать что-нибудь о нем?
	AI_Output(self,other,"DIA_Bartok_Bosper_04_05");	//(смеется) У Боспера недавно украли лук. Прямо средь бела дня.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_06");	//Кто-то вломился в его лавку, схватил лук и был таков.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_07");	//Воры наглеют прямо на глазах!
	if(MIS_BOSPER_BOGEN != LOG_SUCCESS)
	{
		MIS_BOSPER_BOGEN = LOG_RUNNING;
	};
};


instance DIA_BARTOK_WANNALEARN(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 4;
	condition = dia_bartok_wannalearn_condition;
	information = dia_bartok_wannalearn_info;
	permanent = FALSE;
	description = "Ты можешь научить меня охотиться?";
};


func int dia_bartok_wannalearn_condition()
{
	if(Npc_KnowsInfo(other,dia_bartok_hallo))
	{
		return TRUE;
	};
};

func void dia_bartok_wannalearn_info()
{
	AI_Output(other,self,"DIA_Bartok_WannaLearn_15_00");	//Ты можешь научить меня охотиться?
	AI_Output(self,other,"DIA_Bartok_WannaLearn_04_01");	//Я могу научить тебя красться и правильно держать лук.
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
	{
		AI_Output(self,other,"DIA_Bartok_WannaLearn_04_02");	//Если ты хочешь научиться снимать шкуры с животных - иди к Босперу. Это он научил меня.
	};
	BARTOK_TEACHPLAYER = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Барток может обучить меня красться и стрельбе из лука.");
};


instance DIA_BARTOK_TEACHSNEAK(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 4;
	condition = dia_bartok_teachsneak_condition;
	information = dia_bartok_teachsneak_info;
	permanent = TRUE;
	description = b_buildlearnstring("Научи меня красться!",b_getlearncosttalent(other,NPC_TALENT_SNEAK));
};


func int dia_bartok_teachsneak_condition()
{
	if((BARTOK_TEACHPLAYER == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == 0))
	{
		return TRUE;
	};
};

func void dia_bartok_teachsneak_info()
{
	AI_Output(other,self,"DIA_Bartok_TeachSneak_15_00");	//Научи меня красться!
	if(b_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_01");	//Хорошо - сначала ты должен научиться правильно распределять свой вес.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_02");	//Для этого согни ноги в коленях и старайся всегда опускать ногу на пятку.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_03");	//Все нагрузка должна приходиться на опорную ногу, пока другая нога не будет твердо стоять на земле.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_04");	//К большинству зверей невозможно подкрасться, если только они не спят. Они просто учуют тебя.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_05");	//Так что будь внимателен при охоте.
	};
};


var int bosper_merkebow;

instance DIA_BARTOK_TEACH(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 4;
	condition = dia_bartok_teach_condition;
	information = dia_bartok_teach_info;
	permanent = TRUE;
	description = "Я хочу научиться лучше стрелять из лука!";
};


func int dia_bartok_teach_condition()
{
	if(BARTOK_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_bartok_teach_info()
{
	AI_Output(other,self,"DIA_Bartok_TeachBow_15_00");	//Я хочу научиться лучше стрелять из лука!
	AI_Output(self,other,"DIA_Bartok_TeachBow_04_01");	//Хорошо, посмотрим, чему я могу тебя научить...
	BOSPER_MERKEBOW = other.hitchance[NPC_TALENT_BOW];
	Info_ClearChoices(dia_bartok_teach);
	Info_AddChoice(dia_bartok_teach,DIALOG_BACK,dia_bartok_teach_back);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW)),dia_bartok_teach_bow_1);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW) * 5),dia_bartok_teach_bow_5);
};

func void dia_bartok_teach_back()
{
	if(other.hitchance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_00");	//Тебе лучше поискать кого-нибудь, кто знает больше, чем я.
	}
	else if(BOSPER_MERKEBOW < other.hitchance[NPC_TALENT_BOW])
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_01");	//Хорошо, ты стал стрелять значительно лучше.
	};
	Info_ClearChoices(dia_bartok_teach);
};

func void dia_bartok_teach_bow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,60);
	Info_ClearChoices(dia_bartok_teach);
	Info_AddChoice(dia_bartok_teach,DIALOG_BACK,dia_bartok_teach_back);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW)),dia_bartok_teach_bow_1);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW) * 5),dia_bartok_teach_bow_5);
};

func void dia_bartok_teach_bow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,60);
	Info_ClearChoices(dia_bartok_teach);
	Info_AddChoice(dia_bartok_teach,DIALOG_BACK,dia_bartok_teach_back);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW)),dia_bartok_teach_bow_1);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW) * 5),dia_bartok_teach_bow_5);
};


var int bartok_bereit;
var int bartok_later;

instance DIA_BARTOK_ZUSAMMEN(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 5;
	condition = dia_bartok_zusammen_condition;
	information = dia_bartok_zusammen_info;
	permanent = TRUE;
	description = "Почему бы нам не поохотиться вместе?";
};


func int dia_bartok_zusammen_condition()
{
	if((BARTOK_BEREIT == FALSE) && Npc_KnowsInfo(other,dia_bartok_hallo))
	{
		return TRUE;
	};
};

func void dia_bartok_zusammen_info()
{
	if(BARTOK_LATER == FALSE)
	{
		AI_Output(other,self,"DIA_Bartok_Zusammen_15_00");	//Почему бы нам не поохотиться вместе?
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_01");	//Хм. Вдвоем охотиться не так опасно, это точно...
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_02");	//А что ты знаешь об охоте, а?
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_03");	//Я имею в виду, ты знаешь, как снимать шкуры с животных?
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == TRUE)
	{
		if(BARTOK_LATER == TRUE)
		{
			AI_Output(self,other,"DIA_Bartok_HuntNOW_04_01");	//У тебя есть 50 монет?
		}
		else
		{
			AI_Output(other,self,"DIA_Bartok_Zusammen_15_04");	//Да.
			AI_Output(self,other,"DIA_Bartok_Zusammen_04_05");	//Хорошо, я хочу получить 50 золотых монет. А ты можешь забирать себе шкуры и продавать их Босперу.
			AI_Output(self,other,"DIA_Bartok_Zusammen_04_06");	//Это будет честно, правда?
		};
		Info_ClearChoices(dia_bartok_zusammen);
		Info_AddChoice(dia_bartok_zusammen,"Позже...",dia_bartok_zusammen_later);
		Info_AddChoice(dia_bartok_zusammen,"Вот, держи...",dia_bartok_zusammen_pay);
	}
	else
	{
		AI_Output(other,self,"DIA_Bartok_Zusammen_15_07");	//Нет.
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_08");	//Тогда овчинка выделки не стоит.
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_09");	//Возвращайся, когда научишься чему-нибудь.
	};
};

func void dia_bartok_zusammen_later()
{
	AI_Output(other,self,"DIA_Bartok_HuntNOW_Later_15_00");	//Позже...
	BARTOK_LATER = TRUE;
	Info_ClearChoices(dia_bartok_zusammen);
};

func void dia_bartok_zusammen_pay()
{
	Info_ClearChoices(dia_bartok_zusammen);
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(other,self,"DIA_Bartok_HuntNOW_GO_15_00");	//Вот, держи...
		BARTOK_BEREIT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_03");	//Где? Не вижу! У тебя нет золота.
	};
};


var int bartok_los;

instance DIA_BARTOK_HUNTNOW(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 5;
	condition = dia_bartok_huntnow_condition;
	information = dia_bartok_huntnow_info;
	permanent = FALSE;
	description = "Пойдем охотиться!";
};


func int dia_bartok_huntnow_condition()
{
	if(BARTOK_BEREIT == TRUE)
	{
		return TRUE;
	};
};

func void dia_bartok_huntnow_info()
{
	AI_Output(other,self,"DIA_Bartok_HuntNOW_15_00");	//Пойдем охотиться!
	AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_01");	//Хорошо, пошли за мной. За южными воротами начинается лес. Там водится более чем достаточно всяких тварей.
	AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_02");	//(себе под нос) Даже больше, чем хотелось бы...
	BARTOK_LOS = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GUIDEMITTE");
	Wld_InsertNpc(wolf,"NW_FARM1_CITYWALL_FOREST_02");
	Wld_InsertNpc(wolf,"NW_FARM1_CITYWALL_FOREST_02");
	Wld_InsertNpc(wolf,"NW_FARM1_CITYWALL_FOREST_02");
};


var int bartok_orkstillthere;

instance DIA_BARTOK_IMWALD(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 1;
	condition = dia_bartok_imwald_condition;
	information = dia_bartok_imwald_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bartok_imwald_condition()
{
	if((BARTOK_LOS == TRUE) && (Npc_GetDistToWP(self,"NW_FARM1_CITYWALL_FOREST_03") < 500))
	{
		return TRUE;
	};
};

func void dia_bartok_imwald_info()
{
	AI_Output(self,other,"DIA_Bartok_ImWald_04_00");	//Как ты думаешь, стоит нам углубиться в лес или нет?
	Info_ClearChoices(dia_bartok_imwald);
	Info_AddChoice(dia_bartok_imwald,"Пойдем назад!",dia_bartok_imwald_nachhause);
	Info_AddChoice(dia_bartok_imwald,"Стоит.",dia_bartok_imwald_weiter);
};

func void dia_bartok_imwald_nachhause()
{
	AI_Output(other,self,"DIA_Bartok_ImWald_NachHause_15_00");	//Пойдем назад!
	AI_Output(self,other,"DIA_Bartok_ImWald_NachHause_04_01");	//Я тоже так думаю. А то мы так попадем прямо в объятия орка.
	Info_ClearChoices(dia_bartok_imwald);
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};

func void dia_bartok_imwald_weiter()
{
	AI_Output(other,self,"DIA_Bartok_ImWald_Weiter_15_00");	//Стоит.
	AI_Output(self,other,"DIA_Bartok_ImWald_Weiter_04_01");	//Хорошо. (по себя) Будем надеяться, что нам повезет...
	if(!Npc_IsDead(cityorc))
	{
		BARTOK_ORKSTILLTHERE = TRUE;
	};
	Info_ClearChoices(dia_bartok_imwald);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDEENDE");
};


var int bartok_ende;

instance DIA_BARTOK_ANGEKOMMEN(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 1;
	condition = dia_bartok_angekommen_condition;
	information = dia_bartok_angekommen_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bartok_angekommen_condition()
{
	if((BARTOK_LOS == TRUE) && (Npc_GetDistToWP(self,"NW_FARM1_CITYWALL_FOREST_07") < 500))
	{
		return TRUE;
	};
};

func void dia_bartok_angekommen_info()
{
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_00");	//Все! Я думаю, мне лучше вернуться в город.
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_01");	//Здесь для меня слишком опасно - и даже для нас двоих.
	if(BARTOK_ORKSTILLTHERE == TRUE)
	{
		b_bartok_shitanorc();
		BARTOK_ORKGESAGT = TRUE;
	};
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_03");	//Еще увидимся!
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_04");	//Ты можешь продать шкуры Босперу.
	BARTOK_ENDE = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_BARTOK_PERM(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 1;
	condition = dia_bartok_perm_condition;
	information = dia_bartok_perm_info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int dia_bartok_perm_condition()
{
	if(BARTOK_LOS == TRUE)
	{
		return TRUE;
	};
};

func void dia_bartok_perm_info()
{
	AI_Output(other,self,"DIA_Bartok_PERM_15_00");	//Все в порядке?
	if(BARTOK_ENDE == TRUE)
	{
		AI_Output(self,other,"DIA_Bartok_PERM_04_01");	//Да. Но я больше не выйду из города. По крайней мере, в ближайшее время.
		if(BARTOK_ORKGESAGT == TRUE)
		{
			AI_Output(self,other,"DIA_Bartok_PERM_04_02");	//У меня все еще поджилки трясутся от одной мысли об этом орке.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bartok_PERM_04_03");	//Конечно. Давая прикончим еще парочку зверей!
	};
};

