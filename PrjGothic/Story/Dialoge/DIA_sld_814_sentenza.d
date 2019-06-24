
instance DIA_SENTENZA_EXIT(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 999;
	condition = dia_sentenza_exit_condition;
	information = dia_sentenza_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sentenza_exit_condition()
{
	return TRUE;
};

func void dia_sentenza_exit_info()
{
	AI_StopProcessInfos(self);
};


var int sentenza_wants50;
var int sentenza_searchday;

instance DIA_SENTENZA_HELLO(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 1;
	condition = dia_sentenza_hello_condition;
	information = dia_sentenza_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sentenza_hello_condition()
{
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_sentenza_hello_info()
{
	AI_Output(self,other,"DIA_Sentenza_Hello_09_00");	//И куда это ты собрался?!
	self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
	SENTENZA_SEARCHDAY = b_getdayplus();
	Info_ClearChoices(dia_sentenza_hello);
	Info_AddChoice(dia_sentenza_hello,"А какое тебе до этого дело?",dia_sentenza_hello_notyourbusiness);
	Info_AddChoice(dia_sentenza_hello,"Я просто прогуливаюсь. Вот и все.",dia_sentenza_hello_justlooking);
};

func void dia_sentenza_hello_justlooking()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_JustLooking_15_00");	//Я просто прогуливаюсь. Вот и все.
	AI_Output(self,other,"DIA_Sentenza_Hello_JustLooking_09_01");	//(смеется) Таких как ты, здесь ожидают большие проблемы! Это ты мне заявляешь, что просто прогуливаешься?
	AI_Output(self,other,"DIA_Sentenza_Hello_JustLooking_09_02");	//Ха! Ты идешь на двор! Зачем еще тебе нужно было бы проделывать столь долгий путь?
	AI_Output(self,other,"DIA_Sentenza_Hello_JustLooking_09_03");	//Так что прекращай нести эту чушь. Сейчас я обыщу тебя, и можешь топать дальше.
	Info_ClearChoices(dia_sentenza_hello);
	Info_AddChoice(dia_sentenza_hello,"Не распускай руки!",dia_sentenza_hello_handsoff);
	Info_AddChoice(dia_sentenza_hello,"Как хочешь. Можешь обыскать меня!",dia_sentenza_hello_searchme);
};

func void dia_sentenza_hello_notyourbusiness()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_NotYourBusiness_15_00");	//А какое тебе до этого дело?
	AI_Output(self,other,"DIA_Sentenza_Hello_NotYourBusiness_09_01");	//(вздыхает) Значит, мне придется объяснить тебе это в деталях.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void b_sentenza_searchme()
{
	var int playergold;
	playergold = Npc_HasItems(other,itmi_gold);
	AI_Output(other,self,"DIA_Sentenza_Hello_SearchMe_15_00");	//Как хочешь. Можешь обыскать меня!
	AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_01");	//Так, посмотрим, что у нас здесь есть...
	if(playergold >= 50)
	{
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_02");	//Ах! Золото! Очень опасно носить с собой такое количество золота.
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_03");	//Многие из наемников настоящие головорезы. А не такие честные парни, как я.
		b_giveinvitems(other,self,itmi_gold,50);
		SENTENZA_GOLDTAKEN = TRUE;
	}
	else if(playergold > 0)
	{
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_04");	//Да-а... У тебя не так уж много с собой.
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_05");	//Я вернусь к тебе позже.
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_06");	//У тебя нет с собой золота?
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_07");	//Не похоже, что ты голодаешь. Ты, должно быть, припрятал золотишко где-то, правильно?
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_08");	//Да ты не дурак. Я уверен, что мы еще встретимся. Береги себя.
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_09");	//Ты, вероятно, единственный, кто знает, где все твое золото!
	};
	SENTENZA_WANTS50 = TRUE;
	AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_10");	//Я хочу получить с тебя всего 50 золотых - это стандартный сбор. Ты должен заплатить его всего один раз. Это ведь честно, правда?
};

func void dia_sentenza_hello_searchme()
{
	b_sentenza_searchme();
	AI_StopProcessInfos(self);
};

func void dia_sentenza_hello_handsoff()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_HandsOff_15_00");	//Не распускай руки!
	AI_Output(self,other,"DIA_Sentenza_Hello_HandsOff_09_01");	//(угрожающе) А то что?
	Info_ClearChoices(dia_sentenza_hello);
	Info_AddChoice(dia_sentenza_hello,"Или ничего. Обыщи меня!",dia_sentenza_hello_searchme);
	Info_AddChoice(dia_sentenza_hello,"А то ты долго не сможешь никого обыскивать!",dia_sentenza_hello_orelse);
};

func void dia_sentenza_hello_orelse()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_OrElse_15_00");	//А то ты долго не сможешь никого обыскивать!
	AI_Output(self,other,"DIA_Sentenza_Hello_OrElse_09_01");	//Ну, это мы посмотрим!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_SENTENZA_VZWEI(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 2;
	condition = dia_sentenza_vzwei_condition;
	information = dia_sentenza_vzwei_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sentenza_vzwei_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (SENTENZA_GOLDTAKEN == FALSE) && (SENTENZA_SEARCHDAY < Wld_GetDay()))
	{
		return TRUE;
	};
};

func void dia_sentenza_vzwei_info()
{
	AI_Output(self,other,"DIA_Sentenza_Vzwei_09_00");	//Опять ты! Давай посмотрим, что у тебя есть на этот раз!
	self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
	SENTENZA_SEARCHDAY = b_getdayplus();
	Info_ClearChoices(dia_sentenza_vzwei);
	Info_AddChoice(dia_sentenza_vzwei,"Убери от меня свои грязные руки!",dia_sentenza_vzwei_handsoff);
	Info_AddChoice(dia_sentenza_vzwei,"Как хочешь. Можешь обыскать меня!",dia_sentenza_vzwei_searchme);
};

func void dia_sentenza_vzwei_searchme()
{
	b_sentenza_searchme();
	AI_StopProcessInfos(self);
};

func void dia_sentenza_vzwei_handsoff()
{
	AI_Output(other,self,"DIA_Sentenza_Vzwei_HandsOff_15_00");	//Убери от меня свои грязные руки!
	AI_Output(self,other,"DIA_Sentenza_Vzwei_HandsOff_09_01");	//(угрожающе) Да? Похоже, у тебя с собой сейчас побольше золотишка!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_SENTENZA_WANNAJOIN(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 3;
	condition = dia_sentenza_wannajoin_condition;
	information = dia_sentenza_wannajoin_info;
	permanent = FALSE;
	description = "Я пришел, чтобы присоединиться к вам!";
};


func int dia_sentenza_wannajoin_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_sentenza_wannajoin_info()
{
	AI_Output(other,self,"DIA_Sentenza_WannaJoin_15_00");	//Я пришел, чтобы присоединиться к вам!
	AI_Output(self,other,"DIA_Sentenza_WannaJoin_09_01");	//Похвальное желание.
	AI_Output(self,other,"DIA_Sentenza_WannaJoin_09_02");	//(вскользь) А ты знаешь, что наемники будут голосовать - принять тебя или нет?
};


instance DIA_SENTENZA_VOTE(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 4;
	condition = dia_sentenza_vote_condition;
	information = dia_sentenza_vote_info;
	permanent = TRUE;
	description = "Ты проголосуешь за меня?";
};


func int dia_sentenza_vote_condition()
{
	if(Npc_KnowsInfo(other,dia_sentenza_wannajoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_sentenza_vote_info()
{
	AI_Output(other,self,"DIA_Sentenza_Vote_15_00");	//Ты проголосуешь за меня?
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_01");	//Только потому, что ты побил меня? (смеется) Нет.
	}
	else if((Npc_HasItems(self,itmi_gold) >= 50) && ((SENTENZA_GOLDTAKEN == TRUE) || (SENTENZA_GOLDGIVEN == TRUE)))
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_02");	//Хотя, почему бы и нет? 50 золотых - это разумная плата за мой голос, тебе так не кажется?
		SENTENZA_STIMME = TRUE;
		b_logentry(TOPIC_SLDRESPEKT,"Сентенза не возражает против моего вступления в ряды наемников.");
	}
	else if((SENTENZA_STIMME == TRUE) && (Npc_HasItems(self,itmi_gold) < 50))
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_03");	//После того, как ты забрал мое золото? Вряд ли, мой мальчик.
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_04");	//У тебя так ничего не выйдет, парень! Если ты хочешь, чтобы я проголосовал за тебя, ты должен презентовать мне немного золота.
		AI_Output(other,self,"DIA_Sentenza_Vote_15_05");	//Сколько?
		AI_Output(self,other,"DIA_Sentenza_Vote_09_06");	//50 монет. Это сбор, который тебе все равно пришлось бы заплатить.
		SENTENZA_WANTS50 = TRUE;
	};
};


var int sentenza_goldgiven;

instance DIA_SENTENZA_PAY50(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 5;
	condition = dia_sentenza_pay50_condition;
	information = dia_sentenza_pay50_info;
	permanent = TRUE;
	description = "Вот твои 50 золотых монет.";
};


func int dia_sentenza_pay50_condition()
{
	if((SENTENZA_WANTS50 == TRUE) && (Npc_HasItems(self,itmi_gold) < 50) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_sentenza_pay50_info()
{
	AI_Output(other,self,"DIA_Sentenza_Pay50_15_00");	//Вот твои 50 золотых монет.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Sentenza_Pay50_09_01");	//Спасибо, дорогой.
		SENTENZA_GOLDGIVEN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_Pay50_09_02");	//Не пытайся обмануть меня. 50 золотых и ни монетой меньше! Понял?
	};
};


var int sentenza_einmal;

instance DIA_SENTENZA_GOLDBACK(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 6;
	condition = dia_sentenza_goldback_condition;
	information = dia_sentenza_goldback_info;
	permanent = TRUE;
	description = "Верни мне мое золото!";
};


func int dia_sentenza_goldback_condition()
{
	if(Npc_HasItems(self,itmi_gold) >= 50)
	{
		if((SENTENZA_GOLDGIVEN == FALSE) || (other.guild == GIL_SLD))
		{
			return TRUE;
		};
	};
};

func void dia_sentenza_goldback_info()
{
	AI_Output(other,self,"DIA_Sentenza_GoldBack_15_00");	//Верни мне мое золото!
	if((other.guild == GIL_SLD) && (TORLOF_SENTENZACOUNTED == TRUE) && (SENTENZA_EINMAL == FALSE))
	{
		AI_Output(self,other,"DIA_Sentenza_GoldBack_09_01");	//После того, как я проголосовал за тебя?
		AI_Output(self,other,"DIA_Sentenza_GoldBack_09_02");	//Ах ты, мерзкий попрошайка!
		SENTENZA_EINMAL = TRUE;
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_GoldBack_09_03");	//Расслабься! Я просто пригляжу пока за ним...
	};
};


instance DIA_SENTENZA_AUFSMAUL(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 7;
	condition = dia_sentenza_aufsmaul_condition;
	information = dia_sentenza_aufsmaul_info;
	permanent = FALSE;
	description = "Слушай, а что это у тебя перед головой? Лицо или задница? ";
};


func int dia_sentenza_aufsmaul_condition()
{
	if((Npc_HasItems(self,itmi_gold) >= 50) || Npc_KnowsInfo(other,dia_jarvis_missionko))
	{
		return TRUE;
	};
};

func void dia_sentenza_aufsmaul_info()
{
	AI_Output(other,self,"DIA_Sentenza_AufsMaul_15_00");	//Слушай, а что это у тебя перед головой? Лицо или задница?
	AI_Output(self,other,"DIA_Sentenza_AufsMaul_09_01");	//(зло смеется) Ладно, ты сам этого хотел...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_SENTENZA_AUFSMAULAGAIN(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 8;
	condition = dia_sentenza_aufsmaulagain_condition;
	information = dia_sentenza_aufsmaulagain_info;
	permanent = TRUE;
	description = "Пришло время очередной взбучки!";
};


func int dia_sentenza_aufsmaulagain_condition()
{
	if(Npc_KnowsInfo(other,dia_sentenza_aufsmaul))
	{
		if((Npc_HasItems(self,itmi_gold) >= 50) || Npc_KnowsInfo(other,dia_jarvis_missionko))
		{
			return TRUE;
		};
	};
};

func void dia_sentenza_aufsmaulagain_info()
{
	AI_Output(other,self,"DIA_Sentenza_AufsMaulAgain_15_00");	//Пришло время очередной взбучки!
	AI_Output(self,other,"DIA_Sentenza_AufsMaulAgain_09_01");	//Как скажешь...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_SENTENZA_PERM(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 1;
	condition = dia_sentenza_perm_condition;
	information = dia_sentenza_perm_info;
	permanent = TRUE;
	description = "Эй, как дела?";
};


func int dia_sentenza_perm_condition()
{
	return TRUE;
};

func void dia_sentenza_perm_info()
{
	AI_Output(other,self,"DIA_Sentenza_PERM_15_00");	//Эй, как дела?
	AI_Output(self,other,"DIA_Sentenza_PERM_09_01");	//Мало кто заходит сюда, но до последнего времени все они платили мне сбор.
	if(Npc_HasItems(self,itmi_gold) < 50)
	{
		AI_Output(self,other,"DIA_Sentenza_PERM_09_02");	//За исключением тебя. (скалится)
	};
};


instance DIA_SENTENZA_PICKPOCKET(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 900;
	condition = dia_sentenza_pickpocket_condition;
	information = dia_sentenza_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_sentenza_pickpocket_condition()
{
	return c_beklauen(56,65);
};

func void dia_sentenza_pickpocket_info()
{
	Info_ClearChoices(dia_sentenza_pickpocket);
	Info_AddChoice(dia_sentenza_pickpocket,DIALOG_BACK,dia_sentenza_pickpocket_back);
	Info_AddChoice(dia_sentenza_pickpocket,DIALOG_PICKPOCKET,dia_sentenza_pickpocket_doit);
};

func void dia_sentenza_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sentenza_pickpocket);
};

func void dia_sentenza_pickpocket_back()
{
	Info_ClearChoices(dia_sentenza_pickpocket);
};

