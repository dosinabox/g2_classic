
instance DIA_DIEGOOW_EXIT(C_INFO)
{
	npc = pc_thiefow;
	nr = 999;
	condition = dia_diegoow_exit_condition;
	information = dia_diegoow_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_diegoow_exit_condition()
{
	return TRUE;
};

func void dia_diegoow_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DIEGOOW_HALLO(C_INFO)
{
	npc = pc_thiefow;
	nr = 2;
	condition = dia_diegoow_hallo_condition;
	information = dia_diegoow_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_diegoow_hallo_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_diegoow_hallo_info()
{
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_00");	//Эй, я думал, ты мертв.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_01");	//Да... так было.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_02");	//Но теперь я вернулся, и ищу доказательства появления драконов.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_03");	//Для кого ты это делаешь?
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_04");	//Я работаю на лорда Хагена. С помощью паладинов драконов можно остановить.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_05");	//Паладины? Позволь мне сказать тебе кое-что. После того, как мне удалось вырваться отсюда, Я отправился в Хоринис.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_06");	//Я хотел предупредить паладинов о драконах. Сам не знаю, зачем мне это было нужно?
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_07");	//Этот напыщенный Лотар даже не стал слушать меня - и, конечно же, не позволил мне поговорить с лордом Хагеном.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_08");	//Вместо этого, они отправили меня назад, с экспедицией. Так что лучше не напоминай мне о паладинах...
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_09");	//Очень важно остановить драконов, пока у нас еще есть время - и не важно, кто поможет нам сделать это.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_10");	//Остановить их? Да нам нужно уносить ноги из этой долины пока у нас еще есть время для ЭТОГО.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_11");	//Послушай, мне нужны доказательства.
	if(garond.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_12");	//Хорошо, если такова твоя задача - иди, поговори с командующим Гарондом.
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_13");	//Если уж кто и знает что-нибудь о нападении драконов, то это парни из замка.
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_14");	//Хорошо, я помогу тебе, чем смогу. Но я не буду рисковать своей шкурой неизвестно из-за чего.
	};
};


instance DIA_DIEGOOW_GAROND(C_INFO)
{
	npc = pc_thiefow;
	nr = 3;
	condition = dia_diegoow_garond_condition;
	information = dia_diegoow_garond_info;
	permanent = FALSE;
	description = "Я здесь по поручению Гаронда.";
};


func int dia_diegoow_garond_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_diegoow_garond_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Garond_15_00");	//Я здесь по поручению Гаронда. Он хочет знать, сколько руды было добыто к этому времени.
	AI_Output(self,other,"DIA_DiegoOw_Garond_11_01");	//И тогда он даст тебе доказательства?
	AI_Output(other,self,"DIA_DiegoOw_Garond_15_02");	//Именно. Поэтому - ты можешь сказать что-нибудь на этот счет?
	AI_Output(self,other,"DIA_DiegoOw_Garond_11_03");	//Конечно, что ты хочешь знать?
};


instance DIA_DIEGOOW_SILVESTRO(C_INFO)
{
	npc = pc_thiefow;
	nr = 3;
	condition = dia_diegoow_silvestro_condition;
	information = dia_diegoow_silvestro_info;
	permanent = FALSE;
	description = "Что ты знаешь о руде Сильвестро?";
};


func int dia_diegoow_silvestro_condition()
{
	if(Npc_KnowsInfo(other,dia_diegoow_garond) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_diegoow_silvestro_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Silvestro_15_00");	//Что ты знаешь о руде Сильвестро?
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_01");	//Здесь, в задней части пещеры хранятся ЧЕТЫРЕ ящика руды. Их добыли люди Сильвестро.
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_02");	//Гаронд может прийти и забрать их - но меня здесь к тому времени уже не будет.
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_03");	//Скажи - как тебе удалось пробраться через Проход? Я думал, там все кишит орками.
	AI_Output(other,self,"DIA_DiegoOw_Silvestro_15_04");	//Есть путь через заброшенные шахты, где нет орков.
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_05");	//Это хорошая новость. Тогда я должен как можно быстрее отправляться в Хоринис - мне там нужно кое с кем свести счеты.
	SILVESTRO_ORE = TRUE;
	b_logentry(TOPIC_SCOUTMINE,"Диего переправил ЧЕТЫРЕ ящика руды, добытых старателями Сильвестро, в безопасное место.");
};


instance DIA_DIEGOOW_MINE(C_INFO)
{
	npc = pc_thiefow;
	nr = 3;
	condition = dia_diegoow_mine_condition;
	information = dia_diegoow_mine_info;
	permanent = FALSE;
	description = "А какое ты имеешь отношение к руде?";
};


func int dia_diegoow_mine_condition()
{
	if(Npc_KnowsInfo(other,dia_diegoow_silvestro) && (KAPITEL == 2) && (MIS_SCOUTMINE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_diegoow_mine_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Mine_15_00");	//А какое ты имеешь отношение к руде?
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_01");	//Я был с группой Сильвестро. Мы добывали руду уже несколько дней, когда Сильвестро вдруг занервничал.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_02");	//Он сказал, что мы должны переправить руду в безопасное место.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_03");	//Ну, так как я все равно собирался линять, я вызвался добровольцем.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_04");	//И в этом мне очень повезло. Потому что вскоре на старателей напали краулеры. И никто из них не выжил.
};


instance DIA_DIEGOOW_RITTER(C_INFO)
{
	npc = pc_thiefow;
	nr = 9;
	condition = dia_diegoow_ritter_condition;
	information = dia_diegoow_ritter_info;
	permanent = FALSE;
	description = "А что насчет этих двух мертвых рыцарей перед твоим укрытием?";
};


func int dia_diegoow_ritter_condition()
{
	if((KAPITEL == 2) && ((Npc_HasItems(pal_leiche4,itmi_oldcoin) == 0) || (Npc_HasItems(pal_leiche5,itmi_oldcoin) == 0)))
	{
		return TRUE;
	};
};

func void dia_diegoow_ritter_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Ritter_15_00");	//А что насчет этих двух мертвых рыцарей перед твоим укрытием?
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_01");	//Они нашли свою судьбу во время битвы со стаей снепперов.
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_02");	//Да уж, у Долины Рудников свои собственные правила. Я говорил им это. Но они меня не слушали.
};


instance DIA_DIEGOOW_PERM(C_INFO)
{
	npc = pc_thiefow;
	nr = 11;
	condition = dia_diegoow_perm_condition;
	information = dia_diegoow_perm_info;
	permanent = TRUE;
	description = "Что мне нужно знать о долине?";
};


func int dia_diegoow_perm_condition()
{
	if((KAPITEL == 2) && Npc_KnowsInfo(other,dia_diegoow_ritter))
	{
		return TRUE;
	};
};

func void dia_diegoow_perm_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Perm_15_00");	//Что мне нужно знать о долине?
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_01");	//С тех пор, как Барьер пал, здесь многое переменилось. Теперь здесь заправляют орки.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_02");	//А мы, люди, теперь не более чем корм для истинных правителей этой долины: драконов.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_03");	//Держись подальше от всех, кто сильнее тебя - и избегай всего, что напоминает дракона.
};


instance DIA_DIEGOOW_GORN(C_INFO)
{
	npc = pc_thiefow;
	nr = 9;
	condition = dia_diegoow_gorn_condition;
	information = dia_diegoow_gorn_info;
	permanent = FALSE;
	description = "Я хочу купить свободу Горну, но Гаронд просит за это 1000 золотых";
};


func int dia_diegoow_gorn_condition()
{
	if((KAPITEL == 2) && (MIS_RESCUEGORN == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_diegoow_gorn_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Gorn_15_00");	//Я хочу купить свободу Горну, но Гаронд просит за это 1000 золотых.
	AI_Output(self,other,"DIA_DiegoOw_Gorn_11_01");	//Не маленькая сумма. У меня есть 300 монет, ты можешь взять их. Остальное найди сам.
	b_giveinvitems(self,other,itmi_gold,300);
	b_logentry(TOPIC_RESCUEGORN,"Диего заплатил 300 золота за освобождение Горна.");
};


instance DIA_DIEGOOW_TEACH(C_INFO)
{
	npc = pc_thiefow;
	nr = 10;
	condition = dia_diegoow_teach_condition;
	information = dia_diegoow_teach_info;
	permanent = FALSE;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int dia_diegoow_teach_condition()
{
	return TRUE;
};

func void dia_diegoow_teach_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Teach_15_00");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"DIA_DiegoOw_Teach_11_01");	//Сейчас не время для этого. У меня есть дела поважнее.
};


instance DIA_THIEFOW_PICKPOCKET(C_INFO)
{
	npc = pc_thiefow;
	nr = 900;
	condition = dia_thiefow_pickpocket_condition;
	information = dia_thiefow_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_thiefow_pickpocket_condition()
{
	return c_beklauen(120,600);
};

func void dia_thiefow_pickpocket_info()
{
	Info_ClearChoices(dia_thiefow_pickpocket);
	Info_AddChoice(dia_thiefow_pickpocket,DIALOG_BACK,dia_thiefow_pickpocket_back);
	Info_AddChoice(dia_thiefow_pickpocket,DIALOG_PICKPOCKET,dia_thiefow_pickpocket_doit);
};

func void dia_thiefow_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thiefow_pickpocket);
};

func void dia_thiefow_pickpocket_back()
{
	Info_ClearChoices(dia_thiefow_pickpocket);
};

