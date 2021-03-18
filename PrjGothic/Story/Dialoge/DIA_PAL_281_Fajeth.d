
func int c_snapperdeath()
{
	if(Npc_IsDead(newmine_snapper1) && Npc_IsDead(newmine_snapper2) && Npc_IsDead(newmine_snapper3) && Npc_IsDead(newmine_snapper4) && Npc_IsDead(newmine_snapper5) && Npc_IsDead(newmine_snapper6) && Npc_IsDead(newmine_snapper7) && Npc_IsDead(newmine_snapper8))
	{
		return TRUE;
	};
	return FALSE;
};


instance DIA_FAJETH_EXIT(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 999;
	condition = dia_fajeth_exit_condition;
	information = dia_fajeth_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_fajeth_exit_condition()
{
	return TRUE;
};

func void dia_fajeth_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_FAJETH_FIRST(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 2;
	condition = dia_fajeth_first_condition;
	information = dia_fajeth_first_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_fajeth_first_condition()
{
	if(garond.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_fajeth_first_info()
{
	AI_Output(self,other,"DIA_Fajeth_First_12_00");	//Кто ты такой и что ты делаешь здесь?
	AI_Output(other,self,"DIA_Fajeth_First_15_01");	//Я пришел по приказу лорда Хагена...
	AI_Output(self,other,"DIA_Fajeth_First_12_02");	//Тогда тебе нужно попытаться добраться до замка. Командующий Гаронд там. Он главнокомандующий этой экспедицией.
	AI_StopProcessInfos(self);
};


instance DIA_FAJETH_HALLO(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 2;
	condition = dia_fajeth_hallo_condition;
	information = dia_fajeth_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_fajeth_hallo_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_fajeth_hallo_info()
{
	AI_Output(self,other,"DIA_Fajeth_Hallo_12_00");	//Откуда ты пришел?
	AI_Output(other,self,"DIA_Fajeth_Hallo_15_01");	//Я пришел по приказу Гаронда...
	AI_Output(self,other,"DIA_Fajeth_Hallo_12_02");	//Очень хорошо. Мне очень нужны новые люди.
	AI_Output(other,self,"DIA_Fajeth_Hallo_15_03");	//Я здесь не для того, чтобы помогать тебе.
	AI_Output(self,other,"DIA_Fajeth_Hallo_12_04");	//Нет? Тогда зачем ты пришел?
	AI_Output(other,self,"DIA_Fajeth_Hallo_15_05");	//В мою задачу входит выяснить, сколько руды добыто к настоящему моменту.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_06");	//О, достопочтенный маг. Твое присутствие вселяет в меня и моих людей уверенность.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_07");	//Мы были бы очень благодарны, если бы ты смог использовать данную тебе Инносом силу, чтобы помочь нам.
		Info_AddChoice(dia_fajeth_hallo,"Что я могу сделать для тебя?",dia_fajeth_hallo_tun);
		Info_AddChoice(dia_fajeth_hallo,"Мое задание важнее.",dia_fajeth_hallo_kdfnein);
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_08");	//Моя задача - принимать все меры, которые я сочту необходимыми для добычи руды и для ее защиты.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_09");	//Это включает и реквизицию людей. Ты служишь Инносу - следовательно, ты обязан выполнять мои приказы.
		Info_AddChoice(dia_fajeth_hallo,"Что я могу сделать для тебя?",dia_fajeth_hallo_tun);
		Info_AddChoice(dia_fajeth_hallo,"У меня уже есть приказ. От Гаронда.",dia_fajeth_hallo_milnein);
	}
	else
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_10");	//Послушай - я не знаю, зачем Гаронд прислал мне наемника - но, должно быть, у него были на то причины.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_11");	//Но прежде чем я отправлю тебя назад, ты должен выполнить одно задание для меня.
		Info_AddChoice(dia_fajeth_hallo,"У всего есть своя цена.",dia_fajeth_hallo_sldja);
		Info_AddChoice(dia_fajeth_hallo,"Нет, у меня нет времени на то, чтобы решать твои проблемы.",dia_fajeth_hallo_sldnein);
	};
};

func void dia_fajeth_hallo_tun()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_Tun_15_00");	//Что я могу сделать для тебя?
	AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_01");	//Вот уже несколько дней, орда снепперов бродит вокруг нашего лагеря. Похоже, они просто выжидают подходящей возможности для нападения.
	AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_02");	//Я не знаю, чего они ждут - но пока они здесь, в лагере не будет спокойствия.
	if(Npc_IsDead(fed) == FALSE)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_03");	//Фед, помимо всего прочего, напуган ими до смерти - и сводит с ума остальных каторжников.
	};
	if(Npc_IsDead(bilgot) == FALSE)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_04");	//И кого мне послать? Билгота? Ха - он тоже слабак.
	};
	if(Npc_IsDead(tengron) == FALSE)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_05");	//Тенгрона? Конечно, он умеет сражаться, но он не обладает хитростью охотника.
	};
	AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_06");	//Ты единственный, кто может сделать это. Я хочу, чтобы ты выследил этих чертовых тварей и убил их.
	Wld_InsertNpc(newmine_snapper7,"OW_PATH_333");
	Wld_InsertNpc(newmine_snapper8,"OW_PATH_333");
	Wld_InsertNpc(newmine_snapper3,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");
	MIS_FAJETH_KILL_SNAPPER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_FAJETHKILLSNAPPER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FAJETHKILLSNAPPER,LOG_RUNNING);
	b_logentry(TOPIC_FAJETHKILLSNAPPER,"Фаджет научил меня, как охотиться на снепперов, которые бродят толпами вокруг замка.");
	Info_ClearChoices(dia_fajeth_hallo);
	PrintScreen("",-1,-1,FONT_SCREEN,0);
};

func void dia_fajeth_hallo_kdfnein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_KDFNein_15_00");	//Мое задание важнее. Я не могу помочь тебе.
	AI_Output(self,other,"DIA_Fajeth_Hallo_KDFNein_12_01");	//Конечно, о, достопочтенный. Я сообщу тебе все, что ты желаешь знать.
	MIS_FAJETH_KILL_SNAPPER = LOG_OBSOLETE;
	Info_ClearChoices(dia_fajeth_hallo);
};

func void dia_fajeth_hallo_milnein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_MILNein_15_00");	//У меня уже есть приказ. От Гаронда.
	AI_Output(self,other,"DIA_Fajeth_Hallo_MILNein_12_01");	//И ты выполнишь его. Но только после того, как я отпущу тебя.
	AI_Output(self,other,"DIA_Fajeth_Hallo_MILNein_12_02");	//Единственное, что я хочу слышать от тебя -это 'Что я могу сделать?' Понятно?
};

func void dia_fajeth_hallo_sldja()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_SLDJa_15_00");	//У всего есть своя цена. Если ты заплатишь мне, возможно, я и соглашусь.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDJa_12_01");	//Я не привык вести дела с наемниками. Я ненавижу торговаться, чтобы снизить цену.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDJa_12_02");	//Но в знак проявления моей доброй воли, я заплачу тебе 100 золотых, если ты выполнишь эту работу для меня.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDJa_12_03");	//Ну как, по рукам?
	FAJETH_PAY = TRUE;
	Info_ClearChoices(dia_fajeth_hallo);
	Info_AddChoice(dia_fajeth_hallo,"Что я могу сделать для тебя?",dia_fajeth_hallo_tun);
	Info_AddChoice(dia_fajeth_hallo,"Нет, у меня нет времени...",dia_fajeth_hallo_sldnein);
};

func void dia_fajeth_hallo_sldnein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_SLDNein_15_00");	//Нет, у меня нет времени на то, чтобы решать твои проблемы.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDNein_12_01");	//Ты готов так легко отказаться от легких денег? Не ожидал такого от наемника.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDNein_12_02");	//Так как ты не хочешь помочь нам, задавай свои вопросы и проваливай.
	MIS_FAJETH_KILL_SNAPPER = LOG_OBSOLETE;
	Info_ClearChoices(dia_fajeth_hallo);
};


instance DIA_FAJETH_LEADER(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 2;
	condition = dia_fajeth_leader_condition;
	information = dia_fajeth_leader_info;
	permanent = FALSE;
	description = "Я убил вожака стаи.";
};


func int dia_fajeth_leader_condition()
{
	if(Npc_KnowsInfo(other,dia_bilgot_knowsleadsnapper) && Npc_IsDead(newmine_leadsnapper) && (MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_fajeth_leader_info()
{
	AI_Output(other,self,"DIA_Fajeth_Leader_15_00");	//Я убил вожака стаи.
	AI_Output(self,other,"DIA_Fajeth_Leader_12_01");	//Хорошо. Без вожака, они будут не так опасны. Я не думаю, что теперь они решатся напасть на нас.
	if(FAJETH_PAY == TRUE)
	{
		AI_Output(self,other,"DIA_Fajeth_Leader_12_02");	//Вот твое золото - как договаривались.
		b_giveinvitems(self,other,itmi_gold,100);
	};
	fajeth.flags = 0;
	MIS_FAJETH_KILL_SNAPPER = LOG_SUCCESS;
	b_giveplayerxp(XP_FAJETHKILLSNAPPER);
};


instance DIA_FAJETH_SNAPPER_KILLED(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 9;
	condition = dia_fajeth_snapper_killed_condition;
	information = dia_fajeth_snapper_killed_info;
	permanent = TRUE;
	description = "Со снепперами покончено.";
};


func int dia_fajeth_snapper_killed_condition()
{
	if((MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING) && (c_snapperdeath() == TRUE))
	{
		return TRUE;
	};
};

func void dia_fajeth_snapper_killed_info()
{
	AI_Output(hero,self,"DIA_Fajeth_SNAPPER_KILLED_15_00");	//Со снепперами покончено.
	AI_Output(self,hero,"DIA_Fajeth_SNAPPER_KILLED_12_01");	//Отлична работа. А с остальными зверями мы сами разберемся.
	if(FAJETH_PAY == TRUE)
	{
		AI_Output(self,hero,"DIA_Fajeth_SNAPPER_KILLED_12_02");	//Ты заработал свое золото - вот 100 монет, как и договаривались.
		b_giveinvitems(self,other,itmi_gold,100);
	};
	fajeth.flags = 0;
	MIS_FAJETH_KILL_SNAPPER = LOG_SUCCESS;
	b_giveplayerxp(XP_FAJETHKILLSNAPPER);
};


instance DIA_FAJETH_RUNNING(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 9;
	condition = dia_fajeth_running_condition;
	information = dia_fajeth_running_info;
	permanent = TRUE;
	description = "Как настроение у твоих людей?";
};


func int dia_fajeth_running_condition()
{
	if(MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_fajeth_running_info()
{
	AI_Output(other,self,"DIA_Fajeth_Running_15_00");	//Как настроение у твоих людей?
	AI_Output(self,other,"DIA_Fajeth_Running_12_01");	//Ты хочешь узнать, каково настроение моих людей? Да они еле могут работать от страха!
	AI_Output(self,other,"DIA_Fajeth_Running_12_02");	//Разберись с этими снепперами, или кто-нибудь сорвется!
};


instance DIA_FAJETH_BELOHNUNG(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 3;
	condition = dia_fajeth_belohnung_condition;
	information = dia_fajeth_belohnung_info;
	permanent = FALSE;
	description = "Скажи мне, сколько руды удалось вам добыть.";
};


func int dia_fajeth_belohnung_condition()
{
	if((MIS_FAJETH_KILL_SNAPPER == LOG_SUCCESS) || (MIS_FAJETH_KILL_SNAPPER == LOG_OBSOLETE))
	{
		return TRUE;
	};
};

func void dia_fajeth_belohnung_info()
{
	AI_Output(other,self,"DIA_Fajeth_BELOHNUNG_15_00");	//Скажи мне, сколько руды удалось вам добыть.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_01");	//Доложи Гаронду, что мы смогли добыть только ДВА ящика руды.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_02");	//Из-за постоянных нападений на нас мы потеряли очень много людей.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_03");	//Если Гаронд сможет прислать подкрепление, мы сможем добывать больше руды.
	AI_Output(other,self,"DIA_Fajeth_BELOHNUNG_15_04");	//Понятно. Я так и передам ему.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_05");	//Хорошо. Мы надеемся на тебя. И будем удерживать наши позиции до последнего.
	FAJETH_ORE = TRUE;
	b_logentry(TOPIC_SCOUTMINE,"Старатели Фаджета смогли добыть ДВА ящика руды.");
	AI_StopProcessInfos(self);
};


instance DIA_FAJETH_PERM2(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 9;
	condition = dia_fajeth_perm2_condition;
	information = dia_fajeth_perm2_info;
	permanent = TRUE;
	description = "Как идет добыча руды?";
};


func int dia_fajeth_perm2_condition()
{
	if(Npc_KnowsInfo(other,dia_fajeth_belohnung) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_fajeth_perm2_info()
{
	AI_Output(other,self,"DIA_Fajeth_Perm2_15_00");	//Как идет добыча руды?
	AI_Output(self,other,"DIA_Fajeth_Perm2_12_01");	//Плохо. Прогресса почти нет.
	AI_Output(self,other,"DIA_Fajeth_Perm2_12_02");	//Когда мы прибыли сюда, сначала все шло хорошо - но теперь мои парни не добывают почти ничего кроме обломков. Ничего стоящего.
	AI_Output(self,other,"DIA_Fajeth_Perm2_12_03");	//Но мы не отступим - по крайней мере, пока я командую здесь.
};


instance DIA_FAJETH_ERZABBAU(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 11;
	condition = dia_fajeth_erzabbau_condition;
	information = dia_fajeth_erzabbau_info;
	permanent = TRUE;
	description = "Как идет добыча руды?";
};


func int dia_fajeth_erzabbau_condition()
{
	if(Npc_KnowsInfo(other,dia_fajeth_belohnung) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_fajeth_erzabbau_info()
{
	AI_Output(other,self,"DIA_Fajeth_ERZABBAU_15_00");	//Как идет добыча руды?
	if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		AI_Output(self,other,"DIA_Fajeth_ERZABBAU_12_01");	//Здесь стало спокойнее. С чего бы это?
		AI_Output(other,self,"DIA_Fajeth_ERZABBAU_15_02");	//Драконы мертвы.
		AI_Output(self,other,"DIA_Fajeth_ERZABBAU_12_03");	//Ох, тогда я надеюсь, что подкрепления ждать недолго. Я все время теряю своих людей.
	}
	else
	{
		AI_Output(self,other,"DIA_Fajeth_ERZABBAU_12_04");	//Да ты сам это видишь...
	};
};


instance DIA_FAJETH_PICKPOCKET(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 900;
	condition = dia_fajeth_pickpocket_condition;
	information = dia_fajeth_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_fajeth_pickpocket_condition()
{
	return c_beklauen(56,95);
};

func void dia_fajeth_pickpocket_info()
{
	Info_ClearChoices(dia_fajeth_pickpocket);
	Info_AddChoice(dia_fajeth_pickpocket,DIALOG_BACK,dia_fajeth_pickpocket_back);
	Info_AddChoice(dia_fajeth_pickpocket,DIALOG_PICKPOCKET,dia_fajeth_pickpocket_doit);
};

func void dia_fajeth_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fajeth_pickpocket);
};

func void dia_fajeth_pickpocket_back()
{
	Info_ClearChoices(dia_fajeth_pickpocket);
};

