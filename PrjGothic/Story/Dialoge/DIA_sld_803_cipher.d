
instance DIA_CIPHER_EXIT(C_INFO)
{
	npc = sld_803_cipher;
	nr = 999;
	condition = dia_cipher_exit_condition;
	information = dia_cipher_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_cipher_exit_condition()
{
	return TRUE;
};

func void dia_cipher_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CIPHER_HELLO(C_INFO)
{
	npc = sld_803_cipher;
	nr = 1;
	condition = dia_cipher_hello_condition;
	information = dia_cipher_hello_info;
	permanent = FALSE;
	description = "Как дела?";
};


func int dia_cipher_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_cipher_hello_info()
{
	AI_Output(other,self,"DIA_Cipher_Hello_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Cipher_Hello_07_01");	//Эй, я тебя откуда-то знаю?
	AI_Output(other,self,"DIA_Cipher_Hello_15_02");	//Возможно...
	AI_Output(self,other,"DIA_Cipher_Hello_07_03");	//Я торговал болотной травой в колонии, помнишь?
};


instance DIA_CIPHER_TRADEWHAT(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_tradewhat_condition;
	information = dia_cipher_tradewhat_info;
	permanent = FALSE;
	description = "А чем ты торгуешь сейчас?";
};


func int dia_cipher_tradewhat_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_hello))
	{
		return TRUE;
	};
};

func void dia_cipher_tradewhat_info()
{
	AI_Output(other,self,"DIA_Cipher_TradeWhat_15_00");	//А чем ты торгуешь сейчас?
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_01");	//Ах, не спрашивай.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_02");	//Я принес с собой из колонии целый тюк болотной травы.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_03");	//Многие наемники не прочь иногда покурить травки. Я даже смог сколотить небольшое состояние на этом.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_04");	//Но какой-то ублюдок украл эту траву из моего сундука!
	Log_CreateTopic(TOPIC_CIPHERPAKET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CIPHERPAKET,LOG_RUNNING);
	b_logentry(TOPIC_CIPHERPAKET,"Наемник Сифер потерял тюк болотной травы.");
	if(!Npc_IsDead(bodo))
	{
		AI_Output(self,other,"DIA_Cipher_TradeWhat_07_05");	//Я почти уверен, что это Бодо. Он спит в той же комнате, что и я, и всегда ухмыляется при встрече, как идиот...
		b_logentry(TOPIC_CIPHERPAKET,"Он подозревает, что его украл Бодо.");
	};
	MIS_CIPHER_PAKET = LOG_RUNNING;
};


instance DIA_CIPHER_DOWITHTHIEF(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_dowiththief_condition;
	information = dia_cipher_dowiththief_info;
	permanent = FALSE;
	description = "И что ты собираешься делать с вором?";
};


func int dia_cipher_dowiththief_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_tradewhat))
	{
		return TRUE;
	};
};

func void dia_cipher_dowiththief_info()
{
	AI_Output(other,self,"DIA_Cipher_DoWithThief_15_00");	//И что ты собираешься делать с вором?
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_01");	//Когда-нибудь я поймаю его, когда он будет курить мою траву.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_02");	//И тогда, я найду укромное местечко и преподам ему урок, который он не скоро забудет.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_03");	//Если я вырублю его прямо здесь, посреди двора, на глазах у фермеров, я могу поплатиться за это.
	AI_Output(other,self,"DIA_Cipher_DoWithThief_15_04");	//Это почему?
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_05");	//Вес просто. Мы не можем досаждать фермерам, иначе Ли заставит нас заплатить солидный штраф. Так распорядился Онар.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_06");	//И чем больше свидетелей, тем больший шум поднимется. И штраф будет больше.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_07");	//Так что это нужно будет сделать аккуратно и тихо...
};


instance DIA_CIPHER_WANNAJOIN(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_wannajoin_condition;
	information = dia_cipher_wannajoin_info;
	permanent = FALSE;
	description = "Я хочу присоединиться к людям Ли!";
};


func int dia_cipher_wannajoin_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_hello) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_cipher_wannajoin_info()
{
	AI_Output(other,self,"DIA_Cipher_WannaJoin_15_00");	//Я хочу присоединиться к людям Ли!
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_01");	//Людям ЛИ?! Если Ли будет продолжать в том же духе, они скоро перестанут быть его людьми!
	AI_Output(other,self,"DIA_Cipher_WannaJoin_15_02");	//Почему?
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_03");	//Ли всегда был очень спокойным. И в колонии он вел себя так же.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_04");	//Но последнее время это стало уж слишком. Он хочет просто сидеть здесь и ждать, пока паладины не помрут с голоду.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_05");	//Сильвио думает, что мы должны пошерстить немного на небольших фермах у города.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_06");	//Я думаю, это была бы превосходная смена обстановки.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_07");	//А сейчас большинство из нас просто бьют баклуши здесь. И ты все равно хочешь присоединиться?
};


instance DIA_CIPHER_YESJOIN(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_yesjoin_condition;
	information = dia_cipher_yesjoin_info;
	permanent = FALSE;
	description = "Я все равно хочу стать одним из вас!";
};


func int dia_cipher_yesjoin_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_wannajoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_cipher_yesjoin_info()
{
	AI_Output(other,self,"DIA_Cipher_YesJoin_15_00");	//Я все равно хочу стать одним из вас!
	AI_Output(self,other,"DIA_Cipher_YesJoin_07_01");	//Ты уже знаешь, что мы голосуем за каждого новобранца?
	AI_Output(other,self,"DIA_Cipher_YesJoin_15_02");	//На что ты намекаешь?
	AI_Output(self,other,"DIA_Cipher_YesJoin_07_03");	//Ну, я уже давно ничего не курил. Принеси мне несколько косяков из болотной травы, и ты получишь мой голос.
	AI_Output(self,other,"DIA_Cipher_YesJoin_07_04");	//Я уверен, тебе удастся что-нибудь найти.
	MIS_CIPHER_BRINGWEED = LOG_RUNNING;
	Log_CreateTopic(TOPIC_CIPHERHERB,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CIPHERHERB,LOG_RUNNING);
	b_logentry(TOPIC_CIPHERHERB,"Сифер отдаст свой голос за меня, если я принесу ему несколько косяков болотной травы болотной травы.");
};


instance DIA_CIPHER_JOINTS(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_joints_condition;
	information = dia_cipher_joints_info;
	permanent = TRUE;
	description = "Насчет болотной травы...";
};


func int dia_cipher_joints_condition()
{
	if(MIS_CIPHER_BRINGWEED == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_cipher_joints_info()
{
	AI_Output(other,self,"DIA_Cipher_Joints_15_00");	//Насчет болотной травы...
	if(MIS_CIPHER_PAKET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Cipher_Joints_07_01");	//Ты принес назад мой тюк! Теперь все будет отлично!
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Cipher_Joints_07_02");	//Я обязательно проголосую за тебя...
			b_logentry(TOPIC_SLDRESPEKT,"Сифер проголосует за меня, когда я решу присоединиться к наемникам.");
		};
		MIS_CIPHER_BRINGWEED = LOG_OBSOLETE;
	}
	else
	{
		Info_ClearChoices(dia_cipher_joints);
		Info_AddChoice(dia_cipher_joints,"Я посмотрю, что можно сделать...",dia_cipher_joints_running);
		if(Npc_HasItems(other,itmi_joint) > 0)
		{
			Info_AddChoice(dia_cipher_joints,"Вот несколько косяков для тебя...",dia_cipher_joints_success);
		};
	};
};

func void dia_cipher_joints_running()
{
	AI_Output(other,self,"DIA_Cipher_Joints_Running_15_00");	//Посмотрим, что можно сделать...
	Info_ClearChoices(dia_cipher_joints);
};

func void dia_cipher_joints_success()
{
	AI_Output(other,self,"DIA_Cipher_Joints_Success_15_00");	//Вот несколько косяков для тебя...
	if(b_giveinvitems(other,self,itmi_joint,10))
	{
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_01");	//Ах! Ты наш человек!
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Cipher_Joints_Success_07_02");	//Ты получишь мой голос.
		};
		MIS_CIPHER_BRINGWEED = LOG_SUCCESS;
		b_logentry(TOPIC_SLDRESPEKT,"Сифер проголосует за меня, когда я решу присоединиться к наемникам.");
		b_giveplayerxp(XP_CIPHERWEED);
	}
	else
	{
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_03");	//Это все? Да я выкурю это за один присест!
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_04");	//Мне нужно хотя бы 10 косяков.
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Cipher_Joints_Success_07_05");	//Ладно, ты получишь мой голос.
		};
	};
	Info_ClearChoices(dia_cipher_joints);
};


instance DIA_CIPHER_TRADE(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_trade_condition;
	information = dia_cipher_trade_info;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
	trade = TRUE;
};


func int dia_cipher_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_tradewhat))
	{
		return TRUE;
	};
};

func void dia_cipher_trade_info()
{
	AI_Output(other,self,"DIA_Cipher_TRADE_15_00");	//Покажи мне свои товары.
	if(Npc_HasItems(self,itmi_joint) > 0)
	{
		AI_Output(self,other,"DIA_Cipher_TRADE_07_01");	//Конечно. Выбирай.
	}
	else
	{
		AI_Output(self,other,"DIA_Cipher_TRADE_07_02");	//У меня сейчас нет болотной травы. Ты хочешь что-нибудь еще?
	};
};


instance DIA_CIPHER_DARDIEB(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_dardieb_condition;
	information = dia_cipher_dardieb_info;
	permanent = FALSE;
	description = "Я знаю, кто взял твою траву.";
};


func int dia_cipher_dardieb_condition()
{
	if(((DAR_DIEB == TRUE) || (DAR_VERDACHT == TRUE)) && !Npc_IsDead(dar))
	{
		return TRUE;
	};
};

func void dia_cipher_dardieb_info()
{
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_00");	//Я знаю, кто взял твою траву.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_01");	//Кто? Это был Бодо?
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_02");	//Нет, это сделал один из наемников - Дар.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_03");	//Этот ублюдок! Где он?
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_04");	//Даже если ты найдешь его, это тебе не поможет, у него больше нет этого тюка. Он продал его в Хоринисе.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_05");	//ГДЕ ОН?!
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_06");	//За кухней, на углу...
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_07");	//Я ПРИКОНЧУ ЕГО!
	AI_StopProcessInfos(self);
	other.aivar[AIV_INVINCIBLE] = FALSE;
	b_attack(self,dar,AR_NONE,0);
};


instance DIA_CIPHER_DARLOST(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_darlost_condition;
	information = dia_cipher_darlost_info;
	permanent = FALSE;
	description = "Ты сделал из Дара отбивную... Теперь тебе лучше?";
};


func int dia_cipher_darlost_condition()
{
	if(DAR_LOSTAGAINSTCIPHER == TRUE)
	{
		return TRUE;
	};
};

func void dia_cipher_darlost_info()
{
	AI_Output(other,self,"DIA_Cipher_DarLOST_15_00");	//Ты сделал из Дара отбивную... Теперь тебе лучше?
	AI_Output(self,other,"DIA_Cipher_DarLOST_07_01");	//(вздыхает) Да, немного лучше.
	AI_Output(other,self,"DIA_Cipher_DarLOST_15_02");	//Но не для НЕГО, я полагаю...
	AI_Output(self,other,"DIA_Cipher_DarLOST_07_03");	//Этот мерзкий воришка не должен был лазить в мой сундук!
	b_giveplayerxp(XP_AMBIENT * 2);
};


instance DIA_CIPHER_KRAUTPAKET(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_krautpaket_condition;
	information = dia_cipher_krautpaket_info;
	permanent = FALSE;
	description = "Это случайно не твой тюк болотной травы?";
};


func int dia_cipher_krautpaket_condition()
{
	if((Npc_HasItems(other,itmi_herbpaket) > 0) && (MIS_CIPHER_PAKET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_cipher_krautpaket_info()
{
	AI_Output(other,self,"DIA_Cipher_KrautPaket_15_00");	//Это случайно не твой тюк болотной травы?
	b_giveinvitems(other,self,itmi_herbpaket,1);
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_01");	//Да, мой! Где ты нашел его?
	AI_Output(other,self,"DIA_Cipher_KrautPaket_15_02");	//Это долгая история...
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_03");	//Ладно, это не важно, но теперь я знаю, что ты наш человек.
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_04");	//Эй, возьми это в награду.
	b_giveinvitems(self,other,itmi_gold,200);
	b_giveinvitems(self,other,itmi_joint,10);
	b_giveplayerxp(XP_CIPHER_KRAUTPAKET);
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_05");	//Сейчас я скручу пару косячков...
	CreateInvItems(self,itmi_joint,40);
	Npc_RemoveInvItems(self,itmi_herbpaket,1);
	MIS_CIPHER_PAKET = LOG_SUCCESS;
	b_giveplayerxp(XP_CIPHERPAKET);
};


instance DIA_CIPHERSLD_PICKPOCKET(C_INFO)
{
	npc = sld_803_cipher;
	nr = 900;
	condition = dia_ciphersld_pickpocket_condition;
	information = dia_ciphersld_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_ciphersld_pickpocket_condition()
{
	return c_beklauen(65,65);
};

func void dia_ciphersld_pickpocket_info()
{
	Info_ClearChoices(dia_ciphersld_pickpocket);
	Info_AddChoice(dia_ciphersld_pickpocket,DIALOG_BACK,dia_ciphersld_pickpocket_back);
	Info_AddChoice(dia_ciphersld_pickpocket,DIALOG_PICKPOCKET,dia_ciphersld_pickpocket_doit);
};

func void dia_ciphersld_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ciphersld_pickpocket);
};

func void dia_ciphersld_pickpocket_back()
{
	Info_ClearChoices(dia_ciphersld_pickpocket);
};

