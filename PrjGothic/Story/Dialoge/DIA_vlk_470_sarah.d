
instance DIA_SARAH_EXIT(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 999;
	condition = dia_sarah_exit_condition;
	information = dia_sarah_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sarah_exit_condition()
{
	return TRUE;
};

func void dia_sarah_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SARAH_PICKPOCKET(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 900;
	condition = dia_sarah_pickpocket_condition;
	information = dia_sarah_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_sarah_pickpocket_condition()
{
	return c_beklauen(57,60);
};

func void dia_sarah_pickpocket_info()
{
	Info_ClearChoices(dia_sarah_pickpocket);
	Info_AddChoice(dia_sarah_pickpocket,DIALOG_BACK,dia_sarah_pickpocket_back);
	Info_AddChoice(dia_sarah_pickpocket,DIALOG_PICKPOCKET,dia_sarah_pickpocket_doit);
};

func void dia_sarah_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sarah_pickpocket);
};

func void dia_sarah_pickpocket_back()
{
	Info_ClearChoices(dia_sarah_pickpocket);
};


instance DIA_SARAH_GREET(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 1;
	condition = dia_sarah_greet_condition;
	information = dia_sarah_greet_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sarah_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CANTHAR_AUSGELIEFERT == TRUE))
	{
		return TRUE;
	};
};

func void dia_sarah_greet_info()
{
	AI_Output(self,other,"DIA_Sarah_Add_16_07");	//Ах! Опять ты!
};


instance DIA_SARAH_HALLO(C_INFO)
{
	npc = vlk_470_sarah;
	condition = dia_sarah_hallo_condition;
	information = dia_sarah_hallo_info;
	permanent = FALSE;
	description = "Как торговля?";
};


func int dia_sarah_hallo_condition()
{
	return TRUE;
};

func void dia_sarah_hallo_info()
{
	AI_Output(other,self,"DIA_Sarah_HALLO_15_00");	//Как торговля?
	AI_Output(self,other,"DIA_Sarah_HALLO_16_01");	//Когда пришли паладины, я сначала думала, что это хорошо для бизнеса.
	AI_Output(self,other,"DIA_Sarah_HALLO_16_02");	//Но теперь Гарад делает для них оружие, а ни я, ни Хакон еще не получили от них ни одной монеты.
	AI_Output(self,other,"DIA_Sarah_HALLO_16_03");	//И, что еще хуже, фермеры больше не поставляют нам продовольствие, и цены на все взлетели до небес.
	AI_Output(self,other,"DIA_Sarah_Add_16_00");	//Одно маленькое утешение - паладины оплачивают мою комнату в отеле.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Сара торгует оружием на рыночной площади.");
};


instance DIA_SARAH_BAUERN(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 2;
	condition = dia_sarah_bauern_condition;
	information = dia_sarah_bauern_info;
	permanent = FALSE;
	description = "А что за проблема с фермерами?";
};


func int dia_sarah_bauern_condition()
{
	if(Npc_KnowsInfo(other,dia_sarah_hallo))
	{
		return TRUE;
	};
};

func void dia_sarah_bauern_info()
{
	AI_Output(other,self,"DIA_Sarah_Bauern_15_00");	//А что за проблема с фермерами?
	AI_Output(self,other,"DIA_Sarah_Bauern_16_01");	//Они отказываются поставлять нам продовольствие.
	AI_Output(self,other,"DIA_Sarah_Bauern_16_02");	//Теперь, когда корабли больше не заходят в наш порт, город полностью зависит от продуктов, производимых нашими фермерами.
	AI_Output(self,other,"DIA_Sarah_Bauern_16_03");	//А Онар, самый крупный фермер, нанял наемников, чтобы защищать свою ферму от городской стражи. До этого они забирали у него все подчистую.
	AI_Output(self,other,"DIA_Sarah_Add_16_01");	//Но наемники не просто охраняют ферму Онара.
	AI_Output(self,other,"DIA_Sarah_Add_16_02");	//Они добрались даже до маленьких ферм у города, и запугивают их владельцев.
	AI_Output(self,other,"DIA_Sarah_Add_16_03");	//Я видела их, когда ходила на ферму Акила. Не хотела бы я сейчас оказаться на его месте.
};


instance DIA_SARAH_AKILSHOF(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 3;
	condition = dia_sarah_akilshof_condition;
	information = dia_sarah_akilshof_info;
	permanent = FALSE;
	description = "Где мне найти ферму Акила?";
};


func int dia_sarah_akilshof_condition()
{
	if(Npc_KnowsInfo(other,dia_sarah_bauern))
	{
		return TRUE;
	};
};

func void dia_sarah_akilshof_info()
{
	AI_Output(other,self,"DIA_Sarah_AkilsHof_15_00");	//Где мне найти ферму Акила?
	AI_Output(self,other,"DIA_Sarah_Add_16_04");	//Если выйдешь из восточных ворот и пойдешь по дороге направо, скоро ты увидишь каменную лестницу.
	AI_Output(self,other,"DIA_Sarah_Add_16_05");	//Она ведет прямо к ферме Акила.
	AI_Output(self,other,"DIA_Sarah_Add_16_06");	//Но я бы сейчас туда не совалась - эти наемники наверняка все еще там.
};


instance DIA_SARAH_TRADE(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 99;
	condition = dia_sarah_trade_condition;
	information = dia_sarah_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
};


func int dia_sarah_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_sarah_hallo) && (MIS_CANTHARS_KOMPROBRIEF != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_sarah_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Sarah_Trade_15_00");	//Покажи мне свои товары.
	SARAH_WAFFENGESEHEN = TRUE;
};


instance DIA_SARAH_IMKNAST(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 99;
	condition = dia_sarah_imknast_condition;
	information = dia_sarah_imknast_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sarah_imknast_condition()
{
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_SUCCESS) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_sarah_imknast_info()
{
	AI_Output(self,other,"DIA_Sarah_IMKNAST_16_00");	//Ты! Ты осмелился появиться здесь! Я, конечно не могу доказать этого, но я готова поклясться, что это твоих рук дело!
	AI_Output(self,other,"DIA_Sarah_IMKNAST_16_01");	//Это ты виноват, что я здесь. Ты и этот проклятый Кантар - да накажет вас Иннос!
	AI_StopProcessInfos(self);
};


instance DIA_SARAH_SUCCESS(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 4;
	condition = dia_sarah_success_condition;
	information = dia_sarah_success_info;
	permanent = FALSE;
	description = "Кантар пытался подставить тебя и заполучить твой прилавок.";
};


func int dia_sarah_success_condition()
{
	if(CANTHAR_AUSGELIEFERT == TRUE)
	{
		return TRUE;
	};
};

func void dia_sarah_success_info()
{
	AI_Output(other,self,"DIA_Sarah_Success_15_00");	//Кантар пытался подставить тебя и заполучить твой прилавок. Но я сдал его городской страже.
	AI_Output(self,other,"DIA_Sarah_Success_16_01");	//Ты этим нажил себе очень опасного врага. Я давно знаю этого ублюдка. И он всегда хотел заполучить мой прилавок.
	AI_Output(self,other,"DIA_Sarah_Success_16_02");	//Возьми это оружие в знак моей благодарности.
	b_giveplayerxp(XP_CANTHARIMKNAST);
	b_giveinvitems(self,other,itmw_piratensaebel,1);
};

