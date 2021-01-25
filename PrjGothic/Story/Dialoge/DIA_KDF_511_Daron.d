
func void b_daronsegen()
{
	var string concattext;
	var int bonus_1;
	var int bonus_2;
	var int bonus_3;
	DARON_SEGEN = TRUE;
	if(DARON_SPENDE < 100)
	{
		if(other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
		{
			other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
			PrintScreen(PRINT_FULLYHEALED,-1,-1,FONT_SCREEN,2);
		};
	}
	else if((DARON_SPENDE < 250) && (bonus_1 == FALSE))
	{
		if(other.attribute[ATR_MANA] < other.attribute[ATR_MANA_MAX])
		{
			other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
		};
		other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 2;
		concattext = ConcatStrings(PRINT_LEARNMANA_MAX,IntToString(2));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,1);
		bonus_1 = TRUE;
	}
	else if((DARON_SPENDE < 500) && (bonus_2 == FALSE))
	{
		b_giveplayerxp(XP_AMBIENT);
		bonus_2 = TRUE;
	}
	else if((DARON_SPENDE >= 750) && (DARON_SPENDE < 1000) && (bonus_3 == FALSE))
	{
		other.lp = other.lp + 1;
		concattext = ConcatStrings(PRINT_LEARNLP,IntToString(1));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,1);
		bonus_3 = TRUE;
	}
	else
	{
		if(other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
		{
			other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
		};
		if(other.attribute[ATR_MANA] < other.attribute[ATR_MANA_MAX])
		{
			other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
		};
		other.attribute[ATR_HITPOINTS_MAX] = other.attribute[ATR_HITPOINTS_MAX] + 5;
		concattext = ConcatStrings(PRINT_LEARNHITPOINTS_MAX,IntToString(5));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,1);
	};
};


instance DIA_DARON_EXIT(C_INFO)
{
	npc = kdf_511_daron;
	nr = 999;
	condition = dia_daron_exit_condition;
	information = dia_daron_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_daron_exit_condition()
{
	return TRUE;
};

func void dia_daron_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DARON_HALLO(C_INFO)
{
	npc = kdf_511_daron;
	nr = 2;
	condition = dia_daron_hallo_condition;
	information = dia_daron_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_daron_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_daron_hallo_info()
{
	AI_Output(self,other,"DIA_Daron_Hallo_10_00");	//Что я могу сделать для тебя? Ты ищешь душевного комфорта?
	AI_Output(self,other,"DIA_Daron_Hallo_10_01");	//Ты хочешь помолиться нашему владыке Инносу, или, может, хочешь пожертвовать золото его церкви?
};


instance DIA_DARON_PALADINE(C_INFO)
{
	npc = kdf_511_daron;
	nr = 2;
	condition = dia_daron_paladine_condition;
	information = dia_daron_paladine_info;
	permanent = FALSE;
	description = "Мне нужно поговорить с паладинами. Ты можешь помочь мне в этом?";
};


func int dia_daron_paladine_condition()
{
	if((other.guild != GIL_KDF) && (KAPITEL < 2))
	{
		return TRUE;
	};
};

func void dia_daron_paladine_info()
{
	AI_Output(other,self,"DIA_Daron_Paladine_15_00");	//Мне нужно поговорить с паладинами. Ты можешь помочь мне в этом?
	AI_Output(self,other,"DIA_Daron_Paladine_10_01");	//Ну, для этого ты должен иметь доступ в верхний квартал города. Однако входить туда позволено только гражданам и городской страже.
	AI_Output(self,other,"DIA_Daron_Paladine_10_02");	//Ну и, конечно же, нам, Магам Огня.
	AI_Output(other,self,"DIA_Daron_Paladine_15_03");	//Как я могу стать Магом Огня?
	AI_Output(self,other,"DIA_Daron_Paladine_10_04");	//Ты должен вступить в наш орден в качестве послушника. А по прошествии некоторого времени, возможно, ты будешь принят в ряды магов.
	AI_Output(self,other,"DIA_Daron_Paladine_10_05");	//Однако, этот путь долог, полон тяжелой работы и утомительного обучения.
};


instance DIA_DARON_ABOUTSEGEN(C_INFO)
{
	npc = kdf_511_daron;
	nr = 2;
	condition = dia_daron_aboutsegen_condition;
	information = dia_daron_aboutsegen_info;
	permanent = FALSE;
	description = "Я пришел, чтобы получить твое благословение!";
};


func int dia_daron_aboutsegen_condition()
{
	if((MIS_THORBEN_GETBLESSINGS == LOG_RUNNING) && (PLAYER_ISAPPRENTICE == APP_NONE) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_daron_aboutsegen_info()
{
	AI_Output(other,self,"DIA_Daron_AboutSegen_15_00");	//Я пришел, чтобы получить твое благословение!
	AI_Output(self,other,"DIA_Daron_AboutSegen_10_01");	//Это хорошо - тогда ты, вероятно, захочешь пожертвовать золото святой церкви Инноса, правда?
	AI_Output(other,self,"DIA_Daron_AboutSegen_15_02");	//Вообще-то, я хотел получить твое благословение, чтобы поступить в ученики к одному из мастеров в нижней части города...
	if(DARON_SEGEN == TRUE)
	{
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_03");	//Но я уже дал тебе мое благословение, сын мой.
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_04");	//Ступай с Инносом, сын мой!
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_05");	//Но, сын мой! Без скромного пожертвования церкви я не считаю для себя возможным благословить тебя.
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_06");	//Как еще могу я увериться в твоих добрых намерениях по отношению к святой церкви Инноса?
	};
};


instance DIA_DARON_SPENDEN(C_INFO)
{
	npc = kdf_511_daron;
	nr = 3;
	condition = dia_daron_spenden_condition;
	information = dia_daron_spenden_info;
	permanent = FALSE;
	description = "И какое пожертвование обычно считается достаточным?";
};


func int dia_daron_spenden_condition()
{
	if(hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_daron_spenden_info()
{
	AI_Output(other,self,"DIA_Daron_Spenden_15_00");	//И какое пожертвование обычно считается достаточным?
	AI_Output(self,other,"DIA_Daron_Spenden_10_01");	//Ну, это зависит от того, чем ты располагаешь. Давай посмотрим, что у тебя есть.
	AI_Output(self,other,"DIA_Daron_Spenden_10_02");	//(смотрит в кошелек с деньгами) М-м-м хмм...
	if(Npc_HasItems(other,itmi_gold) < 10)
	{
		AI_Output(self,other,"DIA_Daron_Spenden_10_03");	//Хм, ты ведь бедняк, да? Оставь себе то немногое, что у тебя есть.
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Маг огня Дарон не благословил меня. Мне кажется, это означает, что я должен пожертвовать ему немного золота. Без этого он не благословит меня.");
		};
	}
	else
	{
		if(Npc_HasItems(other,itmi_gold) < 50)
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_04");	//Ну, ты не богат, но и не беден. 10 золотых для Инноса - мы живем скромной жизнью.
			b_giveinvitems(other,self,itmi_gold,10);
		}
		else if(Npc_HasItems(other,itmi_gold) < 100)
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_05");	//У тебя больше 50 золотых монет. Пожертвуй 25 монет Инносу и получи мое благословение.
			b_giveinvitems(other,self,itmi_gold,25);
		}
		else
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_06");	//У тебя больше ста золотых монет - Владыка говорит: 'Делись, если можешь'.
			AI_Output(self,other,"DIA_Daron_Spenden_10_07");	//Церковь примет твое щедрое подношение.
			b_giveinvitems(other,self,itmi_gold,50);
		};
		AI_Output(self,other,"DIA_Daron_Spenden_10_08");	//Благословляю тебя от имени Инноса. Он несет в этот мир свет и справедливость.
		DARON_SEGEN = TRUE;
		b_giveplayerxp(XP_INNOSSEGEN);
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Маг огня Дарон благословил меня.");
		};
	};
};


instance DIA_DARON_WOHER(C_INFO)
{
	npc = kdf_511_daron;
	nr = 9;
	condition = dia_daron_woher_condition;
	information = dia_daron_woher_info;
	permanent = FALSE;
	description = "Откуда ты?";
};


func int dia_daron_woher_condition()
{
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_daron_woher_info()
{
	AI_Output(other,self,"DIA_Daron_Woher_15_00");	//Откуда ты пришел?
	AI_Output(self,other,"DIA_Daron_Woher_10_01");	//Я пришел из монастыря магов, находящегося в горах.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Daron_Woher_10_02");	//Мы принимаем к себе всех, кто чист сердцем и ощущает желание служить нашему всемогущему владыке Инносу.
	};
};


instance DIA_DARON_INNOS(C_INFO)
{
	npc = kdf_511_daron;
	nr = 9;
	condition = dia_daron_innos_condition;
	information = dia_daron_innos_info;
	permanent = FALSE;
	description = "Расскажи мне об Инносе.";
};


func int dia_daron_innos_condition()
{
	if(Npc_KnowsInfo(other,dia_daron_woher) && (other.guild != GIL_KDF) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_daron_innos_info()
{
	AI_Output(other,self,"DIA_Daron_Innos_15_00");	//Расскажи мне об Инносе.
	AI_Output(self,other,"DIA_Daron_Innos_10_01");	//Иннос, наш всемогущий владыка, - наш свет и огонь.
	AI_Output(self,other,"DIA_Daron_Innos_10_02");	//Он выбирал людей в качестве проводников своей воли на земле. Он дает им магию и законы.
	AI_Output(self,other,"DIA_Daron_Innos_10_03");	//Мы говорим и действуем от его имени. Мы осуществляем правосудие согласно его воле и проповедуем его слово.
};


instance DIA_DARON_KLOSTER(C_INFO)
{
	npc = kdf_511_daron;
	nr = 9;
	condition = dia_daron_kloster_condition;
	information = dia_daron_kloster_info;
	permanent = FALSE;
	description = "Расскажи мне подробнее о монастыре.";
};


func int dia_daron_kloster_condition()
{
	if(Npc_KnowsInfo(other,dia_daron_woher) || (Npc_KnowsInfo(other,dia_daron_paladine) && (other.guild != GIL_NOV) && (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_daron_kloster_info()
{
	AI_Output(other,self,"DIA_Daron_Kloster_15_00");	//Расскажи мне подробнее о монастыре.
	AI_Output(self,other,"DIA_Daron_Kloster_10_01");	//Мы обучаем наших студентов всем формам магии. Но сила Магов Огня не ограничивается только магией.
	AI_Output(self,other,"DIA_Daron_Kloster_10_02");	//Мы также хорошо разбираемся в искусстве алхимии и создании рун.
	AI_Output(self,other,"DIA_Daron_Kloster_10_03");	//Еще мы делаем превосходное вино.
};


instance DIA_DARON_STADT(C_INFO)
{
	npc = kdf_511_daron;
	nr = 99;
	condition = dia_daron_stadt_condition;
	information = dia_daron_stadt_info;
	permanent = TRUE;
	description = "А что ты делаешь в городе?";
};


func int dia_daron_stadt_condition()
{
	if(Npc_KnowsInfo(other,dia_daron_woher))
	{
		return TRUE;
	};
};

func void dia_daron_stadt_info()
{
	AI_Output(other,self,"DIA_Daron_Stadt_15_00");	//А что ты делаешь в городе?
	AI_Output(self,other,"DIA_Daron_Stadt_10_01");	//Я просвещаю паладинов и поддерживаю горожан своими советами и ободряющими словами.
	AI_Output(self,other,"DIA_Daron_Stadt_10_02");	//В эти тяжелые времена наш долг быть среди народа и помогать бедным.
};


instance DIA_DARON_ARM(C_INFO)
{
	npc = kdf_511_daron;
	nr = 10;
	condition = dia_daron_arm_condition;
	information = dia_daron_arm_info;
	permanent = FALSE;
	description = "Я как раз бедный!";
};


func int dia_daron_arm_condition()
{
	if(Npc_KnowsInfo(other,dia_daron_stadt) && (Npc_HasItems(other,itmi_gold) < 10) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_daron_arm_info()
{
	AI_Output(other,self,"DIA_Daron_arm_15_00");	//Я как раз бедный!
	AI_Output(self,other,"DIA_Daron_arm_10_01");	//Да, ты доведен до нищеты. Это неудивительно в эти тяжелые времена. Возьми это золото, надеюсь, оно поможет тебе.
	AI_Output(self,other,"DIA_Daron_arm_10_02");	//Но ты должен найти себе работу, и тогда у тебя не будет недостатка в золоте. И ты сможешь пожертвовать это золото церкви Инноса, помня о том, как она помогала тебе.
	b_giveinvitems(self,other,itmi_gold,20);
};


instance DIA_DARON_SPENDE(C_INFO)
{
	npc = kdf_511_daron;
	nr = 800;
	condition = dia_daron_spende_condition;
	information = dia_daron_spende_info;
	permanent = TRUE;
	description = "Я хочу сделать пожертвование...";
};


var int dia_daron_spende_permanent;

func int dia_daron_spende_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_DARON_SPENDE_PERMANENT == FALSE) && Npc_KnowsInfo(other,dia_daron_spenden) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_daron_spende_info()
{
	AI_Output(other,self,"DIA_Daron_Spende_15_00");	//Я хочу сделать пожертвование...
	Info_ClearChoices(dia_daron_spende);
	if(DARON_SPENDE < 1000)
	{
		Info_AddChoice(dia_daron_spende,"Но у меня недостаточно золота... (НАЗАД)",dia_daron_spende_back);
		Info_AddChoice(dia_daron_spende,"(50  золота)",dia_daron_spende_50);
		Info_AddChoice(dia_daron_spende,"(100 золота)",dia_daron_spende_100);
		Info_AddChoice(dia_daron_spende,"(200 золота)",dia_daron_spende_200);
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_10_01");	//Ты уже пожертвовал мне более 1000 золотых монет.
		AI_Output(self,other,"DIA_Daron_Spende_10_02");	//Благословение Инноса всегда пребудет с тобой.
		DIA_DARON_SPENDE_PERMANENT = TRUE;
		b_daronsegen();
	};
};

func void dia_daron_spende_back()
{
	AI_Output(other,self,"DIA_Daron_Spende_BACK_15_00");	//Но у меня недостаточно золота...
	AI_Output(self,other,"DIA_Daron_Spende_BACK_10_01");	//Это не имеет значения, сын мой. Ты можешь принести пожертвование позже.
	Info_ClearChoices(dia_daron_spende);
};


var int daron_spende;

func void dia_daron_spende_50()
{
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Daron_Spende_50_10_00");	//Благословляю тебя от имени Инноса. Он несет в этот мир свет и справедливость.
		DARON_SPENDE = DARON_SPENDE + 50;
		b_daronsegen();
		DARON_SEGEN = TRUE;
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Маг огня Дарон благословил меня.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_50_10_01");	//Ты можешь жертвовать несколько раз понемногу, если у тебя сейчас недостаточно золота.
	};
	Info_ClearChoices(dia_daron_spende);
};

func void dia_daron_spende_100()
{
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Daron_Spende_100_10_00");	//Иннос, ты свет, озаряющий путь праведников.
		AI_Output(self,other,"DIA_Daron_Spende_100_10_01");	//Я благословляю этого человека от твоего имени. Да будет твой свет сиять над ним вечно.
		DARON_SPENDE = DARON_SPENDE + 100;
		b_daronsegen();
		DARON_SEGEN = TRUE;
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Маг огня Дарон благословил меня.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_100_10_02");	//Иннос говорит - если хочешь молиться, открой свою душу. А если ты хочешь пожертвовать, принеси свой дар.
	};
	Info_ClearChoices(dia_daron_spende);
};

func void dia_daron_spende_200()
{
	if(b_giveinvitems(other,self,itmi_gold,200))
	{
		AI_Output(self,other,"DIA_Daron_Spende_200_10_00");	//Иннос, благослови этого человека. Да будет твой свет сиять над ним вечно.
		AI_Output(self,other,"DIA_Daron_Spende_200_10_01");	//Придай ему силы жить праведной жизнью.
		DARON_SPENDE = DARON_SPENDE + 200;
		b_daronsegen();
		DARON_SEGEN = TRUE;
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Маг огня Дарон благословил меня.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_200_10_02");	//Если ты хочешь пожертвовать столько золота, оно у тебя должно хотя бы быть.
	};
	Info_ClearChoices(dia_daron_spende);
};


instance DIA_DARON_PICKPOCKET(C_INFO)
{
	npc = kdf_511_daron;
	nr = 900;
	condition = dia_daron_pickpocket_condition;
	information = dia_daron_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_daron_pickpocket_condition()
{
	return c_beklauen(47,80);
};

func void dia_daron_pickpocket_info()
{
	Info_ClearChoices(dia_daron_pickpocket);
	Info_AddChoice(dia_daron_pickpocket,DIALOG_BACK,dia_daron_pickpocket_back);
	Info_AddChoice(dia_daron_pickpocket,DIALOG_PICKPOCKET,dia_daron_pickpocket_doit);
};

func void dia_daron_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_daron_pickpocket);
};

func void dia_daron_pickpocket_back()
{
	Info_ClearChoices(dia_daron_pickpocket);
};

