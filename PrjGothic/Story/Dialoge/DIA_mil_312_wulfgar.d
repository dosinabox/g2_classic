
instance DIA_WULFGAR_EXIT(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 999;
	condition = dia_wulfgar_exit_condition;
	information = dia_wulfgar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wulfgar_exit_condition()
{
	return TRUE;
};

func void dia_wulfgar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WULFGAR_HALLO(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 1;
	condition = dia_wulfgar_hallo_condition;
	information = dia_wulfgar_hallo_info;
	permanent = FALSE;
	description = "Каковы твои обязанности?";
};


func int dia_wulfgar_hallo_condition()
{
	return TRUE;
};

func void dia_wulfgar_hallo_info()
{
	AI_Output(other,self,"DIA_Wulfgar_Hallo_15_00");	//Каковы твои обязанности?
	AI_Output(self,other,"DIA_Wulfgar_Hallo_04_01");	//(презрительно) Эти олухи машут мечами, как крестьяне.
	AI_Output(self,other,"DIA_Wulfgar_Hallo_04_02");	//(убежденно) Но когда они пройдут обучение под моим руководством, каждый из них станет серьезным воином.
};


instance DIA_WULFGAR_WANNAJOIN(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 2;
	condition = dia_wulfgar_wannajoin_condition;
	information = dia_wulfgar_wannajoin_info;
	permanent = FALSE;
	description = "Я хочу вступить в ополчение!";
};


func int dia_wulfgar_wannajoin_condition()
{
	if(Npc_KnowsInfo(other,dia_wulfgar_hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_wulfgar_wannajoin_info()
{
	AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_00");	//Я хочу вступить в ополчение!
	AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_01");	//Да? А ты гражданин этого города?
	if(PLAYER_ISAPPRENTICE == APP_NONE)
	{
		AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_02");	//Нет.
		AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_03");	//Тогда лорд Андрэ не примет тебя.
		AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_04");	//Конечно, ты можешь поговорить с ним, но я не думаю, что он сделает для тебя исключение.
	}
	else
	{
		AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_05");	//Да.
		AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_06");	//Тогда поговори с лордом Андрэ. Он решает, кого можно принять, а кого нет.
	};
};


instance DIA_WULFGAR_ABOUTMILIZ(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 3;
	condition = dia_wulfgar_aboutmiliz_condition;
	information = dia_wulfgar_aboutmiliz_info;
	permanent = FALSE;
	description = "Каково это, служить в ополчении?";
};


func int dia_wulfgar_aboutmiliz_condition()
{
	if(Npc_KnowsInfo(other,dia_wulfgar_hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_wulfgar_aboutmiliz_info()
{
	AI_Output(other,self,"DIA_Wulfgar_AboutMiliz_15_00");	//Каково это, служить в ополчении?
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_01");	//Сейчас нами командует лорд Андрэ.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_02");	//Раньше ополчение подчинялось губернатору. (смеется) Он понятия не имел, чем мы занимались здесь.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_03");	//Но лорд Андрэ знает свое дело. Он заботится о своих людях.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_04");	//Каждый, кто вступает в ополчение, получает неплохие доспехи и хорошее оружие.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_05");	//А если ты выполняешь свою работу хорошо, то можешь рассчитывать на поощрение. Лорд Андрэ дает награду за каждого пойманного преступника.
};


instance DIA_WULFGAR_CANYOUTRAIN(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 4;
	condition = dia_wulfgar_canyoutrain_condition;
	information = dia_wulfgar_canyoutrain_info;
	permanent = FALSE;
	description = "Ты можешь обучить меня сражению на мечах?";
};


func int dia_wulfgar_canyoutrain_condition()
{
	if(Npc_KnowsInfo(other,dia_wulfgar_hallo) && (other.guild != GIL_MIL))
	{
		return TRUE;
	};
};

func void dia_wulfgar_canyoutrain_info()
{
	AI_Output(other,self,"DIA_Wulfgar_CanYouTrain_15_00");	//Ты можешь обучить меня сражению на мечах?
	AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_01");	//По приказу лорда Андрэ мы тренируем всех, кто в состоянии защищать город.
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_02");	//Впрочем, это не касается наемников. Забудь об этом.
	}
	else
	{
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_03");	//Но это касается только боевого обучения. Все остальные виды обучения предназначены только для ополчения.
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_04");	//А ты меч-то можешь удержать?
		AI_Output(other,self,"DIA_Wulfgar_CanYouTrain_15_05");	//Думаю, что да...
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_06");	//(вздыхает) Хорошо, ты можешь приступать, когда пожелаешь.
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"Вульфгар, городской гвардеец, может обучить меня искусству обращения с одноручным и двуручным оружием.");
		WULFGAR_TEACH1H = TRUE;
	};
};


instance DIA_WULFGAR_ADVANTAGE(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 5;
	condition = dia_wulfgar_advantage_condition;
	information = dia_wulfgar_advantage_info;
	permanent = FALSE;
	description = "Каковы преимущества двуручного оружия?";
};


func int dia_wulfgar_advantage_condition()
{
	if((WULFGAR_TEACH1H == TRUE) || (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_wulfgar_advantage_info()
{
	AI_Output(other,self,"DIA_Wulfgar_Advantage_15_00");	//Каковы преимущества двуручного оружия?
	AI_Output(self,other,"DIA_Wulfgar_Advantage_04_01");	//Это просто. С одноручным оружием ты быстрее. Это может стать значительным преимуществом в бою.
	AI_Output(self,other,"DIA_Wulfgar_Advantage_04_02");	//Двуручное оружие более тяжеловесно и замедляет тебя. При сражении им нужно просчитывать свои действия на шаг вперед, но оно наносит больший урон.
};


instance DIA_WULFGAR_HOWTOBEGIN(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 6;
	condition = dia_wulfgar_howtobegin_condition;
	information = dia_wulfgar_howtobegin_info;
	permanent = FALSE;
	description = "С чего мне лучше начать? С одноручного или двуручного оружия?";
};


func int dia_wulfgar_howtobegin_condition()
{
	if((WULFGAR_TEACH1H == TRUE) || (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_wulfgar_howtobegin_info()
{
	AI_Output(other,self,"DIA_Wulfgar_HowToBegin_15_00");	//С чего мне лучше начать? С одноручного или двуручного оружия?
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_01");	//Выбирай сам.
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_02");	//Но даже если ты специализируешься только в одном типе оружия, со временем ты начнешь автоматически изучать и другой тип.
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_03");	//Если, например, ты хорошо сражаешься одноручным оружием, но все еще новичок в использовании двуручного...
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_04");	//...твой навык владения двуручным оружием повышается каждый раз, когда ты тренируешься с одноручным...
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_05");	//Правда, в этом случае обучение изматывает сильнее, чем когда ты тренируешься с различным типом оружия по очереди.
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_06");	//Тебе нужно просто начать - и ты сам поймешь, о чем я говорю.
};


instance DIA_WULFGAR_TEACH(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 7;
	condition = dia_wulfgar_teach_condition;
	information = dia_wulfgar_teach_info;
	permanent = TRUE;
	description = "Начнем обучение.";
};


func int dia_wulfgar_teach_condition()
{
	if((WULFGAR_TEACH1H == TRUE) || (other.guild == GIL_MIL))
	{
		return TRUE;
	};
};

func void dia_wulfgar_teach_info()
{
	AI_Output(other,self,"DIA_Wulfgar_Teach_15_00");	//Начнем обучение.
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Wulfgar_Add_04_00");	//Я не обучаю наемников!
	}
	else
	{
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Wulfgar_Add_04_01");	//Конечно, уважаемый.
		};
		Info_ClearChoices(dia_wulfgar_teach);
		Info_AddChoice(dia_wulfgar_teach,DIALOG_BACK,dia_wulfgar_teach_back);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_wulfgar_teach_2h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_wulfgar_teach_2h_5);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_wulfgar_teach_1h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_wulfgar_teach_1h_5);
	};
};

func void dia_wulfgar_teach_back()
{
	Info_ClearChoices(dia_wulfgar_teach);
};

func void dia_wulfgar_teach_1h_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,60))
	{
		Info_ClearChoices(dia_wulfgar_teach);
		Info_AddChoice(dia_wulfgar_teach,DIALOG_BACK,dia_wulfgar_teach_back);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_wulfgar_teach_2h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_wulfgar_teach_2h_5);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_wulfgar_teach_1h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_wulfgar_teach_1h_5);
	};
};

func void dia_wulfgar_teach_1h_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,60))
	{
		Info_ClearChoices(dia_wulfgar_teach);
		Info_AddChoice(dia_wulfgar_teach,DIALOG_BACK,dia_wulfgar_teach_back);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_wulfgar_teach_2h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_wulfgar_teach_2h_5);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_wulfgar_teach_1h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_wulfgar_teach_1h_5);
	};
};

func void dia_wulfgar_teach_2h_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,60))
	{
		Info_ClearChoices(dia_wulfgar_teach);
		Info_AddChoice(dia_wulfgar_teach,DIALOG_BACK,dia_wulfgar_teach_back);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_wulfgar_teach_2h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_wulfgar_teach_2h_5);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_wulfgar_teach_1h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_wulfgar_teach_1h_5);
	};
};

func void dia_wulfgar_teach_2h_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,60))
	{
		Info_ClearChoices(dia_wulfgar_teach);
		Info_AddChoice(dia_wulfgar_teach,DIALOG_BACK,dia_wulfgar_teach_back);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_wulfgar_teach_2h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_wulfgar_teach_2h_5);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_wulfgar_teach_1h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_wulfgar_teach_1h_5);
	};
};


instance DIA_WULFGAR_ALSMIL(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 1;
	condition = dia_wulfgar_alsmil_condition;
	information = dia_wulfgar_alsmil_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_wulfgar_alsmil_condition()
{
	if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void dia_wulfgar_alsmil_info()
{
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_00");	//Значит, лорд Андрэ принял тебя!
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_01");	//Я надеюсь, ты будешь регулярно тренироваться здесь.
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_02");	//Руга научит тебя пользоваться арбалетом, а Мортис поможет тебе стать сильнее.
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_03");	//Но самое важное - это научиться правильно держать свой меч.
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_04");	//Я еще сделаю из тебя отличного воина!
};


instance DIA_WULFGAR_BONUS(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 2;
	condition = dia_wulfgar_bonus_condition;
	information = dia_wulfgar_bonus_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_wulfgar_bonus_condition()
{
	if(Npc_IsInState(self,zs_talk) && Wld_IsTime(5,2,6,54))
	{
		return TRUE;
	};
};

func void dia_wulfgar_bonus_info()
{
	AI_Output(self,other,"DIA_Wulfgar_Bonus_04_00");	//Ранняя пташка? Я обычно один в это время дня. Но раз уж ты здесь, то можно потренироваться.
	AI_Output(self,other,"DIA_Wulfgar_Bonus_04_01");	//Будь внимательным. Ты можешь обмануть некоторых противников, если уклонишься от удара, а затем атакуешь в правильный момент.
	AI_Output(self,other,"DIA_Wulfgar_Bonus_04_02");	//Помни об этом в своем следующем бою!
	other.hitchance[NPC_TALENT_1H] = other.hitchance[NPC_TALENT_1H] + 2;
	PrintScreen(PRINT_LEARN1H,-1,-1,FONT_SCREENSMALL,2);
};


instance DIA_WULFGAR_PICKPOCKET(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 900;
	condition = dia_wulfgar_pickpocket_condition;
	information = dia_wulfgar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_wulfgar_pickpocket_condition()
{
	return c_beklauen(58,80);
};

func void dia_wulfgar_pickpocket_info()
{
	Info_ClearChoices(dia_wulfgar_pickpocket);
	Info_AddChoice(dia_wulfgar_pickpocket,DIALOG_BACK,dia_wulfgar_pickpocket_back);
	Info_AddChoice(dia_wulfgar_pickpocket,DIALOG_PICKPOCKET,dia_wulfgar_pickpocket_doit);
};

func void dia_wulfgar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_wulfgar_pickpocket);
};

func void dia_wulfgar_pickpocket_back()
{
	Info_ClearChoices(dia_wulfgar_pickpocket);
};

