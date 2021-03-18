
instance DIA_MARCOS_EXIT(C_INFO)
{
	npc = pal_217_marcos;
	nr = 999;
	condition = dia_marcos_exit_condition;
	information = dia_marcos_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marcos_exit_condition()
{
	return TRUE;
};

func void dia_marcos_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARCOS_HALLO(C_INFO)
{
	npc = pal_217_marcos;
	nr = 2;
	condition = dia_marcos_hallo_condition;
	information = dia_marcos_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_marcos_hallo_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_marcos_hallo_info()
{
	AI_Output(self,other,"DIA_Marcos_Hallo_04_00");	//СТОЙ - во имя Инноса! Я Маркос, паладин короля. Говори, что тебе нужно, и говори правду!
	if(other.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Marcos_Hallo_15_01");	//Избранный Инноса всегда говорит правду.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_02");	//Прошу простить меня, о, преподобный маг. Я не понял сразу, с кем я говорю.
		AI_Output(other,self,"DIA_Marcos_Hallo_15_03");	//Да, ничего, все нормально.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_04");	//Если мне будет позволено спросить - что привело тебя сюда?
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(other,self,"DIA_Marcos_Hallo_15_05");	//Расслабься, я состою на службе у лорда Хагена.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_06");	//Ты один из его людей. Какие задачи привели тебя сюда?
	}
	else
	{
		AI_Output(other,self,"DIA_Marcos_Hallo_15_07");	//Расслабься, мы работаем на одного хозяина - лорда Хагена.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_08");	//С каких это пор лорд Хаген стал нанимать наемников? Говори, что тебе нужно здесь?
	};
};


instance DIA_MARCOS_HAGEN(C_INFO)
{
	npc = pal_217_marcos;
	nr = 2;
	condition = dia_marcos_hagen_condition;
	information = dia_marcos_hagen_info;
	permanent = FALSE;
	description = "Я должен доставить лорду Хагену доказательства существования драконов.";
};


func int dia_marcos_hagen_condition()
{
	if((KAPITEL == 2) && (garond.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_marcos_hagen_info()
{
	AI_Output(other,self,"DIA_Marcos_Hagen_15_00");	//Я должен доставить лорду Хагену доказательства существования драконов.
	AI_Output(self,other,"DIA_Marcos_Hagen_04_01");	//Тогда ты не должен терять времени и рисковать своей жизнью понапрасну.
	AI_Output(self,other,"DIA_Marcos_Hagen_04_02");	//Ты думаешь, ты сможешь найти здесь драконью чешуйку и отнести ему?
	AI_Output(self,other,"DIA_Marcos_Hagen_04_03");	//Попробуй добраться до замка и поговорить с командующим Гарондом.
	AI_Output(self,other,"DIA_Marcos_Hagen_04_04");	//Он должен узнать, что ты выполняешь задание лорда Хагена! Он найдет способ помочь тебе.
};


instance DIA_MARCOS_GAROND(C_INFO)
{
	npc = pal_217_marcos;
	nr = 2;
	condition = dia_marcos_garond_condition;
	information = dia_marcos_garond_info;
	permanent = FALSE;
	description = "Я пришел от Гаронда...";
};


func int dia_marcos_garond_condition()
{
	if((KAPITEL == 2) && (MIS_OLDWORLD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_marcos_garond_info()
{
	AI_Output(other,self,"DIA_Marcos_Garond_15_00");	//Я пришел от Гаронда - он хочет знать, какое количество руды готово к транспортировке.
	AI_Output(self,other,"DIA_Marcos_Garond_04_01");	//Скажи Гаронду, что мне пришлось оставить шахту, так как нападения орков стали слишком частыми.
	AI_Output(self,other,"DIA_Marcos_Garond_04_02");	//Я попытался добраться до замка с оставшимися людьми, но в конце концов я единственный остался в живых.
	AI_Output(self,other,"DIA_Marcos_Garond_04_03");	//Я спрятал руду в безопасном месте. Там ЧЕТЫРЕ ящика. Иди к Гаронду и доложи ему об этом.
	AI_Output(self,other,"DIA_Marcos_Garond_04_04");	//Скажи ему, что я буду охранять руду, пока жив. Но я не знаю, сколько времени пройдет, прежде чем орки найдут меня здесь.
	AI_Output(self,other,"DIA_Marcos_Garond_04_05");	//Скажи ему, чтобы прислал подкрепление.
	AI_Output(other,self,"DIA_Marcos_Garond_15_06");	//Я дам ему знать.
	b_logentry(TOPIC_SCOUTMINE,"Паладин Маркос охраняет ЧЕТЫРЕ ящика в небольшой долине.");
	Log_CreateTopic(TOPIC_MARCOSJUNGS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MARCOSJUNGS,LOG_RUNNING);
	b_logentry(TOPIC_MARCOSJUNGS,"Маркос хочет, чтобы Гаронд послал ему подмогу.");
	MIS_MARCOS_JUNGS = LOG_RUNNING;
	MARCOS_ORE = TRUE;
	self.flags = 0;
};


instance DIA_MARCOS_PERM(C_INFO)
{
	npc = pal_217_marcos;
	nr = 9;
	condition = dia_marcos_perm_condition;
	information = dia_marcos_perm_info;
	permanent = TRUE;
	description = "Как обстановка?";
};


func int dia_marcos_perm_condition()
{
	if((KAPITEL >= 2) && (Npc_KnowsInfo(other,dia_marcos_hagen) || Npc_KnowsInfo(other,dia_marcos_garond)))
	{
		return TRUE;
	};
};

func void dia_marcos_perm_info()
{
	AI_Output(other,self,"DIA_Marcos_Perm_15_00");	//Как обстановка?
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_01");	//Мне очень нужны лечебные зелья!
		b_useitem(self,itpo_health_03);
	}
	else if(MIS_MARCOS_JUNGS == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_02");	//Я выдержу, и я надеюсь, что Гаронд скоро пришлет подкрепление.
	}
	else if(MIS_MARCOS_JUNGS == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_03");	//Спасибо тебе за помощь. Иннос даст нам силы и поможет нам продержаться.
		if(MARCOS_EINMALIG == FALSE)
		{
			b_giveplayerxp(XP_MARCOS_JUNGS);
			MARCOS_EINMALIG = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_04");	//Я держусь, потому что со мной Иннос!
	};
	AI_StopProcessInfos(self);
};


instance DIA_MARCOS_PICKPOCKET(C_INFO)
{
	npc = pal_217_marcos;
	nr = 900;
	condition = dia_marcos_pickpocket_condition;
	information = dia_marcos_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_marcos_pickpocket_condition()
{
	return c_beklauen(65,380);
};

func void dia_marcos_pickpocket_info()
{
	Info_ClearChoices(dia_marcos_pickpocket);
	Info_AddChoice(dia_marcos_pickpocket,DIALOG_BACK,dia_marcos_pickpocket_back);
	Info_AddChoice(dia_marcos_pickpocket,DIALOG_PICKPOCKET,dia_marcos_pickpocket_doit);
};

func void dia_marcos_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_marcos_pickpocket);
};

func void dia_marcos_pickpocket_back()
{
	Info_ClearChoices(dia_marcos_pickpocket);
};

