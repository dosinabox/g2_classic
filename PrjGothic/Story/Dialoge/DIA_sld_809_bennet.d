
instance DIA_BENNET_EXIT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 999;
	condition = dia_bennet_exit_condition;
	information = dia_bennet_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bennet_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_bennet_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_HALLO(C_INFO)
{
	npc = sld_809_bennet;
	nr = 1;
	condition = dia_bennet_hallo_condition;
	information = dia_bennet_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bennet_hallo_condition()
{
	if((KAPITEL < 3) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bennet_hallo_info()
{
	AI_Output(self,other,"DIA_Bennet_HALLO_06_00");	//Я не продаю оружие. Халед продает. Он находится в доме Онара.
	Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTRADER,"Халед - торговец оружием.");
};


instance DIA_BENNET_TRADE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 700;
	condition = dia_bennet_trade_condition;
	information = dia_bennet_trade_info;
	permanent = TRUE;
	description = "А как насчет кузнечного инструмента?";
	trade = TRUE;
};


func int dia_bennet_trade_condition()
{
	if((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_trade_info()
{
	var int mcbolzenamount;
	var int mcarrowamount;
	AI_Output(other,self,"DIA_Bennet_TRADE_15_00");	//А как насчет кузнечного инструмента?
	b_givetradeinv(self);
	Npc_RemoveInvItems(self,itrw_bolt,Npc_HasItems(self,itrw_bolt));
	mcbolzenamount = KAPITEL * 50;
	CreateInvItems(self,itrw_bolt,mcbolzenamount);
	Npc_RemoveInvItems(self,itrw_arrow,Npc_HasItems(self,itrw_arrow));
	mcarrowamount = KAPITEL * 50;
	CreateInvItems(self,itrw_arrow,mcarrowamount);
	AI_Output(self,other,"DIA_Bennet_TRADE_06_01");	//Что тебе нужно?
	if(BENNETLOG == FALSE)
	{
		Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
		b_logentry(TOPIC_SOLDIERTRADER,"Беннет продает кузнечное снаряжение.");
		BENNETLOG = TRUE;
	};
};


instance DIA_BENNET_WHICHWEAPONS(C_INFO)
{
	npc = sld_809_bennet;
	nr = 2;
	condition = dia_bennet_whichweapons_condition;
	information = dia_bennet_whichweapons_info;
	permanent = FALSE;
	description = "Какое оружие ты делаешь?";
};


func int dia_bennet_whichweapons_condition()
{
	if(((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)) && (MIS_BENNET_BRINGORE == FALSE))
	{
		return TRUE;
	};
};

func void dia_bennet_whichweapons_info()
{
	AI_Output(other,self,"DIA_Bennet_WhichWeapons_15_00");	//Какое оружие ты делаешь?
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_01");	//Сейчас - обычные мечи. Больше ничего.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_02");	//Но если бы у меня была магическая руда, я мог бы выковать оружие, превосходящее любой меч из обычной стали.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_03");	//Ты случайно не знаешь, где можно раздобыть руды? (смеется) Кроме как в Долине Рудников, я имею в виду.
	AI_Output(other,self,"DIA_Bennet_WhichWeapons_15_04");	//Нет.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_05");	//Конечно же, не знаешь.
};


instance DIA_BENNET_BAUORSLD(C_INFO)
{
	npc = sld_809_bennet;
	nr = 3;
	condition = dia_bennet_bauorsld_condition;
	information = dia_bennet_bauorsld_info;
	permanent = FALSE;
	description = "Ты с фермерами или с наемниками?";
};


func int dia_bennet_bauorsld_condition()
{
	return TRUE;
};

func void dia_bennet_bauorsld_info()
{
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_00");	//Ты с фермерами или с наемниками?
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_01");	//Ты смеешься надо мной, да?
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_02");	//Мне просто интересно.
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_03");	//Ты когда-нибудь видел фермера, который ковал бы оружие?
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_04");	//Нет.
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_05");	//Тогда зачем ты задаешь такие тупые вопросы?
};


instance DIA_BENNET_WANNAJOIN(C_INFO)
{
	npc = sld_809_bennet;
	nr = 4;
	condition = dia_bennet_wannajoin_condition;
	information = dia_bennet_wannajoin_info;
	permanent = TRUE;
	description = "Я хочу присоединиться к наемникам!";
};


func int dia_bennet_wannajoin_condition()
{
	if(Npc_KnowsInfo(other,dia_bennet_bauorsld) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_bennet_wannajoin_info()
{
	AI_Output(other,self,"DIA_Bennet_WannaJoin_15_00");	//Я хочу присоединиться к наемникам!
	AI_Output(self,other,"DIA_Bennet_WannaJoin_06_01");	//Тогда прекращай болтать и иди к Торлофу. Пусть он даст тебе испытание.
	if((MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS) || (MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS))
	{
		AI_Output(other,self,"DIA_Bennet_WannaJoin_15_02");	//Я прошел испытание.
		AI_Output(self,other,"DIA_Bennet_WannaJoin_06_03");	//Хорошо, тогда я проголосую за тебя.
	};
};


instance DIA_BENNET_WANNASMITH(C_INFO)
{
	npc = sld_809_bennet;
	nr = 5;
	condition = dia_bennet_wannasmith_condition;
	information = dia_bennet_wannasmith_info;
	permanent = TRUE;
	description = "Ты можешь научить меня ковать мечи?";
};


func int dia_bennet_wannasmith_condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE) && (BENNET_TEACHCOMMON == FALSE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_wannasmith_info()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_15_00");	//Ты можешь научить меня ковать мечи?
	AI_Output(self,other,"DIA_Bennet_WannaSmith_06_01");	//Конечно.
	AI_Output(self,other,"DIA_Bennet_WannaSmith_06_02");	//Впрочем, это обойдется тебе в некоторую сумму. Скажем, 30 золотых.
	Info_ClearChoices(dia_bennet_wannasmith);
	Info_AddChoice(dia_bennet_wannasmith,"Может быть, позже.",dia_bennet_wannasmith_later);
	Info_AddChoice(dia_bennet_wannasmith,"Отлично. Вот твои 30 золотых.",dia_bennet_wannasmith_pay);
};

func void dia_bennet_wannasmith_pay()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_Pay_15_00");	//Отлично. Вот твои 30 золотых.
	if(b_giveinvitems(other,self,itmi_gold,30))
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmith_Pay_06_01");	//Должен сказать, это очень хорошая цена! Я готов приступить к обучению, как только ты будешь готов.
		BENNET_TEACHCOMMON = TRUE;
		Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
		b_logentry(TOPIC_SOLDIERTEACHER,"Беннет может обучить меня кузнечному делу.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmith_Pay_06_02");	//Не надо держать меня за идиота. 30 золотых и ни одной монетой меньше.
	};
	Info_ClearChoices(dia_bennet_wannasmith);
};

func void dia_bennet_wannasmith_later()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_Later_15_00");	//Может быть, позже.
	Info_ClearChoices(dia_bennet_wannasmith);
};


instance DIA_BENNET_TEACHCOMMON(C_INFO)
{
	npc = sld_809_bennet;
	nr = 6;
	condition = dia_bennet_teachcommon_condition;
	information = dia_bennet_teachcommon_info;
	permanent = TRUE;
	description = b_buildlearnstring("Научиться кузнечному делу",b_getlearncosttalent(other,NPC_TALENT_SMITH));
};


func int dia_bennet_teachcommon_condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE) && (BENNET_TEACHCOMMON == TRUE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_teachcommon_info()
{
	AI_Output(other,self,"DIA_Bennet_TeachCOMMON_15_00");	//Научи меня ковать мечи!
	if(b_teachplayertalentsmith(self,other,WEAPON_COMMON))
	{
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_01");	//Это довольно просто: берешь кусок сырой стали и держишь его над огнем, пока он не раскалится.
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_02");	//Затем кладешь его на наковальню и придаешь мечу форму.
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_03");	//Самое важное - следи, чтобы сталь не стала слишком холодной. У тебя есть всего несколько минут для обработки оружия...
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_04");	//А остальному ты научишься сам - это всего лишь вопрос практики.
	};
};


instance DIA_BENNET_WANNASMITHORE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 7;
	condition = dia_bennet_wannasmithore_condition;
	information = dia_bennet_wannasmithore_info;
	permanent = TRUE;
	description = "Научи меня ковать магическое оружие!";
};


func int dia_bennet_wannasmithore_condition()
{
	if((BENNET_TEACHSMITH == FALSE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_wannasmithore_info()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_00");	//Научи меня ковать магическое оружие!
	if(PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_01");	//Но ты даже не знаешь основ кузнечного дела.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_02");	//Сначала ты должен научиться ковать обычные мечи. А там посмотрим.
	}
	else if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_03");	//Пока ты не один из нас, будь я проклят, если научу тебя секретам изготовления магического оружия.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_04");	//Только немногие кузнецы владеют этим искусством, и я думаю, даже кузнецы в городе ничего не знают об этом.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_05");	//И это хорошо. Иначе все эти пьяницы из городской стражи потрясали бы магическими мечами.
		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_06");	//Ничего личного. (ухмыляется) Против тебя я ничего не имею.
		};
	}
	else if(MIS_BENNET_BRINGORE != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_07");	//Если бы у меня была магическая руда, я бы, возможно, согласился.
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_08");	//Ах, да ладно. Я с наемниками, и я знаю кузнечное дело. Что еще тебе нужно?
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_09");	//Скажи мне, как интересно я должен ковать магическое оружие, не имея магической руды?
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_10");	//Нууу...
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_11");	//Вот что скажу. Мне нужно как минимум 5 кусков руды - или ты можешь забыть об этом.
		if(MIS_BENNET_BRINGORE == FALSE)
		{
			MIS_BENNET_BRINGORE = LOG_RUNNING;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_12");	//Отлично, ты принес мне руду, и ты также знаешь, как куется обычный меч.
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_13");	//Так давай же, обучай меня!
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_14");	//Самое главное: не важно, целиком сделан твой меч, - из магической руды, или ты просто покрыл обычный меч ее тонким слоем. Поверхность - только это имеет значение.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_15");	//А так как эта чертова руда очень дорогая, просто берешь стальную заготовку и несколько кусков руды.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_16");	//Естественно, нельзя просто покрыть готовый меч магической рудой. Оружие нужно создавать с нуля.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_17");	//А все остальное зависит от оружия, которое ты хочешь получить.
		BENNET_TEACHSMITH = TRUE;
	};
};


instance DIA_BENNET_WHEREORE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_whereore_condition;
	information = dia_bennet_whereore_info;
	permanent = FALSE;
	description = "Где мне найти магическую руду?";
};


func int dia_bennet_whereore_condition()
{
	if((MIS_BENNET_BRINGORE == LOG_RUNNING) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_whereore_info()
{
	AI_Output(other,self,"DIA_Bennet_WhereOre_15_00");	//Где мне найти магическую руду?
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_01");	//Эх, если бы я только знал это. Я думаю, в горнодобывающей колонии ты наверняка найдешь что-нибудь.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_02");	//Но, может быть, тебе повезет и ты найдешь несколько мелких обломков где-нибудь здесь и сможешь слепить из них приличный кусок руды.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_03");	//Насколько я знаю, в горах к югу отсюда есть заброшенные шахты. Попробуй попытать счастья там.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_04");	//Но будь осторожен: я слышал, там устроили логово бандиты.
};


instance DIA_BENNET_BRINGORE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 9;
	condition = dia_bennet_bringore_condition;
	information = dia_bennet_bringore_info;
	permanent = FALSE;
	description = "Вот, держи - (5 кусков руды).";
};


func int dia_bennet_bringore_condition()
{
	if((MIS_BENNET_BRINGORE == LOG_RUNNING) && (Npc_HasItems(other,itmi_nugget) >= 5))
	{
		return TRUE;
	};
};

func void dia_bennet_bringore_info()
{
	AI_Output(other,self,"DIA_Bennet_BringOre_15_00");	//Вот держи.
	AI_Output(self,other,"DIA_Bennet_BringOre_06_01");	//(смеется) Покажи!
	b_giveinvitems(other,self,itmi_nugget,5);
	AI_Output(self,other,"DIA_Bennet_BringOre_06_02");	//Да ты что! Я потрясен!
	AI_Output(self,other,"DIA_Bennet_BringOre_06_03");	//Оставь себе два куска. Они тебе понадобятся, чтобы сделать твое собственное оружие.
	b_giveinvitems(self,other,itmi_nugget,2);
	MIS_BENNET_BRINGORE = LOG_SUCCESS;
};


var int bennet_kap2smith;
var int bennet_kap3smith;
var int bennet_kap4smith;
var int bennet_kap5smith;

func void b_saybennetlater()
{
	AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_04");	//Этого недостаточно. Заходи попозже.
};


instance DIA_BENNET_TEACHSMITH(C_INFO)
{
	npc = sld_809_bennet;
	nr = 30;
	condition = dia_bennet_teachsmith_condition;
	information = dia_bennet_teachsmith_info;
	permanent = TRUE;
	description = "Я хочу больше узнать о магическом оружии.";
};


func int dia_bennet_teachsmith_condition()
{
	if((BENNET_TEACHSMITH == TRUE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_teachsmith_info()
{
	AI_Output(other,self,"DIA_Bennet_TeachSmith_15_00");	//Я хочу больше узнать о магическом оружии.
	if(KAPITEL == 1)
	{
		b_saybennetlater();
	}
	else if((KAPITEL == 2) && (BENNET_KAP2SMITH == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_01");	//Я могу научить тебя ковать магические мечи и даже двуручные клинки.
		BENNET_KAP2SMITH = TRUE;
	}
	else if((KAPITEL == 3) && (MIS_READYFORCHAPTER4 == FALSE) && (BENNET_KAP3SMITH == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_02");	//Я немного потренировался, и теперь я могу научить тебя, как ковать полуторные и тяжелые двуручные магические мечи.
		BENNET_KAP3SMITH = TRUE;
	}
	else if((MIS_READYFORCHAPTER4 == TRUE) && (KAPITEL < 5) && (BENNET_KAP4SMITH == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_03");	//Пока мне нечему учить тебя. Это лучшее, что я умею ковать сейчас.
		BENNET_KAP4SMITH = TRUE;
	}
	else if((KAPITEL >= 5) && (BENNET_KAP5SMITH == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_04");	//Послушай. На меня только что снизошло вдохновение. Магическое оружие, покрытое кровью дракона. И я точно знаю, как изготовить его!
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_05");	//(ухмыляется) А ты хочешь узнать?
		BENNET_KAP5SMITH = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_06");	//Какое оружие ты хотел бы научиться делать?
	};
	Info_ClearChoices(dia_bennet_teachsmith);
	Info_AddChoice(dia_bennet_teachsmith,DIALOG_BACK,dia_bennet_teachsmith_back);
	if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_01] == FALSE) && (KAPITEL >= 2))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_01,b_getlearncosttalent(other,NPC_TALENT_SMITH)),dia_bennet_teachsmith_1hspecial1);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_01] == FALSE) && (KAPITEL >= 2))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_01,b_getlearncosttalent(other,NPC_TALENT_SMITH)),dia_bennet_teachsmith_2hspecial1);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_02] == FALSE) && (KAPITEL >= 3))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_02,b_getlearncosttalent(other,NPC_TALENT_SMITH)),dia_bennet_teachsmith_1hspecial2);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_02] == FALSE) && (KAPITEL >= 3))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_02,b_getlearncosttalent(other,NPC_TALENT_SMITH)),dia_bennet_teachsmith_2hspecial2);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_03] == FALSE) && (KAPITEL >= 4))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_03,b_getlearncosttalent(other,NPC_TALENT_SMITH)),dia_bennet_teachsmith_1hspecial3);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_03] == FALSE) && (KAPITEL >= 4))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_03,b_getlearncosttalent(other,NPC_TALENT_SMITH)),dia_bennet_teachsmith_2hspecial3);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_04] == FALSE) && (KAPITEL >= 5))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_04,b_getlearncosttalent(other,NPC_TALENT_SMITH)),dia_bennet_teachsmith_1hspecial4);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_04] == FALSE) && (KAPITEL >= 5))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_04,b_getlearncosttalent(other,NPC_TALENT_SMITH)),dia_bennet_teachsmith_2hspecial4);
	};
};

func void dia_bennet_teachsmith_back()
{
	Info_ClearChoices(dia_bennet_teachsmith);
};

func void dia_bennet_teachsmith_1hspecial1()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_01);
};

func void dia_bennet_teachsmith_2hspecial1()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_01);
};

func void dia_bennet_teachsmith_1hspecial2()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_02);
};

func void dia_bennet_teachsmith_2hspecial2()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_02);
};

func void dia_bennet_teachsmith_1hspecial3()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_03);
};

func void dia_bennet_teachsmith_2hspecial3()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_03);
};

func void dia_bennet_teachsmith_1hspecial4()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_04);
};

func void dia_bennet_teachsmith_2hspecial4()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_04);
};


instance DIA_BENNET_KAP3_EXIT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 999;
	condition = dia_bennet_kap3_exit_condition;
	information = dia_bennet_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bennet_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_bennet_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_WHYPRISON(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_whyprison_condition;
	information = dia_bennet_whyprison_info;
	permanent = FALSE;
	description = "Как ты попал за решетку?";
};


func int dia_bennet_whyprison_condition()
{
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_whyprison_info()
{
	AI_Output(other,self,"DIA_Bennet_WhyPrison_15_00");	//Как ты попал за решетку?
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_01");	//Эти свиньи схватили меня и бросили сюда. Говорят, что я убил паладина.
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_02");	//Но я не делал этого, они хотят оклеветать меня.
	AI_Output(other,self,"DIA_Bennet_WhyPrison_15_03");	//Зачем бы им это?
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_04");	//Откуда мне знать? Ты должен вытащить меня отсюда.
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_05");	//Поговори с лордом Хагеном, проломи стену...  ну, я не знаю... сделай же что-нибудь!
	MIS_RESCUEBENNET = LOG_RUNNING;
	Log_CreateTopic(TOPIC_RESCUEBENNET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET,LOG_RUNNING);
	b_logentry(TOPIC_RESCUEBENNET,"У Беннета серьезные проблемы. Он на все готов, чтобы только вырваться из тюрьмы.");
};


instance DIA_BENNET_WHATHAPPENED(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_whathappened_condition;
	information = dia_bennet_whathappened_info;
	permanent = FALSE;
	description = "Что произошло?";
};


func int dia_bennet_whathappened_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bennet_whyprison))
	{
		return TRUE;
	};
};

func void dia_bennet_whathappened_info()
{
	AI_Output(other,self,"DIA_Bennet_WhatHappened_15_00");	//Что произошло?
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_01");	//Я пошел в нижнюю часть города с Ходжесом, чтобы купить кое-что для наших парней.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_02");	//Неожиданно мы услышали громкий крик и звук топот убегающих ног.
	AI_Output(other,self,"DIA_Bennet_WhatHappened_15_03");	//Давай к делу.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_04");	//Мы сразу поняли - что-то случилось, и нас тут же схватят, если застанут там.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_05");	//И мы побежали. А затем, когда до городских ворот оставалось уже совсем немного, я споткнулся и повредил колено.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_06");	//А дальше все просто. Стражники тут же накинулись на меня и бросили за решетку.
};


instance DIA_BENNET_VICTIM(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_victim_condition;
	information = dia_bennet_victim_info;
	permanent = FALSE;
	description = "Кто был убит?";
};


func int dia_bennet_victim_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bennet_whyprison))
	{
		return TRUE;
	};
};

func void dia_bennet_victim_info()
{
	AI_Output(other,self,"DIA_Bennet_Victim_15_00");	//Кто был убит?
	AI_Output(self,other,"DIA_Bennet_Victim_06_01");	//Понятия не имею - один из паладинов, я не знаю, кто.
	AI_Output(other,self,"DIA_Bennet_Victim_15_02");	//Ты знаешь имя?
	AI_Output(self,other,"DIA_Bennet_Victim_06_03");	//Какой-то Лотар, по-моему. Ну, я не знаю, я не уверен.
	AI_Output(self,other,"DIA_Bennet_Victim_06_04");	//Тебе лучше спросить лорда Хагена, ему известны все детали.
	b_logentry(TOPIC_RESCUEBENNET,"Лотар, один из паладинов, был убит. Лорд Хаген, возможно, сможет рассказать мне подробнее об этом деле, ведь именно он ведет расследование.");
};


instance DIA_BENNET_EVIDENCE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_evidence_condition;
	information = dia_bennet_evidence_info;
	permanent = FALSE;
	description = "У них есть доказательства против тебя?";
};


func int dia_bennet_evidence_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bennet_whyprison))
	{
		return TRUE;
	};
};

func void dia_bennet_evidence_info()
{
	AI_Output(other,self,"DIA_Bennet_Evidence_15_00");	//У них есть доказательства против тебя?
	AI_Output(self,other,"DIA_Bennet_Evidence_06_01");	//Говорят, есть свидетель, который опознал меня.
	AI_Output(other,self,"DIA_Bennet_Evidence_15_02");	//Ты знаешь, кто этот свидетель?
	AI_Output(self,other,"DIA_Bennet_Evidence_06_03");	//Нет. Я знаю только, что он лжет.
	b_logentry(TOPIC_RESCUEBENNET,"Есть свидетель, утверждающий, что видел, как это сделал Беннет. Я должен найти этого свидетеля, если я хочу выяснить правду.");
	RESCUEBENNET_KNOWSWITNESS = TRUE;
};


instance DIA_BENNET_INVESTIGATION(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_investigation_condition;
	information = dia_bennet_investigation_info;
	permanent = FALSE;
	description = "Кто ведет расследование?";
};


func int dia_bennet_investigation_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bennet_evidence))
	{
		return TRUE;
	};
};

func void dia_bennet_investigation_info()
{
	AI_Output(other,self,"DIA_Bennet_Investigation_15_00");	//Кто ведет расследование?
	AI_Output(self,other,"DIA_Bennet_Investigation_06_01");	//Сам лорд Хаген. Так как был убит один из паладинов, это дело подпадает под закон о военном положении.
	AI_Output(other,self,"DIA_Bennet_Investigation_15_02");	//Что это означает?
	AI_Output(self,other,"DIA_Bennet_Investigation_06_03");	//Это легко предположить. Если меня не вытащить отсюда, то я буду повешен без долгих разговоров.
	AI_Output(self,other,"DIA_Bennet_Investigation_06_04");	//Ты должен помочь мне, или начнется война. Ли не отставит это просто так.
	AI_Output(self,other,"DIA_Bennet_Investigation_06_05");	//Ты сам понимаешь, что это значит.
};


instance DIA_BENNET_THANKYOU(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_thankyou_condition;
	information = dia_bennet_thankyou_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bennet_thankyou_condition()
{
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_bennet_thankyou_info()
{
	if(hero.guild == GIL_SLD)
	{
		other.guild = GIL_DJG;
		Npc_SetTrueGuild(other,GIL_DJG);
	};
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_00");	//Ох, а я уж думал, что меня наверняка повесят!
	AI_Output(other,self,"DIA_Bennet_ThankYou_15_01");	//Что ж, в конце концов, все окончилось хорошо.
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_02");	//Да уж. Ты бы видел выражение лица солдата, который выпускал меня!
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_03");	//(смеется) Он был так напуган, что чуть не наложил в штаны.
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_04");	//Да, чуть не забыл. У меня есть кое-что для тебя.
	AI_Output(other,self,"DIA_Bennet_ThankYou_15_05");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_06");	//(ухмыляется) Презент.
};


instance DIA_BENNET_PRESENT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_present_condition;
	information = dia_bennet_present_info;
	permanent = FALSE;
	description = "Какой презент?";
};


func int dia_bennet_present_condition()
{
	if(Npc_KnowsInfo(other,dia_bennet_thankyou))
	{
		return TRUE;
	};
};

func void dia_bennet_present_info()
{
	AI_Output(other,self,"DIA_Bennet_Present_15_00");	//Какой презент?
	AI_Output(self,other,"DIA_Bennet_Present_06_01");	//Мы все слышали о драконах, которые вроде бы появились в Долине.
	AI_Output(other,self,"DIA_Bennet_Present_15_02");	//Они действительно там!
	AI_Output(self,other,"DIA_Bennet_Present_06_03");	//Хорошо, я верю тебе.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Bennet_Present_06_04");	//Как бы там ни было, некоторые из парней решили отправиться в Долину.
		AI_Output(self,other,"DIA_Bennet_Present_06_05");	//(ухмыляется) Они собираются навести там порядок.
		AI_Output(other,self,"DIA_Bennet_Present_15_06");	//А какое это имеет отношение ко мне?
		AI_Output(self,other,"DIA_Bennet_Present_06_07");	//(гордо) Я разработал новый тип доспехов. Доспехи охотника на драконов!
		AI_Output(self,other,"DIA_Bennet_Present_06_08");	//Они прочнее и легче, чем традиционные доспехи.
		AI_Output(self,other,"DIA_Bennet_Present_06_09");	//Так как ты спас меня, я хочу, чтобы ты получил первый экземпляр. Это подарок!
		CreateInvItems(self,itar_djg_l,1);
		b_giveinvitems(self,other,itar_djg_l,1);
		AI_Output(self,other,"DIA_Bennet_Present_06_10");	//Я подумал, что, возможно, тебе тоже захочется позабавиться там. Тебе понадобится хорошее снаряжение, когда ты отправишься в эту долину.
		AI_Output(self,other,"DIA_Bennet_Present_06_11");	//Также, мне интересны драконьи чешуйки. Настоящие драконьи чешуйки. Я хорошо заплачу тебе за них.
		AI_Output(other,self,"DIA_Bennet_Present_15_12");	//Сколько я получу за чешуйку?
		b_say_gold(self,other,VALUE_DRAGONSCALE);
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_Present_06_13");	//Ладно, я думаю, ты наверняка захочешь поучаствовать в готовящейся охоте на драконов.
		AI_Output(other,self,"DIA_Bennet_Present_15_14");	//И?
		AI_Output(self,other,"DIA_Bennet_Present_06_15");	//Вот, возьми этот амулет. Тебе он нужнее, чем мне.
		CreateInvItems(self,itam_hp_01,1);
		b_giveinvitems(self,other,itam_hp_01,1);
	};
};


var int bennet_dragonscale_counter;
var int show_djg_armor_m;

instance DIA_BENNET_DRAGONSCALE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_dragonscale_condition;
	information = dia_bennet_dragonscale_info;
	permanent = TRUE;
	description = "Я принес тебе несколько драконьих чешуек.";
};


func int dia_bennet_dragonscale_condition()
{
	if((Npc_HasItems(other,itat_dragonscale) > 0) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_bennet_dragonscale_info()
{
	AI_Output(other,self,"DIA_Bennet_DragonScale_15_00");	//Я принес тебе несколько драконьих чешуек.
	AI_Output(self,other,"DIA_Bennet_DragonScale_06_01");	//Настоящая чешуя дракона!
	AI_Output(self,other,"DIA_Bennet_DragonScale_06_02");	//Вот твое золото!
	BENNET_DRAGONSCALE_COUNTER = BENNET_DRAGONSCALE_COUNTER + Npc_HasItems(other,itat_dragonscale);
	b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_dragonscale) * VALUE_DRAGONSCALE);
	b_giveinvitems(other,self,itat_dragonscale,Npc_HasItems(other,itat_dragonscale));
	if((BENNET_DRAGONSCALE_COUNTER >= 20) && (SHOW_DJG_ARMOR_M == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_DragonScale_06_03");	//Хорошо, этого должно быть достаточно. Я могу продать тебе новые, улучшенные доспехи, если, конечно, тебе это интересно.
		SHOW_DJG_ARMOR_M = TRUE;
	};
};


var int bennet_dia_bennet_djg_armor_m_permanent;

instance DIA_BENNET_DJG_ARMOR_M(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_djg_armor_m_condition;
	information = dia_bennet_djg_armor_m_info;
	permanent = TRUE;
	description = "Средние доспехи охотника на драконов: Защита: оружие 80, стрелы 80. (12000 золота)";
};


func int dia_bennet_djg_armor_m_condition()
{
	if((BENNET_DIA_BENNET_DJG_ARMOR_M_PERMANENT == FALSE) && (hero.guild == GIL_DJG) && (SHOW_DJG_ARMOR_M == TRUE))
	{
		return TRUE;
	};
};

func void dia_bennet_djg_armor_m_info()
{
	AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_M_15_00");	//Я хочу купить доспехи.
	if(Npc_HasItems(other,itmi_gold) >= 12000)
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_01");	//Очень хорошо. Уверен, они тебя не разочаруют.
		AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_M_15_02");	//Да уж, за такую-то цену...
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_03");	//Ты проймешь, что они стоят этих денег.
		b_giveinvitems(other,self,itmi_gold,12000);
		CreateInvItems(self,itar_djg_m,1);
		b_giveinvitems(self,other,itar_djg_m,1);
		BENNET_DIA_BENNET_DJG_ARMOR_M_PERMANENT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_04");	//У тебя недостаточно золота.
	};
};


instance DIA_BENNET_BETTERARMOR(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_betterarmor_condition;
	information = dia_bennet_betterarmor_info;
	permanent = FALSE;
	description = "Я знаю, как можно еще улучшить доспехи.";
};


func int dia_bennet_betterarmor_condition()
{
	if((PLAYERGETSFINALDJGARMOR == TRUE) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_bennet_betterarmor_info()
{
	AI_Output(other,self,"DIA_Bennet_BetterArmor_15_00");	//Я знаю, как можно еще улучшить доспехи.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_01");	//(ухмыляется про себя) Ну расскажи мне.
	AI_Output(other,self,"DIA_Bennet_BetterArmor_15_02");	//Можно покрыть драконьи чешуйки магической рудой.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_03");	//(смеется) Эта мысль приходила и ко мне. Да, ты прав.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_04");	//Мои новые доспехи превосходят все, что ты когда-либо видел. Они очень легкие и очень прочные.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_05");	//Они СОВЕРШЕННЫ.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_06");	//Ты можешь купить их, если хочешь. Я не предложил бы их абы кому, а цена только-только покрывает стоимость производства.
};


var int bennet_dia_bennet_djg_armor_h_permanent;

instance DIA_BENNET_DJG_ARMOR_H(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_djg_armor_h_condition;
	information = dia_bennet_djg_armor_h_info;
	permanent = TRUE;
	description = "Тяжелые доспехи охотника на драконов: Защита: оружие 90, стрелы 90. (20000 золота)";
};


func int dia_bennet_djg_armor_h_condition()
{
	if((BENNET_DIA_BENNET_DJG_ARMOR_H_PERMANENT == FALSE) && (hero.guild == GIL_DJG) && Npc_KnowsInfo(other,dia_bennet_betterarmor))
	{
		return TRUE;
	};
};

func void dia_bennet_djg_armor_h_info()
{
	AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_H_15_00");	//Дай мне доспехи.
	if(Npc_HasItems(other,itmi_gold) >= 20000)
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_01");	//Это лучшие доспехи из того, что я когда-либо делал.
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_02");	//Настоящее произведение искусства.
		b_giveinvitems(other,self,itmi_gold,20000);
		CreateInvItems(self,itar_djg_h,1);
		b_giveinvitems(self,other,itar_djg_h,1);
		BENNET_DIA_BENNET_DJG_ARMOR_H_PERMANENT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_03");	//У тебя недостаточно золота.
	};
};


instance DIA_BENNET_REPAIRNECKLACE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_repairnecklace_condition;
	information = dia_bennet_repairnecklace_info;
	permanent = FALSE;
	description = "Ты можешь ремонтировать ювелирные изделия?";
};


func int dia_bennet_repairnecklace_condition()
{
	if((MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)))
	{
		return TRUE;
	};
};

func void dia_bennet_repairnecklace_info()
{
	AI_Output(other,self,"DIA_Bennet_RepairNecklace_15_00");	//Ты можешь ремонтировать ювелирные изделия?
	AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_01");	//Может быть. Ты должен сначала показать мне их.
	if(MIS_RESCUEBENNET != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_02");	//Также мне сначала нужно выбраться отсюда.
		AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_03");	//Без этого я не смогу ничего сделать, это очевидно.
	};
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
};


instance DIA_BENNET_SHOWINNOSEYE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_showinnoseye_condition;
	information = dia_bennet_showinnoseye_info;
	permanent = FALSE;
	description = "Ты можешь взглянуть на этот амулет?";
};


func int dia_bennet_showinnoseye_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_broken_mis) && (MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_showinnoseye_info()
{
	AI_Output(other,self,"DIA_Bennet_ShowInnosEye_15_00");	//Ты можешь взглянуть на этот амулет?
	AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_01");	//Конечно, давай посмотрим.
	AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_02");	//Хммм, превосходная работа. Оправа сломана. Но, думаю, впрочем, я смогу починить ее.
	AI_Output(other,self,"DIA_Bennet_ShowInnosEye_15_03");	//Сколько это займет времени?
	if(MIS_RESCUEBENNET != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_04");	//Ну, я застрял здесь пока. Или ты где-то здесь видишь кузницу?
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_05");	//Если бы я был в своей кузнице, я мог бы сделать это за один день. Но, конечно же, сначала мне нужно выбраться отсюда.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_06");	//Если ты оставишь его мне, к завтрашнему утру он будет как новенький.
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_07");	//И я даже не возьму с тебя денег за эту работу. Ведь это ты вытащил меня из тюрьмы.
	};
	b_logentry(TOPIC_INNOSEYE,"Беннет - кузнец, который нужен мне, чтобы починить амулет.");
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
};


instance DIA_BENNET_GIVEINNOSEYE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_giveinnoseye_condition;
	information = dia_bennet_giveinnoseye_info;
	permanent = FALSE;
	description = "Вот амулет, пожалуйста, почини его.";
};


func int dia_bennet_giveinnoseye_condition()
{
	if((Npc_HasItems(other,itmi_innoseye_broken_mis) >= 1) && (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE) && (MIS_RESCUEBENNET == LOG_SUCCESS) && (MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_giveinnoseye_info()
{
	AI_Output(other,self,"DIA_Bennet_GiveInnosEye_15_00");	//Вот амулет, пожалуйста, почини его.
	AI_Output(self,other,"DIA_Bennet_GiveInnosEye_06_01");	//Хорошо. Я закончу работу к завтрашнему утру.
	AI_Output(self,other,"DIA_Bennet_GiveInnosEye_06_02");	//Заходи завтра, и заберешь его.
	Npc_RemoveInvItems(other,itmi_innoseye_broken_mis,1);
	AI_PrintScreen(PRINT_INNOSEYEGIVEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	BENNET_REPAIRDAY = Wld_GetDay();
};


instance DIA_BENNET_GETINNOSEYE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_getinnoseye_condition;
	information = dia_bennet_getinnoseye_info;
	permanent = TRUE;
	description = "Амулет готов?";
};


func int dia_bennet_getinnoseye_condition()
{
	if(Npc_KnowsInfo(other,dia_bennet_giveinnoseye) && (MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_getinnoseye_info()
{
	AI_Output(other,self,"DIA_Bennet_GetInnosEye_15_00");	//Амулет готов?
	if(BENNET_REPAIRDAY < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_01");	//Да, держи.
		TEXT_INNOSEYE_SETTING = TEXT_INNOSEYE_SETTING_REPAIRED;
		CreateInvItems(other,itmi_innoseye_broken_mis,1);
		AI_PrintScreen(PRINT_INNOSEYEGET,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_02");	//Мне пришлось сделать новую оправу для камня.
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_03");	//Я работал всю ночь, и теперь он как новенький.
		b_logentry(TOPIC_INNOSEYE,"Амулет опять как новенький. Беннет проделал отличную работу.");
		MIS_BENNET_INNOSEYEREPAIREDSETTING = LOG_SUCCESS;
		b_giveplayerxp(XP_INNOSEYEISREPAIRED);
	}
	else
	{
		b_saybennetlater();
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_05");	//Если ты будешь продолжать мешать мне, это только задержит работу.
		AI_StopProcessInfos(self);
	};
};


instance DIA_BENNET_KAP4_EXIT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 999;
	condition = dia_bennet_kap4_exit_condition;
	information = dia_bennet_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bennet_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_bennet_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_DRACHENEIER(C_INFO)
{
	npc = sld_809_bennet;
	nr = 5;
	condition = dia_bennet_dracheneier_condition;
	information = dia_bennet_dracheneier_info;
	permanent = TRUE;
	description = "Ты можешь что-нибудь сделать с драконьими яйцами?";
};


func int dia_bennet_dracheneier_condition()
{
	if((KAPITEL >= 4) && (BENNETSDRAGONEGGOFFER == 0) && (Npc_HasItems(other,itat_dragonegg_mis) >= 1) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};


var int bennetsdragoneggoffer;
var int dracheneier_angebotenxp_onetime;

func void dia_bennet_dracheneier_info()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_00");	//Ты можешь что-нибудь сделать с драконьими яйцами?
	if(DRACHENEIER_ANGEBOTENXP_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_01");	//Драконьи яйца? Где, черт возьми, тебе удалось добыть их?
		AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_02");	//Я забрал их у людей-ящеров.
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_03");	//Давай посмотрим.
	};
	Npc_RemoveInvItems(other,itat_dragonegg_mis,1);
	AI_PrintScreen(PRINT_ITEMGEGEBEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	if(DRACHENEIER_ANGEBOTENXP_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_04");	//Ммм. Очень твердый материал. Идеально подходит для доспехов. Если только удастся открыть их.
		AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_05");	//Ну и как? Они нужны тебе?
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_06");	//Конечно! Давай сюда.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_07");	//Ну и сколько еще ты собираешься вертеть их у меня перед носом? Ты продашь их или нет?
	};
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_08");	//Я заплачу тебе, ммм, скажем, 300 золотых за каждое яйцо, что ты принесешь мне.
	Info_ClearChoices(dia_bennet_dracheneier);
	Info_AddChoice(dia_bennet_dracheneier,"Тогда можешь оставить золото себе. Я пока попридержу эти яйца.",dia_bennet_dracheneier_nein);
	Info_AddChoice(dia_bennet_dracheneier,"Это яйца дракона, а не какие-нибудь куриные.",dia_bennet_dracheneier_mehr);
	Info_AddChoice(dia_bennet_dracheneier,"Договорились.",dia_bennet_dracheneier_ok);
	if(DRACHENEIER_ANGEBOTENXP_ONETIME == FALSE)
	{
		b_logentry(TOPIC_DRACHENEIER,"Беннет готов дать за драконьи яйца, которые найду, хорошую цену.");
		b_giveplayerxp(XP_DJG_BRINGDRAGONEGG);
		DRACHENEIER_ANGEBOTENXP_ONETIME = TRUE;
	};
};

func void dia_bennet_dracheneier_ok()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_ok_15_00");	//Договорились.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_01");	//Отлично.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_02");	//Если найдешь еще, неси их сюда.
	if(BENNETSDRAGONEGGOFFER != 350)
	{
		BENNETSDRAGONEGGOFFER = 300;
	};
	CreateInvItems(self,itmi_gold,BENNETSDRAGONEGGOFFER);
	b_giveinvitems(self,other,itmi_gold,BENNETSDRAGONEGGOFFER);
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_03");	//Эээ. Ты сказал, что забрал их у людей-ящеров?
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_ok_15_04");	//Точно.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_05");	//Насколько я знаю, люди-ящеры обычно обитают в пещерах.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_06");	//Я не удивлюсь, если тебе удастся найти еще яйца в пещерах неподалеку.
	b_logentry(TOPIC_DRACHENEIER,"Беннет полагает, что мне стоит поискать яйца в пещерах Хориниса. Во многих из них, по слухам, видели человекоящеров.");
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_07");	//Вот. Возьми эту карту. Она поможет тебе найти пещеры.
	CreateInvItems(self,itwr_map_caves_mis,1);
	b_giveinvitems(self,other,itwr_map_caves_mis,1);
	b_logentry(TOPIC_DRACHENEIER,"Он дал мне карту пещер, возможно, она поможет мне.");
	if(1 == 2)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_08");	//Но сначала ты должен взять карту пещер у картографа в городе. Будет жаль, если ты найдешь не все яйца.
		b_logentry(TOPIC_DRACHENEIER,"Я должен купить карту пещер у картографа в городе, чтобы быть уверенным, что я не пропущу часть яиц.");
	};
	Info_ClearChoices(dia_bennet_dracheneier);
};

func void dia_bennet_dracheneier_mehr()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_mehr_15_00");	//Это яйца дракона, а не какие-нибудь куриные.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_mehr_06_01");	//(сердито) Хорошо. 350 и точка. Я не могу дать тебе больше - иначе это дело не окупится.
	BENNETSDRAGONEGGOFFER = 350;
};

func void dia_bennet_dracheneier_nein()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_nein_15_00");	//Тогда можешь оставить золото себе. Я пока попридержу эти яйца.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_nein_06_01");	//Дай мне знать, если передумаешь.
	CreateInvItems(other,itat_dragonegg_mis,1);
	AI_PrintScreen(PRINT_ITEMERHALTEN,-1,YPOS_ITEMTAKEN,FONT_SCREENSMALL,2);
	BENNETSDRAGONEGGOFFER = 0;
	Info_ClearChoices(dia_bennet_dracheneier);
};


instance DIA_BENNET_EIERBRINGEN(C_INFO)
{
	npc = sld_809_bennet;
	nr = 5;
	condition = dia_bennet_eierbringen_condition;
	information = dia_bennet_eierbringen_info;
	permanent = TRUE;
	description = "Нужны еще драконьи яйца?";
};


func int dia_bennet_eierbringen_condition()
{
	if((BENNETSDRAGONEGGOFFER > 0) && (KAPITEL >= 4) && (Npc_HasItems(other,itat_dragonegg_mis) >= 1) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};


var int dragoneggcounter;

func void dia_bennet_eierbringen_info()
{
	var int dragoneggcount;
	var int xp_djg_bringdragoneggs;
	var int dragonegggeld;
	var string concattext;
	AI_Output(other,self,"DIA_Bennet_EierBringen_15_00");	//Нужны еще драконьи яйца?
	AI_Output(self,other,"DIA_Bennet_EierBringen_06_01");	//Конечно!
	dragoneggcount = Npc_HasItems(other,itat_dragonegg_mis);
	if(dragoneggcount == 1)
	{
		AI_Output(other,self,"DIA_Bennet_EierBringen_15_02");	//Вот. Я принес еще одно.
		b_giveplayerxp(XP_DJG_BRINGDRAGONEGG);
		Npc_RemoveInvItems(other,itat_dragonegg_mis,1);
		AI_PrintScreen(PRINT_ITEMGEGEBEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
		DRAGONEGGCOUNTER = DRAGONEGGCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Bennet_EierBringen_15_03");	//Я принес еще несколько.
		Npc_RemoveInvItems(other,itat_dragonegg_mis,dragoneggcount);
		concattext = ConcatStrings(IntToString(dragoneggcount),PRINT_ITEMSGEGEBEN);
		AI_PrintScreen(concattext,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
		xp_djg_bringdragoneggs = dragoneggcount * XP_DJG_BRINGDRAGONEGG;
		DRAGONEGGCOUNTER = DRAGONEGGCOUNTER + dragoneggcount;
		b_giveplayerxp(xp_djg_bringdragoneggs);
	};
	if(DRAGONEGGCOUNTER <= 7)
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_04");	//Отлично. Давай сюда. Ты везде посмотрел, а? Наверняка где-то должны быть еще.
	}
	else if(DRAGONEGGCOUNTER <= 11)
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_05");	//Где ты раскопал их? Вряд ли где-нибудь еще остались эти яйца.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_06");	//Я не думаю, что ты найдешь еще яйца. К тому же, мне и этих достаточно. Я даже не знаю, что я буду делать со всеми ними.
		TOPIC_END_DRACHENEIER = TRUE;
	};
	AI_Output(self,other,"DIA_Bennet_EierBringen_06_07");	//Ох, хорошо. Вот твои деньги.
	dragonegggeld = dragoneggcount * BENNETSDRAGONEGGOFFER;
	CreateInvItems(self,itmi_gold,dragonegggeld);
	b_giveinvitems(self,other,itmi_gold,dragonegggeld);
};


instance DIA_BENNET_KAP5_EXIT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 999;
	condition = dia_bennet_kap5_exit_condition;
	information = dia_bennet_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bennet_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_bennet_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_KNOWWHEREENEMY(C_INFO)
{
	npc = sld_809_bennet;
	nr = 55;
	condition = dia_bennet_knowwhereenemy_condition;
	information = dia_bennet_knowwhereenemy_info;
	permanent = TRUE;
	description = "Мне нужно плыть на другой остров. Мне бы пригодился кузнец.";
};


func int dia_bennet_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (BENNET_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_bennet_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_00");	//Мне нужно плыть на другой остров. Мне бы пригодился кузнец.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_01");	//И ты подумал обо мне?
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_02");	//Да. Что скажешь? По крайней мере, ты сможешь выбраться отсюда.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_03");	//Это лучше, чем работать на ферме Онара. Парень, даже ад ЛУЧШЕ, чем здесь. Ты можешь рассчитывать на меня.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Беннет готов отправляться немедленно. Кузнец он непревзойденный. Я уверен, что смогу многому научиться у него.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_04");	//Моя команда сейчас полностью укомплектована.
		AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_05");	//Тогда уволь кого-нибудь из нее.
	}
	else
	{
		Info_ClearChoices(dia_bennet_knowwhereenemy);
		Info_AddChoice(dia_bennet_knowwhereenemy,"Я дам тебе знать, когда ты мне понадобишься.",dia_bennet_knowwhereenemy_no);
		Info_AddChoice(dia_bennet_knowwhereenemy,"Будь моим кузнецом. Увидимся в гавани. ",dia_bennet_knowwhereenemy_yes);
	};
};

func void dia_bennet_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_Yes_15_00");	//Будь моим кузнецом. Увидимся в гавани.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_Yes_06_01");	//Хорошо. Увидимся позже.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	self.flags = NPC_FLAG_IMMORTAL;
	BENNET_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_bennet_knowwhereenemy);
};

func void dia_bennet_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_No_15_00");	//Я дам тебе знать, когда ты мне понадобишься.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_No_06_01");	//Отлично. Я буду здесь.
	BENNET_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_bennet_knowwhereenemy);
};


instance DIA_BENNET_LEAVEMYSHIP(C_INFO)
{
	npc = sld_809_bennet;
	nr = 55;
	condition = dia_bennet_leavemyship_condition;
	information = dia_bennet_leavemyship_info;
	permanent = TRUE;
	description = "Я хочу найти себе другого кузнеца.";
};


func int dia_bennet_leavemyship_condition()
{
	if((BENNET_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_bennet_leavemyship_info()
{
	AI_Output(other,self,"DIA_Bennet_LeaveMyShip_15_00");	//Я хочу найти себе другого кузнеца.
	AI_Output(self,other,"DIA_Bennet_LeaveMyShip_06_01");	//Сейчас ты думаешь одно, через минуту - другое. Ты не мог бы определиться, а? Когда будешь твердо уверен в том, чего ты хочешь, дай мне знать.
	BENNET_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_BENNET_STILLNEEDYOU(C_INFO)
{
	npc = sld_809_bennet;
	nr = 55;
	condition = dia_bennet_stillneedyou_condition;
	information = dia_bennet_stillneedyou_info;
	permanent = TRUE;
	description = "Возвращайся, я не могу найти другого кузнеца.";
};


func int dia_bennet_stillneedyou_condition()
{
	if(((BENNET_ISONBOARD == LOG_OBSOLETE) || (BENNET_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_bennet_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Bennet_StillNeedYou_15_00");	//Возвращайся, я не могу найти другого кузнеца.
	AI_Output(self,other,"DIA_Bennet_StillNeedYou_06_01");	//(сердито) Хорошо! Всякий может издеваться над простым кузнецом! Увидимся в гавани.
	self.flags = NPC_FLAG_IMMORTAL;
	BENNET_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	AI_StopProcessInfos(self);
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_BENNET_PICKPOCKET(C_INFO)
{
	npc = sld_809_bennet;
	nr = 900;
	condition = dia_bennet_pickpocket_condition;
	information = dia_bennet_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_bennet_pickpocket_condition()
{
	return c_beklauen(35,45);
};

func void dia_bennet_pickpocket_info()
{
	Info_ClearChoices(dia_bennet_pickpocket);
	Info_AddChoice(dia_bennet_pickpocket,DIALOG_BACK,dia_bennet_pickpocket_back);
	Info_AddChoice(dia_bennet_pickpocket,DIALOG_PICKPOCKET,dia_bennet_pickpocket_doit);
};

func void dia_bennet_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bennet_pickpocket);
};

func void dia_bennet_pickpocket_back()
{
	Info_ClearChoices(dia_bennet_pickpocket);
};

