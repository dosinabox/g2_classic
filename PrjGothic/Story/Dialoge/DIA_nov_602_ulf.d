
instance DIA_ULF_EXIT(C_INFO)
{
	npc = nov_602_ulf;
	nr = 999;
	condition = dia_ulf_exit_condition;
	information = dia_ulf_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulf_exit_condition()
{
	return TRUE;
};

func void dia_ulf_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULF_HALLO(C_INFO)
{
	npc = nov_602_ulf;
	nr = 2;
	condition = dia_ulf_hallo_condition;
	information = dia_ulf_hallo_info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int dia_ulf_hallo_condition()
{
	if((hero.guild != GIL_NOV) && (hero.guild != GIL_KDF) && (MIS_SCHNITZELJAGD == FALSE))
	{
		return TRUE;
	};
};

func void dia_ulf_hallo_info()
{
	AI_Output(other,self,"DIA_Ulf_Hallo_15_00");	//Что ты делаешь здесь?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Ulf_Hallo_03_01");	//Если тебе интересно это знать, я выполняю задание монастыря.
	}
	else
	{
		AI_Output(self,other,"DIA_Ulf_Hallo_03_02");	//Я послушник в монастыре. Я выполняю задания магов, а также паладинов.
	};
	AI_Output(self,other,"DIA_Ulf_Hallo_03_03");	//Я доставил трем трактирщикам города вино из монастыря.
};


instance DIA_ULF_WIRTE(C_INFO)
{
	npc = nov_602_ulf;
	nr = 3;
	condition = dia_ulf_wirte_condition;
	information = dia_ulf_wirte_info;
	permanent = FALSE;
	description = "Кто эти трое трактирщиков?";
};


func int dia_ulf_wirte_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_hallo) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_ulf_wirte_info()
{
	AI_Output(other,self,"DIA_Ulf_Wirte_15_00");	//Кто эти трое трактирщиков?
	AI_Output(self,other,"DIA_Ulf_Wirte_03_01");	//Один из них - вот этот добрый человек за прилавком.
	AI_Output(self,other,"DIA_Ulf_Wirte_03_02");	//Также еще Карагон - хозяин таверны на храмовой площади, и Кардиф - владелец бара в портовом районе.
};


instance DIA_ULF_KLOSTER(C_INFO)
{
	npc = nov_602_ulf;
	nr = 3;
	condition = dia_ulf_kloster_condition;
	information = dia_ulf_kloster_info;
	permanent = FALSE;
	description = "Что ты можешь рассказать мне о монастыре?";
};


func int dia_ulf_kloster_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_hallo) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_ulf_kloster_info()
{
	AI_Output(other,self,"DIA_Ulf_Kloster_15_00");	//Что ты можешь рассказать мне о монастыре?
	AI_Output(self,other,"DIA_Ulf_Kloster_03_01");	//Мы, послушники, ищем просвещение в молитвах Инносу и изучении принципов веры под руководством магов.
	AI_Output(self,other,"DIA_Ulf_Kloster_03_02");	//Мы служим им так же, как мы служим Инносу, и готовим себя к единению с огнем.
};


instance DIA_ULF_BRINGEN(C_INFO)
{
	npc = nov_602_ulf;
	nr = 4;
	condition = dia_ulf_bringen_condition;
	information = dia_ulf_bringen_info;
	permanent = FALSE;
	description = "Отведи меня в монастырь.";
};


func int dia_ulf_bringen_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_hallo) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV) && (hero.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_ulf_bringen_info()
{
	AI_Output(other,self,"DIA_Ulf_Bringen_15_00");	//Отведи меня в монастырь.
	AI_Output(self,other,"DIA_Ulf_Bringen_03_01");	//Забудь об этом. Ты знаешь, сколько различных злобных тварей встретилось мне по пути?
	AI_Output(self,other,"DIA_Ulf_Bringen_03_02");	//Когда я думаю обо всех этих кровавых мухах, волках и гоблинах, я рад, что мне больше не нужно жить здесь.
	AI_Output(self,other,"DIA_Ulf_Bringen_03_03");	//Кроме того, тебя все равно не пустят в монастырь.
	AI_Output(other,self,"DIA_Ulf_Bringen_15_04");	//Почему?
	AI_Output(self,other,"DIA_Ulf_Bringen_03_05");	//Вход в монастырь разрешен только магам, паладинам и послушникам.
};


instance DIA_ULF_AUFNAHME(C_INFO)
{
	npc = nov_602_ulf;
	nr = 3;
	condition = dia_ulf_aufnahme_condition;
	information = dia_ulf_aufnahme_info;
	permanent = FALSE;
	description = "Как мне стать послушником?";
};


func int dia_ulf_aufnahme_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_bringen) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_ulf_aufnahme_info()
{
	AI_Output(other,self,"DIA_Ulf_Aufnahme_15_00");	//Как мне стать послушником?
	AI_Output(self,other,"DIA_Ulf_Aufnahme_03_01");	//Если человек чувствует глубокое желание...
	AI_Output(other,self,"DIA_Ulf_Aufnahme_15_02");	//Эй! Просто скажи мне, каковы условия.
	AI_Output(self,other,"DIA_Ulf_Aufnahme_03_03");	//Ты должен принести дары. Овцу и...
	b_say_gold(self,other,SUMME_KLOSTER);
	Log_CreateTopic(TOPIC_KLOSTER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KLOSTER,LOG_RUNNING);
	b_logentry(TOPIC_KLOSTER,"Чтобы стать послушником монастыря Инноса, мне нужна овца и 1000 золотых монет.");
};


instance DIA_ULF_GOLD(C_INFO)
{
	npc = nov_602_ulf;
	nr = 8;
	condition = dia_ulf_gold_condition;
	information = dia_ulf_gold_info;
	permanent = FALSE;
	description = "Как мне раздобыть такую огромную сумму?";
};


func int dia_ulf_gold_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_aufnahme) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_ulf_gold_info()
{
	AI_Output(other,self,"DIA_Ulf_Gold_15_00");	//Как мне раздобыть такую огромную сумму?
	AI_Output(self,other,"DIA_Ulf_Gold_03_01");	//Так как очевидно, что ты не знаешь никого, кто мог бы заплатить за тебя, тебе просто нужно заработать ее.
};


instance DIA_ULF_SCHAF(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_schaf_condition;
	information = dia_ulf_schaf_info;
	permanent = FALSE;
	description = "Где я могу найти овцу?";
};


func int dia_ulf_schaf_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_aufnahme) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_ulf_schaf_info()
{
	AI_Output(other,self,"DIA_Ulf_Schaf_15_00");	//Где я могу найти овцу?
	AI_Output(self,other,"DIA_Ulf_Schaf_03_01");	//У фермеров, конечно же. Но ты не получишь ее даром.
	b_logentry(TOPIC_KLOSTER,"Я могу раздобыть овцу у фермеров.");
};


instance DIA_ULF_SUCHE(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_suche_condition;
	information = dia_ulf_suche_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ulf_suche_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_42") <= 1000) && !Npc_KnowsInfo(other,dia_ulf_abrechnung))
	{
		return TRUE;
	};
};

func void dia_ulf_suche_info()
{
	AI_Output(self,other,"DIA_Ulf_Suche_03_00");	//Эй, ты знаешь новости?
	AI_Output(other,self,"DIA_Ulf_Suche_15_01");	//Ты был избран.
	AI_Output(self,other,"DIA_Ulf_Suche_03_02");	//Точно. Я как раз хотел посидеть, попить холодного пива, когда из-за угла вышел Дарон и сказал мне, что я был избран.
	AI_Output(self,other,"DIA_Ulf_Suche_03_03");	//Кто бы мог подумать? Воля Инноса непостижима. А что привело тебя сюда?
	AI_Output(other,self,"DIA_Ulf_Suche_15_04");	//Я потребовал прохождения Испытания Огнем.
	AI_Output(self,other,"DIA_Ulf_Suche_03_05");	//Это невозможно! Похоже, мужества у тебя хватит на десятерых. Это значит, что ты тоже будешь искать 'то, что верующий находит в конце пути'?
	AI_Output(other,self,"DIA_Ulf_Suche_15_06");	//Похоже на это.
};


instance DIA_ULF_RAUSGEFUNDEN(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_rausgefunden_condition;
	information = dia_ulf_rausgefunden_info;
	permanent = FALSE;
	description = "Ты еще ничего не нашел";
};


func int dia_ulf_rausgefunden_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_42") <= 1000) && !Npc_KnowsInfo(other,dia_ulf_abrechnung))
	{
		return TRUE;
	};
};

func void dia_ulf_rausgefunden_info()
{
	AI_Output(other,self,"DIA_Ulf_Rausgefunden_15_00");	//Ты еще ничего не нашел
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_01");	//Ну, я пытался идти за Агоном - но я потерял его.
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_02");	//И что теперь?.. Что они говорят? Следуй знакам Инноса. Но я не понимаю эту загадку с путем...
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_03");	//Так что я продолжу свои поиски.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_ULF_FOLGEN(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_folgen_condition;
	information = dia_ulf_folgen_info;
	permanent = FALSE;
	description = "Эй, ты что, идешь за мной?";
};


func int dia_ulf_folgen_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_ulf_rausgefunden) && !Npc_KnowsInfo(other,dia_ulf_abrechnung))
	{
		return TRUE;
	};
};

func void dia_ulf_folgen_info()
{
	AI_Output(other,self,"DIA_Ulf_Folgen_15_00");	//Эй, ты что, идешь за мной?
	AI_Output(self,other,"DIA_Ulf_Folgen_03_01");	//Чушь. Просто я случайно иду в том же направлении, что и ты.
	AI_StopProcessInfos(self);
};


instance DIA_ULF_STOP(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_stop_condition;
	information = dia_ulf_stop_info;
	permanent = FALSE;
	description = "Хватит бегать за мной!";
};


func int dia_ulf_stop_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_ulf_folgen) && !Npc_KnowsInfo(other,dia_ulf_abrechnung))
	{
		return TRUE;
	};
};

func void dia_ulf_stop_info()
{
	AI_Output(other,self,"DIA_Ulf_Stop_15_00");	//Хватит бегать за мной!
	AI_Output(self,other,"DIA_Ulf_Stop_03_01");	//Я не иду за тобой. Но, пожалуйста, если тебе так кажется - я пойду другой дорогой.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SUCHE");
};


instance DIA_ULF_ABRECHNUNG(C_INFO)
{
	npc = nov_602_ulf;
	nr = 1;
	condition = dia_ulf_abrechnung_condition;
	information = dia_ulf_abrechnung_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ulf_abrechnung_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && (Npc_HasItems(other,itmi_runeblank) >= 1))
	{
		return TRUE;
	};
};

func void dia_ulf_abrechnung_info()
{
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_00");	//Мы опять встретились. Я много размышлял. Я верю, что желание стать магом сильно во мне.
	AI_Output(other,self,"DIA_Ulf_Abrechnung_15_01");	//Ох - не делай этого...
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_02");	//У меня нет выбора. Жизнь послушника не по мне.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_03");	//Я должен стать магом. Тогда сразу все станет хорошо. И теперь я заберу то, что должно принадлежать мне.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_04");	//Ты хочешь сказать последнее слово?
	Info_ClearChoices(dia_ulf_abrechnung);
	Info_AddChoice(dia_ulf_abrechnung,"Прекрати, я не хочу убивать тебя.",dia_ulf_abrechnung_lass);
	Info_AddChoice(dia_ulf_abrechnung,"Ты, возможно, что-то не понимаешь - мне нужно вернуться в монастырь.",dia_ulf_abrechnung_schnell);
	Info_AddChoice(dia_ulf_abrechnung,"У тебя нет ничего покурить?",dia_ulf_abrechnung_rauch);
};

func void dia_ulf_abrechnung_lass()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Lass_15_00");	//Прекрати, я не хочу убивать тебя.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Lass_03_01");	//Чушь. Ты же знаешь, что у тебя нет ни единого шанса против меня! Сражайся!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};

func void dia_ulf_abrechnung_schnell()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Schnell_15_00");	//Ты, возможно, что-то не понимаешь... Мне нужно вернуться в монастырь.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Schnell_03_01");	//Тебе больше никуда не нужно идти!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};

func void dia_ulf_abrechnung_rauch()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Rauch_15_00");	//У тебя нет ничего покурить?
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Rauch_03_01");	//Тебе повезло. Как раз у меня кое-что есть.
	b_giveinvitems(self,other,itmi_joint,1);
	b_useitem(other,itmi_joint);
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Rauch_03_02");	//Давай, закурим.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};


instance DIA_ULF_TROLL(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_troll_condition;
	information = dia_ulf_troll_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ulf_troll_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_ulf_rausgefunden) && ((Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_14") <= 1000) || (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_15") <= 1000)))
	{
		return TRUE;
	};
};

func void dia_ulf_troll_info()
{
	AI_Output(self,other,"DIA_Ulf_Troll_03_00");	//Эй, ты действительно думаешь, что мы идем правильной дорогой? Тролль живет не здесь.
	AI_Output(self,other,"DIA_Ulf_Troll_03_01");	//Я думаю, нам нужно идти в другую сторону.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WAIT");
};


instance DIA_ULF_PICKPOCKET(C_INFO)
{
	npc = nov_602_ulf;
	nr = 900;
	condition = dia_ulf_pickpocket_condition;
	information = dia_ulf_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_ulf_pickpocket_condition()
{
	return c_beklauen(34,50);
};

func void dia_ulf_pickpocket_info()
{
	Info_ClearChoices(dia_ulf_pickpocket);
	Info_AddChoice(dia_ulf_pickpocket,DIALOG_BACK,dia_ulf_pickpocket_back);
	Info_AddChoice(dia_ulf_pickpocket,DIALOG_PICKPOCKET,dia_ulf_pickpocket_doit);
};

func void dia_ulf_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ulf_pickpocket);
};

func void dia_ulf_pickpocket_back()
{
	Info_ClearChoices(dia_ulf_pickpocket);
};

