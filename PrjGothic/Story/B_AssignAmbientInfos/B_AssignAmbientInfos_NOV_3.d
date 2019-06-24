
instance DIA_NOV_3_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_nov_3_exit_condition;
	information = dia_nov_3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_nov_3_exit_condition()
{
	return TRUE;
};

func void dia_nov_3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NOV_3_FEGEN(C_INFO)
{
	nr = 2;
	condition = dia_nov_3_fegen_condition;
	information = dia_nov_3_fegen_info;
	permanent = TRUE;
	description = "Мне нужна помощь, чтобы подмести кельи послушников.";
};


var int feger1_permanent;
var int feger2_permanent;

func int dia_nov_3_fegen_condition()
{
	if((KAPITEL == 1) && (MIS_KLOSTERARBEIT == LOG_RUNNING) && (NOV_HELFER < 4))
	{
		return TRUE;
	};
};

func void dia_nov_3_fegen_info()
{
	AI_Output(other,self,"DIA_NOV_3_Fegen_15_00");	//Мне нужна помощь, чтобы подмести кельи послушников.
	if(Hlp_GetInstanceID(feger1) == Hlp_GetInstanceID(self))
	{
		if((NOV_HELFER < 1) && (FEGER1_PERMANENT == FALSE))
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_01");	//Никто не хочет помогать тебе, да? Хорошо, я помогу тебе, но только ты должен найти еще кого-нибудь мне в пару.
			b_logentry(TOPIC_PARLANFEGEN,"Послушник, подметающий погреб, поможет мне, если я смогу найти еще одного послушника, готового помочь подмести комнаты.");
		}
		else if((NOV_HELFER >= 1) && (FEGER1_PERMANENT == FALSE))
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_02");	//Я единственный, кто готов помочь тебе?
			AI_Output(other,self,"DIA_NOV_3_Fegen_15_03");	//Нет, я уже нашел помощника.
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_04");	//Тогда, за дело!
			NOV_HELFER = NOV_HELFER + 1;
			FEGER1_PERMANENT = TRUE;
			b_giveplayerxp(XP_FEGER);
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"FEGEN");
			b_logentry(TOPIC_PARLANFEGEN,"Послушник из погреба поможет мне подметать комнаты.");
		}
		else if(FEGER1_PERMANENT == TRUE)
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_05");	//Послушай, брат, я уже помогаю тебе. Хватит болтать попусту.
		};
	};
	if(Hlp_GetInstanceID(feger2) == Hlp_GetInstanceID(self))
	{
		if(FEGER2_PERMANENT == FALSE)
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_08");	//Конечно, я помогу. Мы, послушники, должны поддерживать друг друга. Сегодня ты - мне, завтра я - тебе.
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_09");	//Я прошу всего 50 золотых монет, мне нужно заплатить их Парлану.
			b_logentry(TOPIC_PARLANFEGEN,"Послушник у церкви поможет мне, если я дам ему 50 золотых монет.");
			Info_ClearChoices(dia_nov_3_fegen);
			Info_AddChoice(dia_nov_3_fegen,"Может быть, позже...",dia_nov_3_fegen_nein);
			if(Npc_HasItems(other,itmi_gold) >= 50)
			{
				Info_AddChoice(dia_nov_3_fegen,"Хорошо, я заплачу.",dia_nov_3_fegen_ja);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_06");	//Я же уже согласился. Ты помог мне, я помогу тебе.
		};
	};
	if((Hlp_GetInstanceID(feger1) != Hlp_GetInstanceID(self)) && (Hlp_GetInstanceID(feger2) != Hlp_GetInstanceID(self)))
	{
		AI_Output(self,other,"DIA_NOV_3_Fegen_03_07");	//Забудь об этом - у меня нет свободного времени. Поищи кого-нибудь еще.
	};
};

func void dia_nov_3_fegen_nein()
{
	AI_Output(other,self,"DIA_NOV_3_Fegen_Nein_15_00");	//Возможно позже, сейчас я не могу позволить себе такие расходы.
	Info_ClearChoices(dia_nov_3_fegen);
};

func void dia_nov_3_fegen_ja()
{
	AI_Output(other,self,"DIA_NOV_3_Fegen_Ja_15_00");	//Хорошо, я заплачу.
	AI_Output(self,other,"DIA_NOV_3_Fegen_Ja_03_01");	//Хорошо, тогда я готов приступать.
	b_giveinvitems(other,self,itmi_gold,50);
	NOV_HELFER = NOV_HELFER + 1;
	b_giveplayerxp(XP_FEGER);
	FEGER2_PERMANENT = TRUE;
	Info_ClearChoices(dia_nov_3_fegen);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FEGEN");
	b_logentry(TOPIC_PARLANFEGEN,"Послушник у церкви поможет мне подметать комнаты.");
};


instance DIA_NOV_3_WURST(C_INFO)
{
	nr = 3;
	condition = dia_nov_3_wurst_condition;
	information = dia_nov_3_wurst_info;
	permanent = TRUE;
	description = "Хочешь колбасы?";
};


func int dia_nov_3_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_nov_3_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_NOV_3_Wurst_15_00");	//Ты не хочешь колбасы?
	AI_Output(self,other,"DIA_NOV_3_Wurst_03_01");	//Конечно, давай ее сюда. Кто же откажется от такой колбасы.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,3);
};


instance DIA_NOV_3_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_nov_3_join_condition;
	information = dia_nov_3_join_info;
	permanent = TRUE;
	description = "Я хочу стать магом!";
};


func int dia_nov_3_join_condition()
{
	if(hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_nov_3_join_info()
{
	AI_Output(other,self,"DIA_NOV_3_JOIN_15_00");	//Я хочу стать магом!
	AI_Output(self,other,"DIA_NOV_3_JOIN_03_01");	//Этого хотят все послушники. Но только немногие из них становятся Избранными и получают шанс быть принятыми в Круг Огня.
	AI_Output(self,other,"DIA_NOV_3_JOIN_03_02");	//Стать магом Круга Огня - это высочайшая честь, и ее нужно заслужить.
	AI_Output(self,other,"DIA_NOV_3_JOIN_03_03");	//Ты должен прилежно трудиться, и тогда, возможно, у тебя появится шанс.
};


instance DIA_NOV_3_PEOPLE(C_INFO)
{
	nr = 5;
	condition = dia_nov_3_people_condition;
	information = dia_nov_3_people_info;
	permanent = TRUE;
	description = "Кто возглавляет этот монастырь?";
};


func int dia_nov_3_people_condition()
{
	return TRUE;
};

func void dia_nov_3_people_info()
{
	AI_Output(other,self,"DIA_NOV_3_PEOPLE_15_00");	//Кто возглавляет этот монастырь?
	AI_Output(self,other,"DIA_NOV_3_PEOPLE_03_01");	//Мы, послушники, служим магам Круга Огня. Их, в свою очередь, возглавляет Высший Совет, состоящий из трех самых влиятельных магов.
	AI_Output(self,other,"DIA_NOV_3_PEOPLE_03_02");	//Но за все дела послушников отвечает Парлан. Его всегда можно найти во дворе, он наблюдает за работой послушников.
};


instance DIA_NOV_3_LOCATION(C_INFO)
{
	nr = 6;
	condition = dia_nov_3_location_condition;
	information = dia_nov_3_location_info;
	permanent = TRUE;
	description = "Что ты можешь сказать мне об этом монастыре?";
};


func int dia_nov_3_location_condition()
{
	return TRUE;
};

func void dia_nov_3_location_info()
{
	AI_Output(other,self,"DIA_NOV_3_LOCATION_15_00");	//Что ты можешь сказать мне об этом монастыре?
	AI_Output(self,other,"DIA_NOV_3_LOCATION_03_01");	//Мы свои трудом добываем хлеб насущный. Мы выращиваем овец и делаем вино.
	AI_Output(self,other,"DIA_NOV_3_LOCATION_03_02");	//Здесь есть библиотека, но вход в нее разрешен только магам и избранным послушникам.
	AI_Output(self,other,"DIA_NOV_3_LOCATION_03_03");	//Мы же, остальные послушники, следим за тем, чтобы маги Круга Огня ни в чем не нуждались.
};


instance DIA_NOV_3_STANDARD(C_INFO)
{
	nr = 10;
	condition = dia_nov_3_standard_condition;
	information = dia_nov_3_standard_info;
	permanent = TRUE;
	description = "Что нового?";
};


func int dia_nov_3_standard_condition()
{
	return TRUE;
};

func void dia_nov_3_standard_info()
{
	AI_Output(other,self,"DIA_NOV_3_STANDARD_15_00");	//Что новенького?
	if(KAPITEL == 1)
	{
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_01");	//И ты еще спрашиваешь! Да все послушники только о тебе и говорят.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_02");	//Очень редко бывает так, чтобы зеленый новичок вроде тебя был избран в Круг Огня.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_03");	//Скоро опять состоятся выборы. Один из послушников скоро будет принят в Круг Огня.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_04");	//Скоро он приступит к выполнению испытаний.
		};
	};
	if((KAPITEL == 2) || (KAPITEL == 3))
	{
		if((PEDRO_TRAITOR == TRUE) && (MIS_NOVIZENCHASE != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_05");	//Нашего ордена коснулась грязная лапа Белиара! Зло, должно быть, очень сильно, если оно смогло найти союзников здесь.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_06");	//Педро жил в этом монастыре многие годы. Я думаю, что он слишком много времени проводил за стенами монастыря. Это ослабило его веру и сделало уязвимым для искушений Белиара.
		}
		else if(MIS_NOVIZENCHASE == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_07");	//Ты пришел как раз вовремя. Сам Иннос не мог бы выбрать лучший момент для твоего появления.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_08");	//Ты войдешь в анналы нашего монастыря как спаситель Глаза.
		}
		else if(MIS_OLDWORLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_09");	//Новости из Долины Рудников очень тревожные. Я думаю, что Иннос специально подвергает нас суровым испытаниям.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_10");	//Говорят, что от паладинов, отправившихся в Долину Рудников, нет никаких вестей. Высший Совет лучше знает, что нужно делать.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_NOV_3_STANDARD_03_11");	//Говорят, что мы должны уничтожить драконов с помощью нашего Владыки. Гнев Инноса испепелит созданий Белиар.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_NOV_3_STANDARD_03_12");	//Слава Инносу, сейчас вроде все успокоилось. Мы должны вернуться на путь нашего Бога - только с его помощью мы можем противостоять злу.
	};
};

func void b_assignambientinfos_nov_3(var C_NPC slf)
{
	dia_nov_3_exit.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_join.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_people.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_location.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_standard.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_fegen.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_wurst.npc = Hlp_GetInstanceID(slf);
};

