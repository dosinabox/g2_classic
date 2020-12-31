
instance DIA_BILGOT_EXIT(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 999;
	condition = dia_bilgot_exit_condition;
	information = dia_bilgot_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bilgot_exit_condition()
{
	return TRUE;
};

func void dia_bilgot_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BILGOT_HALLO(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 2;
	condition = dia_bilgot_hallo_condition;
	information = dia_bilgot_hallo_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_bilgot_hallo_condition()
{
	return TRUE;
};

func void dia_bilgot_hallo_info()
{
	AI_Output(self,other,"DIA_Bilgot_HALLO_05_00");	//Эй, откуда ты взялся? Ты пришел из замка?
	Info_AddChoice(dia_bilgot_hallo,"Да, я пришел из замка - ну и что?",dia_bilgot_hallo_burg);
	Info_AddChoice(dia_bilgot_hallo,"Я просто случайно забрел сюда...",dia_bilgot_hallo_zufall);
};

func void dia_bilgot_hallo_zufall()
{
	AI_Output(other,self,"DIA_Bilgot_HALLO_Zufall_15_00");	//Я просто случайно забрел сюда...
	AI_Output(self,other,"DIA_Bilgot_HALLO_Zufall_05_01");	//Парень, никто не заходит сюда СЛУЧАЙНО. Мы заперты здесь - окруженные снепперами!
	AI_Output(self,other,"DIA_Bilgot_HALLO_Zufall_05_02");	//И дня не проходит, чтобы они не загрызли кого-нибудь из наших.
	AI_Output(self,other,"DIA_Bilgot_HALLO_Zufall_05_03");	//Так ты не скажешь мне, откуда ты пришел? Хорошо - пусть тогда тебя съедят снепперы!
	AI_StopProcessInfos(self);
};

func void dia_bilgot_hallo_burg()
{
	AI_Output(other,self,"DIA_Bilgot_HALLO_Burg_15_00");	//Да, я пришел из замка - ну и что?
	AI_Output(self,other,"DIA_Bilgot_HALLO_Burg_05_01");	//Как там дела?
	AI_Output(other,self,"DIA_Bilgot_HALLO_Burg_15_02");	//Не лучше, чем здесь. Орки все еще там, если ты это имел в виду.
	AI_Output(self,other,"DIA_Bilgot_HALLO_Burg_05_03");	//Черт. Нигде нельзя чувствовать себя в безопасности.
	AI_Output(self,other,"DIA_Bilgot_HALLO_Burg_05_04");	//Я скажу тебе кое-что. Если бы я не был напуган до смерти, я бы бежал отсюда.
	Info_ClearChoices(dia_bilgot_hallo);
};


instance DIA_BILGOT_JOB(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 3;
	condition = dia_bilgot_job_condition;
	information = dia_bilgot_job_info;
	permanent = FALSE;
	description = "А что ты вообще здесь делаешь, кстати?";
};


func int dia_bilgot_job_condition()
{
	return TRUE;
};

func void dia_bilgot_job_info()
{
	AI_Output(other,self,"DIA_Bilgot_Job_15_00");	//А что ты вообще здесь делаешь, кстати?
	AI_Output(self,other,"DIA_Bilgot_Job_05_01");	//Я здесь как мальчик на побегушках. Поднеси-подай, посмотри, где там снепперы, Билгот туда, Билгот сюда.
	AI_Output(self,other,"DIA_Bilgot_Job_05_02");	//Мне лучше было остаться дома со своей старухой. Там было не лучше, но, по крайней мере, там была приличная еда.
	AI_Output(self,other,"DIA_Bilgot_Job_05_03");	//А теперь я - все, что осталось от отряда, которым командовал Фаджет.
	AI_Output(self,other,"DIA_Bilgot_Job_05_04");	//Откуда мне было знать, что этой экспедиции не суждено было вернуться?
	AI_Output(self,other,"DIA_Bilgot_Job_05_05");	//Мой приятель Олав улизнул. Может быть, хотя бы ему удалось вырваться...
};


instance DIA_BILGOT_HILFE(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 3;
	condition = dia_bilgot_hilfe_condition;
	information = dia_bilgot_hilfe_info;
	permanent = FALSE;
	description = "Что ты знаешь о снепперах?";
};


func int dia_bilgot_hilfe_condition()
{
	if(MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_bilgot_hilfe_info()
{
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_00");	//Что ты знаешь о снепперах?
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_01");	//Зачем тебе знать это? И не говори мне, что просто из любопытства!
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_02");	//Я собираюсь поохотиться на этих снепперов,
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_03");	//Это безумие. Я наблюдал за ними - что за кровожадные твари!
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_04");	//Тогда расскажи мне, что ты о них знаешь.
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_05");	//Хм... я мог бы помочь тебе, но только при одном условии!
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_06");	//Что ты хочешь?
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_07");	//Если тебе удастся убить снепперов - ты должен вытащить меня отсюда!
	if(Npc_IsDead(fed) == FALSE)
	{
		AI_Output(self,other,"DIA_Bilgot_Hilfe_05_08");	//Мне здесь долго не продержаться - ты говорил с Федом? У этого парня крыша поехала, и я не хочу кончить как он!
	};
};


instance DIA_BILGOT_KNOWSLEADSNAPPER(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 4;
	condition = dia_bilgot_knowsleadsnapper_condition;
	information = dia_bilgot_knowsleadsnapper_info;
	permanent = FALSE;
	description = "Расскажи мне, что ты знаешь. И я вытащу тебя отсюда!";
};


func int dia_bilgot_knowsleadsnapper_condition()
{
	if(Npc_KnowsInfo(other,dia_bilgot_hilfe) && (MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_bilgot_knowsleadsnapper_info()
{
	AI_Output(other,self,"DIA_Bilgot_KNOWSLEADSNAPPER_15_00");	//Расскажи мне, что ты знаешь. И я вытащу тебя отсюда!
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_01");	//Я знал, что могу рассчитывать на тебя. Так что будь внимателен. Я довольно долго наблюдаю за снепперами.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_02");	//Они очень хитры и могут, ну, как бы... общаться. Они никогда не ходят поодиночке и нападают только стаей.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_03");	//Но есть еще кое-что. Среди них есть один особенный. Он редко показывается, но я видел его.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_04");	//Другие снепперы низко кланяются, когда проходят мимо него, но никогда не отходят далеко.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_05");	//Пока этот зверь не тронется с места, ни один снеппер поблизости даже не шевельнется.
	AI_Output(other,self,"DIA_Bilgot_KNOWSLEADSNAPPER_15_06");	//Где мне найти этого кровожадного зверя?
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_07");	//Я видел его на ступенях старой сторожевой башни.
	AI_Output(other,self,"DIA_Bilgot_KNOWSLEADSNAPPER_15_08");	//Отлично. Мне кажется, я понял. Спасибо!
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_09");	//Помни, ты дал мне слово!
	Wld_InsertNpc(newmine_leadsnapper,"OW_ORC_LOOKOUT_2_01");
	b_logentry(TOPIC_FAJETHKILLSNAPPER,"Билгот рассказал мне о вожаке стаи Снепперов. Он должен быть на ступеньках старой сторожевой башни.");
	Log_CreateTopic(TOPIC_BILGOTESCORT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BILGOTESCORT,LOG_RUNNING);
	b_logentry(TOPIC_BILGOTESCORT,"Билгот хочет, чтобы я вывел его из долины.");
};


instance DIA_BILGOT_TAKEYOUWITHME(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 2;
	condition = dia_bilgot_takeyouwithme_condition;
	information = dia_bilgot_takeyouwithme_info;
	permanent = FALSE;
	description = "Время пришло, Билгот! Пакуй свои вещи, мы отправляемся в путь.";
};


func int dia_bilgot_takeyouwithme_condition()
{
	if((MIS_FAJETH_KILL_SNAPPER == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_bilgot_knowsleadsnapper))
	{
		return TRUE;
	};
};

func void dia_bilgot_takeyouwithme_info()
{
	AI_Output(other,self,"DIA_Bilgot_TAKEYOUWITHME_15_00");	//Время пришло, Билгот! Пакуй свои вещи, мы отправляемся в путь.
	AI_Output(self,other,"DIA_Bilgot_TAKEYOUWITHME_05_03");	//Я готов!
	Npc_ExchangeRoutine(self,"FOLLOWTOOCBRIDGE");
	bilgot.flags = 0;
	MIS_RESCUEBILGOT = LOG_RUNNING;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_BILGOT_LAUFSCHNELLER(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 5;
	condition = dia_bilgot_laufschneller_condition;
	information = dia_bilgot_laufschneller_info;
	permanent = FALSE;
	description = "Ты не мог бы идти немного быстрее?!";
};


func int dia_bilgot_laufschneller_condition()
{
	if(Npc_KnowsInfo(other,dia_bilgot_takeyouwithme) && (Npc_KnowsInfo(other,dia_bilgot_beibrueckeangekommen) == FALSE))
	{
		return TRUE;
	};
};

func void dia_bilgot_laufschneller_info()
{
	AI_Output(other,self,"DIA_Bilgot_LAUFSCHNELLER_15_00");	//Ты не мог бы идти немного быстрее?!
	AI_Output(self,other,"DIA_Bilgot_LAUFSCHNELLER_05_01");	//Я иду так быстро, как могу.
};


instance DIA_BILGOT_BEIBRUECKEANGEKOMMEN(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 2;
	condition = dia_bilgot_beibrueckeangekommen_condition;
	information = dia_bilgot_beibrueckeangekommen_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_bilgot_beibrueckeangekommen_condition()
{
	if(Npc_GetDistToWP(self,"START") < 8000)
	{
		return TRUE;
	};
};

func void dia_bilgot_beibrueckeangekommen_info()
{
	AI_Output(other,self,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_00");	//Хорошо, пришли. Дальше иди один. Но будь осторожен!
	AI_Output(self,other,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_01");	//Спасибо!
	AI_Output(other,self,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_02");	//Смотри, чтобы тебя не съели. Я очень огорчусь.
	AI_Output(self,other,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_03");	//Прощай!
	AI_StopProcessInfos(self);
	TSCHUESSBILGOT = TRUE;
	MIS_RESCUEBILGOT = LOG_SUCCESS;
	b_giveplayerxp(XP_BILGOTESCORT);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"FLEEOUTOFOW");
};


instance DIA_BILGOT_LETZTEPAUSE(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 3;
	condition = dia_bilgot_letztepause_condition;
	information = dia_bilgot_letztepause_info;
	permanent = TRUE;
	description = "Что ты делаешь здесь? Я думал, ты пошел через Проход?";
};


func int dia_bilgot_letztepause_condition()
{
	if(Npc_GetDistToWP(self,"START") < 1000)
	{
		return TRUE;
	};
};

func void dia_bilgot_letztepause_info()
{
	AI_Output(other,self,"DIA_Bilgot_LetztePause_15_00");	//Что ты делаешь здесь? Я думал, ты пошел через Проход?
	AI_Output(self,other,"DIA_Bilgot_LetztePause_05_01");	//Я просто не в силах идти. Мне нужно передохнуть немного. Я справлюсь. Не волнуйся!
	AI_Output(other,self,"DIA_Bilgot_LetztePause_15_02");	//Как скажешь.
	AI_Output(self,other,"DIA_Bilgot_LetztePause_05_03");	//Просто немного передохну.
	AI_StopProcessInfos(self);
};


instance DIA_BILGOT_OLAV(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 3;
	condition = dia_bilgot_olav_condition;
	information = dia_bilgot_olav_info;
	permanent = FALSE;
	description = "Я нашел Олава.";
};


func int dia_bilgot_olav_condition()
{
	if((Npc_HasItems(olav,itse_olav) == 0) && Npc_KnowsInfo(other,dia_bilgot_job))
	{
		return TRUE;
	};
};

func void dia_bilgot_olav_info()
{
	AI_Output(other,self,"DIA_Bilgot_Olav_15_00");	//Я нашел Олава.
	AI_Output(self,other,"DIA_Bilgot_Olav_05_01");	//И как он?
	AI_Output(other,self,"DIA_Bilgot_Olav_15_02");	//Он мертв. Его съели волки.
	AI_Output(self,other,"DIA_Bilgot_Olav_05_03");	//Ох, черт. Надеюсь, хотя бы мне удастся выбраться отсюда.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BILGOT_PICKPOCKET(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 900;
	condition = dia_bilgot_pickpocket_condition;
	information = dia_bilgot_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_bilgot_pickpocket_condition()
{
	return c_beklauen(20,30);
};

func void dia_bilgot_pickpocket_info()
{
	Info_ClearChoices(dia_bilgot_pickpocket);
	Info_AddChoice(dia_bilgot_pickpocket,DIALOG_BACK,dia_bilgot_pickpocket_back);
	Info_AddChoice(dia_bilgot_pickpocket,DIALOG_PICKPOCKET,dia_bilgot_pickpocket_doit);
};

func void dia_bilgot_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bilgot_pickpocket);
};

func void dia_bilgot_pickpocket_back()
{
	Info_ClearChoices(dia_bilgot_pickpocket);
};

