
instance DIA_CASSIA_EXIT(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 999;
	condition = dia_cassia_exit_condition;
	information = dia_cassia_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_cassia_exit_condition()
{
	return TRUE;
};

func void dia_cassia_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CASSIA_PICKME(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 900;
	condition = dia_cassia_pickme_condition;
	information = dia_cassia_pickme_info;
	permanent = TRUE;
	description = PICKPOCKET_100_FEMALE;
};


func int dia_cassia_pickme_condition()
{
	return c_beklauen(100,400);
};

func void dia_cassia_pickme_info()
{
	Info_ClearChoices(dia_cassia_pickme);
	Info_AddChoice(dia_cassia_pickme,DIALOG_BACK,dia_cassia_pickme_back);
	Info_AddChoice(dia_cassia_pickme,DIALOG_PICKPOCKET,dia_cassia_pickme_doit);
};

func void dia_cassia_pickme_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_cassia_pickme);
};

func void dia_cassia_pickme_back()
{
	Info_ClearChoices(dia_cassia_pickme);
};


instance DIA_CASSIA_GILDE(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 1;
	condition = dia_cassia_gilde_condition;
	information = dia_cassia_gilde_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_cassia_gilde_condition()
{
	if((CASSIA_GILDENCHECK == TRUE) && (JOIN_THIEFS == TRUE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_cassia_gilde_info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Cassia_Gilde_16_00");	//Я вижу, ты стал служителем закона и порядка.
		AI_Output(self,other,"DIA_Cassia_Gilde_16_01");	//Но то, что ты теперь служишь Инносу, для нас значения не имеет. Ты один из нас. И я надеюсь, что ты это тоже понимаешь.
	};
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Cassia_Gilde_16_02");	//Так ты теперь служитель церкви Инноса? Отлично. Но ты помимо этого один из нас - надеюсь, ты никогда это не забудешь.
	};
	AI_StopProcessInfos(self);
};


instance DIA_CASSIA_ABGELAUFEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_abgelaufen_condition;
	information = dia_cassia_abgelaufen_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_cassia_abgelaufen_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CASSIA_FRIST == TRUE) && (CASSIA_DAY < (b_getdayplus() - 2)))
	{
		return TRUE;
	};
};

func void dia_cassia_abgelaufen_info()
{
	AI_Output(self,other,"DIA_Cassia_Abgelaufen_16_00");	//Твой срок истек. Тебе не следовало возвращаться.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};


instance DIA_CASSIA_NEWS(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 1;
	condition = dia_cassia_news_condition;
	information = dia_cassia_news_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_cassia_news_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_cassia_news_info()
{
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_News_16_00");	//Я вижу, ты получил наш подарок. Я Кассия.
		AI_Output(other,self,"DIA_Cassia_News_15_01");	//Хорошо, Кассия. Теперь скажи мне, зачем я здесь?
		AI_Output(self,other,"DIA_Cassia_News_16_02");	//Ты привлек наше внимание тем, что завоевал доверие одного из наших друзей.
		AI_Output(self,other,"DIA_Cassia_News_16_03");	//И мы хотим дать тебе шанс. Ты можешь присоединиться к нам.
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_News_16_04");	//Только посмотрите, кто нашел дорогу сюда. Аттила недооценил тебя. Но я не сделаю такой ошибки.
		AI_Output(other,self,"DIA_Cassia_News_15_05");	//Что это за игры?
		AI_Output(self,other,"DIA_Cassia_News_16_06");	//Мы хотели, чтобы ты умер за то, что сдал одного из наших друзей. Вот почему мы послали Аттилу.
		AI_Output(self,other,"DIA_Cassia_News_16_07");	//Твое присутствие здесь, однако, открывает новые возможности...
		AI_Output(other,self,"DIA_Cassia_News_15_08");	//... что ты хочешь предложить мне?
		AI_Output(self,other,"DIA_Cassia_News_16_09");	//Ты можешь присоединиться к нам.
	};
	if((Npc_GetTrueGuild(other) == GIL_NONE) || (Npc_GetTrueGuild(other) == GIL_NOV))
	{
		CASSIA_GILDENCHECK = TRUE;
	};
	DG_GEFUNDEN = TRUE;
};


instance DIA_CASSIA_MEHR(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_mehr_condition;
	information = dia_cassia_mehr_info;
	permanent = FALSE;
	description = "Расскажи мне о вашей организации.";
};


func int dia_cassia_mehr_condition()
{
	return TRUE;
};

func void dia_cassia_mehr_info()
{
	AI_Output(other,self,"DIA_Cassia_mehr_15_00");	//Расскажи мне о вашей организации.
	AI_Output(self,other,"DIA_Cassia_mehr_16_01");	//Горожане недолюбливают нас. Но никто не знает, где находится наше укрытие.
	AI_Output(self,other,"DIA_Cassia_mehr_16_02");	//Те немногие, что вообще знают, что канализация существует, полагают, что она закрыта, и в нее невозможно попасть.
	AI_Output(self,other,"DIA_Cassia_mehr_16_03");	//И пока они не найдут нас, мы можем работать спокойно.
};


instance DIA_CASSIA_VORTEIL(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 3;
	condition = dia_cassia_vorteil_condition;
	information = dia_cassia_vorteil_info;
	permanent = FALSE;
	description = "А какая мне выгода от присоединения к вам?";
};


func int dia_cassia_vorteil_condition()
{
	return TRUE;
};

func void dia_cassia_vorteil_info()
{
	AI_Output(other,self,"DIA_Cassia_Vorteil_15_00");	//А какая мне выгода от присоединения к вам?
	AI_Output(self,other,"DIA_Cassia_Vorteil_16_01");	//Ты можешь научиться у нас особым навыкам - навыкам, которые позволят тебе жить в роскоши.
	AI_Output(other,self,"DIA_Cassia_Vorteil_15_02");	//Но для этого мне придется скрываться здесь, да?
	AI_Output(self,other,"DIA_Cassia_Vorteil_16_03");	//(тихо смеется) Нет. Тебе только нужно придерживаться наших правил. Вот и все.
};


instance DIA_CASSIA_LERNEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 4;
	condition = dia_cassia_lernen_condition;
	information = dia_cassia_lernen_info;
	permanent = FALSE;
	description = "Чему я могу научиться у вас?";
};


func int dia_cassia_lernen_condition()
{
	if(Npc_KnowsInfo(other,dia_cassia_vorteil))
	{
		return TRUE;
	};
};

func void dia_cassia_lernen_info()
{
	AI_Output(other,self,"DIA_Cassia_Lernen_15_00");	//Чему я могу научиться у вас?
	AI_Output(self,other,"DIA_Cassia_Lernen_16_01");	//Джеспер может научить тебя передвигаться бесшумно.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_02");	//Рамирез - чрезвычайно одаренный медвежатник. Ни один замок не устоит перед его отмычками.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_03");	//А я могу научить тебя карманному воровству.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_04");	//Также я могу помочь тебе стать более ловким. Именно ловкость - ключ к воровским способностям.
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Кассия может обучить меня карманному воровству и помочь мне стать более ловким.");
	b_logentry(TOPIC_CITYTEACHER,"Рамирез может обучить меня пользоваться отмычками.");
	b_logentry(TOPIC_CITYTEACHER,"Джеспер может обучить меня красться.");
};


instance DIA_CASSIA_REGELN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 3;
	condition = dia_cassia_regeln_condition;
	information = dia_cassia_regeln_info;
	permanent = FALSE;
	description = "Что у вас за правила?";
};


func int dia_cassia_regeln_condition()
{
	if(Npc_KnowsInfo(other,dia_cassia_vorteil))
	{
		return TRUE;
	};
};

func void dia_cassia_regeln_info()
{
	AI_Output(other,self,"DIA_Cassia_Regeln_15_00");	//Что у вас за правила?
	AI_Output(self,other,"DIA_Cassia_Regeln_16_02");	//Первое правило: никому ни слова о нас. Никогда.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_03");	//Второе: Не попадайся.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_04");	//Третье: если ты обнажишь оружие здесь, чтобы напасть на кого-нибудь, мы убьем тебя.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_05");	//И четвертое - последнее правило: тот, кто хочет присоединиться к нам, должен доказать серьезность своих намерений.
};


instance DIA_CASSIA_ERWISCHEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_erwischen_condition;
	information = dia_cassia_erwischen_info;
	permanent = FALSE;
	description = "Что будет, если меня поймают?";
};


func int dia_cassia_erwischen_condition()
{
	if(Npc_KnowsInfo(other,dia_cassia_regeln))
	{
		return TRUE;
	};
};

func void dia_cassia_erwischen_info()
{
	AI_Output(other,self,"DIA_Cassia_Erwischen_15_00");	//Что будет, если меня поймают?
	AI_Output(self,other,"DIA_Cassia_Erwischen_16_01");	//Просто не попадайся, хорошо?
};


instance DIA_CASSIA_BEWEISEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_beweisen_condition;
	information = dia_cassia_beweisen_info;
	permanent = TRUE;
	description = "Как мне доказать серьезность моих намерений?";
};


var int dia_cassia_beweisen_permanent;

func int dia_cassia_beweisen_condition()
{
	if(Npc_KnowsInfo(other,dia_cassia_regeln) && (DIA_CASSIA_BEWEISEN_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_cassia_beweisen_info()
{
	AI_Output(other,self,"DIA_Cassia_beweisen_15_00");	//Как мне доказать серьезность моих намерений?
	if(JOIN_THIEFS == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_beweisen_16_01");	//Так ты присоединишься к нам или нет?
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_beweisen_16_02");	//У этого упрямого алхимика - Константино, есть прекрасное кольцо.
		AI_Output(self,other,"DIA_Cassia_beweisen_16_03");	//Но оно ему совсем ни к чему. Я хочу, чтобы оно украшало мою руку.
		MIS_CASSIARING = LOG_RUNNING;
		DIA_CASSIA_BEWEISEN_PERMANENT = TRUE;
		Log_CreateTopic(TOPIC_CASSIARING,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CASSIARING,LOG_RUNNING);
		b_logentry(TOPIC_CASSIARING,"Кассия хочет, чтобы я принес ей кольцо Константино.");
	};
};


instance DIA_CASSIA_BEITRETEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 10;
	condition = dia_cassia_beitreten_condition;
	information = dia_cassia_beitreten_info;
	permanent = FALSE;
	description = "Хорошо, я в деле.";
};


func int dia_cassia_beitreten_condition()
{
	if((JOIN_THIEFS == FALSE) && Npc_KnowsInfo(other,dia_cassia_regeln))
	{
		return TRUE;
	};
};

func void dia_cassia_beitreten_info()
{
	AI_Output(other,self,"DIA_Cassia_Beitreten_15_00");	//Хорошо, я в деле.
	AI_Output(self,other,"DIA_Cassia_Beitreten_16_01");	//Отлично. Тебе будет дана возможность проявить себя. А если ты захочешь чему-нибудь научиться у нас - всегда пожалуйста.
	JOIN_THIEFS = TRUE;
};


instance DIA_CASSIA_ABLEHNEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 9;
	condition = dia_cassia_ablehnen_condition;
	information = dia_cassia_ablehnen_info;
	permanent = FALSE;
	description = "А что если я не хочу присоединяться к вам?..";
};


func int dia_cassia_ablehnen_condition()
{
	if((JOIN_THIEFS == FALSE) && Npc_KnowsInfo(other,dia_cassia_regeln))
	{
		return TRUE;
	};
};

func void dia_cassia_ablehnen_info()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_15_00");	//А что если я не хочу присоединяться к вам?..
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_01");	//Ты теряешь шанс, который дается один раз в жизни, но ты можешь идти.
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_02");	//(серьезно) И даже не думай, чтобы предать нас. Ты горько пожалеешь об этом.
		Info_ClearChoices(dia_cassia_ablehnen);
		Info_AddChoice(dia_cassia_ablehnen,"Хорошо, я в деле.",dia_cassia_ablehnen_okay);
		Info_AddChoice(dia_cassia_ablehnen,"Мне нужно время на размышление.",dia_cassia_ablehnen_frist);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_03");	//В таком случае, я убью тебя.
		Info_ClearChoices(dia_cassia_ablehnen);
		Info_AddChoice(dia_cassia_ablehnen,"Хорошо, я в деле.",dia_cassia_ablehnen_okay);
		Info_AddChoice(dia_cassia_ablehnen,"Ну, тогда попробуй меня убить.",dia_cassia_ablehnen_kill);
	};
};

func void dia_cassia_ablehnen_okay()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Okay_15_00");	//Хорошо, я в деле.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Okay_16_01");	//(улыбается) Ты принял мудрое решение. Если ты сможешь доказать серьезность своих намерений, то сможешь влиться в наши ряды.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Okay_16_02");	//Если же ты хочешь сначала получить воровские навыки - пожалуйста - они тебе понадобятся.
	JOIN_THIEFS = TRUE;
	Info_ClearChoices(dia_cassia_ablehnen);
};

func void dia_cassia_ablehnen_kill()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Kill_15_00");	//Ну, тогда попробуй меня убить.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Kill_16_01");	//Жаль. Я думала, ты умнее.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_cassia_ablehnen_frist()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Frist_15_00");	//Мне нужно время на размышление.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Frist_16_01");	//Пожалуйста. Я дам тебе два дня на принятие этого решения. После этого, тебе лучше не появляться здесь.
	CASSIA_DAY = b_getdayplus();
	CASSIA_FRIST = TRUE;
	Info_ClearChoices(dia_cassia_ablehnen);
};


instance DIA_CASSIA_BEVORLERNEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 5;
	condition = dia_cassia_bevorlernen_condition;
	information = dia_cassia_bevorlernen_info;
	permanent = TRUE;
	description = "Ты можешь обучить меня?";
};


func int dia_cassia_bevorlernen_condition()
{
	if((JOIN_THIEFS == TRUE) && Npc_KnowsInfo(other,dia_cassia_lernen) && ((CASSIA_TEACHPICKPOCKET == FALSE) || (CASSIA_TEACHDEX == FALSE)))
	{
		return TRUE;
	};
};

func void dia_cassia_bevorlernen_info()
{
	AI_Output(other,self,"DIA_Cassia_BevorLernen_15_00");	//Ты можешь обучить меня?
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_16_01");	//Конечно, нет проблем. Просто скажи мне, когда будешь готов.
		CASSIA_TEACHPICKPOCKET = TRUE;
		CASSIA_TEACHDEX = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_16_02");	//Конечно. Карманное воровство и ловкость обойдутся тебе по 100 золотых монет.
		Info_ClearChoices(dia_cassia_bevorlernen);
		Info_AddChoice(dia_cassia_bevorlernen,"Может быть, позже... (НАЗАД)",dia_cassia_bevorlernen_spaeter);
		if(CASSIA_TEACHPICKPOCKET == FALSE)
		{
			Info_AddChoice(dia_cassia_bevorlernen,"Я хочу научиться карманному воровству (заплатить 100 золотых).",dia_cassia_bevorlernen_pickpocket);
		};
		if(CASSIA_TEACHDEX == FALSE)
		{
			Info_AddChoice(dia_cassia_bevorlernen,"Я хочу стать более ловким (заплатить 100 золотых).",dia_cassia_bevorlernen_dex);
		};
	};
};

func void dia_cassia_bevorlernen_spaeter()
{
	Info_ClearChoices(dia_cassia_bevorlernen);
};

func void dia_cassia_bevorlernen_dex()
{
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(other,self,"DIA_Cassia_BevorLernen_DEX_15_00");	//Я хочу стать более ловким. Вот золото.
		AI_Output(self,other,"DIA_Cassia_BevorLernen_DEX_16_01");	//Мы можем начать, когда ты будешь готов.
		CASSIA_TEACHDEX = TRUE;
		Info_ClearChoices(dia_cassia_bevorlernen);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_DIA_Cassia_BevorLernen_DEX_16_02");	//Возвращайся, когда у тебя будет золото.
		Info_ClearChoices(dia_cassia_bevorlernen);
	};
};

func void dia_cassia_bevorlernen_pickpocket()
{
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(other,self,"DIA_Cassia_BevorLernen_Pickpocket_15_00");	//Я хочу научиться карманному воровству. Вот золото.
		AI_Output(self,other,"DIA_Cassia_BevorLernen_Pickpocket_16_01");	//Мы можем начать, когда ты будешь готов.
		CASSIA_TEACHPICKPOCKET = TRUE;
		Info_ClearChoices(dia_cassia_bevorlernen);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_Pickpocket_16_02");	//Возвращайся, когда у тебя будет золото.
		Info_ClearChoices(dia_cassia_bevorlernen);
	};
};


instance DIA_CASSIA_TEACH(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 12;
	condition = dia_cassia_teach_condition;
	information = dia_cassia_teach_info;
	permanent = TRUE;
	description = "Я хочу стать более ловким.";
};


func int dia_cassia_teach_condition()
{
	if(CASSIA_TEACHDEX == TRUE)
	{
		return TRUE;
	};
};

func void dia_cassia_teach_info()
{
	AI_Output(other,self,"DIA_Cassia_TEACH_15_00");	//Я хочу стать более ловким.
	Info_ClearChoices(dia_cassia_teach);
	Info_AddChoice(dia_cassia_teach,DIALOG_BACK,dia_cassia_teach_back);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_cassia_teach_1);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_cassia_teach_5);
};

func void dia_cassia_teach_back()
{
	Info_ClearChoices(dia_cassia_teach);
};

func void dia_cassia_teach_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,90);
	Info_ClearChoices(dia_cassia_teach);
	Info_AddChoice(dia_cassia_teach,DIALOG_BACK,dia_cassia_teach_back);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_cassia_teach_1);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_cassia_teach_5);
};

func void dia_cassia_teach_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,90);
	Info_ClearChoices(dia_cassia_teach);
	Info_AddChoice(dia_cassia_teach,DIALOG_BACK,dia_cassia_teach_back);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_cassia_teach_1);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_cassia_teach_5);
};


instance DIA_CASSIA_PICKPOCKET(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 10;
	condition = dia_cassia_pickpocket_condition;
	information = dia_cassia_pickpocket_info;
	permanent = TRUE;
	description = "Научи меня карманному воровству (5 очков обучения)";
};


func int dia_cassia_pickpocket_condition()
{
	if((CASSIA_TEACHPICKPOCKET == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == FALSE))
	{
		return TRUE;
	};
};

func void dia_cassia_pickpocket_info()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_15_00");	//Научи меня карманному воровству.
	if(b_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET))
	{
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_01");	//Если ты хочешь обчистить чьи-нибудь карманы, отвлеки его. Просто начни говорить с ним, поболтай.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_02");	//А когда будешь разговаривать, оцени его. Обращай внимание на оттопыривающиеся карманы, драгоценности или кожаный шнурок на шее. И, самое главное, попытайся оценить, насколько он осторожен.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_03");	//Обокрасть пьяного поденного рабочего - это далеко не то же самое, что украсть у бдительного торговца. Помни об этом.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_04");	//Если ты неуклюж, он конечно же почует недоброе. И, превыше всего: всегда сохраняй хладнокровие.
	};
};


instance DIA_CASSIA_AUFNAHME(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_aufnahme_condition;
	information = dia_cassia_aufnahme_info;
	permanent = FALSE;
	description = "Я принес кольцо Константино.";
};


func int dia_cassia_aufnahme_condition()
{
	if((MIS_CASSIARING == LOG_RUNNING) && (Npc_HasItems(other,itri_prot_point_01_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_cassia_aufnahme_info()
{
	AI_Output(other,self,"DIA_Cassia_Aufnahme_15_00");	//Я принес кольцо Константино.
	b_giveinvitems(other,self,itri_prot_point_01_mis,1);
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_01");	//Поздравляю. Ты прошел вступительный тест. Теперь ты один из нас.
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_02");	//Возьми этот ключ. Он открывает дверь в отель. (улыбается) Теперь тебе не придется каждый раз плыть сюда.
	b_giveinvitems(self,other,itke_thiefguildkey_hotel_mis,1);
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_03");	//Кроме того, ты должен знать, что у нас есть секретный знак. Особый кивок.
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_04");	//Вот такой. Когда ты говоришь с правильными людьми и делаешь этот знак, они поймут, что ты один из нас.
	MIS_CASSIARING = LOG_SUCCESS;
	b_giveplayerxp(XP_CASSIARING);
	KNOWS_SECRETSIGN = TRUE;
	Log_CreateTopic(TOPIC_DIEBESGILDE,LOG_NOTE);
	b_logentry(TOPIC_DIEBESGILDE,"Я был принят в гильдию воров.");
	b_logentry(TOPIC_DIEBESGILDE,"Я знаю знак воров. Если я покажу его нужным людям, они поймут, что я один из них.");
};


instance DIA_CASSIA_VERSTECK(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_versteck_condition;
	information = dia_cassia_versteck_info;
	permanent = FALSE;
	description = "А где вы прячете награбленное?";
};


func int dia_cassia_versteck_condition()
{
	if((MIS_CASSIARING == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_ramirez_beute))
	{
		return TRUE;
	};
};

func void dia_cassia_versteck_info()
{
	AI_Output(other,self,"DIA_Cassia_Versteck_15_00");	//А где вы прячете награбленное?
	AI_Output(self,other,"DIA_Cassia_Versteck_16_01");	//Ты думаешь, я тебе вот так просто все и выложу?
	AI_Output(self,other,"DIA_Cassia_Versteck_16_02");	//У тебя будет достаточно возможностей самому сколотить состояние. Помни - жадные обычно остаются ни с чем.
};


instance DIA_CASSIA_BLUTKELCHE(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_blutkelche_condition;
	information = dia_cassia_blutkelche_info;
	permanent = FALSE;
	description = "У тебя есть работа для меня?";
};


func int dia_cassia_blutkelche_condition()
{
	if((MIS_CASSIARING == LOG_SUCCESS) && (MIS_CASSIAKELCHE != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_cassia_blutkelche_info()
{
	AI_Output(other,self,"DIA_Cassia_Blutkelche_15_00");	//У тебя есть работа для меня?
	if(PETZCOUNTER_CITY_THEFT > 0)
	{
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_01");	//Нет, пока ты разыскиваешься в городе за воровство.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_02");	//Урегулируй эту проблему - заплати штраф или избавься от свидетелей. Меня не волнует, как ты это сделаешь, лишь бы этой проблемы больше не было.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_03");	//Да. Меня интересует коллекция кубков. Всего их шесть.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_04");	//Король Робар захватил их как-то во время одной из своих кампаний - но для этого ему пришлось положить очень много своих людей. Вот почему они называются Кровавые Кубки.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_05");	//Каждый из кубков сам по себе не особенно ценен - но все шесть, собранные вместе, стоят целое состояние.
		AI_Output(other,self,"DIA_Cassia_Blutkelche_15_06");	//Где эти кубки?
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_07");	//Они здесь, в городе - ими владеют богатые торговцы из верхнего квартала.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_08");	//Принеси их мне. А тем временем я подыщу покупателя для них.
		AI_Output(other,self,"DIA_Cassia_Blutkelche_15_09");	//А мне что с этого будет?
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_10");	//Либо половина от дохода, либо ты сможешь выбрать что-нибудь из моей сокровищницы.
		MIS_CASSIAKELCHE = LOG_RUNNING;
		Log_CreateTopic(TOPIC_CASSIAKELCHE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CASSIAKELCHE,LOG_RUNNING);
		b_logentry(TOPIC_CASSIAKELCHE,"Кассия хочет, чтобы я принес ей шесть кровавых кубков. По-видимому, они находятся в городе.");
	};
};


instance DIA_CASSIA_ABGEBEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_abgeben_condition;
	information = dia_cassia_abgeben_info;
	permanent = TRUE;
	description = "Насчет Кровавых Кубков...";
};


func int dia_cassia_abgeben_condition()
{
	if(MIS_CASSIAKELCHE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_cassia_abgeben_info()
{
	AI_Output(other,self,"DIA_Cassia_abgeben_15_00");	//Насчет Кровавых Кубков...
	if(b_giveinvitems(other,self,itmi_bloodcup_mis,6))
	{
		AI_Output(other,self,"DIA_Cassia_abgeben_15_01");	//У меня есть все шесть кубков.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_02");	//Отличная работа. А я тем временем подыскала покупателя.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_03");	//Ты можешь получить свою награду. Спасибо, что сделал это для меня.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_04");	//Мне больше нечего тебе предложить, но ты можешь учиться у меня, когда захочешь. Ну и всегда помни - на этом острове много что плохо лежит... (улыбается)
		MIS_CASSIAKELCHE = LOG_SUCCESS;
		b_giveplayerxp(XP_CASSIABLUTKELCHE);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_abgeben_16_05");	//Я могу продать эти кубки только все вместе. Принеси мне все шесть.
	};
};


instance DIA_CASSIA_BELOHNUNG(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_belohnung_condition;
	information = dia_cassia_belohnung_info;
	permanent = FALSE;
	description = "Я пришел за своей наградой.";
};


func int dia_cassia_belohnung_condition()
{
	if(MIS_CASSIAKELCHE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_cassia_belohnung_info()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_00");	//Я пришел за своей наградой.
	AI_Output(self,other,"DIA_Cassia_Belohnung_16_01");	//Что ты выбираешь?
	Info_ClearChoices(dia_cassia_belohnung);
	Info_AddChoice(dia_cassia_belohnung,"400 золотых.",dia_cassia_belohnung_gold);
	Info_AddChoice(dia_cassia_belohnung,"4 лечебных эликсира",dia_cassia_belohnung_trank);
	Info_AddChoice(dia_cassia_belohnung,"Кольцо железной кожи",dia_cassia_belohnung_ring);
};

func void dia_cassia_belohnung_gold()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_02");	//Дай мне золото.
	b_giveinvitems(self,other,itmi_gold,400);
	Info_ClearChoices(dia_cassia_belohnung);
};

func void dia_cassia_belohnung_trank()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_03");	//Дай мне зелья.
	b_giveinvitems(self,other,itpo_health_03,4);
	Info_ClearChoices(dia_cassia_belohnung);
};

func void dia_cassia_belohnung_ring()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_04");	//Дай мне кольцо.
	b_giveinvitems(self,other,itri_prot_edge_01,1);
	Info_ClearChoices(dia_cassia_belohnung);
};

