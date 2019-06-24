
instance DIA_MARDUK_KAP1_EXIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 999;
	condition = dia_marduk_kap1_exit_condition;
	information = dia_marduk_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marduk_kap1_exit_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_marduk_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARDUK_JOB(C_INFO)
{
	npc = kdf_505_marduk;
	condition = dia_marduk_job_condition;
	information = dia_marduk_job_info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int dia_marduk_job_condition()
{
	return TRUE;
};

func void dia_marduk_job_info()
{
	AI_Output(other,self,"DIA_Marduk_JOB_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Marduk_JOB_05_01");	//Я готовлю паладинов к сражению против Зла.
};


instance DIA_MARDUK_ARBEIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 3;
	condition = dia_marduk_arbeit_condition;
	information = dia_marduk_arbeit_info;
	permanent = FALSE;
	description = "Могу я сделать что-нибудь для тебя, мастер?";
};


func int dia_marduk_arbeit_condition()
{
	if(MIS_KLOSTERARBEIT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_marduk_arbeit_info()
{
	AI_Output(other,self,"DIA_Marduk_Arbeit_15_00");	//Могу я сделать что-нибудь для тебя, мастер?
	AI_Output(self,other,"DIA_Marduk_Arbeit_05_01");	//Для меня? Нет, мне не нужна твоя помощь. Лучше помолись за воинов Инноса, отправившихся в Долину Рудников.
	MIS_MARDUKBETEN = LOG_RUNNING;
	b_startotherroutine(sergio,"WAIT");
	Log_CreateTopic(TOPIC_MARDUKBETEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MARDUKBETEN,LOG_RUNNING);
	b_logentry(TOPIC_MARDUKBETEN,"У мастера Мардука нет заданий для меня. Он сказал, что мне лучше пойти помолиться за паладинов.");
};


instance DIA_MARDUK_GEBETET(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 3;
	condition = dia_marduk_gebetet_condition;
	information = dia_marduk_gebetet_info;
	permanent = FALSE;
	description = "Я помолился за паладинов.";
};


func int dia_marduk_gebetet_condition()
{
	if((MIS_MARDUKBETEN == LOG_RUNNING) && Npc_KnowsInfo(other,pc_prayshrine_paladine))
	{
		return TRUE;
	};
};

func void dia_marduk_gebetet_info()
{
	AI_Output(other,self,"DIA_Marduk_Gebetet_15_00");	//Я помолился за паладинов.
	AI_Output(self,other,"DIA_Marduk_Gebetet_05_01");	//Это хорошо. А теперь возвращайся к своей работе.
	MIS_MARDUKBETEN = LOG_SUCCESS;
	b_giveplayerxp(XP_MARDUKBETEN);
	b_startotherroutine(sergio,"START");
};


instance DIA_MARDUK_EVIL(C_INFO)
{
	npc = kdf_505_marduk;
	condition = dia_marduk_evil_condition;
	information = dia_marduk_evil_info;
	permanent = TRUE;
	description = "Что такое 'Зло'?";
};


func int dia_marduk_evil_condition()
{
	if(Npc_KnowsInfo(hero,dia_marduk_job))
	{
		return TRUE;
	};
};

func void dia_marduk_evil_info()
{
	AI_Output(other,self,"DIA_Marduk_Evil_15_00");	//Что такое 'Зло'?
	AI_Output(self,other,"DIA_Marduk_Evil_05_01");	//Зло повсюду. Оно порождение Белиара, извечного противника Инноса.
	AI_Output(self,other,"DIA_Marduk_Evil_05_02");	//Это всепоглощающая тьма, которая пытается навсегда закрыть от нас Свет Инноса.
	AI_Output(self,other,"DIA_Marduk_Evil_05_03");	//Белиар - Повелитель Тьмы, Ненависти и Разрушений.
	AI_Output(self,other,"DIA_Marduk_Evil_05_04");	//Только те из нас, чьи сердца горят Святым Огнем Инноса, несут сияющий Свет Инноса в наш мир и изгоняют тьму.
};


instance DIA_MARDUK_PAL(C_INFO)
{
	npc = kdf_505_marduk;
	condition = dia_marduk_pal_condition;
	information = dia_marduk_pal_info;
	permanent = FALSE;
	description = "Но в монастыре живут только маги и послушники.";
};


func int dia_marduk_pal_condition()
{
	if(Npc_KnowsInfo(hero,dia_marduk_job))
	{
		return TRUE;
	};
};

func void dia_marduk_pal_info()
{
	AI_Output(other,self,"DIA_Marduk_Pal_15_00");	//Но в монастыре живут только маги и послушники.
	AI_Output(self,other,"DIA_Marduk_Pal_05_01");	//Правильно. В отличие от нашей общины, которая чтит Слово Инноса...
	AI_Output(self,other,"DIA_Marduk_Pal_05_02");	//...паладины чтят превыше всего дела нашего Владыки.
	AI_Output(self,other,"DIA_Marduk_Pal_05_03");	//Мы все - представители Инноса, но паладины - его воины, идущие в бой с его именем на устах и прославляя его величие.
};


instance DIA_MARDUK_BEFORETEACH(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 3;
	condition = dia_marduk_beforeteach_condition;
	information = dia_marduk_beforeteach_info;
	permanent = FALSE;
	description = "Ты можешь чему-нибудь научить меня?";
};


func int dia_marduk_beforeteach_condition()
{
	if(Npc_KnowsInfo(hero,dia_marduk_job))
	{
		return TRUE;
	};
};

func void dia_marduk_beforeteach_info()
{
	AI_Output(other,self,"DIA_Marduk_BEFORETEACH_15_00");	//Ты можешь чему-нибудь научить меня?
	AI_Output(self,other,"DIA_Marduk_BEFORETEACH_05_01");	//Я эксперт в магии льда и грома. Я могу обучить тебя этим дисциплинам.
	if(other.guild != GIL_KDF)
	{
		AI_Output(self,other,"DIA_Marduk_BEFORETEACH_05_02");	//Однако я обучаю только магов.
	};
};


instance DIA_MARDUK_TEACH(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 10;
	condition = dia_marduk_teach_condition;
	information = dia_marduk_teach_info;
	permanent = TRUE;
	description = "Обучи меня (созданию рун).";
};


func int dia_marduk_teach_condition()
{
	if(Npc_KnowsInfo(hero,dia_marduk_beforeteach) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_marduk_teach_info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Marduk_TEACH_15_00");	//Обучи меня.
	Info_ClearChoices(dia_marduk_teach);
	Info_AddChoice(dia_marduk_teach,DIALOG_BACK,dia_marduk_teach_back);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_ZAP] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_ZAP,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_marduk_teach_zap);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_ICEBOLT] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_ICEBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_marduk_teach_icebolt);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_ICECUBE] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_ICECUBE,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_marduk_teach_icecube);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_CHARGEZAP] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_CHARGEZAP,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_marduk_teach_thunderball);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_LIGHTNINGFLASH] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_LIGHTNINGFLASH,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_marduk_teach_lightningflash);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_ICEWAVE] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_ICEWAVE,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_marduk_teach_icewave);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Marduk_TEACH_05_01");	//Сейчас я не могу обучить тебя.
		Info_ClearChoices(dia_marduk_teach);
	};
};

func void dia_marduk_teach_back()
{
	Info_ClearChoices(dia_marduk_teach);
};

func void dia_marduk_teach_zap()
{
	b_teachplayertalentrunes(self,other,SPL_ZAP);
};

func void dia_marduk_teach_icebolt()
{
	b_teachplayertalentrunes(self,other,SPL_ICEBOLT);
};

func void dia_marduk_teach_lightningflash()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHTNINGFLASH);
};

func void dia_marduk_teach_icecube()
{
	b_teachplayertalentrunes(self,other,SPL_ICECUBE);
};

func void dia_marduk_teach_thunderball()
{
	b_teachplayertalentrunes(self,other,SPL_CHARGEZAP);
};

func void dia_marduk_teach_icewave()
{
	b_teachplayertalentrunes(self,other,SPL_ICEWAVE);
};


instance DIA_MARDUK_KAP2_EXIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 999;
	condition = dia_marduk_kap2_exit_condition;
	information = dia_marduk_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marduk_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_marduk_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARDUK_KAP3_EXIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 999;
	condition = dia_marduk_kap3_exit_condition;
	information = dia_marduk_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marduk_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_marduk_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARDUK_KAP3_HELLO(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 30;
	condition = dia_marduk_kap3_hello_condition;
	information = dia_marduk_kap3_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_marduk_kap3_hello_condition()
{
	if((KAPITEL == 3) && ((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_marduk_kap3_hello_info()
{
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_00");	//Добро пожаловать, сын мой.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_01");	//С каких это пор ты стал паладином?
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_02");	//Откуда ты пришел?
	};
	Info_ClearChoices(dia_marduk_kap3_hello);
	Info_AddChoice(dia_marduk_kap3_hello,"Это не твое дело.",dia_marduk_kap3_hello_notyourconcern);
	if(hero.guild == GIL_PAL)
	{
		Info_AddChoice(dia_marduk_kap3_hello,"Совсем недавно.",dia_marduk_kap3_hello_soon);
	};
	if(hero.guild == GIL_DJG)
	{
		Info_AddChoice(dia_marduk_kap3_hello,"Я пришел с фермы.",dia_marduk_kap3_hello_djg);
	};
};

func void dia_marduk_kap3_hello_notyourconcern()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_NotYourConcern_15_00");	//Это не твое дело.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_01");	//(ворчливо) Паладин всегда должен быть вежливым и скромным. Ты должен защищать тех, кто не может защитить себя сам.
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_02");	//(ворчливо) Это привилегия, и ты должен быть благодарен, что Иннос дает тебе такую возможность. Подумай об этом!
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_03");	//(зло) Эх, раньше всякий сброд не пускали в монастырь. Твое поведение доказывает, что это были хорошие времена.
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_04");	//(предупреждающе) Я предупреждаю тебя, не стоит сеять тут смуту - ты будешь немедленно наказан. Мы не будем проявлять фальшивое великодушие.
	};
	Info_ClearChoices(dia_marduk_kap3_hello);
};

func void dia_marduk_kap3_hello_soon()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_Soon_15_00");	//Совсем недавно.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Soon_05_01");	//Тогда добро пожаловать. В этой битве нам нужны все, у кого есть мужество противостоять злу.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Soon_05_02");	//Судьба всех нас лежит в руках людей вроде тебя. Да придаст тебе Иннос так необходимое тебе мужество.
	Info_ClearChoices(dia_marduk_kap3_hello);
};

func void dia_marduk_kap3_hello_djg()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_DJG_15_00");	//Я пришел с фермы.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_DJG_05_01");	//Тогда добро пожаловать во имя гостеприимства. Надеюсь, ты оценишь его.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_DJG_05_02");	//Но не забывай, что ты в гостях, иначе у тебя будут большие проблемы.
	Info_ClearChoices(dia_marduk_kap3_hello);
};


instance DIA_MARDUK_TRAINPALS(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 32;
	condition = dia_marduk_trainpals_condition;
	information = dia_marduk_trainpals_info;
	permanent = TRUE;
	description = "Чему ты можешь обучить меня?";
};


var int marduk_trainpals_permanent;

func int dia_marduk_trainpals_condition()
{
	if((hero.guild == GIL_PAL) && (MARDUK_TRAINPALS_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_marduk_trainpals_info()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_15_00");	//Чему ты можешь обучить меня?
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_01");	//Естественно, я не могу обучить тебя боевым искусствам.
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_02");	//Но я могу, впрочем, донести сущность Инноса и его дары до тебя.
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_03");	//Кроме того, я мои обязанности входит подготовить тебя к Освящению Меча.
	AI_Output(other,self,"DIA_Marduk_TrainPals_15_04");	//А магии?
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_05");	//Здесь мы учим только нашей магии. Ты должен изучать магию паладинов в городе.
	Info_ClearChoices(dia_marduk_trainpals);
	Info_AddChoice(dia_marduk_trainpals,"Может быть, позже.",dia_marduk_trainpals_later);
	Info_AddChoice(dia_marduk_trainpals,"Что ты хочешь этим сказать?",dia_marduk_trainpals_meaning);
	Info_AddChoice(dia_marduk_trainpals,"Что такое Освящение Меча?",dia_marduk_trainpals_blessing);
};

func void dia_marduk_trainpals_later()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Later_15_00");	//Может быть, позже.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Later_05_01");	//Добро пожаловать в любое время.
	Info_ClearChoices(dia_marduk_trainpals);
};

func void dia_marduk_trainpals_meaning()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Meaning_15_00");	//Что ты хочешь сказать этим?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_01");	//Когда Иннос покидал наш мир, он оставил человечеству частицу своей божественной силы.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_02");	//Только немногим из людей позволено использовать его силу и нести в мир правосудие от его имени.
	AI_Output(other,self,"DIA_Marduk_TrainPals_Meaning_15_03");	//А что ты хочешь донести до меня?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_04");	//Я могу наставить тебя на правильный путь, чтобы ты познал сущность Инноса и следовал по этому пути.
};

func void dia_marduk_trainpals_blessing()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Blessing_15_00");	//Что такое Освящение Меча?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_01");	//Освящение Меча - это один из самых священных ритуалов паладинов.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_02");	//Во время этой церемонии святая сила Инноса протекает через меч паладина и придает мечу невообразимую силу.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_03");	//Меч, освященный таким образом, - самое ценное, что есть у паладина, и он не расстается с ним до конца своих дней.
	MARDUK_TRAINPALS_PERMANENT = TRUE;
};


instance DIA_MARDUK_SWORDBLESSING(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 33;
	condition = dia_marduk_swordblessing_condition;
	information = dia_marduk_swordblessing_info;
	permanent = TRUE;
	description = "Я хочу освятить мой меч.";
};


func int dia_marduk_swordblessing_condition()
{
	if(MARDUK_TRAINPALS_PERMANENT == TRUE)
	{
		return TRUE;
	};
};

func void dia_marduk_swordblessing_info()
{
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_15_00");	//Я хочу освятить мой меч.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_01");	//Если ты твердо решил сделать этот шаг, тебе сначала нужно найти магический меч.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_02");	//Затем ты должен вернуться в эту часовню и молиться.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_03");	//Во время молитвы и после разумного пожертвования нашему Владыке Инносу ты должен попросить у Инноса благоволения и помощи в битве против Зла.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_04");	//Если Иннос будет благосклонен к тебе, твой меч в тот же момент будет освящен нашим Владыкой.
	Info_ClearChoices(dia_marduk_swordblessing);
	Info_AddChoice(dia_marduk_swordblessing,DIALOG_BACK,dia_marduk_swordblessing_back);
	Info_AddChoice(dia_marduk_swordblessing,"Что за пожертвование?",dia_marduk_swordblessing_donation);
	Info_AddChoice(dia_marduk_swordblessing,"Где мне найти магический меч?",dia_marduk_swordblessing_oreblade);
};

func void dia_marduk_swordblessing_back()
{
	Info_ClearChoices(dia_marduk_swordblessing);
};

func void dia_marduk_swordblessing_donation()
{
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_Donation_15_00");	//Что за пожертвование?
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_Donation_05_01");	//Ну, учитывая милость, что будет оказана тебе, суммы в 5000 монет будет более чем достаточно.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_Donation_05_02");	//Конечно, ты можешь пожертвовать больше.
};

func void dia_marduk_swordblessing_oreblade()
{
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_OreBlade_15_00");	//Где мне найти магический меч?
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_01");	//Попробуй поговорить в городе с кузнецом Гарадом.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_02");	//Он обеспечивает паладинов магическими клинками, пока они находятся на острове.
	if(Npc_IsDead(harad) == TRUE)
	{
		AI_Output(other,self,"DIA_Marduk_SwordBlessing_OreBlade_15_03");	//Гарад мертв.
		AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_04");	//Мне очень жаль, но тогда тебе придется ждать возвращения на материк вместе с другими паладинами.
	};
};


instance DIA_MARDUK_KAP3_PERM(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 39;
	condition = dia_marduk_kap3_perm_condition;
	information = dia_marduk_kap3_perm_info;
	permanent = TRUE;
	description = "Есть новости?";
};


func int dia_marduk_kap3_perm_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_marduk_kap3_perm_info()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_15_00");	//Есть новости?
	if(MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_01");	//Да, врагу удалось внедрить предателя в наши ряды.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_02");	//Он украл Глаз Инноса, один из самых важных наших артефактов. И это только вершина айсберга.
	};
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_04");	//(озабоченно) Враг, по-видимому, уже вошел в город.
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_15_05");	//Чт ты имеешь в виду?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_06");	//Один из паладинов, Лотар, был убит на улице.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_07");	//(зло) Прямо средь бела дня! Это зашло слишком далеко, но я боюсь, что это только начало.
	Info_ClearChoices(dia_marduk_kap3_perm);
	Info_AddChoice(dia_marduk_kap3_perm,DIALOG_BACK,dia_marduk_kap3_perm_back);
	Info_AddChoice(dia_marduk_kap3_perm,"Что будет теперь?",dia_marduk_kap3_perm_andnow);
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		Info_AddChoice(dia_marduk_kap3_perm,"Беннет не виновен.",dia_marduk_kap3_perm_bennetisnotguilty);
	}
	else
	{
		Info_AddChoice(dia_marduk_kap3_perm,"Убийца был пойман?",dia_marduk_kap3_perm_murderer);
	};
	if(MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		Info_AddChoice(dia_marduk_kap3_perm,"Куда побежал вор?",dia_marduk_kap3_perm_thief);
	};
};

func void dia_marduk_kap3_perm_back()
{
	Info_ClearChoices(dia_marduk_kap3_perm);
};

func void dia_marduk_kap3_perm_andnow()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_AndNow_15_00");	//Что будет теперь?
	if(MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_01");	//Мы будем преследовать вора, куда бы он не побежал. Мы найдем его, и он понесет заслуженное наказание.
		AI_Output(other,self,"DIA_Marduk_Kap3_PERM_AndNow_15_02");	//Для этого сначала нужно знать, кто этот вор.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_03");	//Мы скоро выясним это. И не важно, сколько времени на это понадобится, но мы найдем его.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_04");	//Клянусь Инносом.
	}
	else
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_05");	//Убийство, а тем более паладина, несомненно, одно из самых тяжелых преступлений.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_06");	//Убийца наверняка будет приговорен к смерти.
	};
};

func void dia_marduk_kap3_perm_bennetisnotguilty()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_00");	//Беннет не виновен. Свидетель солгал.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_01");	//Откуда ты это знаешь?
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_02");	//Я нашел доказательства.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_03");	//Иногда мне кажется, что предательство и жадность - наши самые величайшие враги.
};

func void dia_marduk_kap3_perm_murderer()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_Murderer_15_00");	//Убийца был пойман?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_Murderer_05_01");	//По счастью, да. Им оказался один из головорезов с фермы Онара.
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_Murderer_15_02");	//Кто?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_Murderer_05_03");	//Я не знаю его имени. Но среди наемников, определенно, есть личности, от которых можно ожидать подобного.
};

func void dia_marduk_kap3_perm_thief()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_thief_15_00");	//Куда побежал вор?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_thief_05_01");	//Я не знаю, он выбежал из ворот как одержимый и исчез.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_thief_05_02");	//Не важно, где он скрывается, под каким камнем он спрятался, гнев Инноса поразит его и выжжет его черное сердце.
};


instance DIA_MARDUK_KAP4_EXIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 999;
	condition = dia_marduk_kap4_exit_condition;
	information = dia_marduk_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marduk_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_marduk_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARDUK_KAP4U5_PERM(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 49;
	condition = dia_marduk_kap4u5_perm_condition;
	information = dia_marduk_kap4u5_perm_info;
	permanent = TRUE;
	description = "Есть новости?";
};


func int dia_marduk_kap4u5_perm_condition()
{
	if((KAPITEL == 4) || (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_marduk_kap4u5_perm_info()
{
	AI_Output(other,self,"DIA_Marduk_Kap4U5_PERM_15_00");	//Есть новости?
	AI_Output(self,other,"DIA_Marduk_Kap4U5_PERM_05_01");	//Нет, о, боже, ситуация все еще очень критическая.
};


instance DIA_MARDUK_KAP5_EXIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 999;
	condition = dia_marduk_kap5_exit_condition;
	information = dia_marduk_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marduk_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_marduk_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARDUK_PICKPOCKET(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 900;
	condition = dia_marduk_pickpocket_condition;
	information = dia_marduk_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_marduk_pickpocket_condition()
{
	return c_beklauen(36,40);
};

func void dia_marduk_pickpocket_info()
{
	Info_ClearChoices(dia_marduk_pickpocket);
	Info_AddChoice(dia_marduk_pickpocket,DIALOG_BACK,dia_marduk_pickpocket_back);
	Info_AddChoice(dia_marduk_pickpocket,DIALOG_PICKPOCKET,dia_marduk_pickpocket_doit);
};

func void dia_marduk_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_marduk_pickpocket);
};

func void dia_marduk_pickpocket_back()
{
	Info_ClearChoices(dia_marduk_pickpocket);
};

