
instance DIA_MARIA_EXIT(C_INFO)
{
	npc = bau_910_maria;
	nr = 999;
	condition = dia_maria_exit_condition;
	information = dia_maria_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maria_exit_condition()
{
	return TRUE;
};

func void dia_maria_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARIA_HALLO(C_INFO)
{
	npc = bau_910_maria;
	nr = 1;
	condition = dia_maria_hallo_condition;
	information = dia_maria_hallo_info;
	permanent = FALSE;
	description = "Кто ты?";
};


func int dia_maria_hallo_condition()
{
	return TRUE;
};

func void dia_maria_hallo_info()
{
	AI_Output(other,self,"DIA_Maria_Hallo_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Maria_Hallo_17_01");	//Я жена Онара, Мария.
	AI_Output(self,other,"DIA_Maria_Hallo_17_02");	//Что тебе нужно здесь?
};


instance DIA_MARIA_UMSEHEN(C_INFO)
{
	npc = bau_910_maria;
	nr = 2;
	condition = dia_maria_umsehen_condition;
	information = dia_maria_umsehen_info;
	permanent = FALSE;
	description = "Я просто хотел посмотреть, как вы живете...";
};


func int dia_maria_umsehen_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_hallo))
	{
		return TRUE;
	};
};

func void dia_maria_umsehen_info()
{
	AI_Output(other,self,"DIA_Maria_Umsehen_15_00");	//Я просто хотел посмотреть, как вы живете...
	AI_Output(self,other,"DIA_Maria_Umsehen_17_01");	//Когда столько людей живет на ферме, даже в доме покоя не найдешь!
	AI_Output(self,other,"DIA_Maria_Umsehen_17_02");	//Они так и лезут сюда.
};


instance DIA_MARIA_SOELDNER(C_INFO)
{
	npc = bau_910_maria;
	nr = 3;
	condition = dia_maria_soeldner_condition;
	information = dia_maria_soeldner_info;
	permanent = FALSE;
	description = "Тебя беспокоят наемники?";
};


func int dia_maria_soeldner_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_umsehen))
	{
		return TRUE;
	};
};

func void dia_maria_soeldner_info()
{
	AI_Output(other,self,"DIA_Maria_Soeldner_15_00");	//Тебя беспокоят наемники?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_01");	//Ох, забудь о том, что я только что сказала - с тех пор, как вы здесь, жить здесь стало значительно безопаснее.
	}
	else
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_02");	//Ох. Ну, зато с тех пор как пришли наемники, хотя бы на ферме стало безопаснее.
	};
	AI_Output(self,other,"DIA_Maria_Soeldner_17_03");	//Когда мы еще были сами по себе, сюда постоянно приходили стражники из города и грабили нас.
	AI_Output(self,other,"DIA_Maria_Soeldner_17_04");	//Они забирали большую часть урожая. И овец тоже. И ничего не давали нам взамен.
	AI_Output(self,other,"DIA_Maria_Soeldner_17_05");	//Некоторые из них даже воровали, что плохо лежит.
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_06");	//Только не пойми меня неверно, солдат. Я знаю, что не все вы такие.
	};
};


instance DIA_MARIA_MISSION(C_INFO)
{
	npc = bau_910_maria;
	nr = 4;
	condition = dia_maria_mission_condition;
	information = dia_maria_mission_info;
	permanent = FALSE;
	description = "А что они украли у тебя?";
};


func int dia_maria_mission_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_soeldner) && (MIS_MARIA_BRINGPLATE != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_maria_mission_info()
{
	AI_Output(other,self,"DIA_Maria_Mission_15_00");	//А что они украли у тебя?
	AI_Output(self,other,"DIA_Maria_Mission_17_01");	//В основном золото и серебро. Они даже забрали мой свадебный подарок. Золотую тарелку.
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Maria_Mission_17_02");	//Ручаюсь, она сейчас пылится в сундуке у какого-нибудь городского стражника.
	};
	MIS_MARIA_BRINGPLATE = LOG_RUNNING;
};


instance DIA_MARIA_BRINGPLATE(C_INFO)
{
	npc = bau_910_maria;
	nr = 5;
	condition = dia_maria_bringplate_condition;
	information = dia_maria_bringplate_info;
	permanent = FALSE;
	description = "Я принес золотую тарелку. Это не твоя?";
};


func int dia_maria_bringplate_condition()
{
	if(Npc_HasItems(other,itmi_mariasgoldplate) > 0)
	{
		return TRUE;
	};
};

func void dia_maria_bringplate_info()
{
	b_giveinvitems(other,self,itmi_mariasgoldplate,1);
	AI_Output(other,self,"DIA_Maria_BringPlate_15_00");	//Я принес золотую тарелку. Это не твоя?
	AI_Output(self,other,"DIA_Maria_BringPlate_17_01");	//Да! Это она! Огромное спасибо тебе!
	MIS_MARIA_BRINGPLATE = LOG_SUCCESS;
	b_giveplayerxp(XP_MARIA_TELLER);
};


var int maria_belohnung;

instance DIA_MARIA_BELOHNUNG(C_INFO)
{
	npc = bau_910_maria;
	nr = 6;
	condition = dia_maria_belohnung_condition;
	information = dia_maria_belohnung_info;
	permanent = TRUE;
	description = "А как насчет моего вознаграждения?";
};


func int dia_maria_belohnung_condition()
{
	if((MIS_MARIA_BRINGPLATE == LOG_SUCCESS) && (MARIA_BELOHNUNG == FALSE))
	{
		return TRUE;
	};
};

func void dia_maria_belohnung_info()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_15_00");	//А как насчет моего вознаграждения?
	if((other.guild == GIL_SLD) || Npc_KnowsInfo(other,dia_onar_howmuch))
	{
		AI_Output(self,other,"DIA_Maria_Belohnung_17_01");	//Ты работаешь наемником на моего мужа, да?
		AI_Output(other,self,"DIA_Maria_Belohnung_15_02");	//Точно.
		AI_Output(self,other,"DIA_Maria_Belohnung_17_03");	//Сколько мой муж платит тебе?
		b_say_gold(other,self,SOLD);
		AI_Output(self,other,"DIA_Maria_Belohnung_17_04");	//Этого недостаточно. Иди к нему и скажи, чтобы он платил тебе больше.
		AI_Output(other,self,"DIA_Maria_Belohnung_15_05");	//Ты думаешь, он послушает?
		AI_Output(self,other,"DIA_Maria_Belohnung_17_06");	//Он знает, что будет, если не послушает. Поверь мне.
		MARIA_MEHRGOLD = TRUE;
		MARIA_BELOHNUNG = TRUE;
	}
	else if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Maria_Belohnung_17_07");	//Ты хочешь стать наемником на этой ферме?
		Info_ClearChoices(dia_maria_belohnung);
		Info_AddChoice(dia_maria_belohnung,"Вообще-то нет.",dia_maria_belohnung_gold);
		Info_AddChoice(dia_maria_belohnung,"Да.",dia_maria_belohnung_sold);
	}
	else
	{
		b_giveinvitems(self,other,itmi_gold,50);
		MARIA_BELOHNUNG = TRUE;
		AI_Output(self,other,"DIA_Maria_Belohnung_17_08");	//Вот, возьми это. Ты заслужил.
	};
};

func void dia_maria_belohnung_gold()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_Gold_15_00");	//Вообще-то нет.
	b_giveinvitems(self,other,itmi_gold,50);
	MARIA_BELOHNUNG = TRUE;
	AI_Output(self,other,"DIA_Maria_Belohnung_Gold_17_01");	//Тогда возьми это золото в качестве награды. Ты заслужил его.
	Info_ClearChoices(dia_maria_belohnung);
};

func void dia_maria_belohnung_sold()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_SOLD_15_00");	//Да.
	AI_Output(self,other,"DIA_Maria_Belohnung_SOLD_17_01");	//Хорошо, если ты будешь работать здесь, я прослежу, чтобы ты получал хорошее жалование.
	AI_Output(self,other,"DIA_Maria_Belohnung_SOLD_17_02");	//Зайди ко мне, когда обсудишь размер жалования с моим мужем.
	Info_ClearChoices(dia_maria_belohnung);
};


instance DIA_MARIA_ABOUTONAR(C_INFO)
{
	npc = bau_910_maria;
	nr = 7;
	condition = dia_maria_aboutonar_condition;
	information = dia_maria_aboutonar_info;
	permanent = FALSE;
	description = "Расскажи мне об Онаре.";
};


func int dia_maria_aboutonar_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_hallo))
	{
		return TRUE;
	};
};

func void dia_maria_aboutonar_info()
{
	AI_Output(other,self,"DIA_Maria_AboutOnar_15_00");	//Расскажи мне об Онаре.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_01");	//Он хороший человек. Немного сварливый и очень раздражительный, но у нас у всех есть свои недостатки.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_02");	//Я спросила своего мужа: 'Почему ты позволяешь солдатам из города так с собой обращаться'?
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_03");	//'Сделай же что-нибудь', - сказала я.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_04");	//И он нанял наемников. А теперь мне кажется, что мы ведем войну.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_05");	//Но, если подумать, мы ведь действительно воюем, разве нет?
};


instance DIA_MARIA_PERM(C_INFO)
{
	npc = bau_910_maria;
	nr = 8;
	condition = dia_maria_perm_condition;
	information = dia_maria_perm_info;
	permanent = FALSE;
	description = "Что интересного было в последнее время?";
};


func int dia_maria_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_hallo))
	{
		return TRUE;
	};
};

func void dia_maria_perm_info()
{
	AI_Output(other,self,"DIA_Maria_PERM_15_00");	//Что интересного было в последнее время?
	if(KAPITEL <= 2)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_01");	//Мимо прошли паладины.
		AI_Output(self,other,"DIA_Maria_PERM_17_02");	//Сначала мы подумали, что они собираются напасть на нашу ферму, но они прошли мимо, в Долину Рудников.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_03");	//Василий поймал вора несколько дней назад. А кроме этого, все спокойно.
	};
	if(KAPITEL >= 4)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_04");	//С тех пор, как часть наемников ушла отсюда, стало значительно спокойнее.
	};
};


instance DIA_MARIA_PICKPOCKET(C_INFO)
{
	npc = bau_910_maria;
	nr = 900;
	condition = dia_maria_pickpocket_condition;
	information = dia_maria_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_maria_pickpocket_condition()
{
	return c_beklauen(60,110);
};

func void dia_maria_pickpocket_info()
{
	Info_ClearChoices(dia_maria_pickpocket);
	Info_AddChoice(dia_maria_pickpocket,DIALOG_BACK,dia_maria_pickpocket_back);
	Info_AddChoice(dia_maria_pickpocket,DIALOG_PICKPOCKET,dia_maria_pickpocket_doit);
};

func void dia_maria_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_maria_pickpocket);
};

func void dia_maria_pickpocket_back()
{
	Info_ClearChoices(dia_maria_pickpocket);
};

