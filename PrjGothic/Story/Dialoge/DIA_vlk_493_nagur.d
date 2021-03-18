
instance DIA_NAGUR_EXIT(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 999;
	condition = dia_nagur_exit_condition;
	information = dia_nagur_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_nagur_exit_condition()
{
	return TRUE;
};

func void dia_nagur_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_PICKPOCKET(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 900;
	condition = dia_nagur_pickpocket_condition;
	information = dia_nagur_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_nagur_pickpocket_condition()
{
	return c_beklauen(75,150);
};

func void dia_nagur_pickpocket_info()
{
	Info_ClearChoices(dia_nagur_pickpocket);
	Info_AddChoice(dia_nagur_pickpocket,DIALOG_BACK,dia_nagur_pickpocket_back);
	Info_AddChoice(dia_nagur_pickpocket,DIALOG_PICKPOCKET,dia_nagur_pickpocket_doit);
};

func void dia_nagur_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_nagur_pickpocket);
};

func void dia_nagur_pickpocket_back()
{
	Info_ClearChoices(dia_nagur_pickpocket);
};


instance DIA_NAGUR_HALLO(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 2;
	condition = dia_nagur_hallo_condition;
	information = dia_nagur_hallo_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_nagur_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_KARDIF_DIEBESWERK_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_nagur_hallo_info()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Nagur_Hallo_08_00");	//Эй, у меня нет времени, чтобы болтать с тобой. Если тебе нужна информация, поговори с Кардифом.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Hallo_08_01");	//Послушай, оставь меня в покое, хорошо?
		AI_StopProcessInfos(self);
	};
};

func void b_nagur_abfertigen()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(heroarmor,itar_mil_l) == FALSE) && (Hlp_IsItem(heroarmor,itar_mil_m) == FALSE) && (Hlp_IsItem(heroarmor,itar_pal_m) == FALSE) && (Hlp_IsItem(heroarmor,itar_pal_h) == FALSE) && (Hlp_IsItem(heroarmor,itar_nov_l) == FALSE) && (Hlp_IsItem(heroarmor,itar_kdf_l) == FALSE) && (Hlp_IsItem(heroarmor,itar_kdf_h) == FALSE))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_02");	//Ты думаешь, я не узнаю тебя, раз ты надел другую одежду?!
	};
	AI_Output(self,other,"DIA_Nagur_Add_08_03");	//(заговорщицки) Не суй нос туда, куда не следует!
	AI_Output(self,other,"DIA_Nagur_Add_08_04");	//Проваливай!
	MIS_NAGUR_BOTE = LOG_SUCCESS;
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_JOB(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 3;
	condition = dia_nagur_job_condition;
	information = dia_nagur_job_info;
	permanent = FALSE;
	description = "Кардиф говорит, что у тебя может быть работа для меня.";
};


func int dia_nagur_job_condition()
{
	if(DIA_KARDIF_DIEBESWERK_PERMANENT == TRUE)
	{
		return TRUE;
	};
};

func void dia_nagur_job_info()
{
	AI_Output(other,self,"DIA_Nagur_Job_15_00");	//Кардиф говорит, что у тебя может быть работа для меня.
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_00");	//Здесь, в гавани НЕТ работы для людей из монастыря! (смеется)
		b_nagur_abfertigen();
	}
	else if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_01");	//Здесь, в гавани НЕТ работы для королевских солдат.
		b_nagur_abfertigen();
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Job_08_01");	//(оценивающе) Так, так... Ты ищешь особенную работу. Ладно. Но будем играть по моим правилам, понятно?
		AI_Output(other,self,"DIA_Nagur_Job_15_02");	//Что это значит?
		AI_Output(self,other,"DIA_Nagur_Job_08_03");	//Это значит, что ты будешь делать, что я скажу, и будешь получать треть от навара.
		AI_Output(self,other,"DIA_Nagur_Job_08_04");	//Если тебя это не устраивает, то у меня нет работы для тебя.
		Info_ClearChoices(dia_nagur_job);
		Info_AddChoice(dia_nagur_job,"Мы партнеры. Поэтому пятьдесят на пятьдесят.",dia_nagur_job_halbe);
		Info_AddChoice(dia_nagur_job,"Хорошо, ты здесь главный.",dia_nagur_job_klar);
	};
};

func void dia_nagur_job_klar()
{
	AI_Output(other,self,"DIA_Nagur_Job_Klar_15_00");	//Хорошо, ты здесь главный.
	AI_Output(self,other,"DIA_Nagur_Job_Klar_08_01");	//Отлично. Тогда дай мне знать, когда будешь готов заработать кучу золота.
	NAGUR_DEAL = 80;
	Info_ClearChoices(dia_nagur_job);
};

func void dia_nagur_job_halbe()
{
	AI_Output(other,self,"DIA_Nagur_Job_Halbe_15_00");	//Мы партнеры. Поэтому пятьдесят на пятьдесят.
	AI_Output(self,other,"DIA_Nagur_Job_Halbe_08_01");	//Хорошо, это разумно. Конечно же, мы будем делить заработанное честно.
	NAGUR_DEAL = 120;
	Info_ClearChoices(dia_nagur_job);
};


instance DIA_NAGUR_AUFTRAG(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 4;
	condition = dia_nagur_auftrag_condition;
	information = dia_nagur_auftrag_info;
	permanent = FALSE;
	description = "Договорились. Так какой у тебя план?";
};


func int dia_nagur_auftrag_condition()
{
	if(Npc_KnowsInfo(other,dia_nagur_job))
	{
		return TRUE;
	};
};

func void dia_nagur_auftrag_info()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_15_00");	//Договорились. Так какой у тебя план?
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_01");	//Ты знаешь торговца Бальтрама, нет? Если нет, пришло время поговорить с ним.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_02");	//У этого Бальтрама есть посыльный, доставлявший ему товары с фермы Акила.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_03");	//Вернее у него БЫЛ посыльный, пока я не перерезал ему глотку. И теперь Бальтраму придется искать нового мальчика на побегушках. И им будешь ты.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_04");	//Ты должен поступить на работу к Бальтраму и взять посылку у Акила.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_05");	//Затем ты принесешь ее мне, а я продам ее заинтересованному покупателю. Он даст неплохую цену за нее.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_06");	//И не пытайся продать эти товары сам. Ты все понял?
	Info_ClearChoices(dia_nagur_auftrag);
	Info_AddChoice(dia_nagur_auftrag,"Хорошо, договорились (КОНЕЦ)",dia_nagur_auftrag_okay);
	Info_AddChoice(dia_nagur_auftrag,"Где мне найти Бальтрама?",dia_nagur_auftrag_baltram);
	Info_AddChoice(dia_nagur_auftrag,"Когда мне поговорить с Бальтрамом?",dia_nagur_auftrag_wann);
	Info_AddChoice(dia_nagur_auftrag,"Где ферма Акила?",dia_nagur_auftrag_akil);
	Info_AddChoice(dia_nagur_auftrag,"Какой ожидается навар?",dia_nagur_auftrag_gewinn);
};

func void dia_nagur_auftrag_akil()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Akil_15_00");	//Где ферма Акила?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_01");	//Выйдешь из города через восточные ворота, что находятся на рыночной площади.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_02");	//Если ты пойдешь по дороге направо, вскоре увидишь лестницу, вырезанную в скале.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_03");	//Поднимись по ней и окажешься на ферме Акила.
};

func void dia_nagur_auftrag_gewinn()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Gewinn_15_00");	//Какой ожидается навар?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Gewinn_08_01");	//Не могу сказать точно. Но, я думаю, не менее 400 монет.
};

func void dia_nagur_auftrag_baltram()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Baltram_15_00");	//Где мне найти Бальтрама?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Baltram_08_01");	//Его прилавок находится на рыночной площади.
};

func void dia_nagur_auftrag_wann()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Wann_15_00");	//Когда мне поговорить с Бальтрамом?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Wann_08_01");	//Ты можешь сделать это прямо сейчас. Он уже должен понять, что его посыльный никогда уже не появится. (грязный смех)
};

func void dia_nagur_auftrag_okay()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Okay_15_00");	//Хорошо, договорились.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Okay_08_01");	//Отлично. Тогда за дело - но если ты попытаешься обмануть меня, тебя будет ждать та же судьба, что и этого посыльного! Не забывай об этом!
	MIS_NAGUR_BOTE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_NAGUR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NAGUR,LOG_RUNNING);
	b_logentry(TOPIC_NAGUR,"Я должен заставить Бальтрама взять меня в качестве мальчика на побегушках. Затем я должен забрать посылку у фермера Акила и принести ее Нагуру.");
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_SUCCESS(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 5;
	condition = dia_nagur_success_condition;
	information = dia_nagur_success_info;
	permanent = FALSE;
	description = "Я принес пакет.";
};


func int dia_nagur_success_condition()
{
	if((MIS_NAGUR_BOTE == LOG_RUNNING) && (Npc_HasItems(other,itmi_baltrampaket) >= 1) && (NAGUR_AUSGELIEFERT == FALSE))
	{
		return TRUE;
	};
};

func void dia_nagur_success_info()
{
	AI_Output(other,self,"DIA_Nagur_Success_15_00");	//Я принес пакет.
	AI_Output(self,other,"DIA_Nagur_Success_08_01");	//Отлично. Теперь мне нужно продать его. Заходи завтра.
	b_logentry(TOPIC_NAGUR,"Нагур получил посылку. Он заплатит мне золотом завтра.");
	AI_StopProcessInfos(self);
	if(b_giveinvitems(other,self,itmi_baltrampaket,1))
	{
		Npc_RemoveInvItems(self,itmi_baltrampaket,1);
	};
	NAGURDAY = b_getdayplus();
};


instance DIA_NAGUR_DEAL(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 6;
	condition = dia_nagur_deal_condition;
	information = dia_nagur_deal_info;
	permanent = TRUE;
	description = "Ты уже продал товары?";
};


var int dia_nagur_deal_permanent;

func int dia_nagur_deal_condition()
{
	if((DIA_NAGUR_DEAL_PERMANENT == FALSE) && (MIS_NAGUR_BOTE == LOG_RUNNING) && (NAGUR_AUSGELIEFERT == FALSE) && Npc_KnowsInfo(other,dia_nagur_success))
	{
		return TRUE;
	};
};

func void dia_nagur_deal_info()
{
	AI_Output(other,self,"DIA_Nagur_Deal_15_00");	//Ты уже продал товары?
	if(b_getdayplus() > NAGURDAY)
	{
		AI_Output(self,other,"DIA_Nagur_Deal_08_01");	//Да, но за меньшую сумму, чем рассчитывал. Я получил только 300 монет.
		AI_Output(self,other,"DIA_Nagur_Deal_08_02");	//Часть этой суммы пошла моим хозяевам...
		AI_Output(self,other,"DIA_Nagur_Deal_08_03");	//И Кардиф получил свой обычный процент - плюс золото за то, что он нашел тебя.
		AI_Output(self,other,"DIA_Nagur_Deal_08_04");	//Остается 240 золотых монет. Мы поделим их как договорились. Вот твоя доля.
		AI_Output(self,other,"DIA_Nagur_Deal_08_05");	//Ты хорошо поработал. Я сообщил об этом моим хозяевам.
		AI_Output(self,other,"DIA_Nagur_Deal_08_06");	//Что из этого выйдет - не знаю.
		b_giveinvitems(self,other,itmi_gold,NAGUR_DEAL);
		MIS_NAGUR_BOTE = LOG_SUCCESS;
		MIS_BALTRAM_SCOUTAKIL = LOG_FAILED;
		b_giveplayerxp(XP_NAGUR_BOTE);
		DIA_NAGUR_DEAL_PERMANENT = TRUE;
		DIEBESGILDE_OKAY = DIEBESGILDE_OKAY + 1;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Deal_08_07");	//Пока еще нет. На это нужно время. Я не хочу продешевить.
	};
};


instance DIA_NAGUR_AUFTRAGGEBER(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_auftraggeber_condition;
	information = dia_nagur_auftraggeber_info;
	permanent = FALSE;
	description = "Кто твои хозяева?";
};


func int dia_nagur_auftraggeber_condition()
{
	if(MIS_NAGUR_BOTE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_nagur_auftraggeber_info()
{
	AI_Output(other,self,"DIA_Nagur_Auftraggeber_15_00");	//Кто твои хозяева?
	AI_Output(self,other,"DIA_Nagur_Auftraggeber_08_01");	//Ты что, действительно думаешь, что я просто так возьму и скажу тебе?
};


instance DIA_NAGUR_FAZIT(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_fazit_condition;
	information = dia_nagur_fazit_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_nagur_fazit_condition()
{
	if(Npc_KnowsInfo(other,dia_nagur_auftraggeber) && Npc_IsInState(self,zs_talk) && (KNOWS_SECRETSIGN == FALSE))
	{
		return TRUE;
	};
};

func void dia_nagur_fazit_info()
{
	AI_Output(self,other,"DIA_Nagur_Fazit_08_00");	//Дело прошло удачно, но я не говорю о своих хозяевах. Так что можешь расслабиться.
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_KNAST(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_knast_condition;
	information = dia_nagur_knast_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_nagur_knast_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_NAGUR") <= 1000) && (NAGUR_AUSGELIEFERT == TRUE))
	{
		return TRUE;
	};
};

func void dia_nagur_knast_info()
{
	AI_Output(self,other,"DIA_Nagur_Knast_08_00");	//Ты предал меня! Это была большая ошибка - а теперь проваливай!
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_SIGN(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_sign_condition;
	information = dia_nagur_sign_info;
	permanent = FALSE;
	description = "(показать сигнал воров)";
};


func int dia_nagur_sign_condition()
{
	if((MIS_NAGUR_BOTE == LOG_SUCCESS) && (KNOWS_SECRETSIGN == TRUE))
	{
		return TRUE;
	};
};

func void dia_nagur_sign_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Nagur_Sign_08_00");	//Так тебе удалось это. Теперь ты знаешь, кто мои хозяева.
	AI_Output(self,other,"DIA_Nagur_Sign_08_01");	//Не забывай о том, что Кассия говорит тебе - нам не интересно, кто ты такой. Ты один из нас, и только это имеет значение.
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_PERM(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_perm_condition;
	information = dia_nagur_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_nagur_perm_condition()
{
	if((MIS_NAGUR_BOTE == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_nagur_sign) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_nagur_perm_info()
{
	AI_Output(self,other,"DIA_Nagur_Perm_08_00");	//Поищи кого-нибудь еще, здесь бродит много народа. А у меня больше ничего нет для тебя.
	AI_StopProcessInfos(self);
};

