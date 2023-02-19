
instance DIA_GORAX_KAP1_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap1_exit_condition;
	information = dia_gorax_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap1_exit_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_gorax_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_PICKPOCKET(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 888;
	condition = dia_gorax_pickpocket_condition;
	information = dia_gorax_pickpocket_info;
	permanent = TRUE;
	description = "(украсть этот ключ будет очень сложно)";
};


func int dia_gorax_pickpocket_condition()
{
	if((self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == TRUE) && (other.attribute[ATR_DEXTERITY] >= (80 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_gorax_pickpocket_info()
{
	Info_ClearChoices(dia_gorax_pickpocket);
	Info_AddChoice(dia_gorax_pickpocket,DIALOG_BACK,dia_gorax_pickpocket_back);
	Info_AddChoice(dia_gorax_pickpocket,DIALOG_PICKPOCKET,dia_gorax_pickpocket_doit);
};

func void dia_gorax_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 80)
	{
		CreateInvItems(self,itke_klosterschatz,1);
		b_giveinvitems(self,other,itke_klosterschatz,1);
		b_givethiefxp();
		Info_ClearChoices(dia_gorax_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_gorax_pickpocket_back()
{
	Info_ClearChoices(dia_gorax_pickpocket);
};


instance DIA_GORAX_HELP(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 2;
	condition = dia_gorax_help_condition;
	information = dia_gorax_help_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gorax_help_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_gorax_help_info()
{
	AI_Output(self,other,"DIA_Gorax_HELP_14_00");	//Могу я чем-нибудь помочь тебе?
};


instance DIA_GORAX_GOLD(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 2;
	condition = dia_gorax_gold_condition;
	information = dia_gorax_gold_info;
	permanent = TRUE;
	description = "Я принес целую кучу золота.";
};


var int dia_gorax_gold_perm;

func int dia_gorax_gold_condition()
{
	if((other.guild == GIL_NOV) && (DIA_GORAX_GOLD_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorax_gold_info()
{
	AI_Output(other,self,"DIA_Gorax_GOLD_15_00");	//Я принес целую кучу золота.
	if(Npc_HasItems(other,itmi_gold) >= SUMME_KLOSTER)
	{
		AI_Output(self,other,"DIA_Gorax_GOLD_14_01");	//(в предвкушении) Ах! Приношение Инносу. Это очень хорошо, сын мой.
		AI_Output(self,other,"DIA_Gorax_GOLD_14_02");	//Я использую твое пожертвование на благо монастыря, как того желает Иннос.
		DIA_GORAX_GOLD_PERM = TRUE;
		b_giveinvitems(other,self,itmi_gold,SUMME_KLOSTER);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_14_02");	//Что ты сделал с этим золотом? Ты потратил его? Уходи и не возвращайся сюда без золота!
	};
};


instance DIA_GORAX_SLEEP(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 4;
	condition = dia_gorax_sleep_condition;
	information = dia_gorax_sleep_info;
	description = "Я ищу место, где можно было бы поспать.";
};


func int dia_gorax_sleep_condition()
{
	if((DIA_GORAX_GOLD_PERM == TRUE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_gorax_sleep_info()
{
	AI_Output(other,self,"DIA_Gorax_SLEEP_15_00");	//Я ищу место, где можно было бы поспать.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_01");	//Есть одна свободная кровать в следующей комнате. Первая дверь направо, рядом с входом. Ты можешь поспать там.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_02");	//Ты можешь сложить свои вещи в один из пустых сундуков.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_03");	//И помни - тебе нельзя входить в опочивальни магов. Также, без соответствующего разрешения тебе нельзя входить в библиотеку.
};


instance DIA_GORAX_AUFGABE(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 3;
	condition = dia_gorax_aufgabe_condition;
	information = dia_gorax_aufgabe_info;
	permanent = FALSE;
	description = "У тебя есть какое-нибудь задание для меня?";
};


func int dia_gorax_aufgabe_condition()
{
	if(MIS_KLOSTERARBEIT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_gorax_aufgabe_info()
{
	AI_Output(other,self,"DIA_Gorax_Aufgabe_15_00");	//У тебя есть какое-нибудь задание для меня?
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_01");	//Да, послушники хорошо поработали. А тот, кто хорошо работает, должен хорошо питаться.
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_02");	//Я дам тебе ключ от кладовой. Ты найдешь там баранью колбасу. Раздай ее послушникам - но раздели ее по справедливости!
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_03");	//А когда закончишь с этим, можешь обратиться ко мне опять.
	CreateInvItems(self,itke_klosterstore,1);
	b_giveinvitems(self,other,itke_klosterstore,1);
	MIS_GORAXESSEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_GORAXESSEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GORAXESSEN,LOG_RUNNING);
	b_logentry(TOPIC_GORAXESSEN,"Мастер Горакс хочет, чтобы я разделил баранью колбасу из кладовой поровну среди послушников. Кроме меня, в монастыре есть еще тринадцать послушников.");
};


instance DIA_GORAX_WURST(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 2;
	condition = dia_gorax_wurst_condition;
	information = dia_gorax_wurst_info;
	permanent = TRUE;
	description = "Я раздал колбасу (завершение задания).";
};


func int dia_gorax_wurst_condition()
{
	if((MIS_GORAXESSEN == LOG_RUNNING) && (Mob_HasItems("WURSTTRUHE",itfo_schafswurst) == 0))
	{
		return TRUE;
	};
};

func void dia_gorax_wurst_info()
{
	AI_Output(other,self,"DIA_Gorax_Wurst_15_00");	//Я раздал колбасу.
	if(WURST_GEGEBEN >= 13)
	{
		AI_Output(self,other,"DIA_Gorax_Wurst_14_01");	//И разделил ее по справедливости. Вот, возьми эти свитки исцеления - и возвращайся к своей работе.
		MIS_GORAXESSEN = LOG_SUCCESS;
		b_giveplayerxp(XP_GORAXESSEN);
		b_giveinvitems(self,other,itsc_lightheal,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Wurst_14_02");	//Да? Я думаю, ты недостаточно ответственно относишься к своей работе.
		AI_Output(self,other,"DIA_Gorax_Wurst_14_03");	//Ты либо съел колбасу сам, либо дал кому-нибудь больше, чем ему причитается.
		AI_Output(self,other,"DIA_Gorax_Wurst_14_04");	//Послушай, так как ты новичок - и только по этой причине - я на первый раз прощу тебя. Но чтобы больше такого не повторялось, послушник!
		MIS_GORAXESSEN = LOG_FAILED;
	};
};


instance DIA_GORAX_AUFGABE2(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 3;
	condition = dia_gorax_aufgabe2_condition;
	information = dia_gorax_aufgabe2_info;
	permanent = FALSE;
	description = "У тебя есть еще какое-нибудь поручение для меня?";
};


func int dia_gorax_aufgabe2_condition()
{
	if(((MIS_GORAXESSEN == LOG_SUCCESS) || (MIS_GORAXESSEN == LOG_FAILED)) && (Npc_IsDead(orlan) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorax_aufgabe2_info()
{
	AI_Output(other,self,"DIA_Gorax_Aufgabe2_15_00");	//У тебя есть еще какое-нибудь поручение для меня?
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_01");	//Да. Как ты знаешь, мы делаем здесь превосходное вино, и часть его продаем.
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_02");	//Орлан, хозяин трактира 'Мертвая Гарпия' заказал солидную партию. Мы договорились на сумму в 240 золотых монет.
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_03");	//Отнеси ему эти бутылки - но смотри, чтобы он не обсчитал тебя.
	b_giveinvitems(self,other,itfo_wine,12);
	MIS_GORAXWEIN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_GORAXWEIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GORAXWEIN,LOG_RUNNING);
	b_logentry(TOPIC_GORAXWEIN,"Мастер Горакс хочет, чтобы я доставил Орлану, хозяину трактира, двенадцать бутылок вина. Они стоят 240 золотых монет.");
};


instance DIA_GORAX_ORLAN(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 3;
	condition = dia_gorax_orlan_condition;
	information = dia_gorax_orlan_info;
	permanent = TRUE;
	description = "Я отнес вино Орлану.";
};


var int dia_gorax_orlan_permanent;

func int dia_gorax_orlan_condition()
{
	if((MIS_GORAXWEIN == LOG_RUNNING) && Npc_KnowsInfo(other,dia_orlan_wein) && (DIA_GORAX_ORLAN_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorax_orlan_info()
{
	AI_Output(other,self,"DIA_Gorax_Orlan_15_00");	//Я отнес вино Орлану.
	if(Npc_HasItems(other,itmi_gold) >= 100)
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_14_01");	//И? Ты получил 240 золотых монет?
		DIA_GORAX_ORLAN_PERMANENT = TRUE;
		Info_ClearChoices(dia_gorax_orlan);
		Info_AddChoice(dia_gorax_orlan,"Он надул меня! (Отдать 100 монет)",dia_gorax_orlan_100);
		Info_AddChoice(dia_gorax_orlan,"Я принес золото. (Отдать 240 монет)",dia_gorax_orlan_240);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_14_02");	//Что ты сделал с этим золотом? Ты потратил его? Уходи и не возвращайся сюда без золота!
	};
};

func void dia_gorax_orlan_100()
{
	AI_Output(other,self,"DIA_Gorax_Orlan_100_15_00");	//Он надул меня!
	AI_Output(self,other,"DIA_Gorax_Orlan_100_14_01");	//Ты продал ему вино дешевле? Ох, нет! И почему только я послал ТЕБЯ?!
	AI_Output(self,other,"DIA_Gorax_Orlan_100_14_02");	//Ты совершенно ни на что не способен! Убирайся с глаз моих!
	b_giveinvitems(other,self,itmi_gold,100);
	MIS_GORAXWEIN = LOG_FAILED;
	Info_ClearChoices(dia_gorax_orlan);
	AI_StopProcessInfos(self);
};

func void dia_gorax_orlan_240()
{
	AI_Output(other,self,"DIA_Gorax_Orlan_240_15_00");	//Я принес золото.
	if(b_giveinvitems(other,self,itmi_gold,240))
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_240_14_01");	//Превосходно. Ты проявляешь некоторые способности. Вот, возьми в качестве вознаграждения свиток исцеления. А теперь иди и займись каким-нибудь делом.
		MIS_GORAXWEIN = LOG_SUCCESS;
		b_giveplayerxp(XP_GORAXWEIN);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_240_14_02");	//Но ты уже потратил часть этих денег, да? Ты ничтожество - пошел прочь!
		MIS_GORAXWEIN = LOG_FAILED;
		b_giveinvitems(other,self,itmi_gold,Npc_HasItems(other,itmi_gold));
	};
	Info_ClearChoices(dia_gorax_orlan);
};


instance DIA_GORAX_JOB(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 35;
	condition = dia_gorax_job_condition;
	information = dia_gorax_job_info;
	permanent = FALSE;
	description = "А что входит в твои обязанности здесь?";
};


func int dia_gorax_job_condition()
{
	return TRUE;
};

func void dia_gorax_job_info()
{
	AI_Output(other,self,"DIA_Gorax_JOB_15_00");	//А что входит в твои обязанности здесь?
	AI_Output(self,other,"DIA_Gorax_JOB_14_01");	//Мои обязанности многочисленны и разнообразны. Я не только управляющий, но также и казначей.
	AI_Output(self,other,"DIA_Gorax_JOB_14_02");	//Кроме того, я заведую винным погребом, а также на моих плечах лежит обеспечение монастыря съестными припасами.
	AI_Output(self,other,"DIA_Gorax_JOB_14_03");	//Поэтому, если тебе что-нибудь нужно, ты всегда можешь обратиться ко мне и получить все необходимое - за скромное пожертвование, конечно.
	Log_CreateTopic(TOPIC_KLOSTERTRADER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTRADER,"Мастер Горакс в монастыре может предоставить мне все, что мне нужно.");
};


instance DIA_GORAX_TRADE(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 99;
	condition = dia_gorax_trade_condition;
	information = dia_gorax_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Мне нужно кое-что...";
};


func int dia_gorax_trade_condition()
{
	if(Npc_KnowsInfo(hero,dia_gorax_job))
	{
		return TRUE;
	};
};

func void dia_gorax_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Gorax_TRADE_15_00");	//Мне нужно кое-что...
};


instance DIA_GORAX_KDF(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 5;
	condition = dia_gorax_kdf_condition;
	information = dia_gorax_kdf_info;
	permanent = FALSE;
	description = "Мне нужно место для сна.";
};


func int dia_gorax_kdf_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_gorax_kdf_info()
{
	AI_Output(other,self,"DIA_Gorax_KDF_15_00");	//Мне нужно место для сна.
	AI_Output(self,other,"DIA_Gorax_KDF_14_01");	//У нас есть свободная комната справа отсюда. Вот, возьми ключ. Там ты найдешь все, что тебе может понадобиться.
	b_giveinvitems(self,other,itke_kdfplayer,1);
	Wld_InsertItem(itpo_perm_mana,"FP_ITEM_KDFPLAYER");
};


instance DIA_GORAX_KAP2_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap2_exit_condition;
	information = dia_gorax_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_gorax_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_KAP3_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap3_exit_condition;
	information = dia_gorax_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_gorax_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_KILLPEDRO(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 3;
	condition = dia_gorax_killpedro_condition;
	information = dia_gorax_killpedro_info;
	important = TRUE;
};


func int dia_gorax_killpedro_condition()
{
	if((PEDRO_TRAITOR == TRUE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_gorax_killpedro_info()
{
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_00");	//Подожди, наемник. Мне нужно поговорить с тобой.
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_15_01");	//Чего ты хочешь?
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_02");	//Монастырю необходимо решить очень деликатную проблему.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_03");	//В настоящий момент, похоже, все не доверяют друг другу. И к тому же, этот случай с Педро, это очень... (сглатывает)
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_04");	//У меня есть поручение для тебя от первосвященников. Ты не являешься членом Братства Огня, и, следовательно, ты единственный, кто может помочь нам в решении этой проблемы.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_05");	//Но я должен предупредить тебя. Если я дам тебе это поручение, ты будешь обязан выполнить его. Когда ты узнаешь, в чем оно заключается, у тебя уже не будет выбора. Ты понимаешь это?
	Info_ClearChoices(dia_gorax_killpedro);
	Info_AddChoice(dia_gorax_killpedro,"Забудь об этом. Это слишком рискованное предприятие для меня.",dia_gorax_killpedro_nein);
	Info_AddChoice(dia_gorax_killpedro,"Скажи мне, чего ты хочешь.",dia_gorax_killpedro_ja);
};

func void dia_gorax_killpedro_nein()
{
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_nein_15_00");	//Забудь об этом. Это слишком рискованное предприятие для меня.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_nein_14_01");	//Хорошо, в таком случае, забудь о том, что я говорил.
	AI_StopProcessInfos(self);
};

func void dia_gorax_killpedro_ja()
{
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_ja_15_00");	//Скажи мне, чего ты хочешь.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_01");	//Хорошо. Тогда слушай внимательно, дважды повторять я не буду.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_02");	//Серпентес хочет, чтобы ты убил Педро за его предательство.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_03");	//Когда ты выполнишь эту задачу, тебе немедленно будет выдано вознаграждение.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_04");	//Я ничего тебе не говорил. И ты ничего не слышал. Понятно?
	b_logentry(TOPIC_TRAITORPEDRO,"Горакс сказал мне, что Серпентес хочет, чтобы я убил предателя Педро, если я повстречаюсь с ним.");
	b_giveplayerxp(XP_GORAX_KILLPEDRO_GOTMISSION);
	MIS_GORAX_KILLPEDRO = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_KAP4_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap4_exit_condition;
	information = dia_gorax_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_gorax_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_KAP5_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap5_exit_condition;
	information = dia_gorax_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_gorax_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};

