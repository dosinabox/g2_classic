
instance DIA_GAAN_EXIT(C_INFO)
{
	npc = bau_961_gaan;
	nr = 999;
	condition = dia_gaan_exit_condition;
	information = dia_gaan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


var int dia_gaan_exit_onetime;

func int dia_gaan_exit_condition()
{
	return TRUE;
};

func void dia_gaan_exit_info()
{
	AI_StopProcessInfos(self);
	if(DIA_GAAN_EXIT_ONETIME == FALSE)
	{
		Npc_ExchangeRoutine(self,"Start");
		DIA_GAAN_EXIT_ONETIME = TRUE;
	};
};


instance DIA_GAAN_HALLO(C_INFO)
{
	npc = bau_961_gaan;
	nr = 3;
	condition = dia_gaan_hallo_condition;
	information = dia_gaan_hallo_info;
	description = "У тебя здесь просторно.";
};


func int dia_gaan_hallo_condition()
{
	return TRUE;
};

func void dia_gaan_hallo_info()
{
	AI_Output(other,self,"DIA_Gaan_HALLO_15_00");	//У тебя здесь просторно.
	AI_Output(self,other,"DIA_Gaan_HALLO_03_01");	//Да, мне здесь нравится. Но если ты пойдешь по вон тому проходу, ты можешь переменить свое мнение.
	AI_Output(self,other,"DIA_Gaan_HALLO_03_02");	//Если этот клочок земли произвел впечатление на тебя, значит, ты еще не видел Долины Рудников.
};


instance DIA_GAAN_WASMACHSTDU(C_INFO)
{
	npc = bau_961_gaan;
	nr = 4;
	condition = dia_gaan_wasmachstdu_condition;
	information = dia_gaan_wasmachstdu_info;
	description = "Кто ты?";
};


func int dia_gaan_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_hallo))
	{
		return TRUE;
	};
};

func void dia_gaan_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Gaan_WASMACHSTDU_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Gaan_WASMACHSTDU_03_01");	//Меня зовут Гаан. Я охотник и работаю на Бенгара, фермера, владеющего этими высокогорными пастбищами.
	AI_Output(self,other,"DIA_Gaan_WASMACHSTDU_03_02");	//Я провожу большую часть времени на природе, греясь на солнце.
};


instance DIA_GAAN_WALD(C_INFO)
{
	npc = bau_961_gaan;
	nr = 5;
	condition = dia_gaan_wald_condition;
	information = dia_gaan_wald_info;
	description = "Что мне нужно знать о Долине Рудников?";
};


func int dia_gaan_wald_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_gaan_wald_info()
{
	AI_Output(other,self,"DIA_Gaan_WALD_15_00");	//Что мне нужно знать о Долине Рудников?
	AI_Output(self,other,"DIA_Gaan_WALD_03_01");	//Понятия не имею. Я видел эту долину только мельком. По мне, там слишком опасно.
	AI_Output(self,other,"DIA_Gaan_WALD_03_02");	//Лучше всего, если ты пойдешь туда по проходу, держаться протоптанной дорожки.
	AI_Output(self,other,"DIA_Gaan_WALD_03_03");	//Ты можешь пойти либо через большое ущелье, либо по дороге через каменный мост. Первый путь короче и безопаснее.
	AI_Output(self,other,"DIA_Gaan_WALD_03_04");	//Теперь, когда орки роятся повсюду, нужно быть очень осторожным.
	AI_Output(self,other,"DIA_Gaan_WALD_03_05");	//Мне совсем не хочется тащить тебя к ведьме-целительнице.
};


instance DIA_GAAN_SAGITTA(C_INFO)
{
	npc = bau_961_gaan;
	nr = 7;
	condition = dia_gaan_sagitta_condition;
	information = dia_gaan_sagitta_info;
	description = "Ведьме-целительнице?";
};


func int dia_gaan_sagitta_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_wald))
	{
		return TRUE;
	};
};

func void dia_gaan_sagitta_info()
{
	AI_Output(other,self,"DIA_Gaan_SAGITTA_15_00");	//Ведьме-целительнице?
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_01");	//Ее зовут Сагитта. Она лечит фермеров и других людей, живущих вне города.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_02");	//Очень загадочная женщина.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_03");	//Никому не нравится ходить к ней, и все обожают распускать о ней сплетни.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_04");	//Но, если ты заболеешь, ты нигде не найдешь лучшей помощи, чем у Сагитты, на ее кухне, полной целебных трав.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_05");	//Ты найдешь ее в лесу за фермой Секоба.
};


instance DIA_GAAN_MONSTER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 8;
	condition = dia_gaan_monster_condition;
	information = dia_gaan_monster_info;
	description = "А как выглядит этот опасный зверь?";
};


func int dia_gaan_monster_condition()
{
	if((MIS_GAAN_SNAPPER == LOG_RUNNING) && (Npc_IsDead(gaans_snapper) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gaan_monster_info()
{
	AI_Output(other,self,"DIA_Gaan_MONSTER_15_00");	//А как выглядит этот опасный зверь?
	AI_Output(self,other,"DIA_Gaan_MONSTER_03_01");	//Я точно не знаю. Я только слышал фырканье и скрежет когтей. Но видел, что он может сделать.
	AI_Output(self,other,"DIA_Gaan_MONSTER_03_02");	//Даже волки боятся его. Этот зверь как-то оторвал одному волку голову.
};


instance DIA_GAAN_WASZAHLSTDU(C_INFO)
{
	npc = bau_961_gaan;
	nr = 9;
	condition = dia_gaan_waszahlstdu_condition;
	information = dia_gaan_waszahlstdu_info;
	description = "Сколько ты заплатишь, если я убью этого зверя для тебя?";
};


func int dia_gaan_waszahlstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_monster) && (Npc_IsDead(gaans_snapper) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gaan_waszahlstdu_info()
{
	AI_Output(other,self,"DIA_Gaan_WASZAHLSTDU_15_00");	//Сколько ты заплатишь, если я убью этого зверя для тебя?
	AI_Output(self,other,"DIA_Gaan_WASZAHLSTDU_03_01");	//Я бы отдал тому, кто убьет этого зверя, все, что у меня есть.
	b_say_gold(self,other,30);
	MIS_GAAN_DEAL = LOG_RUNNING;
};


instance DIA_GAAN_WOHERMONSTER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 10;
	condition = dia_gaan_wohermonster_condition;
	information = dia_gaan_wohermonster_info;
	description = "Откуда пришел этот коварный зверь?";
};


func int dia_gaan_wohermonster_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_monster) && (Npc_IsDead(gaans_snapper) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gaan_wohermonster_info()
{
	AI_Output(other,self,"DIA_Gaan_WOHERMONSTER_15_00");	//Откуда пришел этот коварный зверь?
	AI_Output(self,other,"DIA_Gaan_WOHERMONSTER_03_01");	//Откуда-то издалека. Может быть, из Долины Рудников. Но я не знаю точно.
	AI_Output(self,other,"DIA_Gaan_WOHERMONSTER_03_02");	//Я никогда не был в Долине Рудников.
};


instance DIA_GAAN_MONSTERTOT(C_INFO)
{
	npc = bau_961_gaan;
	nr = 11;
	condition = dia_gaan_monstertot_condition;
	information = dia_gaan_monstertot_info;
	important = TRUE;
};


func int dia_gaan_monstertot_condition()
{
	if(Npc_IsDead(gaans_snapper) == TRUE)
	{
		return TRUE;
	};
};

func void dia_gaan_monstertot_info()
{
	AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_00");	//Этот ужасный зверь мертв, я полагаю.
	AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_01");	//Теперь я опять могу охотиться спокойно.
	if(MIS_GAAN_DEAL == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_02");	//Вот деньги, что я обещал тебе.
		CreateInvItems(self,itmi_gold,30);
		b_giveinvitems(self,other,itmi_gold,30);
	};
	MIS_GAAN_SNAPPER = LOG_SUCCESS;
	b_giveplayerxp(XP_GAAN_WALDSNAPPER);
	AI_StopProcessInfos(self);
};


instance DIA_GAAN_ASKTEACHER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 10;
	condition = dia_gaan_askteacher_condition;
	information = dia_gaan_askteacher_info;
	description = "Ты можешь научить меня охотиться?";
};


func int dia_gaan_askteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_gaan_askteacher_info()
{
	AI_Output(other,self,"DIA_Gaan_AskTeacher_15_00");	//Ты можешь научить меня охотиться?
	AI_Output(self,other,"DIA_Gaan_AskTeacher_03_01");	//Нет проблем. За 100 золотых монет я могу показать тебе, как выпотрошить животных, что ты убьешь.
	AI_Output(self,other,"DIA_Gaan_AskTeacher_03_02");	//Шкуры и другие трофеи можно выгодно продать на рынке.
	Log_CreateTopic(TOPIC_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_TEACHER,"Гаан может обучить меня добывать трофеи животных.");
};


instance DIA_GAAN_PAYTEACHER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 11;
	condition = dia_gaan_payteacher_condition;
	information = dia_gaan_payteacher_info;
	permanent = TRUE;
	description = "Вот. 100 золотых монет за твой опыт по разделыванию животных.";
};


var int dia_gaan_payteacher_noperm;

func int dia_gaan_payteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_askteacher) && (DIA_GAAN_PAYTEACHER_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_gaan_payteacher_info()
{
	AI_Output(other,self,"DIA_Gaan_PayTeacher_15_00");	//Вот. 100 золотых монет за твой опыт по разделыванию животных.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Gaan_PayTeacher_03_01");	//Спасибо. Теперь, говори, что ты хочешь.
		GAAN_TEACHPLAYER = TRUE;
		DIA_GAAN_PAYTEACHER_NOPERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_PayTeacher_03_02");	//Обратись ко мне позже, когда у тебя будут деньги.
	};
};


instance DIA_GAAN_TEACHHUNTING(C_INFO)
{
	npc = bau_961_gaan;
	nr = 12;
	condition = dia_gaan_teachhunting_condition;
	information = dia_gaan_teachhunting_info;
	permanent = TRUE;
	description = "Чему ты можешь обучить меня?";
};


func int dia_gaan_teachhunting_condition()
{
	if(GAAN_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_gaan_teachhunting_info()
{
	AI_Output(other,self,"DIA_Gaan_TEACHHUNTING_15_00");	//Чему ты можешь обучить меня?
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE) || ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRGSNAPPERHORN] == FALSE) && (MIS_GAAN_SNAPPER == LOG_SUCCESS)))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_03_01");	//Это зависит от того, что ты уже знаешь.
		Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Удаление зубов",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_gaan_teachhunting_teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Удаление когтей",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_gaan_teachhunting_claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Снятие шкур",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_gaan_teachhunting_fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Жало кровавой мухи",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_gaan_teachhunting_bfsting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Крылья кровавой мухи",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_gaan_teachhunting_bfwing);
		};
		if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRGSNAPPERHORN] == FALSE) && (MIS_GAAN_SNAPPER == LOG_SUCCESS))
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Рог драконьего снеппера",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_gaan_teachhunting_drgsnapperhorn);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_03_02");	//Я не могу научить тебя ничему, что ты еще не знаешь. Извини.
	};
};

func void dia_gaan_teachhunting_back()
{
	Info_ClearChoices(dia_gaan_teachhunting);
};

func void dia_gaan_teachhunting_claws()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_00");	//Звери не любят расставаться со своими когтями. Ножом нужно работать очень точно.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_01");	//Твои руки должны быть слегка скрещены. Затем нужно отрубить когти сильным ударом.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_02");	//Торговцы всегда готовы выложить кругленькую сумму за когти.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_teeth()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Teeth_03_00");	//Легче всего вырезать зубы животного. Просто проведи своим ножом вокруг зубов во рту животного.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Teeth_03_01");	//Затем нужно отделить их от черепа точным ударом.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_fur()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Fur_03_00");	//Лучше снимать шкуру, сделав глубокий разрез в районе задних ног.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Fur_03_01");	//После этого, ты легко сможешь снять шкуру, стягивая ее с животного.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_bfsting()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFSTING))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFSting_03_00");	//У этих мух есть мягкое место на спине.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFSting_03_01");	//Если нажать там, жало выдвинется очень далеко, и ты сможешь вырезать его при помощи ножа.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_bfwing()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFWING))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFWing_03_00");	//Лучше всего отделить крылья кровавой мухи, отрубив их ударом острого ножа как можно ближе к телу.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFWing_03_01");	//Нужно быть очень аккуратным, чтобы не повредить нежную ткань крыльев. Они не будут ничего стоить, если ты повредишь их.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_drgsnapperhorn()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRGSNAPPERHORN))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_00");	//Теперь, когда этот огромный снеппер мертв, я могу показать тебе, как вырезать его рог.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_01");	//Нужно засунуть нож глубоко в лоб этого животного и осторожно выковырнуть рог.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_02");	//Если он не отделится от черепа, нужно поддеть его вторым ножом с другой стороны.
		CreateInvItems(gaans_snapper,itat_drgsnapperhorn,1);
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};


instance DIA_GAAN_JAGD(C_INFO)
{
	npc = bau_961_gaan;
	nr = 80;
	condition = dia_gaan_jagd_condition;
	information = dia_gaan_jagd_info;
	permanent = TRUE;
	description = "Как охота?";
};


func int dia_gaan_jagd_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_wasmachstdu))
	{
		return TRUE;
	};
};

func void b_wasmachtjagd()
{
	AI_Output(other,self,"DIA_Gaan_JAGD_15_00");	//Как охота?
};

func void dia_gaan_jagd_info()
{
	b_wasmachtjagd();
	if(Npc_IsDead(gaans_snapper) == FALSE)
	{
		AI_Output(self,other,"DIA_Gaan_JAGD_03_01");	//Последнее животное, которое мне удалось убить, была большая крыса. Дела идут совсем плохо.
		AI_Output(self,other,"DIA_Gaan_JAGD_03_02");	//Вот уже несколько дней какой-то фыркающий зверь бродит здесь.
		AI_Output(self,other,"DIA_Gaan_JAGD_03_03");	//Он не только убивает все, что движется, он мешает моей работе.
		Log_CreateTopic(TOPIC_GAANSCHNAUBI,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_GAANSCHNAUBI,LOG_RUNNING);
		b_logentry(TOPIC_GAANSCHNAUBI,"Этот фыркающий зверь доставляет неприятности охотнику Гаан. Если я не уничтожу этого зверя, он не сможет охотиться.");
		MIS_GAAN_SNAPPER = LOG_RUNNING;
	}
	else if(KAPITEL >= 3)
	{
		AI_Output(self,other,"DIA_Gaan_JAGD_03_04");	//Дела идут все хуже и хуже. А тем временем, через проход толпами валят эти фыркающие твари.
		AI_Output(self,other,"DIA_Gaan_JAGD_03_05");	//Охотиться становится все сложнее и сложнее.
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_JAGD_03_06");	//Мне не на что жаловаться.
	};
};


instance DIA_GAAN_PICKPOCKET(C_INFO)
{
	npc = bau_961_gaan;
	nr = 900;
	condition = dia_gaan_pickpocket_condition;
	information = dia_gaan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_gaan_pickpocket_condition()
{
	return c_beklauen(23,35);
};

func void dia_gaan_pickpocket_info()
{
	Info_ClearChoices(dia_gaan_pickpocket);
	Info_AddChoice(dia_gaan_pickpocket,DIALOG_BACK,dia_gaan_pickpocket_back);
	Info_AddChoice(dia_gaan_pickpocket,DIALOG_PICKPOCKET,dia_gaan_pickpocket_doit);
};

func void dia_gaan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_gaan_pickpocket);
};

func void dia_gaan_pickpocket_back()
{
	Info_ClearChoices(dia_gaan_pickpocket);
};

