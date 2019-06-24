
instance DIA_PARLAN_KAP1_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap1_exit_condition;
	information = dia_parlan_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_parlan_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


var int parlan_hammer;

func void b_parlan_hammer()
{
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_00");	//(строго) Подожди минутку, сын мой, сын мой.
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_01");	//Ходят слухи, что ценный артефакт 'исчез' из нашего святилища.
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_02");	//Я не хочу ничего даже слышать об этом - я жду, что он вернется на свое законное место.
	PARLAN_HAMMER = TRUE;
};


var int parlan_lastpetzcounter;
var int parlan_lastpetzcrime;

instance DIA_PARLAN_PMSCHULDEN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 1;
	condition = dia_parlan_pmschulden_condition;
	information = dia_parlan_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_parlan_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (PARLAN_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= PARLAN_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_parlan_pmschulden_info()
{
	var int diff;
	if((PARLAN_HAMMER == FALSE) && (HAMMER_TAKEN == TRUE) && (other.guild == GIL_NOV) && (Npc_IsDead(garwig) == FALSE))
	{
		b_parlan_hammer();
	};
	AI_Output(self,other,"DIA_Parlan_PMSchulden_05_00");	//Ты нарушил законы нашей общины.
	if(b_gettotalpetzcounter(self) > PARLAN_LASTPETZCOUNTER)
	{
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_01");	//И хотя ты уже был обвинен, ты лишь усугубляешь свою вину.
		if(PARLAN_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_02");	//Твой грех может быть отпущен только посредством пожертвования большой суммы монастырю.
			AI_Output(other,self,"DIA_Parlan_PMAdd_15_00");	//Сколько?
			diff = b_gettotalpetzcounter(self) - PARLAN_LASTPETZCOUNTER;
			if(diff > 0)
			{
				PARLAN_SCHULDEN = PARLAN_SCHULDEN + (diff * 50);
			};
			if(PARLAN_SCHULDEN > 1000)
			{
				PARLAN_SCHULDEN = 1000;
			};
			b_say_gold(self,other,PARLAN_SCHULDEN);
		}
		else
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_03");	//За кого ты себя принимаешь? Молись Инносу, чтобы он даровал прощение твоих грехов!
		};
	}
	else if(b_getgreatestpetzcrime(self) < PARLAN_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_04");	//Твоя ситуация изменилась.
		if(PARLAN_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_05");	//Больше нет свидетелей убийства, совершенного тобой!
		};
		if((PARLAN_LASTPETZCRIME == CRIME_THEFT) || ((PARLAN_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_06");	//Никто не может засвидетельствовать, что ты воровал!
		};
		if((PARLAN_LASTPETZCRIME == CRIME_ATTACK) || ((PARLAN_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_07");	//Никто больше не может засвидетельствовать, что ты принимал участие в драке!
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_08");	//Все обвинения против тебя не находят подтверждения!
		};
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_09");	//Возможно, тебе удастся провести меня, но Иннос все видит!
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_10");	//Твои грехи забыты.
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_11");	//И постарайся, чтобы мы больше не возвращались к этому разговору!
			PARLAN_SCHULDEN = 0;
			PARLAN_LASTPETZCOUNTER = 0;
			PARLAN_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_12");	//Ты должен заплатить штраф. Такова воля Инноса!
			b_say_gold(self,other,PARLAN_SCHULDEN);
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_13");	//Освободись от своей вины!
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_parlan_pmschulden);
		Info_ClearChoices(dia_parlan_petzmaster);
		Info_AddChoice(dia_parlan_pmschulden,"У меня недостаточно золота!",dia_parlan_petzmaster_paylater);
		Info_AddChoice(dia_parlan_pmschulden,"Сколько там нужно?",dia_parlan_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= PARLAN_SCHULDEN)
		{
			Info_AddChoice(dia_parlan_pmschulden,"Я хочу заплатить штраф!",dia_parlan_petzmaster_paynow);
		};
	};
};

func void dia_parlan_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Parlan_PMSchulden_HowMuchAgain_15_00");	//Сколько там нужно?
	b_say_gold(self,other,PARLAN_SCHULDEN);
	Info_ClearChoices(dia_parlan_pmschulden);
	Info_ClearChoices(dia_parlan_petzmaster);
	Info_AddChoice(dia_parlan_pmschulden,"У меня недостаточно золота!",dia_parlan_petzmaster_paylater);
	Info_AddChoice(dia_parlan_pmschulden,"Сколько там нужно?",dia_parlan_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= PARLAN_SCHULDEN)
	{
		Info_AddChoice(dia_parlan_pmschulden,"Я хочу заплатить штраф!",dia_parlan_petzmaster_paynow);
	};
};


instance DIA_PARLAN_PETZMASTER(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 1;
	condition = dia_parlan_petzmaster_condition;
	information = dia_parlan_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_parlan_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > PARLAN_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_parlan_petzmaster_info()
{
	if((PARLAN_HAMMER == FALSE) && (HAMMER_TAKEN == TRUE) && (other.guild == GIL_NOV) && (Npc_IsDead(garwig) == FALSE))
	{
		b_parlan_hammer();
	};
	PARLAN_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_00");	//Мы еще не успели даже поговорить, а ты уже взвалил на себя груз вины!
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_01");	//Ты обвиняешься в худшем из всех преступлений! Убийстве!
		PARLAN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		PARLAN_SCHULDEN = PARLAN_SCHULDEN + 500;
		if((PETZCOUNTER_CITY_THEFT + PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_02");	//И ты взвалил на себя груз новой вины!
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_03");	//Если бы было решать мне, ты был бы проклят на месте, ты убийца!
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_04");	//Но если ты заплатишь штраф за свое преступление, впрочем, мы простим тебе твои грехи.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_05");	//Воровство - нарушение законов монастыря!
		if((PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_06");	//Кроме того, ты нарушил и другие законы.
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_07");	//Эти прегрешения должны быть наказаны. Таков закон Инноса.
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_08");	//Ты должен заплатить штраф монастырю.
		PARLAN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_09");	//Мы не терпим драк в монастыре. Такое поведение нарушает наши правила.
		if(PETZCOUNTER_CITY_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_10");	//И зачем ты убил нашу овцу?
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_11");	//Мы живем здесь в соответствии с законами. Они касаются и тебя.
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_12");	//За твое преступление, ты должен сделать пожертвование монастырю.
		PARLAN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_13");	//Ты убил нашу овцу. Ты должен заплатить компенсацию за нее!
		PARLAN_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_15_14");	//Сколько?
	if(PARLAN_SCHULDEN > 1000)
	{
		PARLAN_SCHULDEN = 1000;
	};
	b_say_gold(self,other,PARLAN_SCHULDEN);
	Info_ClearChoices(dia_parlan_pmschulden);
	Info_ClearChoices(dia_parlan_petzmaster);
	Info_AddChoice(dia_parlan_petzmaster,"У меня недостаточно золота!",dia_parlan_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= PARLAN_SCHULDEN)
	{
		Info_AddChoice(dia_parlan_petzmaster,"Я хочу заплатить штраф!",dia_parlan_petzmaster_paynow);
	};
};

func void dia_parlan_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_PayNow_15_00");	//Я хочу заплатить штраф!
	b_giveinvitems(other,self,itmi_gold,PARLAN_SCHULDEN);
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayNow_05_01");	//Я принимаю твое пожертвование. Твои прегрешения забыты. Я надеюсь, Иннос даст тебе мудрость не совершать больше подобных ошибок.
	b_grantabsolution(LOC_MONASTERY);
	PARLAN_SCHULDEN = 0;
	PARLAN_LASTPETZCOUNTER = 0;
	PARLAN_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_parlan_pmschulden);
	Info_ClearChoices(dia_parlan_petzmaster);
};

func void dia_parlan_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_PayLater_15_00");	//У меня недостаточно золота!
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayLater_05_01");	//Тебе стоило подумать об этом до того, как грешить.
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayLater_05_02");	//Возможно, это тебя чему-нибудь научит. Не создавай проблем, и тебе не нужно будет платить.
	PARLAN_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	PARLAN_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	Info_ClearChoices(dia_parlan_pmschulden);
	Info_ClearChoices(dia_parlan_petzmaster);
	AI_StopProcessInfos(self);
};


instance DIA_PARLAN_WELCOME(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 1;
	condition = dia_parlan_welcome_condition;
	information = dia_parlan_welcome_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_parlan_welcome_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_parlan_welcome_info()
{
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_00");	//Добро пожаловать, новый послушник. Я Парлан.
	AI_Output(other,self,"DIA_Parlan_WELCOME_15_01");	//А я...
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_02");	//(прерывает) ...ПОСЛУШНИК. Не важно, кем ты был раньше. Теперь ты слуга Инноса. Только это имеет значение.
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_03");	//И с принятием в Братство Огня, все твои предыдущие прегрешения будут забыты.
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_04");	//Да благословит Иннос этого человека, отдавшего свою жизнь служению Ему, и смоет все его грехи.
	AI_Output(other,self,"DIA_Parlan_WELCOME_15_05");	//И что теперь?
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_06");	//Прежде всего, ты должен выполнять свои обязанности послушника. Ты будешь работать и служить Братству.
	b_grantabsolution(LOC_ALL);
	Snd_Play("LEVELUP");
	Log_CreateTopic(TOPIC_GEMEINSCHAFT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GEMEINSCHAFT,LOG_RUNNING);
	b_logentry(TOPIC_GEMEINSCHAFT,"В обязанности послушника входит выполнять работы на благо общины.");
	if(LIESEL_GIVEAWAY == FALSE)
	{
		AI_Output(self,other,"DIA_Parlan_WELCOME_05_07");	//Но сначала отведи свою овцу к Ополосу, он позаботится о ней.
	};
	if(DIA_GORAX_GOLD_PERM == FALSE)
	{
		AI_Output(self,other,"DIA_Parlan_WELCOME_05_08");	//Ты можешь отдать свое золото Гораксу, нашему управляющему. Ты найдешь его в винодельне.
		AI_Output(self,other,"DIA_Parlan_WELCOME_05_09");	//Когда с этим будет покончено, мы поговорим о твоей работе здесь, в монастыре.
	};
};


instance DIA_PARLAN_AUGE(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 2;
	condition = dia_parlan_auge_condition;
	information = dia_parlan_auge_info;
	permanent = FALSE;
	description = "Я ищу Глаз Инноса.";
};


func int dia_parlan_auge_condition()
{
	if(KAPITEL <= 2)
	{
		return TRUE;
	};
};

func void dia_parlan_auge_info()
{
	AI_Output(other,self,"DIA_Parlan_Auge_15_00");	//Я ищу Глаз Инноса.
	AI_Output(self,other,"DIA_Parlan_Auge_05_01");	//Я не знаю, кто сказал тебе о нем, но к этому божественному артефакту никто не смеет прикасаться.
	AI_Output(other,self,"DIA_Parlan_Auge_15_02");	//Где хранится Глаз Инноса?
	AI_Output(self,other,"DIA_Parlan_Auge_05_03");	//Осень немногие знают эту тайну. Попробуй найти его - и тебе это не удастся.
};


instance DIA_PARLAN_AMULETT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 3;
	condition = dia_parlan_amulett_condition;
	information = dia_parlan_amulett_info;
	permanent = FALSE;
	description = "Расскажи мне о Глазе Инноса.";
};


func int dia_parlan_amulett_condition()
{
	if((KAPITEL <= 2) && Npc_KnowsInfo(other,dia_parlan_auge))
	{
		return TRUE;
	};
};

func void dia_parlan_amulett_info()
{
	AI_Output(other,self,"DIA_Parlan_Amulett_15_00");	//Расскажи мне о Глазе Инноса.
	AI_Output(self,other,"DIA_Parlan_Amulett_05_01");	//Хорошо. Глаз Инноса содержит частицу божественной силы Инноса. Только ОДИН избранный слуга Инноса может носить этот амулет.
	AI_Output(self,other,"DIA_Parlan_Amulett_05_02");	//Он был создан, чтобы защитить нас от сил Зла, когда придет время.
};


instance DIA_PARLAN_HAGEN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 2;
	condition = dia_parlan_hagen_condition;
	information = dia_parlan_hagen_info;
	permanent = FALSE;
	description = "Я должен поговорить с командующим паладинами!";
};


func int dia_parlan_hagen_condition()
{
	if((KAPITEL <= 2) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_parlan_hagen_info()
{
	AI_Output(other,self,"DIA_Parlan_Hagen_15_00");	//Я должен поговорить с командующим паладинами!
	AI_Output(self,other,"DIA_Parlan_Hagen_05_01");	//Лорд Хаген не принимает послушников - только магом позволено видеть его.
};


instance DIA_PARLAN_WORK(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 2;
	condition = dia_parlan_work_condition;
	information = dia_parlan_work_info;
	permanent = TRUE;
	description = "Чем я могу служить общине?";
};


var int dia_parlan_work_perm;

func int dia_parlan_work_condition()
{
	if((KAPITEL == 1) && (Npc_KnowsInfo(other,dia_parlan_knowsjudge) == FALSE) && Npc_KnowsInfo(other,dia_parlan_welcome) && (DIA_PARLAN_WORK_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlan_work_info()
{
	AI_Output(other,self,"DIA_Parlan_WORK_15_00");	//Чем я могу служить общине?
	if((LIESEL_GIVEAWAY == FALSE) || (DIA_GORAX_GOLD_PERM == FALSE))
	{
		AI_Output(self,other,"DIA_Parlan_WELCOME_05_06");	//Прежде всего, ты должен выполнять свои обязанности послушника. Ты будешь работать и служить Братству.
		if(LIESEL_GIVEAWAY == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_07");	//Но сначала отведи свою овцу к Ополосу, он позаботится о ней.
		};
		if(DIA_GORAX_GOLD_PERM == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_08");	//Ты можешь отдать свое золото Гораксу, нашему управляющему. Ты найдешь его в винодельне.
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_09");	//Когда с этим будет покончено, мы поговорим о твоей работе здесь, в монастыре.
		};
		AI_StopProcessInfos(self);
	}
	else if(Wld_IsTime(22,0,7,30))
	{
		AI_Output(self,other,"DIA_Parlan_WORK_NIGHT_05_01");	//Сейчас время мира. Работа послушников начинается рано утром и продолжается дотемна.
		AI_Output(self,other,"DIA_Parlan_WORK_NIGHT_05_02");	//Ты тоже должен спать. Возвращайся ко мне, когда придет время работы.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_WORK_05_03");	//Поговори с другими магами. Они дадут тебе поручения.
		AI_Output(self,other,"DIA_Parlan_WORK_05_04");	//Я буду наблюдать за твоей работой, и если ты хорошо будешь справляться с ней, ты получишь позволение войти в библиотеку, чтобы изучать учение Инноса.
		DIA_PARLAN_WORK_PERM = TRUE;
		MIS_KLOSTERARBEIT = LOG_RUNNING;
		b_logentry(TOPIC_GEMEINSCHAFT,"Если я выполню все задания магов, мне будет даровано право посещать библиотеку.");
	};
};


instance DIA_PARLAN_STAND(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 23;
	condition = dia_parlan_stand_condition;
	information = dia_parlan_stand_info;
	permanent = TRUE;
	description = "Могу я войти в библиотеку?";
};


func int dia_parlan_stand_condition()
{
	if((MIS_KLOSTERARBEIT == LOG_RUNNING) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_parlan_stand_info()
{
	KLOSTER_PUNKTE = 0;
	AI_Output(other,self,"DIA_Parlan_Stand_15_00");	//Могу я войти в библиотеку?
	if(MIS_NEORASPFLANZEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_01");	//Ты принес огненную крапиву брату Неорасу.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 2;
	};
	if(MIS_NEORASREZEPT == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_02");	//Ты нашел рецепт брата Неораса.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 2;
	};
	if(MIS_ISGAROTHWOLF == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_03");	//Ты убил черного волка, терроризировавшего часовню.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 1;
	};
	if(MIS_PARLANFEGEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_04");	//Ты смог найти четырех послушников и подмести кельи.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 3;
	};
	if(MIS_GORAXESSEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_05");	//Ты честно раздал еду послушникам, как и просил тебя брат Горакс.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 1;
	}
	else if(MIS_GORAXESSEN == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_06");	//Горакс неудовлетворен тобой, так как нечестно распределил еду.
	};
	if(MIS_GORAXWEIN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_07");	//Ты продал вино, как того и хотел Горакс.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 1;
	}
	else if(MIS_GORAXWEIN == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_08");	//Чем меньше мы будем говорить о вине, тем лучше...
	};
	if(KLOSTER_PUNKTE >= 8)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_09");	//Да, ты хорошо поработал. Теперь пришло время начать постигать учение Инноса. Поговори с мастером Хигласом в библиотеке.
		AI_Output(self,other,"DIA_Parlan_Stand_05_10");	//Я выдаю тебе этот ключ.
		PARLAN_ERLAUBNIS = TRUE;
		MIS_KLOSTERARBEIT = LOG_SUCCESS;
		Wld_AssignRoomToGuild("Kloster02",GIL_PUBLIC);
		b_giveinvitems(self,other,itke_klosterbibliothek,1);
		if(MIS_NEORASPFLANZEN == LOG_RUNNING)
		{
			MIS_NEORASPFLANZEN = LOG_OBSOLETE;
		};
		if(MIS_NEORASREZEPT == LOG_RUNNING)
		{
			MIS_NEORASREZEPT = LOG_OBSOLETE;
		};
		if(MIS_ISGAROTHWOLF == LOG_RUNNING)
		{
			MIS_ISGAROTHWOLF = LOG_OBSOLETE;
		};
		if(MIS_PARLANFEGEN == LOG_RUNNING)
		{
			MIS_PARLANFEGEN = LOG_OBSOLETE;
		};
		if(MIS_GORAXESSEN == LOG_RUNNING)
		{
			MIS_GORAXESSEN = LOG_OBSOLETE;
		};
		if(MIS_GORAXWEIN == LOG_RUNNING)
		{
			MIS_GORAXWEIN = LOG_OBSOLETE;
		};
		if(MIS_MARDUKBETEN == LOG_RUNNING)
		{
			MIS_MARDUKBETEN = LOG_OBSOLETE;
		};
		b_checklog();
	}
	else if(KLOSTER_PUNKTE >= 1)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_11");	//Ты работал, конечно, но пока ты должен продолжать служить общине.
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_12");	//Сначала выполни свои поручения на благо общины. А когда ты закончишь свою работу, мы вернемся к этому разговору.
	};
};


instance DIA_PARLAN_AUFGABE(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 10;
	condition = dia_parlan_aufgabe_condition;
	information = dia_parlan_aufgabe_info;
	permanent = FALSE;
	description = "У тебя есть какое-нибудь задание для меня?";
};


func int dia_parlan_aufgabe_condition()
{
	if(MIS_KLOSTERARBEIT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_parlan_aufgabe_info()
{
	AI_Output(other,self,"DIA_Parlan_Aufgabe_15_00");	//У тебя есть поручения для меня?
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_01");	//Хмм... Да, ты, действительно можешь сделать кое-что для общины.
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_02");	//Кельям послушников не помешает хорошая уборка. Позаботься об этом.
	AI_Output(other,self,"DIA_Parlan_Aufgabe_15_03");	//Но это займет целую вечность...
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_04");	//Тогда тебе лучше не терять время попусту, разве нет?
	MIS_PARLANFEGEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_PARLANFEGEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PARLANFEGEN,LOG_RUNNING);
	b_logentry(TOPIC_PARLANFEGEN,"Мастер Парлан хочет, чтобы я подмел кельи четырех послушников. Это займет целую вечность.");
};


instance DIA_PARLAN_FEGEN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 3;
	condition = dia_parlan_fegen_condition;
	information = dia_parlan_fegen_info;
	permanent = TRUE;
	description = "Насчет келий послушников...";
};


var int dia_parlan_fegen_permanent;

func int dia_parlan_fegen_condition()
{
	if((MIS_PARLANFEGEN == LOG_RUNNING) && (DIA_PARLAN_FEGEN_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlan_fegen_info()
{
	AI_Output(other,self,"DIA_Parlan_Fegen_15_00");	//Насчет келий послушников...
	if(NOV_HELFER >= 4)
	{
		AI_Output(self,other,"DIA_Parlan_Fegen_05_01");	//Тебе удалось найти четырех послушников себе в помощь. Я думаю, теперь они могут вернуться к своей работе.
		AI_Output(self,other,"DIA_Parlan_Fegen_05_02");	//Отлично, послушник. Ты выполнил мое поручение.
		MIS_PARLANFEGEN = LOG_SUCCESS;
		b_giveplayerxp(XP_PARLANFEGEN);
		DIA_PARLAN_FEGEN_PERMANENT = TRUE;
		b_startotherroutine(feger1,"START");
		b_startotherroutine(feger2,"START");
		b_startotherroutine(feger3,"START");
		b_startotherroutine(babo,"START");
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_Fegen_05_03");	//Бесспорно - это непростая задача. Но с помощью Инноса ты справишься.
	};
};


instance DIA_PARLAN_LEARN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 23;
	condition = dia_parlan_learn_condition;
	information = dia_parlan_learn_info;
	permanent = FALSE;
	description = "Как мне изучить основы магии?";
};


func int dia_parlan_learn_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlan_hagen) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_parlan_learn_info()
{
	AI_Output(other,self,"DIA_Parlan_LEARN_15_00");	//Как мне изучить основы магии?
	AI_Output(self,other,"DIA_Parlan_LEARN_05_01");	//Ты здесь не для того, чтобы получить дар магии. Ты здесь, чтобы служить Инносу.
	AI_Output(self,other,"DIA_Parlan_LEARN_05_02");	//Но я могу показать тебе, как повысить твои магические способности.
	b_logentry(TOPIC_KLOSTERTEACHER,"Мастер Парлан может помочь мне повысить мою магическую энергию.");
};


instance DIA_PARLAN_KNOWSJUDGE(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 23;
	condition = dia_parlan_knowsjudge_condition;
	information = dia_parlan_knowsjudge_info;
	permanent = FALSE;
	description = "Я хочу пройти Испытание Огнем.";
};


func int dia_parlan_knowsjudge_condition()
{
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == TRUE) && (Npc_KnowsInfo(hero,dia_pyrokar_fire) == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlan_knowsjudge_info()
{
	AI_Output(other,self,"DIA_Parlan_KNOWSJUDGE_15_00");	//Я хочу пройти Испытание Огнем.
	AI_Output(self,other,"DIA_Parlan_KNOWSJUDGE_05_01");	//Что?.. Хм... (удостоверяясь) Ты это действительно серьезно?
	AI_Output(other,self,"DIA_Parlan_KNOWSJUDGE_15_02");	//Я настаиваю.
	AI_Output(self,other,"DIA_Parlan_KNOWSJUDGE_05_03");	//Ты необычный послушник. Хорошо, если ты настаиваешь, поговори с мастером Пирокаром.
	b_logentry(TOPIC_FIRECONTEST,"Если я хочу потребовать пройти Испытание огнем, я должен поговорить с Мастером Пирокаром.");
};


instance DIA_PARLAN_TEACH_MANA(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 10;
	condition = dia_parlan_teach_mana_condition;
	information = dia_parlan_teach_mana_info;
	permanent = TRUE;
	description = "Я хочу повысить мои магические способности.";
};


func int dia_parlan_teach_mana_condition()
{
	if(((other.guild == GIL_KDF) || (other.guild == GIL_PAL) || ((other.guild == GIL_NOV) && Npc_KnowsInfo(hero,dia_parlan_learn))) && (PARLAN_SENDS == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlan_teach_mana_info()
{
	AI_Output(other,self,"DIA_Parlan_TEACH_MANA_15_00");	//Я хочу повысить мои магические способности
	Info_ClearChoices(dia_parlan_teach_mana);
	Info_AddChoice(dia_parlan_teach_mana,DIALOG_BACK,dia_parlan_teach_mana_back);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_parlan_teach_mana_1);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_parlan_teach_mana_5);
};

func void dia_parlan_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= 100)
	{
		AI_Output(self,other,"DIA_Parlan_TEACH_MANA_05_00");	//Твоя магическая энергия выросла. Я не могу помочь тебе повысить ее еще больше.
		AI_Output(self,other,"DIA_Parlan_TEACH_MANA_05_01");	//Если ты хочешь научиться большему, поговори с Пирокаром.
		PARLAN_SENDS = TRUE;
	};
	Info_ClearChoices(dia_parlan_teach_mana);
};

func void dia_parlan_teach_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,100);
	Info_ClearChoices(dia_parlan_teach_mana);
	Info_AddChoice(dia_parlan_teach_mana,DIALOG_BACK,dia_parlan_teach_mana_back);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_parlan_teach_mana_1);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_parlan_teach_mana_5);
};

func void dia_parlan_teach_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,100);
	Info_ClearChoices(dia_parlan_teach_mana);
	Info_AddChoice(dia_parlan_teach_mana,DIALOG_BACK,dia_parlan_teach_mana_back);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_parlan_teach_mana_1);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_parlan_teach_mana_5);
};


instance DIA_PARLAN_MAGE(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 2;
	condition = dia_parlan_mage_condition;
	information = dia_parlan_mage_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_parlan_mage_condition()
{
	if((other.guild == GIL_KDF) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_parlan_mage_info()
{
	AI_Output(self,other,"DIA_Parlan_MAGE_05_00");	//Ты принес клятву, брат. Добро пожаловать в наши ряды.
	AI_Output(self,other,"DIA_Parlan_MAGE_05_01");	//Я научу тебя первому Кругу магии, когда у тебя будет достаточно опыта.
	AI_Output(self,other,"DIA_Parlan_MAGE_05_02");	//Возьми этот рунный камень в качестве символа силы, которая теперь находится в твоих руках.
	b_giveinvitems(self,other,itmi_runeblank,1);
};


instance DIA_PARLAN_CIRCLE1(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 99;
	condition = dia_parlan_circle1_condition;
	information = dia_parlan_circle1_info;
	permanent = TRUE;
	description = "Научи меня первому Кругу магии.";
};


func int dia_parlan_circle1_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlan_mage) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 0))
	{
		return TRUE;
	};
};

func void dia_parlan_circle1_info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE1_15_00");	//Научи меня первому Кругу магии.
	if(b_teachmagiccircle(self,other,1))
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_01");	//Первый Круг магии позволит тебе использовать руны, созданные тобой.
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_02");	//Теперь ты достоин узнать формулы заклинаний для создания собственных рун.
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_03");	//Каждый из нас специализируется на своей области магии. Так что хорошо подумай, в какой области хочешь специализироваться ты.
	};
};


instance DIA_PARLAN_CIRCLE2(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 99;
	condition = dia_parlan_circle2_condition;
	information = dia_parlan_circle2_info;
	permanent = TRUE;
	description = "Научи меня второму Кругу магии.";
};


func int dia_parlan_circle2_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlan_mage) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1))
	{
		return TRUE;
	};
};

func void dia_parlan_circle2_info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE2_15_00");	//Научи меня второму Кругу магии.
	if(KAPITEL >= 2)
	{
		if(b_teachmagiccircle(self,other,2))
		{
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_01");	//Войди во второй Круг и научись использовать более сильную магию.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_02");	//Но также помни, что на тебе лежит большой груз ответственности. Не передо мной и Пирокаром - перед Инносом.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_03");	//Он покажет тебе направление - но путь формируют твои дела.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_04");	//Время еще не пришло.
	};
};


instance DIA_PARLAN_CIRCLE3(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 99;
	condition = dia_parlan_circle3_condition;
	information = dia_parlan_circle3_info;
	permanent = TRUE;
	description = "Научи меня третьему Кругу магии.";
};


func int dia_parlan_circle3_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlan_mage) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2))
	{
		return TRUE;
	};
};

func void dia_parlan_circle3_info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE3_15_00");	//Научи меня третьему Кругу магии.
	if(KAPITEL >= 3)
	{
		if(b_teachmagiccircle(self,other,3))
		{
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_01");	//Да, время пришло. Войди в третий Круг магии. Тебя ждут новые заклинания.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_02");	//Они тебе понадобятся - Зло хочет погрузить землю в хаос, и остановить его можно только с помощью силы Инноса.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_03");	//Я научил тебя всем Кругам, которыми владею сам. Карас введет тебя в другие Круги.
			b_logentry(TOPIC_KLOSTERTEACHER,"Брат Парлан обучил меня первым трем Кругам. Брат Каррас поможет мне изучить следующие Круги.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_04");	//Для изучения третьего Круга еще не пришло время.
	};
};


instance DIA_PARLAN_TEACH(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 3;
	condition = dia_parlan_teach_condition;
	information = dia_parlan_teach_info;
	permanent = TRUE;
	description = "Обучи меня (созданию рун).";
};


func int dia_parlan_teach_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_parlan_teach_info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Parlan_TEACH_15_00");	//Обучи меня!
	Info_ClearChoices(dia_parlan_teach);
	Info_AddChoice(dia_parlan_teach,DIALOG_BACK,dia_parlan_teach_back);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_LIGHTHEAL] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_LIGHTHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_parlan_teach_light_heal);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_LIGHT] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_LIGHT,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_parlan_teach_light);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_WINDFIST] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_WINDFIST,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_parlan_teach_windfist);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_SLEEP] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_SLEEP,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_parlan_teach_sleep);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_MEDIUMHEAL] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_MEDIUMHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_parlan_teach_mediumheal);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_FEAR] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_FEAR,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_parlan_teach_fear);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_DESTROYUNDEAD] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_DESTROYUNDEAD,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_parlan_teach_destroyundead);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_FULLHEAL] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_FULLHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_parlan_teach_fullheal);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Parlan_TEACH_05_01");	//Пока я ничему не могу научить тебя.
	};
};

func void dia_parlan_teach_back()
{
	Info_ClearChoices(dia_parlan_teach);
};

func void dia_parlan_teach_light_heal()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHTHEAL);
};

func void dia_parlan_teach_light()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHT);
};

func void dia_parlan_teach_windfist()
{
	b_teachplayertalentrunes(self,other,SPL_WINDFIST);
};

func void dia_parlan_teach_sleep()
{
	b_teachplayertalentrunes(self,other,SPL_SLEEP);
};

func void dia_parlan_teach_mediumheal()
{
	b_teachplayertalentrunes(self,other,SPL_MEDIUMHEAL);
};

func void dia_parlan_teach_fear()
{
	b_teachplayertalentrunes(self,other,SPL_FEAR);
};

func void dia_parlan_teach_destroyundead()
{
	b_teachplayertalentrunes(self,other,SPL_DESTROYUNDEAD);
};

func void dia_parlan_teach_fullheal()
{
	b_teachplayertalentrunes(self,other,SPL_FULLHEAL);
};


instance DIA_PARLAN_KAP2_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap2_exit_condition;
	information = dia_parlan_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_parlan_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};

func void b_parlan_exit()
{
	AI_Output(self,other,"DIA_Parlan_EXIT_05_00");	//Да защитит тебя Иннос.
};


instance DIA_PARLAN_KAP3_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap3_exit_condition;
	information = dia_parlan_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_parlan_kap3_exit_info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		b_parlan_exit();
	};
	AI_StopProcessInfos(self);
};


instance DIA_PARLAN_IAMPARLAN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 39;
	condition = dia_parlan_iamparlan_condition;
	information = dia_parlan_iamparlan_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_parlan_iamparlan_condition()
{
	if((KAPITEL >= 3) && Npc_IsInState(self,zs_talk) && ((other.guild != GIL_NOV) && (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_parlan_iamparlan_info()
{
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_00");	//Я вижу, ты решил сражаться на нашей стороне. Я рад.
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_01");	//Нам нужны каждые сильные руки. Ты должен поговорить с Мардуком, он отвечает за вас, паладинов.
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_02");	//Я не знаю, почему тебя пустили в монастырь. Я Парлан, и я отвечаю за наших послушников.
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_03");	//Я не хочу, чтобы ты отрывал их от работы своими дурацкими вопросами. Надеюсь, это ясно?
		PARLAN_DONTTALKTONOVICE = LOG_RUNNING;
		Info_ClearChoices(dia_parlan_iamparlan);
		Info_AddChoice(dia_parlan_iamparlan,"Я буду делать то, что сочту нужным.",dia_parlan_iamparlan_mychoice);
		Info_AddChoice(dia_parlan_iamparlan,"Конечно.",dia_parlan_iamparlan_ok);
	};
	Wld_InsertItem(itke_klosterbibliothek,"NW_MONASTERY_CORRIDOR_02");
};

func void dia_parlan_iamparlan_mychoice()
{
	AI_Output(other,self,"DIA_Parlan_IAmParlan_MyChoice_15_00");	//Я буду делать то, что сочту нужным.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_MyChoice_05_01");	//Возможно, тому, что тебя терпят здесь, есть причины, но предел есть всему.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_MyChoice_05_02");	//Если ты будешь создавать проблемы, ты ответишь за это. Так что лучше держись подальше от послушников.
	Info_ClearChoices(dia_parlan_iamparlan);
};

func void dia_parlan_iamparlan_ok()
{
	AI_Output(other,self,"DIA_Parlan_IAmParlan_OK_15_00");	//Конечно.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_OK_05_01");	//Очень надеюсь на это.
	Info_ClearChoices(dia_parlan_iamparlan);
};


instance DIA_PARLAN_BIBLIOTHEK(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 40;
	condition = dia_parlan_bibliothek_condition;
	information = dia_parlan_bibliothek_info;
	permanent = FALSE;
	description = "У тебя есть что-нибудь для меня?";
};


func int dia_parlan_bibliothek_condition()
{
	if((other.guild != GIL_KDF) && (KAPITEL >= 3) && (other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_parlan_bibliothek_info()
{
	AI_Output(other,self,"DIA_Parlan_Bibliothek_15_00");	//У тебя есть что-нибудь для меня?
	AI_Output(self,other,"DIA_Parlan_Bibliothek_05_01");	//Да. Как читателю библиотеки, тебе выдается ключ от нее. Там ты найдешь братьев Караса и Хигласа.
	AI_Output(self,other,"DIA_Parlan_Bibliothek_05_02");	//Если хочешь, ты можешь поговорить с ними.
	if(other.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Parlan_DontDisturb_05_03");	//Но оставь в покое послушников!
	};
	b_giveinvitems(self,other,itke_klosterbibliothek,1);
};


instance DIA_PARLAN_DONTDISTURB(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 39;
	condition = dia_parlan_dontdisturb_condition;
	information = dia_parlan_dontdisturb_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_parlan_dontdisturb_condition()
{
	if((PARLAN_DONTTALKTONOVICE == LOG_SUCCESS) && (b_getgreatestpetzcrime(self) == CRIME_NONE) && ((other.guild != GIL_PAL) || (other.guild != GIL_NOV) || (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_parlan_dontdisturb_info()
{
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_00");	//(угрожающе) Я не люблю повторять. Оставь послушников в покое.
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_01");	//Они должны очищать свой дух физическим трудом и готовить себя к жизни в монастыре.
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_02");	//(резко) Я не потерплю вмешательства в их работу!
	PARLAN_DONTTALKTONOVICE = LOG_RUNNING;
};


instance DIA_PARLAN_KAP3U4U5_PERM(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 39;
	condition = dia_parlan_kap3u4u5_perm_condition;
	information = dia_parlan_kap3u4u5_perm_info;
	permanent = TRUE;
	description = "Где мне найти...";
};


func int dia_parlan_kap3u4u5_perm_condition()
{
	if((KAPITEL >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_parlan_kap3u4u5_perm_info()
{
	AI_Output(other,self,"DIA_Parlan_Kap3_PERM_15_00");	//Где мне найти...
	Info_ClearChoices(dia_parlan_kap3u4u5_perm);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,DIALOG_BACK,dia_parlan_kap3u4u5_perm_back);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,"...церковь?",dia_parlan_kap3u4u5_perm_church);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,"...библиотеку?",dia_parlan_kap3u4u5_perm_library);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,"...часовню?",dia_parlan_kap3u4u5_perm_chapel);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,"...подвал?",dia_parlan_kap3u4u5_perm_cellar);
};

func void dia_parlan_kap3u4u5_perm_back()
{
	Info_ClearChoices(dia_parlan_kap3u4u5_perm);
};

func void dia_parlan_kap3u4u5_perm_church()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Church_15_00");	//...церковь?
	AI_Output(self,other,"DIA_Parlan_Add_05_00");	//О, господи! Неужели Иннос ослепил тебя?!
	AI_Output(self,other,"DIA_Parlan_Add_05_01");	//(цинично) Где церковь? Ох, боже, и куда же она подевалась?!
};

func void dia_parlan_kap3u4u5_perm_library()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Library_15_00");	//...библиотеку?
	AI_Output(self,other,"DIA_Parlan_Add_05_02");	//Библиотека находится в конце колоннады слева, прямо напротив церкви.
};

func void dia_parlan_kap3u4u5_perm_chapel()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Chapel_15_00");	//...часовню?
	AI_Output(self,other,"DIA_Parlan_Add_05_03");	//Часовня находится в комнате посередине левой колоннады. Там паладины молятся Инносу.
};

func void dia_parlan_kap3u4u5_perm_cellar()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Cellar_15_00");	//...подвал?
	AI_Output(self,other,"DIA_Parlan_Add_05_04");	//Вход в подвал находится посередине колоннады справа.
};


instance DIA_PARLAN_KAP4_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap4_exit_condition;
	information = dia_parlan_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_parlan_kap4_exit_info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		b_parlan_exit();
	};
	AI_StopProcessInfos(self);
};


instance DIA_PARLAN_KAP5_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap5_exit_condition;
	information = dia_parlan_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_parlan_kap5_exit_info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		b_parlan_exit();
	};
	AI_StopProcessInfos(self);
};

