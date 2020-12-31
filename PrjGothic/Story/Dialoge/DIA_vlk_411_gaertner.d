
instance DIA_GAERTNER_EXIT(C_INFO)
{
	npc = vlk_411_gaertner;
	nr = 999;
	condition = dia_gaertner_exit_condition;
	information = dia_gaertner_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gaertner_exit_condition()
{
	return TRUE;
};

func void dia_gaertner_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GAERTNER_PICKPOCKET(C_INFO)
{
	npc = vlk_411_gaertner;
	nr = 900;
	condition = dia_gaertner_pickpocket_condition;
	information = dia_gaertner_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_gaertner_pickpocket_condition()
{
	return c_beklauen(40,50);
};

func void dia_gaertner_pickpocket_info()
{
	Info_ClearChoices(dia_gaertner_pickpocket);
	Info_AddChoice(dia_gaertner_pickpocket,DIALOG_BACK,dia_gaertner_pickpocket_back);
	Info_AddChoice(dia_gaertner_pickpocket,DIALOG_PICKPOCKET,dia_gaertner_pickpocket_doit);
};

func void dia_gaertner_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_gaertner_pickpocket);
};

func void dia_gaertner_pickpocket_back()
{
	Info_ClearChoices(dia_gaertner_pickpocket);
};


instance DIA_GAERTNER_JOB(C_INFO)
{
	npc = vlk_411_gaertner;
	nr = 5;
	condition = dia_gaertner_job_condition;
	information = dia_gaertner_job_info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int dia_gaertner_job_condition()
{
	return TRUE;
};

func void dia_gaertner_job_info()
{
	AI_Output(other,self,"DIA_Gaertner_Job_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Gaertner_Job_09_01");	//А ты как думаешь? Я садовник и ухаживаю за этим садом.
	AI_Output(other,self,"DIA_Gaertner_Job_15_02");	//Ты, похоже, вполне доволен жизнью?
	AI_Output(self,other,"DIA_Gaertner_Job_09_03");	//Да, и хотелось бы, чтобы все так и оставалось подольше.
	AI_Output(self,other,"DIA_Gaertner_Job_09_04");	//Когда-то меня даже хотели отправить в колонию за то, что я прикончил одного парня.
	AI_Output(self,other,"DIA_Gaertner_Job_09_05");	//Но Лариусу, губернатору, нужен был садовник, и меня оставили здесь.
	AI_Output(self,other,"DIA_Gaertner_Job_09_06");	//Со временем этот сад стал моим домом. И я вполне доволен этим.
};


instance DIA_GAERTNER_PLANTS(C_INFO)
{
	npc = vlk_411_gaertner;
	nr = 5;
	condition = dia_gaertner_plants_condition;
	information = dia_gaertner_plants_info;
	permanent = FALSE;
	description = "Ты выращиваешь какие-нибудь травы?";
};


func int dia_gaertner_plants_condition()
{
	if(Npc_KnowsInfo(other,dia_gaertner_job))
	{
		return TRUE;
	};
};

func void dia_gaertner_plants_info()
{
	AI_Output(other,self,"DIA_Gaertner_Plants_15_00");	//Ты выращиваешь какие-нибудь травы?
	AI_Output(self,other,"DIA_Gaertner_Plants_09_01");	//Да, немного. Я выращиваю огненную траву и огненную крапиву. Также я пытался сажать болотную траву, но она не приживается здесь.
	AI_Output(self,other,"DIA_Gaertner_Plants_09_02");	//Я только что собрал выращенное. Так что, если ты хочешь что-то купить...
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Садовник губернатора может продать мне кое-какие растения.");
};


instance DIA_GAERTNER_TRADE(C_INFO)
{
	npc = vlk_411_gaertner;
	nr = 5;
	condition = dia_gaertner_trade_condition;
	information = dia_gaertner_trade_info;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
	trade = TRUE;
};


func int dia_gaertner_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_gaertner_plants))
	{
		return TRUE;
	};
};

func void dia_gaertner_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Gaertner_Trade_15_00");	//Покажи мне свои товары.
};


instance DIA_GAERTNER_KRAUTABAK(C_INFO)
{
	npc = vlk_411_gaertner;
	nr = 5;
	condition = dia_gaertner_krautabak_condition;
	information = dia_gaertner_krautabak_info;
	permanent = FALSE;
	description = "У меня есть травяной табак.";
};


func int dia_gaertner_krautabak_condition()
{
	if((Npc_HasItems(other,itmi_sumpftabak) >= 1) && Wld_IsTime(6,45,21,45))
	{
		return TRUE;
	};
};

func void dia_gaertner_krautabak_info()
{
	AI_Output(other,self,"DIA_Gaertner_Krautabak_15_00");	//У меня есть травяной табак. Хочешь затянуться?
	AI_Output(self,other,"DIA_Gaertner_Krautabak_09_01");	//Даже не знаю... А, ладно, давай. Покурю немного.
	b_giveinvitems(other,self,itmi_sumpftabak,1);
	Npc_RemoveInvItems(self,itmi_sumpftabak,1);
	CreateInvItems(self,itmi_joint,1);
	b_useitem(self,itmi_joint);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Output(self,other,"DIA_Gaertner_Krautabak_09_02");	//Хха... кха-кха....
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Gaertner_Krautabak_09_03");	//Ядреная штука. Что-то мне расхотелось курить это.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GAERTNER_SIGN(C_INFO)
{
	npc = vlk_411_gaertner;
	nr = 6;
	condition = dia_gaertner_sign_condition;
	information = dia_gaertner_sign_info;
	permanent = FALSE;
	description = "(показать сигнал воров)";
};


func int dia_gaertner_sign_condition()
{
	if(KNOWS_SECRETSIGN == TRUE)
	{
		return TRUE;
	};
};

func void dia_gaertner_sign_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Gaertner_Sign_09_00");	//Теперь ты один из нас. И я могу подкинуть тебе кое-какую информацию.
	AI_Output(self,other,"DIA_Gaertner_Sign_09_01");	//В некоторых домах здесь есть секретные панели, которые открываются скрытыми выключателями.
	AI_Output(self,other,"DIA_Gaertner_Sign_09_02");	//Люди хранят там самые ценные свои вещи.
};

