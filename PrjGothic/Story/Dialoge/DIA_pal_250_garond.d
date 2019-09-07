
instance DIA_GAROND_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_exit_condition;
	information = dia_garond_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_garond_exit_info()
{
	AI_StopProcessInfos(self);
};


var int garond_lastpetzcounter;
var int garond_lastpetzcrime;

instance DIA_GAROND_PMSCHULDEN(C_INFO)
{
	npc = pal_250_garond;
	nr = 1;
	condition = dia_garond_pmschulden_condition;
	information = dia_garond_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_garond_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (GAROND_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= GAROND_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_garond_pmschulden_info()
{
	var int diff;
	AI_Output(self,other,"DIA_Garond_PMSchulden_10_00");	//Мы ничего не будем обсуждать, пока ты не заплатишь штраф.
	if(b_gettotalpetzcounter(self) > GAROND_LASTPETZCOUNTER)
	{
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_01");	//А он возрос, учитывая все последние обвинения.
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_02");	//Проблем у тебя, похоже, только прибавилось.
		if(GAROND_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_03");	//Но я надеюсь, что ты способен заплатить сразу за все! Учитывая все твои прегрешения, это будет...
		}
		else
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_04");	//Я очень разочарован тобой. Твой штраф теперь составляет...
		};
		diff = b_gettotalpetzcounter(self) - GAROND_LASTPETZCOUNTER;
		if(diff > 0)
		{
			GAROND_SCHULDEN = GAROND_SCHULDEN + (diff * 50);
		};
		if(GAROND_SCHULDEN > 1000)
		{
			GAROND_SCHULDEN = 1000;
		};
		b_say_gold(self,other,GAROND_SCHULDEN);
	}
	else if(b_getgreatestpetzcrime(self) < GAROND_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_05");	//Выяснились новые подробности.
		if(GAROND_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_06");	//Теперь больше никто не обвиняет тебя в убийстве.
		};
		if((GAROND_LASTPETZCRIME == CRIME_THEFT) || ((GAROND_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_07");	//Никто не помнит, что видел, как ты воровал.
		};
		if((GAROND_LASTPETZCRIME == CRIME_ATTACK) || ((GAROND_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_08");	//Больше нет свидетелей, утверждающих, что ты участвовал в драке.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_09");	//Похоже, все обвинения против тебя сняты.
		};
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_10");	//Я понятия не имею, что там произошло, но предупреждаю тебя: не заходи слишком далеко!
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_11");	//Я принял решение освободить тебя от штрафа.
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_12");	//И больше я не хочу слышать о том, что ты сеешь смуту в замке!
			GAROND_SCHULDEN = 0;
			GAROND_LASTPETZCOUNTER = 0;
			GAROND_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_13");	//Я хочу довести до твоего сведения: тебе все равно придется заплатить штраф в полном объеме.
			b_say_gold(self,other,GAROND_SCHULDEN);
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_14");	//Так как насчет этого?
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_garond_pmschulden);
		Info_ClearChoices(dia_garond_petzmaster);
		Info_AddChoice(dia_garond_pmschulden,"У меня нет столько золота!",dia_garond_petzmaster_paylater);
		Info_AddChoice(dia_garond_pmschulden,"Сколько там нужно?",dia_garond_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= GAROND_SCHULDEN)
		{
			Info_AddChoice(dia_garond_pmschulden,"Я хочу заплатить штраф!",dia_garond_petzmaster_paynow);
		};
	};
};

func void dia_garond_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Garond_PMSchulden_HowMuchAgain_15_00");	//Сколько там было?
	b_say_gold(self,other,GAROND_SCHULDEN);
	Info_ClearChoices(dia_garond_pmschulden);
	Info_ClearChoices(dia_garond_petzmaster);
	Info_AddChoice(dia_garond_pmschulden,"У меня нет столько золота!",dia_garond_petzmaster_paylater);
	Info_AddChoice(dia_garond_pmschulden,"Сколько там нужно?",dia_garond_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= GAROND_SCHULDEN)
	{
		Info_AddChoice(dia_garond_pmschulden,"Я хочу заплатить штраф!",dia_garond_petzmaster_paynow);
	};
};


instance DIA_GAROND_PETZMASTER(C_INFO)
{
	npc = pal_250_garond;
	nr = 1;
	condition = dia_garond_petzmaster_condition;
	information = dia_garond_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_garond_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > GAROND_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_garond_petzmaster_info()
{
	GAROND_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_00");	//Так это ты сеешь смуту в замке.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_01");	//Я спрашивал себя: сколько это еще будет продолжаться, прежде чем ты придешь ко мне с повинной?
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_02");	//Еще только убийств мне здесь не хватало.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_03");	//У меня на счету каждый человек - а теперь у меня стало на одного бойца меньше!
		GAROND_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		GAROND_SCHULDEN = GAROND_SCHULDEN + 500;
		if((PETZCOUNTER_CITY_THEFT + PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_04");	//Не говоря уже обо всем остальном, в чем тебя обвиняют.
		};
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_05");	//Позволь мне объяснить тебе кое-что. Мы здесь все в одной ловушке.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_06");	//И у меня на счету каждый человек. Включая тебя.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_07");	//Если тебе хочется убить кого-нибудь, просто выйди за ворота замка. И убивай там орков себе на здоровье.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_08");	//Я вынужден наложить на тебя штраф - и мне крайне неприятно применять такие меры.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_09");	//Ходят слухи, что ты шарил в чужих вещах.
		if((PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_10");	//Не говоря уже обо всем другом, что мне доносили.
		};
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_11");	//Тебе так просто не уйти от ответственности. Ты, похоже, не понимаешь всей серьезности ситуации.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_12");	//Тебе придется заплатить штраф в качестве компенсации за твои преступления!
		GAROND_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_13");	//Я не люблю, когда среди моих людей случаются драки.
		if(PETZCOUNTER_CITY_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_14");	//А уж этот случай с овцой мне совсем не понятен.
		};
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_15");	//Тебе придется заплатить за это штраф!
		GAROND_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_16");	//Ты убиваешь наших овец?! Это общественная собственность.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_17");	//Тебе придется заплатить за это мясо.
		GAROND_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Garond_PETZMASTER_15_18");	//Сколько?
	if(GAROND_SCHULDEN > 1000)
	{
		GAROND_SCHULDEN = 1000;
	};
	b_say_gold(self,other,GAROND_SCHULDEN);
	Info_ClearChoices(dia_garond_pmschulden);
	Info_ClearChoices(dia_garond_petzmaster);
	Info_AddChoice(dia_garond_petzmaster,"У меня нет столько золота!",dia_garond_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= GAROND_SCHULDEN)
	{
		Info_AddChoice(dia_garond_petzmaster,"Я хочу заплатить штраф!",dia_garond_petzmaster_paynow);
	};
};

func void dia_garond_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Garond_PETZMASTER_PayNow_15_00");	//Я хочу заплатить штраф!
	b_giveinvitems(other,self,itmi_gold,GAROND_SCHULDEN);
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayNow_10_01");	//Хорошо, я скажу об этом нашим парням, чтобы немного успокоить их. Но чтобы больше такое не повторялось!
	b_grantabsolution(LOC_OLDCAMP);
	GAROND_SCHULDEN = 0;
	GAROND_LASTPETZCOUNTER = 0;
	GAROND_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_garond_petzmaster);
	Info_ClearChoices(dia_garond_pmschulden);
};

func void dia_garond_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Garond_PETZMASTER_PayLater_15_00");	//У меня нет столько золота!
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayLater_10_01");	//Тогда постарайся раздобыть это золото как можно быстрее.
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayLater_10_02");	//И я предупреждаю тебя: если ты будешь совершать подобные преступления и в будущем, цена возрастет!
	GAROND_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	GAROND_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_HELLO(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_hello_condition;
	information = dia_garond_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_garond_hello_condition()
{
	if((KAPITEL == 2) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_garond_hello_info()
{
	AI_Output(self,other,"DIA_Garond_Hello_10_00");	//Откуда ты взялся? Ты не из старателей, и ты не один из моих людей. Так кто же ты?
	AI_Output(other,self,"DIA_Garond_Hello_15_01");	//Я пришел через Проход.
	AI_Output(self,other,"DIA_Garond_Hello_10_02");	//Через Проход...? Ты действительно прошел там?! О, Иннос всемогущий!
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_03");	//Зачем ты прошел этот путь, маг?
	}
	else if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_04");	//Какой приказ ты выполняешь, солдат?
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_05");	//Я задаю себе вопрос, зачем наемнику проделывать такой путь? Что ты делаешь здесь?
	};
};


instance DIA_GAROND_NEEDPROOF(C_INFO)
{
	npc = pal_250_garond;
	nr = 1;
	condition = dia_garond_needproof_condition;
	information = dia_garond_needproof_info;
	description = "Я пришел от лорда Хагена.";
};


func int dia_garond_needproof_condition()
{
	if(Npc_KnowsInfo(other,dia_garond_hello) && (MIS_OLDWORLD == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_garond_needproof_info()
{
	AI_Output(other,self,"DIA_Garond_NeedProof_15_00");	//Я пришел от лорда Хагена. Он хочет, чтобы я представил ему доказательства присутствия здесь драконов.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_01");	//Так ты пришел, чтобы получить эти доказательства и исчезнуть опять?
	AI_Output(other,self,"DIA_Garond_NeedProof_15_02");	//Да, именно на это я и рассчитывал.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_03");	//Так ему нужны доказательства? Он может получить их. Но я не могу отправить тебя назад к лорду Хагену, не предоставив ему информацию о руде.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_04");	//Послушай - лорд Хаген должен узнать все о ситуации здесь и о том, сколько руды удалось нам добыть.
	AI_Output(other,self,"DIA_Garond_NeedProof_15_05");	//Хорошо, и что ты хочешь, чтобы я сделал?
	AI_Output(self,other,"DIA_Garond_NeedProof_10_06");	//У нас здесь, в долине, три отряда старателей. Но я еще не получил от них ни одного куска руды.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_07");	//Посети все три шахты и доложи мне, сколько руды они добыли.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_08");	//После этого, я дам тебе письмо, которое ты отнесешь лорду Хагену.
	AI_Output(other,self,"DIA_Garond_NeedProof_15_09");	//Ну, хорошо - похоже, у меня нет выбора.
	MIS_SCOUTMINE = LOG_RUNNING;
	b_startotherroutine(jergan,"FAJETH");
	b_logentry(TOPIC_MISOLDWORLD,"Прежде чем командующий Гаронд отправит меня назад, он хочет, чтобы я разыскал три группы старателей и сообщил ему, сколько руды удалось им добыть.");
	Log_CreateTopic(TOPIC_SCOUTMINE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SCOUTMINE,LOG_RUNNING);
	b_logentry(TOPIC_SCOUTMINE,"Командующий Гаронд дал мне поручение. Он отправил три группы старателей добывать магическую руду. И до сих пор они не вернулись.");
	b_logentry(TOPIC_SCOUTMINE,"Я должен найти эти три группы старателей и выяснить, сколько руды удалось им добыть.");
};


instance DIA_GAROND_WHY(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_why_condition;
	information = dia_garond_why_info;
	permanent = FALSE;
	description = "Но почему именно я?";
};


func int dia_garond_why_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_garond_why_info()
{
	AI_Output(other,self,"DIA_Garond_Why_15_00");	//Но почему именно я?
	AI_Output(self,other,"DIA_Garond_Why_10_01");	//Потому что ты знаешь как пробираться через ряды орков. Мои парни только зря отдадут свои жизни.
	AI_Output(self,other,"DIA_Garond_Why_10_02");	//Ведь тебе один раз уже удалось преодолеть все препятствия - значит, ты как нельзя лучше подходишь для этой работы.
};


instance DIA_GAROND_EQUIPMENT(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_equipment_condition;
	information = dia_garond_equipment_info;
	permanent = FALSE;
	description = "Мне нужно снаряжение.";
};


func int dia_garond_equipment_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && ((other.guild == GIL_KDF) || (other.guild == GIL_MIL)))
	{
		return TRUE;
	};
};

func void dia_garond_equipment_info()
{
	AI_Output(other,self,"DIA_Garond_Equipment_15_00");	//Мне нужно снаряжение.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Garond_Equipment_10_01");	//Поговори с магом Милтеном здесь, в замке. Он разбирается в таких вещах.
	};
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Garond_Equipment_10_02");	//Поговори об этом с Тандором. Он выдаст тебе все необходимое.
		Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
		b_logentry(TOPIC_TRADER_OC,"Тандор продает оружие в замке.");
	};
};


instance DIA_GAROND_ZAHLEN(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_zahlen_condition;
	information = dia_garond_zahlen_info;
	permanent = FALSE;
	description = "Сколько ты заплатишь мне за эту работу?";
};


func int dia_garond_zahlen_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_garond_zahlen_info()
{
	AI_Output(other,self,"DIA_Garond_zahlen_15_00");	//Сколько ты заплатишь мне за эту работу?
	AI_Output(self,other,"DIA_Garond_zahlen_10_01");	//(сердито) Я не торгуюсь с вами, наемниками.
	AI_Output(self,other,"DIA_Garond_zahlen_10_02");	//Ох, ладно, похоже, у меня нет выбора. Я заплачу тебе 500 золотых, если ты выполнишь мое задание.
};


instance DIA_GAROND_WO(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_wo_condition;
	information = dia_garond_wo_info;
	permanent = FALSE;
	description = "Где мне найти эти шахты?";
};


func int dia_garond_wo_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_garond_wo_info()
{
	AI_Output(other,self,"DIA_Garond_Wo_15_00");	//Где мне найти эти шахты?
	AI_Output(self,other,"DIA_Garond_Wo_10_01");	//Вот, возьми эту карту. На ней показаны две области, где находятся шахты.
	CreateInvItems(self,itwr_map_oldworld_oremines_mis,1);
	b_giveinvitems(self,other,itwr_map_oldworld_oremines_mis,1);
	AI_Output(self,other,"DIA_Garond_Wo_10_02");	//Если у тебя есть еще вопросы, обратись к Парсивалю. Он расскажет все, что тебе нужно знать о старателях.
	b_logentry(TOPIC_SCOUTMINE,"Паладин Парсиваль может дать мне информацию о старателях.");
};

func void b_garond_orecounter3()
{
	AI_Output(self,other,"B_Garond_OreCounter3_10_00");	//Черт! Что там происходит? Неужели сам Белиар явился, чтобы стереть нас с лица земли?!
	AI_Output(self,other,"B_Garond_OreCounter3_10_01");	//Мои люди почти все мертвы, а с той рудой, что у нас есть, мы НЕ МОЖЕМ ОСТАНОВИТЬ ДАЖЕ ОДНОГО ОРКА, НЕ ГОВОРЯ УЖЕ ОБ АРМИИ!
	AI_Output(self,other,"B_Garond_OreCounter3_10_02");	//Эта экспедиция обречена на провал.
};


instance DIA_GAROND_FAJETH(C_INFO)
{
	npc = pal_250_garond;
	nr = 2;
	condition = dia_garond_fajeth_condition;
	information = dia_garond_fajeth_info;
	permanent = FALSE;
	description = "Я поговорил с Фаджетом.";
};


func int dia_garond_fajeth_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (FAJETH_ORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_fajeth_info()
{
	AI_Output(other,self,"DIA_Garond_Fajeth_15_00");	//Я поговорил с Фаджетом.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_01");	//Что он может сказать мне?
	AI_Output(other,self,"DIA_Garond_Fajeth_15_02");	//Его люди добыли два ящика руды.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_03");	//Хмм... два ящика? Мне не нужны два ящика - мне нужно ДВЕ СОТНИ.
	AI_Output(other,self,"DIA_Garond_Fajeth_15_04");	//Он хочет, чтобы я передал тебе - ему нужны еще люди.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_05");	//Что? Я должен послать еще людей на верную смерть? Он может забыть об этом.
	ORE_COUNTER = ORE_COUNTER + 1;
	b_giveplayerxp(XP_FAJETH_ORE);
	if(ORE_COUNTER >= 3)
	{
		b_garond_orecounter3();
	};
};


instance DIA_GAROND_SILVESTRO(C_INFO)
{
	npc = pal_250_garond;
	nr = 2;
	condition = dia_garond_silvestro_condition;
	information = dia_garond_silvestro_info;
	permanent = FALSE;
	description = "Насчет шахты Сильвестро...";
};


func int dia_garond_silvestro_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (SILVESTRO_ORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_silvestro_info()
{
	AI_Output(other,self,"DIA_Garond_Silvestro_15_00");	//Насчет шахты Сильвестро...
	AI_Output(self,other,"DIA_Garond_Silvestro_10_01");	//Ты видел его? Ты говорил с ним?
	AI_Output(other,self,"DIA_Garond_Silvestro_15_02");	//Все, кто находился в шахте, мертвы. Растерзаны краулерами.
	AI_Output(self,other,"DIA_Garond_Silvestro_10_03");	//А что насчет руды? Ты знаешь, сколько они добыли?
	AI_Output(other,self,"DIA_Garond_Silvestro_15_04");	//Им удалось спрятать несколько ящиков. Они в пещере - по пути от замка к шахте.
	AI_Output(self,other,"DIA_Garond_Silvestro_10_05");	//Черт! Это были хорошие люди - да проявит Иннос милосердие к их душам.
	ORE_COUNTER = ORE_COUNTER + 1;
	b_giveplayerxp(XP_SILVESTRO_ORE);
	if(ORE_COUNTER >= 3)
	{
		b_garond_orecounter3();
	};
};


instance DIA_GAROND_MARCOS(C_INFO)
{
	npc = pal_250_garond;
	nr = 2;
	condition = dia_garond_marcos_condition;
	information = dia_garond_marcos_info;
	permanent = FALSE;
	description = "Я встретил Маркоса.";
};


func int dia_garond_marcos_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (MARCOS_ORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_marcos_info()
{
	AI_Output(other,self,"DIA_Garond_Marcos_15_00");	//Я встретил Маркоса.
	AI_Output(self,other,"DIA_Garond_Marcos_10_01");	//И? Что он может доложить? Сколько руды он добыл для нас?
	AI_Output(other,self,"DIA_Garond_Marcos_15_02");	//Четыре ящика. Он покинул шахту, чтобы переправить руду в безопасное место.
	AI_Output(other,self,"DIA_Garond_Marcos_15_03");	//Теперь он охраняет эти ящики в небольшой долине за позициями орков. Он просит прислать подкрепление.
	AI_Output(self,other,"DIA_Garond_Marcos_10_04");	//Что? Всего четыре ящика - и он покинул шахту? Черт, как это все плохо.
	AI_Output(self,other,"DIA_Garond_Marcos_10_05");	//И ему нужны еще люди?.. Что ж, ладно, я пошлю к нему двух человек.
	marcos_guard1.flags = 0;
	marcos_guard2.flags = 0;
	b_startotherroutine(marcos_guard1,"MARCOS");
	b_startotherroutine(marcos_guard2,"MARCOS");
	AI_Teleport(marcos_guard1,"OW_STAND_GUARDS");
	AI_Teleport(marcos_guard1,"OW_STAND_GUARDS");
	ORE_COUNTER = ORE_COUNTER + 1;
	MIS_MARCOS_JUNGS = LOG_SUCCESS;
	b_giveplayerxp(XP_MARCOS_ORE);
	if(ORE_COUNTER >= 3)
	{
		b_garond_orecounter3();
	};
};


instance DIA_GAROND_SUCCESS(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_success_condition;
	information = dia_garond_success_info;
	permanent = FALSE;
	description = "Что насчет письма для лорда Хагена?";
};


func int dia_garond_success_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (ORE_COUNTER >= 3))
	{
		return TRUE;
	};
};

func void dia_garond_success_info()
{
	AI_Output(other,self,"DIA_Garond_Success_15_00");	//Что насчет письма для лорда Хагена?
	AI_Output(self,other,"DIA_Garond_Success_10_01");	//В общей сложности у нас есть десять ящиков руды - и мы потеряли в два раза больше хороших людей.
	AI_Output(self,other,"DIA_Garond_Success_10_02");	//Ты получишь свое письмо. Лорд Хаген ДОЛЖЕН услышать об этом. Эта долина проклята - здесь царствует Зло.
	CreateInvItems(self,itwr_paladinletter_mis,1);
	b_giveinvitems(self,other,itwr_paladinletter_mis,1);
	KNOWSPALADINS_ORE = TRUE;
	b_logentry(TOPIC_MISOLDWORLD,"Командующий Гаронд дал мне письмо. Его должно быть достаточно для подтверждения моих слов. Я могу отнести его лорду Хагену.");
	MIS_SCOUTMINE = LOG_SUCCESS;
	b_giveplayerxp(XP_SCOUTMINE);
	MIS_READYFORCHAPTER3 = TRUE;
	b_npc_isalivecheck(OLDWORLD_ZEN);
};


instance DIA_GAROND_SLD(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_sld_condition;
	information = dia_garond_sld_info;
	permanent = FALSE;
	description = "Как насчет оплаты?";
};


func int dia_garond_sld_condition()
{
	if((MIS_SCOUTMINE == LOG_SUCCESS) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_garond_sld_info()
{
	AI_Output(other,self,"DIA_Garond_SLD_15_00");	//Как насчет оплаты?
	AI_Output(self,other,"DIA_Garond_SLD_10_01");	//Ох, да, точно. Я должен тебе немного золота. Вот твоя награда.
	b_giveinvitems(self,other,itmi_gold,500);
};


instance DIA_GAROND_RUNNING(C_INFO)
{
	npc = pal_250_garond;
	nr = 10;
	condition = dia_garond_running_condition;
	information = dia_garond_running_info;
	permanent = TRUE;
	description = "Как ситуация?";
};


func int dia_garond_running_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (ORE_COUNTER < 3))
	{
		return TRUE;
	};
};

func void dia_garond_running_info()
{
	AI_Output(other,self,"DIA_Garond_Running_15_00");	//Как обстановка?
	if(ORE_COUNTER == 2)
	{
		AI_Output(self,other,"DIA_Garond_Running_10_01");	//Теперь я жду только новостей с последней шахты - и надеюсь, что это будут хорошие новости.
	}
	else if(ORE_COUNTER == 1)
	{
		AI_Output(self,other,"DIA_Garond_Running_10_02");	//Мне нужны доклады о двух других шахтах. А там посмотрим.
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Running_10_03");	//Ты должен найти наши шахты. Мне очень нужны новости о том, как обстоят дела с добычей руды.
	};
};


instance DIA_GAROND_GORN(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_gorn_condition;
	information = dia_garond_gorn_info;
	permanent = FALSE;
	description = "Я хочу, чтобы ты освободил Горна.";
};


func int dia_garond_gorn_condition()
{
	if(Npc_KnowsInfo(other,dia_miltenow_gorn) && (KAPITEL == 2) && Npc_KnowsInfo(other,dia_garond_needproof))
	{
		return TRUE;
	};
};

func void dia_garond_gorn_info()
{
	AI_Output(other,self,"DIA_Garond_Gorn_15_00");	//Я хочу, чтобы ты освободил Горна.
	AI_Output(self,other,"DIA_Garond_Gorn_10_01");	//Я не могу отпустить его. Он совершил слишком много преступлений и должен поплатиться за это.
	AI_Output(other,self,"DIA_Garond_Gorn_15_02");	//Могу я заплатить штраф за него?
	AI_Output(self,other,"DIA_Garond_Gorn_10_03");	//Это возможно - но обойдется тебе очень недешево. Я хочу получить за Горна 1000 золотых.
	AI_Output(other,self,"DIA_Garond_Gorn_15_04");	//Это огромная сумма.
	AI_Output(self,other,"DIA_Garond_Gorn_10_05");	//Вина Горна тоже не маленькая. Принеси мне это золото, и я освобожу его.
	MIS_RESCUEGORN = LOG_RUNNING;
	b_logentry(TOPIC_RESCUEGORN,"Гаронд требует тысячу золотых монет за освобождение Горна.");
};


instance DIA_GAROND_PAY(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_pay_condition;
	information = dia_garond_pay_info;
	permanent = TRUE;
	description = "Я хочу купить свободу Горну. (Заплатить 1000 монет)";
};


func int dia_garond_pay_condition()
{
	if((MIS_RESCUEGORN == LOG_RUNNING) && (KAPITEL == 2) && (GAROND_KERKERAUF == FALSE))
	{
		return TRUE;
	};
};

func void dia_garond_pay_info()
{
	AI_Output(other,self,"DIA_Garond_Pay_15_00");	//Я хочу купить Горну свободу.
	if(b_giveinvitems(other,self,itmi_gold,1000))
	{
		AI_Output(self,other,"DIA_Garond_Pay_10_01");	//Хорошо. Ты можешь пойти к Герольду и сказать ему, что я приказываю освободить Горна.
		GAROND_KERKERAUF = TRUE;
		b_logentry(TOPIC_RESCUEGORN,"Я заплатил Гаронду. Теперь я могу освободить Горна из темницы. Стражник Герольд не будет препятствовать.");
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Pay_10_02");	//Тогда принеси мне 1000 золотых монет.
	};
};


instance DIA_GAROND_PERM2(C_INFO)
{
	npc = pal_250_garond;
	nr = 9;
	condition = dia_garond_perm2_condition;
	information = dia_garond_perm2_info;
	permanent = TRUE;
	description = "Что ты планируешь делать дальше?";
};


func int dia_garond_perm2_condition()
{
	if(Npc_KnowsInfo(other,dia_garond_success) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_garond_perm2_info()
{
	AI_Output(other,self,"DIA_Garond_Perm2_15_00");	//Что ты планируешь делать дальше?
	AI_Output(self,other,"DIA_Garond_Perm2_10_01");	//Я уже все перепробовал. Ты - моя единственная надежда, что лорд Хаген пришлет мне подкрепление.
	AI_Output(self,other,"DIA_Garond_Perm2_10_02");	//Но мы не падем духом и будем молиться Инносу, чтобы он не оставил нас без своей поддержки в этот мрачный час.
};


instance DIA_GAROND_KAP3_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_kap3_exit_condition;
	information = dia_garond_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_garond_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_WASGIBTSNEUES(C_INFO)
{
	npc = pal_250_garond;
	nr = 30;
	condition = dia_garond_wasgibtsneues_condition;
	information = dia_garond_wasgibtsneues_info;
	permanent = TRUE;
	description = "Что нового?";
};


func int dia_garond_wasgibtsneues_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_garond_wasgibtsneues_info()
{
	AI_Output(other,self,"DIA_Garond_WASGIBTSNEUES_15_00");	//Что нового?
	AI_Output(self,other,"DIA_Garond_WASGIBTSNEUES_10_01");	//Черт. Что ты тут ошиваешься? Мне нужно подкрепление!
	AI_Output(self,other,"DIA_Garond_WASGIBTSNEUES_10_02");	//Даже Милтен покинул замок. Но мне не нужно несколько человек - мне нужно БОЛЬШОЕ подкрепление!
};


instance DIA_GAROND_KAP4_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_kap4_exit_condition;
	information = dia_garond_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_garond_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_BACKINKAP4(C_INFO)
{
	npc = pal_250_garond;
	nr = 12;
	condition = dia_garond_backinkap4_condition;
	information = dia_garond_backinkap4_info;
	permanent = FALSE;
	description = "Я вернулся.";
};


func int dia_garond_backinkap4_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_garond_backinkap4_info()
{
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_00");	//Я вернулся.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_01");	//Я сам это вижу. А что насчет подкрепления?
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_02");	//Лорд Хаген прибудет, как только со всем разберется. Столько всего произошло.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_03");	//Меня это не волнует. Мне нужны войска. Орки все прибывают и прибывают. Нам не продержаться долго.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_04");	//Мои люди измотаны, и у нас заканчивается провизия.
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_05");	//Прибыли волонтеры.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_06");	//Ты имеешь в виду себя и твоих друзей, охотников на драконов, что ли? Вы, конечно, можете помочь нам, но вас слишком мало.
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_07");	//Ты имеешь в виду охотников на драконов? Они, конечно, могут помочь нам, но их слишком мало.
	};
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_08");	//Если Хаген не пришлет в ближайшее время своих людей, я ничего не могу гарантировать.
	b_initnpcglobals();
	AI_Teleport(djg_angar,"OW_DJG_WATCH_STONEHENGE_01");
	b_startotherroutine(djg_angar,"Start");
	DJG_ANGAR_SENTTOSTONES = TRUE;
	b_startotherroutine(kjorn,"START");
	b_startotherroutine(godar,"START");
	b_startotherroutine(hokurn,"START");
	b_startotherroutine(pc_fighter_djg,"START");
	b_startotherroutine(kurgan,"START");
	if(DJG_BIFFPARTY == FALSE)
	{
		b_startotherroutine(biff,"START");
	};
};


instance DIA_GAROND_DRAGONPLETTBERICHT(C_INFO)
{
	npc = pal_250_garond;
	nr = 11;
	condition = dia_garond_dragonplettbericht_condition;
	information = dia_garond_dragonplettbericht_info;
	permanent = TRUE;
	description = "Насчет драконов ...";
};


var int dia_garond_dragonplettbericht_noperm;

func int dia_garond_dragonplettbericht_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_garond_backinkap4) && (DIA_GAROND_DRAGONPLETTBERICHT_NOPERM == FALSE))
	{
		return TRUE;
	};
};


var int garond_dragoncounter;
var int garond_swampdragonkilled_onetime;
var int garond_rockdragonkilled_onetime;
var int garond_firedragonkilled_onetime;
var int garond_icedragonkilled_onetime;
var int garond_oricexperte_onetime;

func void dia_garond_dragonplettbericht_info()
{
	var int currentdragoncount;
	var int drachengeld;
	var int xp_localgarond;
	b_logentry(TOPIC_DRACHENJAGD,"Гаронда по долгу службы должно интересовать, как обстоят дела с драконами, хотя мне кажется, ему на это наплевать.");
	if(GAROND_DRAGONCOUNTER < MIS_KILLEDDRAGONS)
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_00");	//У меня есть новости о драконах.
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_01");	//Докладывай.
		currentdragoncount = 0;
		if(Npc_IsDead(swampdragon) && (GAROND_SWAMPDRAGONKILLED_ONETIME == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_02");	//Я убил дракона в болоте к востоку отсюда.
			GAROND_SWAMPDRAGONKILLED_ONETIME = TRUE;
			currentdragoncount = currentdragoncount + 1;
		};
		if(Npc_IsDead(rockdragon) && (GAROND_ROCKDRAGONKILLED_ONETIME == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_03");	//Дракон в каменной крепости, к югу отсюда, мертв.
			GAROND_ROCKDRAGONKILLED_ONETIME = TRUE;
			currentdragoncount = currentdragoncount + 1;
		};
		if(Npc_IsDead(firedragon) && (GAROND_FIREDRAGONKILLED_ONETIME == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_04");	//Огненный дракон из вулкана на юге больше не будет беспокоить вас.
			GAROND_FIREDRAGONKILLED_ONETIME = TRUE;
			currentdragoncount = currentdragoncount + 1;
		};
		if(Npc_IsDead(icedragon) && (GAROND_ICEDRAGONKILLED_ONETIME == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_05");	//Я был в западном ледяном районе и расправился с драконом, обитавшем там.
			GAROND_ICEDRAGONKILLED_ONETIME = TRUE;
			currentdragoncount = currentdragoncount + 1;
		};
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_06");	//Это хорошие новости. Вот. Возьми эти деньги. Надеюсь, они помогут тебе обновить свое снаряжение.
		drachengeld = currentdragoncount * GAROND_KILLEDDRAGONGELD;
		xp_localgarond = currentdragoncount * XP_GAROND_KILLEDDRAGON;
		b_giveplayerxp(xp_localgarond);
		CreateInvItems(self,itmi_gold,drachengeld);
		b_giveinvitems(self,other,itmi_gold,drachengeld);
		GAROND_DRAGONCOUNTER = MIS_KILLEDDRAGONS;
		if(MIS_ALLDRAGONSDEAD == TRUE)
		{
			DIA_GAROND_DRAGONPLETTBERICHT_NOPERM = TRUE;
		};
	};
	if((GAROND_ORICEXPERTE_ONETIME == FALSE) && (Npc_IsDead(oric) == FALSE) && (MIS_ALLDRAGONSDEAD == FALSE))
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_07");	//Ты можешь еще что-нибудь рассказать о драконах?
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_08");	//Мне нужно заниматься другими делами. Пусть мой помощник-стратег Орик расскажет тебе об этом.
		b_logentry(TOPIC_DRACHENJAGD,"У офицера Гаронда, отвечающего за стратегию, Орика, возможно есть полезная информация для меня.");
		GAROND_ORICEXPERTE_ONETIME = TRUE;
	}
	else if(MIS_ALLDRAGONSDEAD == FALSE)
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_09");	//Последнее время были еще нападения драконов?
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_10");	//По счастью, нет. В настоящий момент они держатся вдалеке.
	};
};


instance DIA_GAROND_ALLDRAGONDEAD(C_INFO)
{
	npc = pal_250_garond;
	nr = 12;
	condition = dia_garond_alldragondead_condition;
	information = dia_garond_alldragondead_info;
	permanent = FALSE;
	description = "Все драконы мертвы.";
};


func int dia_garond_alldragondead_condition()
{
	if((MIS_ALLDRAGONSDEAD == TRUE) && (DIA_GAROND_DRAGONPLETTBERICHT_NOPERM == TRUE) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_garond_alldragondead_info()
{
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_00");	//Все драконы мертвы.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_01");	//(недоверчиво) Все? То есть зло изгнано отсюда навеки?
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_02");	//Нет. Остался их предводитель.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_03");	//Разве не драконы были предводителями орков?
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_04");	//Да, это так, но у них также есть свой хозяин. Мы должны уничтожить и его тоже.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_05");	//Я, к сожалению, ничем не могу тебе помочь. Я должен охранять руду, а эти проклятые орки, кстати, тоже все еще здесь.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_06");	//Тебе придется сделать это самому.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_07");	//Да защитит тебя Иннос.
};


instance DIA_GAROND_JANBECOMESMITH(C_INFO)
{
	npc = pal_250_garond;
	nr = 12;
	condition = dia_garond_janbecomesmith_condition;
	information = dia_garond_janbecomesmith_info;
	permanent = TRUE;
	description = "Я хочу поговорить о кузнеце.";
};


func int dia_garond_janbecomesmith_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_RUNNING) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_garond_janbecomesmith_info()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_00");	//Я хочу поговорить о кузнеце.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_01");	//Каком кузнеце? Он исчез.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_02");	//Он что вернулся? Тогда можешь сказать ему...
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_03");	//Нет, я говорю о Яне.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_04");	//Он охотник на драконов, как и я, и хороший кузнец.
	}
	else
	{
		AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_05");	//Одном из охотников на драконов. Он кузнец.
	};
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_06");	//Это хорошо. Наш предыдущий кузнец слинял, трус.
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_07");	//Ян хотел бы поработать в кузнице.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_08");	//Понимаю. Так ты думаешь, я могу доверять ему?
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_09");	//Да.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_10");	//Если ты так уверен, то ты можешь поручиться за него.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_11");	//Если из-за него возникнут проблемы, за это ответишь ты. Согласен?
	Info_ClearChoices(dia_garond_janbecomesmith);
	Info_AddChoice(dia_garond_janbecomesmith,"Я подумаю над этим.",dia_garond_janbecomesmith_no);
	Info_AddChoice(dia_garond_janbecomesmith,"Я ручаюсь за Яна.",dia_garond_janbecomesmith_yes);
};

func void dia_garond_janbecomesmith_no()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_No_15_00");	//Я подумаю над этим.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_No_10_01");	//Как я могу доверять ему, если даже ты сомневаешься в нем?
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_No_10_02");	//Если за него никто не сможет поручиться, этот Ян на пушечный выстрел не подойдет к кузнице.
	Info_ClearChoices(dia_garond_janbecomesmith);
};

func void dia_garond_janbecomesmith_yes()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_Yes_15_00");	//Я ручаюсь за Яна.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_Yes_10_01");	//Хорошо. Он может работать в кузнице. Но, конечно же, он должен обеспечивать моих людей мечами.
	Info_ClearChoices(dia_garond_janbecomesmith);
	MIS_JANBECOMESSMITH = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GAROND_KAP5_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_kap5_exit_condition;
	information = dia_garond_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_garond_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_PERM5(C_INFO)
{
	npc = pal_250_garond;
	nr = 59;
	condition = dia_garond_perm5_condition;
	information = dia_garond_perm5_info;
	permanent = TRUE;
	description = "Как ситуация?";
};


func int dia_garond_perm5_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_garond_perm5_info()
{
	AI_Output(other,self,"DIA_Garond_PERM5_15_00");	//Как обстановка?
	if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Garond_PERM5_10_01");	//Что за бардак! Какой-то ублюдок оставил открытыми главные ворота. Теперь мы остались совсем без защиты.
		AI_Output(self,other,"DIA_Garond_PERM5_10_02");	//Ну, доберусь я до этого предателя...
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_PERM5_10_03");	//Мы все здесь помрем как мухи, если Хаген не прибудет как можно скорее.
	};
};


instance DIA_GAROND_KAP6_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_kap6_exit_condition;
	information = dia_garond_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_garond_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

