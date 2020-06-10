
instance DIA_ABUYIN_EXIT(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 999;
	condition = dia_abuyin_exit_condition;
	information = dia_abuyin_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_abuyin_exit_condition()
{
	return TRUE;
};

func void dia_abuyin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ABUYIN_PICKPOCKET(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 900;
	condition = dia_abuyin_pickpocket_condition;
	information = dia_abuyin_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_abuyin_pickpocket_condition()
{
	return c_beklauen(75,200);
};

func void dia_abuyin_pickpocket_info()
{
	Info_ClearChoices(dia_abuyin_pickpocket);
	Info_AddChoice(dia_abuyin_pickpocket,DIALOG_BACK,dia_abuyin_pickpocket_back);
	Info_AddChoice(dia_abuyin_pickpocket,DIALOG_PICKPOCKET,dia_abuyin_pickpocket_doit);
};

func void dia_abuyin_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_abuyin_pickpocket);
};

func void dia_abuyin_pickpocket_back()
{
	Info_ClearChoices(dia_abuyin_pickpocket);
};


instance DIA_ABUYIN_HALLO(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_hallo_condition;
	information = dia_abuyin_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_abuyin_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_abuyin_hallo_info()
{
	AI_Output(self,other,"DIA_Abuyin_Hallo_13_00");	//Приветствую тебя мой друг. Присядь на мой скромный коврик и насладись дымом из моей трубки.
};


instance DIA_ABUYIN_DU(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_du_condition;
	information = dia_abuyin_du_info;
	permanent = FALSE;
	description = "Кто ты?";
};


func int dia_abuyin_du_condition()
{
	return TRUE;
};

func void dia_abuyin_du_info()
{
	AI_Output(other,self,"DIA_Abuyin_du_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Abuyin_du_13_01");	//Меня зовут Абуин ибн Джадир ибн Омар Халид бен Хаджи аль Шариди. Я пророк и предсказатель, астролог и торговец табаком.
};


instance DIA_ABUYIN_KRAUT(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_kraut_condition;
	information = dia_abuyin_kraut_info;
	permanent = FALSE;
	description = "Что за табак ты предлагаешь?";
};


func int dia_abuyin_kraut_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du))
	{
		return TRUE;
	};
};

func void dia_abuyin_kraut_info()
{
	AI_Output(other,self,"DIA_Abuyin_Kraut_15_00");	//Что за табак ты предлагаешь?
	AI_Output(self,other,"DIA_Abuyin_Kraut_13_01");	//Мои трубки набиты острым, освежающим яблочным табаком.
	AI_Output(self,other,"DIA_Abuyin_Kraut_13_02");	//Выбирай, что хочешь, Сын Приключений.
};


instance DIA_ABUYIN_ANDEREN(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_anderen_condition;
	information = dia_abuyin_anderen_info;
	permanent = FALSE;
	description = "А у тебя есть другой табак?";
};


func int dia_abuyin_anderen_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_kraut))
	{
		return TRUE;
	};
};

func void dia_abuyin_anderen_info()
{
	AI_Output(other,self,"DIA_Abuyin_anderen_15_00");	//А у тебя есть другой табак?
	AI_Output(self,other,"DIA_Abuyin_anderen_13_01");	//Я предлагаю только лучший табак. Эта яблочная смесь - симфония моей родины - южных островов.
	AI_Output(self,other,"DIA_Abuyin_anderen_13_02");	//Но, конечно же, я всегда готов попробовать другой сорт табака - если кто-нибудь сумеет приготовить действительно хороший табак.
	AI_Output(other,self,"DIA_Abuyin_anderen_15_03");	//А как это делается?
	AI_Output(self,other,"DIA_Abuyin_anderen_13_04");	//Возьми за основу яблочный табак. И попробуй добавлять в него различные ингредиенты.
	AI_Output(self,other,"DIA_Abuyin_anderen_13_05");	//Это делается на алхимическом столе, если, конечно ты имеешь навыки в алхимии.
};


instance DIA_ABUYIN_WOHER(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_woher_condition;
	information = dia_abuyin_woher_info;
	permanent = FALSE;
	description = "Где мне взять яблочный табак?";
};


func int dia_abuyin_woher_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_anderen))
	{
		return TRUE;
	};
};

func void dia_abuyin_woher_info()
{
	AI_Output(other,self,"DIA_Abuyin_Woher_15_00");	//Где мне взять яблочный табак?
	AI_Output(self,other,"DIA_Abuyin_Woher_13_01");	//Я дам тебе две порции. А там делай с ними, что тебе захочется.
	AI_Output(self,other,"DIA_Abuyin_Woher_13_02");	//Если тебе понадобится еще табак, то направь свои стопы к Зурису, Мастеру Зелий. Он производит этот табак и продает его.
	b_giveinvitems(self,other,itmi_apfeltabak,2);
};

func void b_tabakprobieren()
{
	AI_Output(self,other,"DIA_Abuyin_Mischung_Nichts_13_00");	//Позволь мне попробовать твой табак.
	CreateInvItems(self,itmi_joint,1);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Nichts_13_01");	//Нет, этот аромат мне не очень нравится. Но, может быть, ты найдешь кого-нибудь, кто оценит его... э-э... утонченность.
};


instance DIA_ABUYIN_MISCHUNG(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 10;
	condition = dia_abuyin_mischung_condition;
	information = dia_abuyin_mischung_info;
	permanent = TRUE;
	description = "Я принес новый сорт табака...";
};


func int dia_abuyin_mischung_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_anderen) && (ABUYIN_HONIGTABAK == FALSE) && ((Npc_HasItems(other,itmi_sumpftabak) >= 1) || (Npc_HasItems(other,itmi_pilztabak) >= 1) || (Npc_HasItems(other,itmi_doppeltabak) >= 1) || (Npc_HasItems(other,itmi_honigtabak) >= 1)))
	{
		return TRUE;
	};
};

func void dia_abuyin_mischung_info()
{
	AI_Output(other,self,"DIA_Abuyin_Mischung_15_00");	//Я принес новый сорт табака...
	Info_ClearChoices(dia_abuyin_mischung);
	Info_AddChoice(dia_abuyin_mischung,DIALOG_BACK,dia_abuyin_mischung_back);
	if(Npc_HasItems(other,itmi_sumpftabak) >= 1)
	{
		Info_AddChoice(dia_abuyin_mischung,"Травяной табак",dia_abuyin_mischung_sumpf);
	};
	if(Npc_HasItems(other,itmi_pilztabak) >= 1)
	{
		Info_AddChoice(dia_abuyin_mischung,"Грибной табак",dia_abuyin_mischung_pilz);
	};
	if(Npc_HasItems(other,itmi_doppeltabak) >= 1)
	{
		Info_AddChoice(dia_abuyin_mischung,"Двойное яблоко",dia_abuyin_mischung_doppel);
	};
	if(Npc_HasItems(other,itmi_honigtabak) >= 1)
	{
		Info_AddChoice(dia_abuyin_mischung,"Медовый табак",dia_abuyin_mischung_super);
	};
};

func void dia_abuyin_mischung_back()
{
	Info_ClearChoices(dia_abuyin_mischung);
};

func void dia_abuyin_mischung_sumpf()
{
	b_giveinvitems(other,self,itmi_sumpftabak,1);
	b_tabakprobieren();
	Info_ClearChoices(dia_abuyin_mischung);
};

func void dia_abuyin_mischung_pilz()
{
	b_giveinvitems(other,self,itmi_pilztabak,1);
	b_tabakprobieren();
	Info_ClearChoices(dia_abuyin_mischung);
};

func void dia_abuyin_mischung_doppel()
{
	b_giveinvitems(other,self,itmi_doppeltabak,1);
	b_tabakprobieren();
	Info_ClearChoices(dia_abuyin_mischung);
};

func void dia_abuyin_mischung_super()
{
	b_giveinvitems(other,self,itmi_honigtabak,1);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_00");	//Давай я попробую твой табак.
	CreateInvItems(self,itmi_joint,1);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_01");	//Это невероятно! В жизни ничего подобного не пробовал!
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_02");	//Как ты приготовил его?
	AI_Output(other,self,"DIA_Abuyin_Mischung_Super_15_03");	//Я смешал обычный табак с медом.
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_04");	//Ты хорошо поработал, о, Отец Искусства Смешения. Я с превеликим удовольствием набью им свои презренные трубки.
	AI_Output(other,self,"DIA_Abuyin_Mischung_Super_15_05");	//Ну, набей.
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_06");	//Спасибо тебе, о, Сын Великодушия. Ни одна другая смесь не сравнится с твоим творением. Я готов покупать все, что ты сможешь принести мне.
	ABUYIN_HONIGTABAK = TRUE;
	b_giveplayerxp(XP_AMBIENT * 2);
	Info_ClearChoices(dia_abuyin_mischung);
};


instance DIA_ABUYIN_TRADE(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_trade_condition;
	information = dia_abuyin_trade_info;
	permanent = TRUE;
	description = "Я принес тебе медового табака.";
};


func int dia_abuyin_trade_condition()
{
	if((ABUYIN_HONIGTABAK == TRUE) && (Npc_HasItems(other,itmi_honigtabak) >= 1))
	{
		return TRUE;
	};
};

func void dia_abuyin_trade_info()
{
	ABUYIN_SCORE = 0;
	ABUYIN_SCORE = Npc_HasItems(other,itmi_honigtabak) * VALUE_ITMI_HONIGTABAK;
	AI_Output(other,self,"DIA_Abuyin_Trade_15_00");	//Я принес тебе медового табака.
	b_giveinvitems(other,self,itmi_honigtabak,Npc_HasItems(other,itmi_honigtabak));
	b_giveinvitems(self,other,itmi_gold,ABUYIN_SCORE);
	AI_Output(self,other,"DIA_Abuyin_Trade_13_01");	//Для меня огромное удовольствие иметь с тобой дело.
};


instance DIA_ABUYIN_HERB(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_herb_condition;
	information = dia_abuyin_herb_info;
	permanent = FALSE;
	description = "Тебя не заинтересует этот тюк травы?";
};


func int dia_abuyin_herb_condition()
{
	if(Npc_HasItems(other,itmi_herbpaket) >= 1)
	{
		return TRUE;
	};
};

func void dia_abuyin_herb_info()
{
	AI_Output(other,self,"DIA_Abuyin_Herb_15_00");	//Тебя не заинтересует этот тюк травы?
	AI_Output(self,other,"DIA_Abuyin_Herb_13_01");	//Тюк трав - это не болотная трава, нет? Ох, убери ее, о, Сын Недальновидности.
	AI_Output(self,other,"DIA_Abuyin_Herb_13_02");	//Если городская стража увидит ее у меня, они бросят меня в тюрьму - а тебя будет ждать не лучшая судьба!
	AI_Output(self,other,"DIA_Abuyin_Herb_13_03");	//Если тебе так хочется продать эту траву, послушай моего совета - покинь этот город.
	AI_Output(self,other,"DIA_Abuyin_Herb_13_04");	//Попробуй избавиться от нее где-нибудь за пределами городских стен. А здесь... тебя здесь ждет с ней одна головная боль.
};


instance DIA_ABUYIN_WEISSAGUNG(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung_condition;
	information = dia_abuyin_weissagung_info;
	permanent = FALSE;
	description = "Ты можешь сделать пророчество?";
};


func int dia_abuyin_weissagung_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 1))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung_info()
{
	AI_Output(other,self,"DIA_Abuyin_Weissagung_15_00");	//Ты можешь сделать пророчество?
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_01");	//Я к твоим услугам за скромное вознаграждение, о, Отец Щедрости.
	AI_Output(other,self,"DIA_Abuyin_Weissagung_15_02");	//Сколько ты хочешь?
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_03");	//За какие-то 25 монет я рискну заглянуть для тебя в будущее.
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_04");	//Но помни - будущее всегда неопределенно. Все, что в моих силах - это уловить лишь крошечные фрагменты времени.
};


instance DIA_ABUYIN_ZUKUNFT(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft_condition;
	information = dia_abuyin_zukunft_info;
	permanent = TRUE;
	description = "Расскажи мне о будущем (заплатить 25 золотых).";
};


var int dia_abuyin_zukunft_permanent;

func int dia_abuyin_zukunft_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung) && (DIA_ABUYIN_ZUKUNFT_PERMANENT == FALSE) && (KAPITEL == 1))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft_15_00");	//Расскажи мне о будущем.
	if(b_giveinvitems(other,self,itmi_gold,25))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft_13_01");	//Хорошо, о, Жаждущий Знаний. Я сейчас войду в состояние транса. Ты готов?
		Info_ClearChoices(dia_abuyin_zukunft);
		Info_AddChoice(dia_abuyin_zukunft,"Я готов!",dia_abuyin_zukunft_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft_13_02");	//О, Отец Монет, я прошу у тебя 25 золотых в обмен на взгляд в туманное будущее.
	};
};

func void dia_abuyin_zukunft_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_00");	//(в трансе) Орки... они охраняют вход... старый туннель... Долина Рудников...
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_01");	//(в трансе) Люди в сверкающих доспехах... маг... твой друг с ними... он ждет тебя...
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_02");	//(в трансе) Огонь! Нападение... могучего существа... пламя... многие... погибнут...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_03");	//... Извини - видение кончилось. Больше я ничего не смог увидеть.
	DIA_ABUYIN_ZUKUNFT_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 1;
	Info_ClearChoices(dia_abuyin_zukunft);
	b_giveplayerxp(XP_AMBIENT * 4);
};


instance DIA_ABUYIN_NOCHMAL(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_nochmal_condition;
	information = dia_abuyin_nochmal_info;
	permanent = TRUE;
	description = "Ты можешь дать мне еще одно пророчество?";
};


func int dia_abuyin_nochmal_condition()
{
	if(KAPITEL == ABUYIN_ZUKUNFT)
	{
		return TRUE;
	};
};

func void dia_abuyin_nochmal_info()
{
	AI_Output(other,self,"DIA_Abuyin_Nochmal_15_00");	//Ты можешь дать мне еще одно пророчество?
	AI_Output(self,other,"DIA_Abuyin_Nochmal_13_01");	//О, Сын Загадочного Будущего, сейчас я не в силах приподнять завесу времени.
	AI_Output(self,other,"DIA_Abuyin_Nochmal_13_02");	//Только когда время подаст мне очередной знак, я смогу помочь тебе еще раз.
	if(ABUYIN_ERZAEHLT == FALSE)
	{
		AI_Output(other,self,"DIA_Abuyin_Nochmal_15_03");	//А когда это будет?
		AI_Output(self,other,"DIA_Abuyin_Nochmal_13_04");	//Когда будущее станет настоящим, и ты продолжишь свой путь.
		ABUYIN_ERZAEHLT = TRUE;
	};
};

func void b_abuyin_weissagung()
{
	AI_Output(other,self,"B_Abuyin_Weissagung_15_00");	//Ты можешь сделать пророчество?
	AI_Output(self,other,"B_Abuyin_Weissagung_13_01");	//Да, время ушло вперед, и я могу сделать еще одно пророчество, если у тебя найдется несколько монет.
	AI_Output(other,self,"B_Abuyin_Weissagung_15_02");	//Сколько?
};


instance DIA_ABUYIN_WEISSAGUNG2(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung2_condition;
	information = dia_abuyin_weissagung2_info;
	permanent = FALSE;
	description = "Ты можешь сделать пророчество?";
};


func int dia_abuyin_weissagung2_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung2_info()
{
	b_abuyin_weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung2_13_00");	//За какие-то 100 монет я рискну заглянуть для тебя в будущее.
};


instance DIA_ABUYIN_ZUKUNFT2(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft2_condition;
	information = dia_abuyin_zukunft2_info;
	permanent = TRUE;
	description = "Расскажи мне о будущем (заплатить 100 золотых).";
};


var int dia_abuyin_zukunft2_permanent;

func int dia_abuyin_zukunft2_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung2) && (DIA_ABUYIN_ZUKUNFT2_PERMANENT == FALSE) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft2_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft2_15_00");	//Расскажи мне о будущем.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft2_13_01");	//Хорошо, о, Сын Мужества. Я сейчас войду в состояние транса. Ты готов?
		Info_ClearChoices(dia_abuyin_zukunft2);
		Info_AddChoice(dia_abuyin_zukunft2,"Я готов!",dia_abuyin_zukunft2_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft2_13_02");	//О, Отец Монет, я прошу у тебя 100 золотых в обмен на взгляд в туманное будущее.
	};
};

func void dia_abuyin_zukunft2_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_00");	//(в трансе) Наемник... ему нужен ты... ужасное убийство... Глаз...
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_01");	//(в трансе) Зловещие приспешники... они идут... ищут тебя... страж падет...
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_02");	//(в трансе) ...но трое должны объединиться... только тогда ты получишь то, что должно принадлежать тебе...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_03");	//Это все. Больше я ничего не смог увидеть.
	DIA_ABUYIN_ZUKUNFT2_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 2;
	Info_ClearChoices(dia_abuyin_zukunft2);
	b_giveplayerxp(XP_AMBIENT * 4);
};


instance DIA_ABUYIN_WEISSAGUNG3(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung3_condition;
	information = dia_abuyin_weissagung3_info;
	permanent = FALSE;
	description = "Ты можешь сделать пророчество?";
};


func int dia_abuyin_weissagung3_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung3_info()
{
	b_abuyin_weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung3_13_00");	//За какие-то 250 монет я рискну заглянуть для тебя в будущее.
};


instance DIA_ABUYIN_ZUKUNFT3(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft3_condition;
	information = dia_abuyin_zukunft3_info;
	permanent = TRUE;
	description = "Расскажи мне о будущем (заплатить 250 золотых).";
};


var int dia_abuyin_zukunft3_permanent;

func int dia_abuyin_zukunft3_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung3) && (DIA_ABUYIN_ZUKUNFT3_PERMANENT == FALSE) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft3_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft3_15_00");	//Расскажи мне о будущем.
	if(b_giveinvitems(other,self,itmi_gold,250))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft3_13_01");	//Хорошо, о, Сын Знаний. Я сейчас войду в состояние транса. Ты готов?
		Info_ClearChoices(dia_abuyin_zukunft3);
		Info_AddChoice(dia_abuyin_zukunft3,"Я готов!",dia_abuyin_zukunft3_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft3_13_02");	//О, Отец Монет, я прошу у тебя 250 золотых в обмен на взгляд в туманное будущее.
	};
};

func void dia_abuyin_zukunft3_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_00");	//(в трансе) Ты должен пробиться... это суждено только тебе...
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_01");	//(в трансе) ...сквозь огонь и снег... сквозь лед и пламя...
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_02");	//(в трансе) Люди в странных доспехах... болото... ящеры... они ждут тебя...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_03");	//Это все. Больше я ничего не смог увидеть.
	DIA_ABUYIN_ZUKUNFT3_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 3;
	Info_ClearChoices(dia_abuyin_zukunft3);
	b_giveplayerxp(XP_AMBIENT * 4);
};


instance DIA_ABUYIN_WEISSAGUNG4(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung4_condition;
	information = dia_abuyin_weissagung4_info;
	permanent = FALSE;
	description = "Ты можешь сделать пророчество?";
};


func int dia_abuyin_weissagung4_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 4))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung4_info()
{
	b_abuyin_weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung4_13_00");	//За какие-то 500 монет я рискну заглянуть для тебя в будущее.
};


instance DIA_ABUYIN_ZUKUNFT4(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft4_condition;
	information = dia_abuyin_zukunft4_info;
	permanent = TRUE;
	description = "Расскажи мне о будущем (заплатить 500 золотых).";
};


var int dia_abuyin_zukunft4_permanent;

func int dia_abuyin_zukunft4_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung4) && (DIA_ABUYIN_ZUKUNFT4_PERMANENT == FALSE) && (KAPITEL == 4))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft4_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft4_15_00");	//Расскажи мне о будущем.
	if(b_giveinvitems(other,self,itmi_gold,500))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft4_13_01");	//Хорошо, о, Сын Знаний. Я сейчас войду в состояние транса. Ты готов?
		Info_ClearChoices(dia_abuyin_zukunft4);
		Info_AddChoice(dia_abuyin_zukunft4,"Я готов!",dia_abuyin_zukunft4_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft4_13_02");	//О, Отец Монет, я прошу у тебя 500 золотых в обмен на взгляд в туманное будущее.
	};
};

func void dia_abuyin_zukunft4_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_00");	//(в трансе) Место знаний... другая страна... темное место далеко-далеко...
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_01");	//(в трансе) Мужественные спутники... ты должен сделать выбор...
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_02");	//(в трансе) Храм... стоит одиноко в царстве Аданоса... покрытый туманом...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_03");	//Это все. Больше я ничего не смог увидеть.
	DIA_ABUYIN_ZUKUNFT4_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 4;
	Info_ClearChoices(dia_abuyin_zukunft4);
	b_giveplayerxp(XP_AMBIENT * 4);
};


instance DIA_ABUYIN_WEISSAGUNG5(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung5_condition;
	information = dia_abuyin_weissagung5_info;
	permanent = FALSE;
	description = "Ты можешь сделать пророчество?";
};


func int dia_abuyin_weissagung5_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung5_info()
{
	b_abuyin_weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung5_13_00");	//За какие-то 1000 монет я рискну заглянуть для тебя в будущее.
};


instance DIA_ABUYIN_ZUKUNFT5(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft5_condition;
	information = dia_abuyin_zukunft5_info;
	permanent = TRUE;
	description = "Расскажи мне о будущем (заплатить 1000 золотых).";
};


var int dia_abuyin_zukunft5_permanent;

func int dia_abuyin_zukunft5_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung5) && (DIA_ABUYIN_ZUKUNFT5_PERMANENT == FALSE) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft5_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft5_15_00");	//Расскажи мне о будущем.
	if(b_giveinvitems(other,self,itmi_gold,1000))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft5_13_01");	//Хорошо, о, Сын Знаний. Я сейчас войду в состояние транса. Ты готов?
		Info_ClearChoices(dia_abuyin_zukunft5);
		Info_AddChoice(dia_abuyin_zukunft5,"Я готов!",dia_abuyin_zukunft5_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft5_13_02");	//О, Отец Монет, я прошу у тебя 1000 золотых в обмен на взгляд в туманное будущее.
	};
};

func void dia_abuyin_zukunft5_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_00");	//(в трансе) Тьма опустилась на землю... Зло торжествует...
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_01");	//(в трансе) Король проиграет войну против орков...
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_02");	//(в трансе) Ты вернешься, но не найдешь покоя...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_03");	//Это все. Больше я ничего не смог увидеть.
	DIA_ABUYIN_ZUKUNFT5_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 5;
	Info_ClearChoices(dia_abuyin_zukunft5);
	b_giveplayerxp(XP_AMBIENT * 4);
};

