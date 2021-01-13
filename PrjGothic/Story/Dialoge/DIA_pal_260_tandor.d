
instance DIA_TANDOR_EXIT(C_INFO)
{
	npc = pal_260_tandor;
	nr = 999;
	condition = dia_tandor_exit_condition;
	information = dia_tandor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_tandor_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_tandor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TANDOR_HALLO(C_INFO)
{
	npc = pal_260_tandor;
	nr = 2;
	condition = dia_tandor_hallo_condition;
	information = dia_tandor_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_tandor_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_tandor_hallo_info()
{
	AI_Output(self,other,"DIA_Tandor_Hallo_08_00");	//Ты пришел через Проход? Это хорошо. Мы уже потеряли там много хороших людей.
	AI_Output(self,other,"DIA_Tandor_Hallo_08_01");	//Я хорошо знаю, каково там - я служил в разведотряде некоторое время.
	AI_Output(self,other,"DIA_Tandor_Hallo_08_02");	//У тебя есть оружие? Если тебе нужно хорошее оружие, обратись ко мне.
	Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
	b_logentry(TOPIC_TRADER_OC,"Тандор продает оружие в замке.");
};


instance DIA_TANDOR_TRUPP(C_INFO)
{
	npc = pal_260_tandor;
	nr = 2;
	condition = dia_tandor_trupp_condition;
	information = dia_tandor_trupp_info;
	permanent = FALSE;
	description = "Что стало с этим отрядом?";
};


func int dia_tandor_trupp_condition()
{
	if(Npc_KnowsInfo(other,dia_tandor_hallo))
	{
		return TRUE;
	};
};

func void dia_tandor_trupp_info()
{
	AI_Output(other,self,"DIA_Tandor_Trupp_15_00");	//Что стало с этим отрядом?
	AI_Output(self,other,"DIA_Tandor_Trupp_08_01");	//Мы проводили разведку местности и собирались продвинуться к побережью. Мы разбили лагерь в пещере.
	AI_Output(self,other,"DIA_Tandor_Trupp_08_02");	//Но поздно ночью пришли орки. Они осветили склон факелами и обнаружили нас.
	AI_Output(self,other,"DIA_Tandor_Trupp_08_03");	//Мы попытались скрыться, но я единственный, кому удалось пробиться к своим...
	AI_Output(self,other,"DIA_Tandor_Trupp_08_04");	//Вскоре после этого орки возвели огромный частокол, и нам пришлось отступить в замок.
};


instance DIA_TANDOR_TRADE(C_INFO)
{
	npc = pal_260_tandor;
	nr = 900;
	condition = dia_tandor_trade_condition;
	information = dia_tandor_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи мне свои товары.";
};


func int dia_tandor_trade_condition()
{
	return TRUE;
};

func void dia_tandor_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Tandor_Trade_15_00");	//Покажи мне свои товары.
};


instance DIA_TANDOR_EQUIPMENT(C_INFO)
{
	npc = pal_260_tandor;
	nr = 3;
	condition = dia_tandor_equipment_condition;
	information = dia_tandor_equipment_info;
	description = "Меня послал Гаронд - мне нужно снаряжение.";
};


func int dia_tandor_equipment_condition()
{
	if(Npc_KnowsInfo(hero,dia_garond_equipment) && (other.guild == GIL_MIL) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_tandor_equipment_info()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_15_00");	//Меня послал Гаронд - мне нужно снаряжение.
	AI_Output(self,other,"DIA_Tandor_Equipment_08_01");	//Для ближнего или дальнего боя?
	Info_ClearChoices(dia_tandor_equipment);
	Info_AddChoice(dia_tandor_equipment,"Для ближнего боя.",dia_tandor_equipment_nah);
	Info_AddChoice(dia_tandor_equipment,"Для дальнего боя.",dia_tandor_equipment_fern);
};

func void dia_tandor_equipment_nah()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Nah_15_00");	//Для ближнего боя.
	AI_Output(self,other,"DIA_Tandor_Equipment_Nah_08_01");	//Одноручное или двуручное?
	Info_ClearChoices(dia_tandor_equipment);
	Info_AddChoice(dia_tandor_equipment,"Одноручное.",dia_tandor_equipment_ein);
	Info_AddChoice(dia_tandor_equipment,"Двуручное.",dia_tandor_equipment_zwei);
};

func void dia_tandor_equipment_fern()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Fern_15_00");	//Для дальнего боя.
	AI_Output(self,other,"DIA_Tandor_Equipment_Fern_08_01");	//Лук или арбалет?
	Info_ClearChoices(dia_tandor_equipment);
	Info_AddChoice(dia_tandor_equipment,"Лук.",dia_tandor_equipment_bow);
	Info_AddChoice(dia_tandor_equipment,"Арбалет.",dia_tandor_equipment_crossbow);
};

func void dia_tandor_equipment_ein()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Ein_15_00");	//Одноручное.
	AI_Output(self,other,"DIA_Tandor_Equipment_Ein_08_01");	//Тогда возьми этот Дробитель камней. Это хорошее оружие.
	b_giveinvitems(self,other,itmw_steinbrecher,1);
	Info_ClearChoices(dia_tandor_equipment);
};

func void dia_tandor_equipment_zwei()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Zwei_15_00");	//Двуручное.
	AI_Output(self,other,"DIA_Tandor_Equipment_Zwei_08_01");	//Тебе понравится этот двуручник.
	b_giveinvitems(self,other,itmw_zweihaender1,1);
	Info_ClearChoices(dia_tandor_equipment);
};

func void dia_tandor_equipment_bow()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Bow_15_00");	//Лук.
	AI_Output(self,other,"DIA_Tandor_Equipment_Bow_08_01");	//Этот охотничий лук как нельзя лучше подойдет тебе. Я также дам тебе колчан стрел.
	b_giveinvitems(self,other,itrw_bow_l_03,1);
	b_giveinvitems(self,other,itrw_arrow,50);
	Info_ClearChoices(dia_tandor_equipment);
};

func void dia_tandor_equipment_crossbow()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Crossbow_15_00");	//Арбалет.
	AI_Output(self,other,"DIA_Tandor_Equipment_Crossbow_08_01");	//Тогда возьми этот легкий арбалет. И болты к нему в придачу.
	b_giveinvitems(self,other,itrw_crossbow_l_02,1);
	b_giveinvitems(self,other,itrw_bolt,50);
	Info_ClearChoices(dia_tandor_equipment);
};


instance DIA_TANDOR_KAP3_EXIT(C_INFO)
{
	npc = pal_260_tandor;
	nr = 999;
	condition = dia_tandor_kap3_exit_condition;
	information = dia_tandor_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_tandor_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_tandor_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TANDOR_KAP4_EXIT(C_INFO)
{
	npc = pal_260_tandor;
	nr = 999;
	condition = dia_tandor_kap4_exit_condition;
	information = dia_tandor_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_tandor_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_tandor_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TANDOR_NEWS(C_INFO)
{
	npc = pal_260_tandor;
	nr = 40;
	condition = dia_tandor_news_condition;
	information = dia_tandor_news_info;
	permanent = TRUE;
	description = "Есть какие-нибудь новости?";
};


func int dia_tandor_news_condition()
{
	if((KAPITEL == 4) && Npc_KnowsInfo(hero,dia_tandor_hallo))
	{
		return TRUE;
	};
};

func void dia_tandor_news_info()
{
	AI_Output(other,self,"DIA_Tandor_News_15_00");	//Есть какие-нибудь новости?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Tandor_News_08_01");	//Единственная новость за последнее время - то, что вы, охотники на драконов, появились здесь.
	}
	else
	{
		AI_Output(self,other,"DIA_Tandor_News_08_02");	//Сюда прибыли охотники на драконов.
		AI_Output(self,other,"DIA_Tandor_News_08_03");	//Похоже, это крепкие ублюдки. Надеюсь, это действительно так, иначе вряд ли им удастся выжить здесь.
	};
};


instance DIA_TANDOR_KAP5_EXIT(C_INFO)
{
	npc = pal_260_tandor;
	nr = 999;
	condition = dia_tandor_kap5_exit_condition;
	information = dia_tandor_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_tandor_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_tandor_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TANDOR_WASISTLOS(C_INFO)
{
	npc = pal_260_tandor;
	nr = 51;
	condition = dia_tandor_wasistlos_condition;
	information = dia_tandor_wasistlos_info;
	permanent = TRUE;
	description = "Что-то ты не весел.";
};


func int dia_tandor_wasistlos_condition()
{
	if((KAPITEL == 5) && Npc_KnowsInfo(hero,dia_tandor_hallo))
	{
		return TRUE;
	};
};

func void dia_tandor_wasistlos_info()
{
	AI_Output(other,self,"DIA_Tandor_WASISTLOS_15_00");	//Что-то ты не весел.
	if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Tandor_WASISTLOS_08_01");	//Орки валят толпами. Скоро нам всем настанет конец.
	}
	else
	{
		AI_Output(self,other,"DIA_Tandor_WASISTLOS_08_02");	//Запасы продовольствия кончаются. Мы голодаем.
	};
};


instance DIA_TANDOR_KAP6_EXIT(C_INFO)
{
	npc = pal_260_tandor;
	nr = 999;
	condition = dia_tandor_kap6_exit_condition;
	information = dia_tandor_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_tandor_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_tandor_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TANDOR_PICKPOCKET(C_INFO)
{
	npc = pal_260_tandor;
	nr = 900;
	condition = dia_tandor_pickpocket_condition;
	information = dia_tandor_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_tandor_pickpocket_condition()
{
	return c_beklauen(47,90);
};

func void dia_tandor_pickpocket_info()
{
	Info_ClearChoices(dia_tandor_pickpocket);
	Info_AddChoice(dia_tandor_pickpocket,DIALOG_BACK,dia_tandor_pickpocket_back);
	Info_AddChoice(dia_tandor_pickpocket,DIALOG_PICKPOCKET,dia_tandor_pickpocket_doit);
};

func void dia_tandor_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_tandor_pickpocket);
};

func void dia_tandor_pickpocket_back()
{
	Info_ClearChoices(dia_tandor_pickpocket);
};

