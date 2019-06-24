
instance DIA_HYGLAS_KAP1_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap1_exit_condition;
	information = dia_hyglas_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_FEUER(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 2;
	condition = dia_hyglas_feuer_condition;
	information = dia_hyglas_feuer_info;
	permanent = FALSE;
	description = "Мне необходимо пройти Испытание Огнем.";
};


func int dia_hyglas_feuer_condition()
{
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == TRUE) && (Npc_KnowsInfo(other,dia_pyrokar_fire) == FALSE))
	{
		return TRUE;
	};
};

func void dia_hyglas_feuer_info()
{
	AI_Output(other,self,"DIA_Hyglas_Feuer_15_00");	//Мне необходимо пройти Испытание Огнем.
	AI_Output(self,other,"DIA_Hyglas_Feuer_14_01");	//Испытание Огнем - это обряд из древних времен, и не проводилось уже давно.
	AI_Output(self,other,"DIA_Hyglas_Feuer_14_02");	//То, чего ты требуешь, очень опасно. Даже и не думай об этом.
};


instance DIA_HYGLAS_HALLO(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 2;
	condition = dia_hyglas_hallo_condition;
	information = dia_hyglas_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hyglas_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_hyglas_hallo_info()
{
	AI_Output(self,other,"DIA_Hyglas_Hallo_14_00");	//Я Мастер Хиглас, Страж Огня и Хранитель Знаний.
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Hyglas_Hallo_14_01");	//Итак, Мастер Парлан дал тебе разрешение изучать священные книги.
		AI_Output(self,other,"DIA_Hyglas_Hallo_14_02");	//Тогда бери их и изучай. Может быть, ты найдешь просвещение в этих писаниях.
	};
};


instance DIA_HYGLAS_JOB(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 2;
	condition = dia_hyglas_job_condition;
	information = dia_hyglas_job_info;
	permanent = FALSE;
	description = "Что ты изучаешь, Мастер?";
};


func int dia_hyglas_job_condition()
{
	return TRUE;
};

func void dia_hyglas_job_info()
{
	AI_Output(other,self,"DIA_Hyglas_JOB_15_00");	//Что ты изучаешь, Мастер?
	AI_Output(self,other,"DIA_Hyglas_JOB_14_01");	//Я посвятил себя изучению огня - силы Инноса.
	AI_Output(self,other,"DIA_Hyglas_JOB_14_02");	//Это его дар, и в то же время, могучее оружие - я создаю руны, содержащие частицу его силы.
	if(other.guild == GIL_NOV)
	{
		AI_Output(other,self,"DIA_Hyglas_JOB_15_03");	//Как это интересно! А не мог бы ты научить и меня этому?
		AI_Output(self,other,"DIA_Hyglas_JOB_14_04");	//Магию дарует Иннос. И только его слугам, Магам Огня, дано познать, как пользоваться этой силой.
	};
};


instance DIA_HYGLAS_CONTEST(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 9;
	condition = dia_hyglas_contest_condition;
	information = dia_hyglas_contest_info;
	permanent = FALSE;
	description = "Я потребовал прохождения Испытания Огнем.";
};


func int dia_hyglas_contest_condition()
{
	if(MIS_RUNE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_hyglas_contest_info()
{
	AI_Output(other,self,"DIA_Hyglas_CONTEST_15_00");	//Я должен пройти Испытание Огнем. Ультар дал мне задание создать руну огненной стрелы.
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_01");	//И ты хочешь, чтобы я обучил тебя этому?
	AI_Output(other,self,"DIA_Hyglas_CONTEST_15_02");	//Я не знаю другого способа выполнить это задание.
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_03");	//Хмм...
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_04");	//Хорошо, я научу тебя. Но сначала, ты должен найти все необходимые ингредиенты.
	b_logentry(TOPIC_RUNE,"Хиглас готов обучить меня создавать руну Огненная стрела, если я принесу ему все необходимые ингредиенты.");
};


instance DIA_HYGLAS_FIREBOLT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 9;
	condition = dia_hyglas_firebolt_condition;
	information = dia_hyglas_firebolt_info;
	permanent = FALSE;
	description = "Какие ингредиенты нужны для создания руны огненной стрелы?";
};


func int dia_hyglas_firebolt_condition()
{
	if(Npc_KnowsInfo(hero,dia_hyglas_contest) && (MIS_RUNE == LOG_RUNNING) && (PLAYER_TALENT_RUNES[SPL_FIREBOLT] == FALSE))
	{
		return TRUE;
	};
};

func void dia_hyglas_firebolt_info()
{
	AI_Output(other,self,"DIA_Hyglas_FIREBOLT_15_00");	//Какие ингредиенты нужны для создания руны огненной стрелы?
	AI_Output(self,other,"DIA_Hyglas_FIREBOLT_14_01");	//Прочти об этом - ты найдешь эту информацию здесь, в книгах.
};


instance DIA_HYGLAS_TALENT_FIREBOLT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 990;
	condition = dia_hyglas_talent_firebolt_condition;
	information = dia_hyglas_talent_firebolt_info;
	permanent = TRUE;
	description = "Научи меня создавать руну ОГНЕННОЙ СТРЕЛЫ.";
};


func int dia_hyglas_talent_firebolt_condition()
{
	if(Npc_KnowsInfo(hero,dia_hyglas_contest) && (PLAYER_TALENT_RUNES[SPL_FIREBOLT] == FALSE) && (Npc_HasItems(other,itmi_runeblank) >= 1) && (Npc_HasItems(other,itsc_firebolt) >= 1) && (Npc_HasItems(other,itmi_sulfur) >= 1))
	{
		return TRUE;
	};
};

func void dia_hyglas_talent_firebolt_info()
{
	AI_Output(other,self,"DIA_Hyglas_TALENT_FIREBOLT_15_00");	//Научи меня создавать руну ОГНЕННОЙ СТРЕЛЫ.
	if(b_teachplayertalentrunes(self,other,SPL_FIREBOLT))
	{
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_01");	//Чтобы создать руну огненной стрелы, ты должен объединить на рунном столе серу с рунным камнем.
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_02");	//Сила свитка огненной стрелы перетечет в эту руну, и ты станешь обладателем оружия Инноса.
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_03");	//Когда у тебя будет все необходимое, подойди к рунному столу и создай свою руну.
	};
};


instance DIA_HYGLAS_BLANK_RUNE(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 9;
	condition = dia_hyglas_blank_rune_condition;
	information = dia_hyglas_blank_rune_info;
	permanent = FALSE;
	description = "Где я могу найти рунный камень?";
};


func int dia_hyglas_blank_rune_condition()
{
	if(Npc_KnowsInfo(hero,dia_hyglas_firebolt) && (MIS_RUNE == LOG_RUNNING) && (Npc_HasItems(other,itmi_runeblank) < 1) && (PLAYER_TALENT_RUNES[SPL_FIREBOLT] == FALSE))
	{
		return TRUE;
	};
};

func void dia_hyglas_blank_rune_info()
{
	AI_Output(other,self,"DIA_Hyglas_BLANK_RUNE_15_00");	//Где я могу найти рунный камень?
	AI_Output(self,other,"DIA_Hyglas_BLANK_RUNE_14_01");	//Послушай, тебе ведь необходимо пройти Испытание Огнем - не мне. Поиски входят в это испытание.
};


instance DIA_HYGLAS_GOTRUNE(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 2;
	condition = dia_hyglas_gotrune_condition;
	information = dia_hyglas_gotrune_info;
	permanent = FALSE;
	description = "Я создал руну.";
};


func int dia_hyglas_gotrune_condition()
{
	if((Npc_KnowsInfo(hero,dia_ulthar_success) == FALSE) && (Npc_HasItems(hero,itru_firebolt) >= 1) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_hyglas_gotrune_info()
{
	AI_Output(other,self,"DIA_Hyglas_GOTRUNE_15_00");	//Я создал руну.
	AI_Output(self,other,"DIA_Hyglas_GOTRUNE_14_01");	//Хорошо, хорошо. Я думаю, ты прошел этот тест. Впрочем, это было не так уж и сложно.
	AI_Output(self,other,"DIA_Hyglas_GOTRUNE_14_02");	//Теперь иди к Ультару и покажи ему плоды своего труда.
	b_logentry(TOPIC_RUNE,"Я создал руну Огненная стрела.");
};


instance DIA_HYGLAS_TEACH(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 15;
	condition = dia_hyglas_teach_condition;
	information = dia_hyglas_teach_info;
	permanent = TRUE;
	description = "Научи меня.";
};


func int dia_hyglas_teach_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_hyglas_teach_info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Hyglas_TEACH_15_00");	//Обучи меня.
	Info_ClearChoices(dia_hyglas_teach);
	Info_AddChoice(dia_hyglas_teach,DIALOG_BACK,dia_hyglas_teach_back);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_INSTANTFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_hyglas_teach_instantfireball);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_FIRESTORM] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_FIRESTORM,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_hyglas_teach_firestorm);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_CHARGEFIREBALL] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_CHARGEFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_hyglas_teach_chargefireball);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_PYROKINESIS] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_PYROKINESIS,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_hyglas_teach_pyrokinesis);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6) && (PLAYER_TALENT_RUNES[SPL_FIRERAIN] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_FIRERAIN,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_hyglas_teach_firerain);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		b_say(self,other,"$NOLEARNOVERPERSONALMAX");
		Info_ClearChoices(dia_hyglas_teach);
	};
};

func void dia_hyglas_teach_back()
{
	Info_ClearChoices(dia_hyglas_teach);
};

func void dia_hyglas_teach_instantfireball()
{
	b_teachplayertalentrunes(self,other,SPL_INSTANTFIREBALL);
};

func void dia_hyglas_teach_chargefireball()
{
	b_teachplayertalentrunes(self,other,SPL_CHARGEFIREBALL);
};

func void dia_hyglas_teach_pyrokinesis()
{
	b_teachplayertalentrunes(self,other,SPL_PYROKINESIS);
};

func void dia_hyglas_teach_firestorm()
{
	b_teachplayertalentrunes(self,other,SPL_FIRESTORM);
};

func void dia_hyglas_teach_firerain()
{
	b_teachplayertalentrunes(self,other,SPL_FIRERAIN);
};


instance DIA_HYGLAS_KAP2_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap2_exit_condition;
	information = dia_hyglas_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_KAP3_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap3_exit_condition;
	information = dia_hyglas_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_BRINGBOOK(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 38;
	condition = dia_hyglas_bringbook_condition;
	information = dia_hyglas_bringbook_info;
	permanent = FALSE;
	description = "Есть новости?";
};


func int dia_hyglas_bringbook_condition()
{
	if((KAPITEL >= 3) && (hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_hyglas_bringbook_info()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_00");	//Есть какие-нибудь новости?
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_01");	//Хмм, да. Ну, ты, вероятно, заметил эти фигуры в черных робах.
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_02");	//Я встречал их.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_03");	//Вот! А теперь перейдем к сути дела. В настоящий момент, мы наблюдаем очень редкое созвездие.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_04");	//Если быть более точным, созвездие Быка сейчас находится в прямой взаимосвязи с созвездием Воина. Я полагаю, ты знаешь, что это означает.
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_05");	//Хмм. Ну, если быть честным...
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_06");	//Да, хорошо, я понимаю. Ну, я не могу объяснить тебе сейчас все детали, но это, определенно, предвещает великие перемены. А я не люблю перемены.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_07");	//"Поэтому, я хочу, чтобы ты принес мне из города книгу. Она называется ""Божественная сила звезд"". Тебе, возможно, придется поискать ее, но я уверен, что ты справишься с этим."
	Info_ClearChoices(dia_hyglas_bringbook);
	Info_AddChoice(dia_hyglas_bringbook,"Достань эту книгу сам.",dia_hyglas_bringbook_getityourself);
	Info_AddChoice(dia_hyglas_bringbook,"А что мне с этого будет?",dia_hyglas_bringbook_getforit);
	Info_AddChoice(dia_hyglas_bringbook,"Я попробую найти ее.",dia_hyglas_bringbook_yes);
};

func void dia_hyglas_bringbook_getityourself()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetItYourself_15_00");	//Достань эту книгу сам.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetItYourself_14_01");	//Как ты смеешь говорить со мной в таком тоне?! Твое поведение недопустимо, ты обязан проявлять уважение ко мне!
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetItYourself_14_02");	//Убирайся с глаз моих и подумай о своем поведении.
	MIS_HYGLASBRINGBOOK = LOG_OBSOLETE;
	Info_ClearChoices(dia_hyglas_bringbook);
};

func void dia_hyglas_bringbook_getforit()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetForIt_15_00");	//И что я за это получу?
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetForIt_14_01");	//Что ты имеешь в виду?
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetForIt_15_02");	//Я бы хотел знать, что ты дашь мне, если я принесу эту книгу.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetForIt_14_03");	//Ничего. А что ты ожидал получить? Если у тебя есть время, чтобы выполнить для меня задание в городе, это твоя обязанность помочь мне.
	Info_ClearChoices(dia_hyglas_bringbook);
};

func void dia_hyglas_bringbook_yes()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_Yes_15_00");	//Я попробую найти ее.
	AI_Output(self,other,"DIA_Hyglas_BringBook_Yes_14_01");	//Хорошо - это сэкономит мое время, и я смогу заняться другими делами.
	AI_Output(self,other,"DIA_Hyglas_BringBook_Yes_14_02");	//Но не трать на это слишком много времени. Как раз времени-то, боюсь, у нас очень мало.
	MIS_HYGLASBRINGBOOK = LOG_RUNNING;
	Info_ClearChoices(dia_hyglas_bringbook);
	Log_CreateTopic(TOPIC_HYGLASBRINGBOOK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HYGLASBRINGBOOK,LOG_RUNNING);
	b_logentry(TOPIC_HYGLASBRINGBOOK,"Хиглас хочет, чтобы я принес ему книгу 'Божественная сила звезд'. Она может быть у одного из торговцев в городе.");
};


instance DIA_HYGLAS_HAVEBOOK(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 38;
	condition = dia_hyglas_havebook_condition;
	information = dia_hyglas_havebook_info;
	permanent = FALSE;
	description = "Я принес тебе книгу.";
};


func int dia_hyglas_havebook_condition()
{
	if(Npc_KnowsInfo(other,dia_hyglas_bringbook) && (Npc_HasItems(other,itwr_astronomy_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_hyglas_havebook_info()
{
	AI_Output(other,self,"DIA_Hyglas_HaveBook_15_00");	//Я принес тебе книгу.
	if(MIS_HYGLASBRINGBOOK == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Hyglas_HaveBook_14_01");	//Очень хорошо, давай ее сюда.
	}
	else
	{
		AI_Output(self,other,"DIA_Hyglas_HaveBook_14_02");	//Ты все же передумал. Очень хорошо. Так где же эта книга?
	};
	b_giveinvitems(other,self,itwr_astronomy_mis,1);
	MIS_HYGLASBRINGBOOK = LOG_SUCCESS;
	b_giveplayerxp(XP_HYGLASBRINGBOOK);
	AI_Output(self,other,"DIA_Hyglas_HaveBook_14_03");	//Теперь ты можешь удалиться. А я должен уединиться и заняться ее изучением.
};


instance DIA_HYGLAS_KAP4_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap4_exit_condition;
	information = dia_hyglas_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_KAP4_PERM(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 49;
	condition = dia_hyglas_kap4_perm_condition;
	information = dia_hyglas_kap4_perm_info;
	permanent = TRUE;
	description = "Ничего пока не нашел?";
};


func int dia_hyglas_kap4_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_hyglas_bringbook))
	{
		return TRUE;
	};
};

func void dia_hyglas_kap4_perm_info()
{
	AI_Output(other,self,"DIA_Hyglas_Kap4_PERM_15_00");	//Ничего пока не нашел?
	if(MIS_HYGLASBRINGBOOK == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_01");	//Ну, я не совсем уверен, но текущее расположение звезд, похоже, сулит многие опасности.
		AI_Output(other,self,"DIA_Hyglas_Kap4_PERM_15_02");	//Какого рода опасности?
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_03");	//Ну, материя между мирами, похоже, очень слаба. Нужна только небольшая часть силы, которая потребовалась бы в обычное время, чтобы прорвать брешь в этой материи.
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_04");	//Демоны могут использовать эти порталы, чтобы войти в наш мир, не встретив сопротивления.
		HYGLAS_SENDSTOKARRAS = TRUE;
	}
	else if(MIS_HYGLASBRINGBOOK == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_05");	//Нет, я все еще жду эту книгу.
	}
	else
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_06");	//Я говорил тебе, что я все равно продолжаю свои исследования, но на них, конечно же, потребуется больше времени, если у меня не будет необходимых материалов.
	};
};


instance DIA_HYGLAS_KAP5_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap5_exit_condition;
	information = dia_hyglas_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_PICKPOCKET(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 900;
	condition = dia_hyglas_pickpocket_condition;
	information = dia_hyglas_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_hyglas_pickpocket_condition()
{
	return c_beklauen(73,200);
};

func void dia_hyglas_pickpocket_info()
{
	Info_ClearChoices(dia_hyglas_pickpocket);
	Info_AddChoice(dia_hyglas_pickpocket,DIALOG_BACK,dia_hyglas_pickpocket_back);
	Info_AddChoice(dia_hyglas_pickpocket,DIALOG_PICKPOCKET,dia_hyglas_pickpocket_doit);
};

func void dia_hyglas_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hyglas_pickpocket);
};

func void dia_hyglas_pickpocket_back()
{
	Info_ClearChoices(dia_hyglas_pickpocket);
};

