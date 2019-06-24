
instance DIA_HAGEN_EXIT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 999;
	condition = dia_hagen_exit_condition;
	information = dia_hagen_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hagen_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_hagen_exit_info()
{
	AI_StopProcessInfos(self);
};


var int hagen_lastpetzcounter;
var int hagen_lastpetzcrime;

instance DIA_HAGEN_PMSCHULDEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 1;
	condition = dia_hagen_pmschulden_condition;
	information = dia_hagen_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hagen_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (HAGEN_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= HAGEN_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_hagen_pmschulden_info()
{
	var int diff;
	AI_Output(self,other,"DIA_Hagen_PMSchulden_04_00");	//Хорошо, что ты пришел. Ты можешь заплатить штраф прямо сейчас.
	if(b_gettotalpetzcounter(self) > HAGEN_LASTPETZCOUNTER)
	{
		diff = b_gettotalpetzcounter(self) - HAGEN_LASTPETZCOUNTER;
		if(diff > 0)
		{
			HAGEN_SCHULDEN = HAGEN_SCHULDEN + (diff * 50);
		};
		if(HAGEN_SCHULDEN > 1000)
		{
			HAGEN_SCHULDEN = 1000;
		};
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_01");	//Ты не очень-то серьезно относишься к законам города, да?
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_02");	//Список твоих преступлений все растет и растет.
		if(HAGEN_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_03");	//И не говори мне, что ты не знал этого!
		}
		else
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_04");	//Ты заплатишь максимальный штраф.
			b_say_gold(self,other,HAGEN_SCHULDEN);
		};
	}
	else if(b_getgreatestpetzcrime(self) < HAGEN_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_05");	//Похоже, ситуация изменилась.
		if(HAGEN_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_06");	//Больше нет свидетелей убийства, совершенного тобой!
		};
		if((HAGEN_LASTPETZCRIME == CRIME_THEFT) || ((HAGEN_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_07");	//Никто теперь не может подтвердить, что ты воровал!
		};
		if((HAGEN_LASTPETZCRIME == CRIME_ATTACK) || ((HAGEN_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_08");	//Больше нет свидетелей твоей драки.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_09");	//Все обвинения против тебя больше не находят подтверждений.
		};
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_10");	//Я не знаю, что случилось в городе, и не хочу знать.
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_11");	//Просто позаботься, чтобы у тебя не было проблем здесь.
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_12");	//Как бы то ни было, я решил простить твои прегрешения.
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_13");	//Смотри, чтобы этого больше не повторялось.
			HAGEN_SCHULDEN = 0;
			HAGEN_LASTPETZCOUNTER = 0;
			HAGEN_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_14");	//Ты, тем не менее, заплатишь штраф в полном объеме.
			b_say_gold(self,other,HAGEN_SCHULDEN);
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_15");	//Итак, ты будешь платить?
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_hagen_pmschulden);
		Info_ClearChoices(dia_hagen_petzmaster);
		Info_AddChoice(dia_hagen_pmschulden,"У меня нет столько золота!",dia_hagen_petzmaster_paylater);
		Info_AddChoice(dia_hagen_pmschulden,"Сколько там нужно?",dia_hagen_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= HAGEN_SCHULDEN)
		{
			Info_AddChoice(dia_hagen_pmschulden,"Я хочу заплатить штраф!",dia_hagen_petzmaster_paynow);
		};
	};
};

func void dia_hagen_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Hagen_PMSchulden_HowMuchAgain_15_00");	//Сколько там на этот раз?
	b_say_gold(self,other,HAGEN_SCHULDEN);
	Info_ClearChoices(dia_hagen_pmschulden);
	Info_ClearChoices(dia_hagen_petzmaster);
	Info_AddChoice(dia_hagen_pmschulden,"У меня нет столько золота!",dia_hagen_petzmaster_paylater);
	Info_AddChoice(dia_hagen_pmschulden,"Сколько там нужно?",dia_hagen_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= HAGEN_SCHULDEN)
	{
		Info_AddChoice(dia_hagen_pmschulden,"Я хочу заплатить штраф!",dia_hagen_petzmaster_paynow);
	};
};


instance DIA_HAGEN_PETZMASTER(C_INFO)
{
	npc = pal_200_hagen;
	nr = 1;
	condition = dia_hagen_petzmaster_condition;
	information = dia_hagen_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hagen_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > HAGEN_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_hagen_petzmaster_info()
{
	HAGEN_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_00");	//Твоя слава опережает тебя. Ты нарушил законы города.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_01");	//Ты влип в дерьмо по уши.
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_02");	//Убийство - серьезное преступление!
		HAGEN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		HAGEN_SCHULDEN = HAGEN_SCHULDEN + 500;
		if((PETZCOUNTER_CITY_THEFT + PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_03");	//Не говоря уже о других обвинениях.
		};
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_04");	//Страже приказано казнить убийц на месте.
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_05");	//Убийства неприемлемы в этом городе. Но ты можешь подтвердить свое раскаяние, заплатив штраф
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_06");	//Ты обвиняешься в воровстве!
		if((PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_07");	//Не говоря уже о других преступлениях, о которых я слышал.
		};
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_08");	//Это нарушение законов города. Ты должен заплатить штраф.
		HAGEN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_09");	//Ты ввязался в драку. Таким образом ты нарушил закон.
		if(PETZCOUNTER_CITY_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_10");	//А что там еще с овцой?
		};
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_11");	//Нарушение законов города - это нарушение законов Инноса.
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_12");	//Следовательно, ты должен заплатить за это.
		HAGEN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_13");	//Ты убил нашу овцу - я сначала даже не поверил в это.
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_14");	//Зачем ты делаешь все это?!
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_15");	//Ты должен заплатить компенсацию!
		HAGEN_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Hagen_PETZMASTER_15_16");	//Сколько?
	if(HAGEN_SCHULDEN > 1000)
	{
		HAGEN_SCHULDEN = 1000;
	};
	b_say_gold(self,other,HAGEN_SCHULDEN);
	Info_ClearChoices(dia_hagen_pmschulden);
	Info_ClearChoices(dia_hagen_petzmaster);
	Info_AddChoice(dia_hagen_petzmaster,"У меня нет столько золота!",dia_hagen_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= HAGEN_SCHULDEN)
	{
		Info_AddChoice(dia_hagen_petzmaster,"Я хочу заплатить штраф!",dia_hagen_petzmaster_paynow);
	};
};

func void dia_hagen_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Hagen_PETZMASTER_PayNow_15_00");	//Я хочу заплатить штраф!
	b_giveinvitems(other,self,itmi_gold,HAGEN_SCHULDEN);
	AI_Output(self,other,"DIA_Hagen_PETZMASTER_PayNow_04_01");	//Хорошо! Я позабочусь, чтобы все в городе узнали об этом. Это в некоторой степени восстановит твою репутацию.
	b_grantabsolution(LOC_CITY);
	HAGEN_SCHULDEN = 0;
	HAGEN_LASTPETZCOUNTER = 0;
	HAGEN_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_hagen_petzmaster);
	Info_ClearChoices(dia_hagen_pmschulden);
};

func void dia_hagen_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Hagen_PETZMASTER_PayLater_15_00");	//У меня нет столько золота!
	AI_Output(self,other,"DIA_Hagen_PETZMASTER_PayLater_04_01");	//Тогда позаботься о том, чтобы раздобыть это золото как можно быстрее.
	AI_Output(self,other,"DIA_Hagen_PETZMASTER_PayLater_04_02");	//И я предупреждаю тебя: если ты при этом усугубишь свою вину, на пощаду не рассчитывай.
	HAGEN_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	HAGEN_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_LORD_HAGEN_HALLO(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_hallo_condition;
	information = dia_lord_hagen_hallo_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_lord_hagen_hallo_condition()
{
	if((hero.guild != GIL_NONE) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_hallo_info()
{
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_00");	//Я уже слышал о тебе.
	if(Npc_KnowsInfo(other,dia_lothar_eyeinnos) || (ANDRE_EYEINNOS == TRUE))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_03");	//Лотар докладывал, что ты хочешь поговорить со мной.
		AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_01");	//Ты чужеземец, который требует Глаз Инноса.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_02");	//Я лорд Хаген.
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_03");	//Паладин короля, воин нашего владыки Инноса и главнокомандующий Хориниса.
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_04");	//Я очень занятой человек. Поэтому не трать мое время попусту. А теперь скажи, зачем ты здесь.
};


instance DIA_LORD_HAGEN_FRIEDEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_frieden_condition;
	information = dia_lord_hagen_frieden_info;
	permanent = FALSE;
	description = "Я принес предложение мира от наемников!";
};


func int dia_lord_hagen_frieden_condition()
{
	if((MIS_LEE_FRIEDENSANGEBOT == LOG_RUNNING) && (Npc_HasItems(other,itwr_passage_mis) > 0))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_frieden_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Frieden_15_00");	//Я принес предложение мира от наемников!
	b_giveinvitems(other,self,itwr_passage_mis,1);
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_01");	//(раздражительно) Хм... покажи!
	b_usefakescroll();
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_02");	//Я знаю генерала Ли. Мне также известно об обстоятельствах, при которых он был приговорен к исправительным работам в колонии.
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_03");	//Я считаю его благородным человеком. Я готов даровать ему помилование - но только ему!
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_04");	//Это не касается его людей, впрочем. Большинство из них - отъявленные головорезы и заслуживают наказания!
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_05");	//Я ни за что не помилую их. Можешь так и передать Ли.
	HAGEN_FRIEDENABGELEHNT = TRUE;
	if(!Npc_KnowsInfo(other,dia_lord_hagen_armee))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_06");	//Это все?
	};
	b_logentry(TOPIC_FRIEDEN,"Лорд Хаген готов даровать прощение Ли, но не другим наемникам.");
};


instance DIA_LORD_HAGEN_ARMEE(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_armee_condition;
	information = dia_lord_hagen_armee_info;
	permanent = FALSE;
	description = "Силы зла собираются очень близко отсюда. В Долине Рудников.";
};


func int dia_lord_hagen_armee_condition()
{
	if((!MIS_LEE_FRIEDENSANGEBOT == LOG_RUNNING) || (HAGEN_FRIEDENABGELEHNT == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_armee_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_00");	//Силы зла собираются очень близко отсюда. В Долине Рудников.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_01");	//В Долине Рудников? Мы отправили туда экспедицию. До нас также доходили сведения, что Проход оккупирован орками.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_02");	//Но до сего момента до меня не доходило никаких сведений об армии Зла.
	if(Npc_KnowsInfo(other,dia_lord_hagen_frieden))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_03");	//Это, что, такая уловка, чтобы я поверил, что мне необходимо заключить союз с наемниками?
		AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_04");	//Нет.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_05");	//(скептически) Что это еще за армия?
	AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_06");	//Армия драконов, которые собрали вокруг себя орды прислужников.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_07");	//Драконов? Согласно старинным писаниям, драконов не видели уже много веков.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_08");	//Скажи мне - почему я должен верить тому, что ты говоришь?
	AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_09");	//Вопрос не в том, должен ли ты мне верить. Вопрос в том, можешь ли ты себе позволить НЕ поверить мне в случае, если я говорю правду.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_10");	//Пока я не получу доказательств, я не могу позволить себе послать еще людей туда.
};


instance DIA_LORD_HAGEN_PROOF(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_proof_condition;
	information = dia_lord_hagen_proof_info;
	permanent = FALSE;
	description = "То есть ты хочешь, чтобы я принес тебе доказательство?";
};


func int dia_lord_hagen_proof_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_armee))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_proof_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Proof_15_00");	//То есть ты хочешь, чтобы я принес тебе доказательство?
	AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_01");	//Именно. Пройди через Проход в Долину Рудников. Когда ты будешь там, найди нашу экспедицию, а когда ты найдешь их, поговори с командующим Гарондом.
	AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_02");	//Вряд ли кто-то лучше него знает ситуацию там.
	AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_03");	//Если он подтвердит твои слова, я буду готов помочь тебе.
	AI_Output(other,self,"DIA_Lord_Hagen_Proof_15_04");	//Значит ли это, что ты отдашь мне Глаз Инноса?
	AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_05");	//Глаз Инноса... хорошо. Принеси мне доказательство, и я распоряжусь, чтобы тебе было позволено надеть этот амулет.
	AI_Output(other,self,"DIA_Lord_Hagen_Proof_15_06");	//То есть я могу считать, что ты дал слово?
	AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_07");	//Можешь, так как я действительно дал его.
};


instance DIA_LORD_HAGEN_AUGE(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_auge_condition;
	information = dia_lord_hagen_auge_info;
	permanent = FALSE;
	description = "Что ты знаешь о Глазе Инноса?";
};


func int dia_lord_hagen_auge_condition()
{
	return TRUE;
};

func void dia_lord_hagen_auge_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Auge_15_00");	//Что ты знаешь о Глазе Инноса?
	AI_Output(self,other,"DIA_Lord_Hagen_Auge_04_01");	//Это божественный артефакт. (задумчиво) В древних пророчествах он упоминается в связи с драконами.
	AI_Output(self,other,"DIA_Lord_Hagen_Auge_04_02");	//Однако писания также говорят, что его может носить только Избранный Инноса.
	if(other.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Auge_15_03");	//Я и есть Избранный Инноса!
		AI_Output(self,other,"DIA_Lord_Hagen_Auge_04_04");	//Тогда, возможно, ты действительно достоин получить этот амулет.
	};
};


instance DIA_LORD_HAGEN_PASS(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_pass_condition;
	information = dia_lord_hagen_pass_info;
	permanent = FALSE;
	description = "Как я пройду через Проход?";
};


func int dia_lord_hagen_pass_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_proof) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_pass_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Pass_15_00");	//Как я пройду через Проход?
	AI_Output(self,other,"DIA_Lord_Hagen_Pass_04_01");	//Я дам тебе ключ от ворот Прохода. Однако тебе самому придется решать, как пробраться через толпы орков.
	AI_Output(self,other,"DIA_Lord_Hagen_Pass_04_02");	//Да защитит тебя Иннос.
	AI_StopProcessInfos(self);
	MIS_OLDWORLD = LOG_RUNNING;
	b_kapitelwechsel(2,NEWWORLD_ZEN);
	CreateInvItems(self,itke_pass_mis,1);
	b_giveinvitems(self,other,itke_pass_mis,1);
	Log_CreateTopic(TOPIC_MISOLDWORLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MISOLDWORLD,LOG_RUNNING);
	b_logentry(TOPIC_MISOLDWORLD,"Лорд Хаген хочет, чтобы я принес ему доказательства существования армии Зла. Я должен отправиться в Долину рудников и поговорить с командующим Гарондом.");
	b_startotherroutine(fernando,"WAIT");
};


instance DIA_LORD_HAGEN_KHORINIS(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_khorinis_condition;
	information = dia_lord_hagen_khorinis_info;
	permanent = FALSE;
	description = "Зачем вы пришли в Хоринис?";
};


func int dia_lord_hagen_khorinis_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_armee) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_khorinis_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Khorinis_15_00");	//Зачем вы пришли в Хоринис?
	AI_Output(self,other,"DIA_Lord_Hagen_Khorinis_04_01");	//Мы выполняем важное задание королевства. Приказы нам исходят непосредственно от короля Робара.
	AI_Output(self,other,"DIA_Lord_Hagen_Khorinis_04_02");	//Я говорил тебе, что мы отправили экспедицию в Долину Рудников. Это главная причина нашего присутствия здесь.
};


instance DIA_LORD_HAGEN_MINENTAL(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_minental_condition;
	information = dia_lord_hagen_minental_info;
	permanent = TRUE;
	description = "А что ваши люди делают в Долине Рудников?";
};


func int dia_lord_hagen_minental_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_khorinis) && (KNOWSPALADINS_ORE == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_minental_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Minental_15_00");	//А что ваши люди делают в Долине Рудников?
	if(!Npc_KnowsInfo(other,dia_lord_hagen_proof))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_01");	//Я не вижу причин рассказывать тебе об этом!
	}
	else
	{
		if(garond.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_02");	//Ты был там. Ты должен знать.
		}
		else
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_03");	//Хорошо, так как ты все равно идешь туда, я все же расскажу тебе.
		};
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_04");	//Причиной всему - магическая руда. Она может решить исход этой войны.
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_05");	//Без достаточного количества оружия из магической руды у королевской армии нет ни единого шанса против элитных воинов орков.
		if(other.guild != GIL_SLD)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_06");	//А шахты с магической рудой, находящиеся на острове, - последние, к которым у нас еще есть доступ.
		};
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_07");	//Как только наш корабль будет загружен рудой, мы отправимся назад, на материк.
		KNOWSPALADINS_ORE = TRUE;
		AI_Output(other,self,"DIA_Lord_Hagen_Minental_15_08");	//Значит, война против орков идет плохо, да?
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_09");	//Я и так сказал тебе слишком много.
	};
};


instance DIA_HAGEN_CANTEACH(C_INFO)
{
	npc = pal_200_hagen;
	nr = 5;
	condition = dia_hagen_canteach_condition;
	information = dia_hagen_canteach_info;
	permanent = FALSE;
	description = "Я ищу мастера-мечника.";
};


func int dia_hagen_canteach_condition()
{
	if((LORDHAGEN_TEACH2H == FALSE) && (other.guild == GIL_PAL) && (other.hitchance[NPC_TALENT_2H] >= 90) && (other.hitchance[NPC_TALENT_2H] < 100))
	{
		return TRUE;
	};
};

func void dia_hagen_canteach_info()
{
	AI_Output(other,self,"DIA_Hagen_CanTeach_15_00");	//Я ищу мастера-мечника.
	AI_Output(self,other,"DIA_Hagen_CanTeach_04_01");	//Да? Считай, что ты нашел его.
	LORDHAGEN_TEACH2H = TRUE;
	b_logentry(TOPIC_CITYTEACHER,"Лорд Хаген может обучить меня сражаться двуручным оружием.");
};


instance DIA_HAGEN_TEACH(C_INFO)
{
	npc = pal_200_hagen;
	nr = 100;
	condition = dia_hagen_teach_condition;
	information = dia_hagen_teach_info;
	permanent = TRUE;
	description = "Начнем (изучить бой двуручным оружием).";
};


var int dia_hagen_teach_permanent;

func int dia_hagen_teach_condition()
{
	if((LORDHAGEN_TEACH2H == TRUE) && (DIA_HAGEN_TEACH_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_hagen_teach_info()
{
	AI_Output(other,self,"DIA_Hagen_Teach_15_00");	//Приступим к обучению!
	Info_ClearChoices(dia_hagen_teach);
	Info_AddChoice(dia_hagen_teach,DIALOG_BACK,dia_hagen_teach_back);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_hagen_teach_2h_1);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_hagen_teach_2h_5);
};

func void dia_hagen_teach_back()
{
	if(other.hitchance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_Hagen_Teach_04_00");	//Ты стал великолепным мечником. Мне больше нечему учить тебя.
		AI_Output(self,other,"DIA_Hagen_Teach_04_01");	//Да ведет твою руку в будущих свершениях мудрость мастера-мечника.
		DIA_HAGEN_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_hagen_teach);
};

func void dia_hagen_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,100);
	Info_ClearChoices(dia_hagen_teach);
	Info_AddChoice(dia_hagen_teach,DIALOG_BACK,dia_hagen_teach_back);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_hagen_teach_2h_1);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_hagen_teach_2h_5);
};

func void dia_hagen_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,100);
	Info_ClearChoices(dia_hagen_teach);
	Info_AddChoice(dia_hagen_teach,DIALOG_BACK,dia_hagen_teach_back);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_hagen_teach_2h_1);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_hagen_teach_2h_5);
};


instance DIA_LORD_HAGEN_KNIGHT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 990;
	condition = dia_lord_hagen_knight_condition;
	information = dia_lord_hagen_knight_info;
	permanent = TRUE;
	description = "Я хочу поступить на службу в орден.";
};


func int dia_lord_hagen_knight_condition()
{
	if(hero.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_knight_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_15_00");	//Я хочу поступить на службу в орден.
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_01");	//Хорошо, ты доказал, что у тебя есть мужество, опыт и знания, чтобы служить Инносу.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_02");	//Твои дела свидетельствуют о том, что у тебя чистое сердце.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_03");	//Если таково твое желание, наш орден с радостью примет тебя.
		Info_ClearChoices(dia_lord_hagen_knight);
		Info_AddChoice(dia_lord_hagen_knight,"Я еще не совсем уверен.",dia_lord_hagen_knight_no);
		Info_AddChoice(dia_lord_hagen_knight,"Я готов!",dia_lord_hagen_knight_yes);
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_04");	//Стать воином Инноса означает  полностью посвятить себя служению Инносу.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_05");	//Только самые благородные и мужественные воины могут быть приняты в орден.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_06");	//Если ты твердо решил стать паладином, ты должен доказать, что достоин этого.
	};
	HAGEN_GAVEINFOKNIGHT = TRUE;
};

func void dia_lord_hagen_knight_no()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_No_15_00");	//Я еще не совсем уверен.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_No_04_01");	//Тогда иди и освободи свое сердце от сомнений. Возвращайся, когда будешь готов.
	Info_ClearChoices(dia_lord_hagen_knight);
};

func void dia_lord_hagen_knight_yes()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_Yes_15_00");	//Я готов!
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_01");	//(торжественно) Тогда так тому и быть!
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_02");	//(торжественно) Много людей вступило на этот путь и отдало свои жизни во имя Инноса.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_03");	//(торжественно) Ты клянешься, что твои дела не опозорят их честь и будут прославлять Инноса?
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_Yes_15_04");	//Клянусь!
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_05");	//Тогда отныне ты принадлежишь к нашему братству.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_06");	//Я произвожу тебя в воины Инноса.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_07");	//Я даю тебе оружие и доспехи рыцаря. Носи их с гордостью, рыцарь!
	CreateInvItems(self,itar_pal_m,1);
	b_giveinvitems(self,other,itar_pal_m,1);
	if(other.hitchance[NPC_TALENT_2H] >= other.hitchance[NPC_TALENT_1H])
	{
		CreateInvItems(self,itmw_2h_pal_sword,1);
		b_giveinvitems(self,other,itmw_2h_pal_sword,1);
	}
	else
	{
		CreateInvItems(self,itmw_1h_pal_sword,1);
		b_giveinvitems(self,other,itmw_1h_pal_sword,1);
	};
	AI_UnequipArmor(other);
	AI_EquipArmor(other,itar_pal_m);
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_08");	//С этого времени благодаря твоему рангу ты будешь иметь доступ в монастырь.
	if(Npc_IsDead(albrecht) == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_09");	//Альбрехт научит тебя магии, иди и поговори с ним.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_02");	//И, конечно же, наши казармы в верхней части города всегда открыты для тебя.
	hero.guild = GIL_PAL;
	Npc_SetTrueGuild(other,GIL_PAL);
	Info_ClearChoices(dia_lord_hagen_knight);
};


instance DIA_LORD_HAGEN_WHATPROOF(C_INFO)
{
	npc = pal_200_hagen;
	nr = 991;
	condition = dia_lord_hagen_whatproof_condition;
	information = dia_lord_hagen_whatproof_info;
	permanent = FALSE;
	description = "Как я могу доказать, что достоин?";
};


func int dia_lord_hagen_whatproof_condition()
{
	if((HAGEN_GAVEINFOKNIGHT == TRUE) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_whatproof_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_WhatProof_15_00");	//Как я могу доказать, что достоин?
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_01");	//Твои дела покажут, достоин ты или нет.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_02");	//Мы сражаемся за свободу и справедливость во имя Инноса.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_03");	//Мы сражаемся против Белиара и его приспешников, которые жаждут уничтожить орден Инноса.
	AI_Output(other,self,"DIA_Lord_Hagen_WhatProof_15_04");	//Я понимаю.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_05");	//Ты ничего не понимаешь! Наша честь - наша жизнь, а наша жизнь - Иннос.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_06");	//Паладин идет в бой с именем Инноса на устах, и многие из нас положили свою жизнь на алтарь вечной борьбы Добра со Злом.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_07");	//Все мы как один посвятили себя этой борьбе. Если мы потерпим поражение, мы оскверним память наших павших товарищей.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_08");	//Только тот, кто сердцем понимает это, достоин быть паладином.
};


instance DIA_LORD_HAGEN_KAP3_EXIT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 999;
	condition = dia_lord_hagen_kap3_exit_condition;
	information = dia_lord_hagen_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lord_hagen_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


var int hagen_knowseyekaputt;

instance DIA_LORD_HAGEN_KAP3U4_PERM(C_INFO)
{
	npc = pal_200_hagen;
	nr = 998;
	condition = dia_lord_hagen_kap3u4_perm_condition;
	information = dia_lord_hagen_kap3u4_perm_info;
	permanent = TRUE;
	description = "Как ситуация?";
};


func int dia_lord_hagen_kap3u4_perm_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap3u4_perm_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_KAP3U4_PERM_15_00");	//Как ситуация?
	if(MIS_OLDWORLD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_04");	//Я должен найти способ спасти эту экспедицию.
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_05");	//Мы должны сделать что-то с драконами.
		if(HAGEN_KNOWSEYEKAPUTT == FALSE)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Add_04_06");	//(себе под нос) Возможно, Глаз Инноса может спасти нас всех...
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_01");	//Я с ума сойду здесь. Я солдат, а не бюрократ.
		AI_Output(self,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_02");	//Из-за всей этой бумажной работы, что я должен делать, я уже почти забыл ощущение от клинка в руке.
	};
};


instance DIA_LORD_HAGEN_EYEBROKEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 1;
	condition = dia_lord_hagen_eyebroken_condition;
	information = dia_lord_hagen_eyebroken_info;
	permanent = FALSE;
	description = "Глаз у меня, но он поврежден.";
};


func int dia_lord_hagen_eyebroken_condition()
{
	if((KAPITEL == 3) && (MIS_READYFORCHAPTER4 == FALSE) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)) && (MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_eyebroken_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_07");	//Глаз у меня, но он поврежден.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_08");	//ЧТО? О, Иннос! Что ты наделал? Нам нужен этот Глаз!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_09");	//Поговори с  Пирокаром! Должен быть способ восстановить его.
	HAGEN_KNOWSEYEKAPUTT = TRUE;
};


instance DIA_LORD_HAGEN_BACKINTOWN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_backintown_condition;
	information = dia_lord_hagen_backintown_info;
	permanent = FALSE;
	description = "Я принес тебе новости от Гаронда.";
};


func int dia_lord_hagen_backintown_condition()
{
	if((MIS_OLDWORLD == LOG_RUNNING) && (Npc_HasItems(hero,itwr_paladinletter_mis) >= 1) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_backintown_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_00");	//Я принес тебе новости от Гаронда. Вот, он начертал эти строки для тебя.
	b_giveinvitems(other,self,itwr_paladinletter_mis,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_01");	//Наша ситуация хуже, чем я опасался. Но доложи мне о ситуации в Долине Рудников.
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_02");	//Паладины заперты в замке Долины Рудников, окруженном орками.
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_03");	//Они потеряли много людей в старательских операциях и добыли очень мало руды.
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_04");	//И, должен добавить, без помощи извне им всем скоро придет конец. Вот такие дела.
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_05");	//Я должен найти способ спасти эту экспедицию. Ты многое сделал для нас. Иннос благодарит тебя...
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_06");	//Мне не интересна его благодарность. Мне нужен его глаз.
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_07");	//Да, конечно. Я держу свое слово. Возьми это письмо. Оно откроет перед тобой монастырские врата.
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_08");	//Поговори с Пирокаром, высшим Магом Огня, и покажи ему это письмо с полномочиями. Он предоставит тебе доступ к Глазу Инноса.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_00");	//И еще одно, прежде чем ты уйдешь...
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_01");	//Возьми эту руну в знак моей благодарности. Она вернет тебя в город, когда ты этого захочешь.
	b_giveinvitems(self,other,itru_teleportseaport,1);
	CreateInvItems(self,itwr_permissiontowearinnoseye_mis,1);
	b_giveinvitems(self,other,itwr_permissiontowearinnoseye_mis,1);
	MIS_INNOSEYESTOLEN = TRUE;
	MIS_OLDWORLD = LOG_SUCCESS;
	b_logentry(TOPIC_INNOSEYE,"Лорд Хаген дал мне записку. Она заставит мастера Пирокара в монастыре отдать мне Глаз Инноса.");
	Wld_InsertNpc(vlk_4250_jorgen,"NW_MONASTERY_BRIDGE_01");
	Wld_InsertNpc(bdt_1050_landstreicher,"NW_TROLLAREA_NOVCHASE_01");
	Wld_InsertNpc(bdt_1051_wegelagerer,"NW_TROLLAREA_RITUALFOREST_09");
	Wld_InsertNpc(bdt_1052_wegelagerer,"NW_TROLLAREA_RITUALFOREST_09");
	b_killnpc(bdt_1020_bandit_l);
	Wld_InsertNpc(dmt_1200_dementor,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(dmt_1202_dementor,"NW_TROLLAREA_RITUAL_01");
	Wld_InsertNpc(dmt_1204_dementor,"NW_TROLLAREA_RITUAL_03");
	Wld_InsertNpc(dmt_1206_dementor,"NW_TROLLAREA_RITUAL_05");
	Wld_InsertNpc(dmt_1207_dementor,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(dmt_1209_dementor,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(dmt_1210_dementor,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(dmt_1211_dementor,"NW_TROLLAREA_RITUALPATH_01");
	b_startotherroutine(pedro,"Tot");
	if(Npc_IsDead(miltennw))
	{
		Wld_InsertNpc(pc_mage_nw,"NW_MONASTERY_ENTRY_01");
		b_startotherroutine(miltennw,"START");
	};
	Wld_InsertNpc(nov_650_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_650_toternovize);
	Wld_InsertNpc(nov_651_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_651_toternovize);
	Wld_InsertNpc(nov_652_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_652_toternovize);
	Wld_InsertNpc(nov_653_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_653_toternovize);
	Wld_InsertNpc(nov_654_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_654_toternovize);
	Wld_InsertNpc(nov_655_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_655_toternovize);
	Wld_InsertNpc(nov_656_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_656_toternovize);
	TEXT_INNOSEYE_SETTING = TEXT_INNOSEYE_SETTING_BROKEN;
	Wld_InsertItem(itmi_innoseye_broken_mis,"FP_TROLLAREA_RITUAL_ITEM");
};


var int hagen_einmalbennet;

instance DIA_LORD_HAGEN_RESCUEBENNET(C_INFO)
{
	npc = pal_200_hagen;
	nr = 3;
	condition = dia_lord_hagen_rescuebennet_condition;
	information = dia_lord_hagen_rescuebennet_info;
	permanent = TRUE;
	description = "Мне нужно поговорить с тобой о Беннете.";
};


func int dia_lord_hagen_rescuebennet_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && (CORNELIUS_ISLIAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_rescuebennet_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_15_00");	//Мне нужно поговорить с тобой о Беннете.
	if(HAGEN_EINMALBENNET == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_04_01");	//Но этот наемник убил одного их моих людей.
		HAGEN_EINMALBENNET = TRUE;
	};
	Info_ClearChoices(dia_lord_hagen_rescuebennet);
	Info_AddChoice(dia_lord_hagen_rescuebennet,DIALOG_BACK,dia_lord_hagen_rescuebennet_back);
	Info_AddChoice(dia_lord_hagen_rescuebennet,"Почему ты так уверен, что убийца именно Беннет?",dia_lord_hagen_rescuebennet_whysure);
	Info_AddChoice(dia_lord_hagen_rescuebennet,"Я верю, что Беннет невиновен.",dia_lord_hagen_rescuebennet_innoscent);
	if((MIS_RESCUEBENNET == LOG_RUNNING) && (MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (HAGEN_KNOWSEYEKAPUTT == TRUE))
	{
		Info_AddChoice(dia_lord_hagen_rescuebennet,"Беннет мог бы помочь нам починить Глаз Инноса.",dia_lord_hagen_rescuebennet_hilfe);
	};
};

func void dia_lord_hagen_rescuebennet_hilfe()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_16");	//Беннет мог бы помочь нам починить Глаз Инноса.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_17");	//Даже если бы он мог вызвать самого Инноса на землю...
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_18");	//Он убил паладина. За это он будет казнен!
};

func void dia_lord_hagen_rescuebennet_back()
{
	Info_ClearChoices(dia_lord_hagen_rescuebennet);
};

func void dia_lord_hagen_rescuebennet_whysure()
{
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_WhySure_15_00");	//Почему ты так уверен, что убийца именно Беннет?
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_WhySure_04_01");	//У нас есть свидетель.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_WhySure_04_02");	//Как видишь, нет никаких сомнений в виновности этого наемника.
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_Witness_15_00");	//Кто этот свидетель?
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Witness_04_01");	//Корнелиус, секретарь губернатора, видел, как произошло убийство.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Witness_04_02");	//Его описание подходит к Беннету, в этом нет никаких сомнений. По моему мнению, это достаточное доказательство.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Witness_04_03");	//Этот наемник будет повешен за измену.
	b_logentry(TOPIC_RESCUEBENNET,"Корнелиус, секретарь губернатора, является свидетелем. Он утверждает, что был свидетелем убийства.");
	RECUEBENNET_KNOWSCORNELIUS = TRUE;
};

func void dia_lord_hagen_rescuebennet_innoscent()
{
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_Innoscent_15_00");	//Я верю, что Беннет невиновен.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Innoscent_04_01");	//Доказательства налицо. Он виновен.
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_Innoscent_15_02");	//А что если доказательства неверны?
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Innoscent_04_03");	//Выбирай слова. Ты выдвигаешь серьезное обвинение.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Innoscent_04_04");	//Если ты не можешь представить доказательство того, что свидетель солгал, тебе лучше попридержать язык.
};


instance DIA_LORD_HAGEN_CORNELIUS(C_INFO)
{
	npc = pal_200_hagen;
	nr = 3;
	condition = dia_lord_hagen_cornelius_condition;
	information = dia_lord_hagen_cornelius_info;
	permanent = TRUE;
	description = "Корнелиус солгал.";
};


func int dia_lord_hagen_cornelius_condition()
{
	if((Npc_HasItems(other,itwr_corneliustagebuch_mis) >= 1) && (CORNELIUS_ISLIAR == TRUE) && (MIS_RESCUEBENNET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_cornelius_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_00");	//Корнелиус солгал.
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_01");	//Откуда тебе это известно?
	AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_02");	//Вот, у меня его дневник. Все в нем.
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_03");	//(в ярости) Ах, гнусная мразь!
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_04");	//Перед лицом новых доказательств мне не остается ничего другого.
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_05");	//Властью, данной мне королем и церковью, я провозглашаю...
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_06");	//...что с заключенного Беннета снимаются все обвинения и он подлежит освобождению.
	b_startotherroutine(bennet,"START");
	b_startotherroutine(hodges,"START");
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_07");	//Корнелиус должен быть немедленно посажен под арест за лжесвидетельство.
	if(Npc_IsDead(cornelius) == TRUE)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_08");	//Можешь не беспокоиться. Корнелиус мертв.
		AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_09");	//Значит, он уже понес заслуженное наказание. Отлично.
	}
	else if(CORNELIUSFLEE == TRUE)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_10");	//Он сбежал.
		AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_11");	//Рано или поздно, он объявится. И тогда мы арестуем его.
		b_startotherroutine(cornelius,"FLED");
	}
	else
	{
		b_startotherroutine(cornelius,"PRISON");
	};
	MIS_RESCUEBENNET = LOG_SUCCESS;
	b_giveplayerxp(XP_RESCUEBENNET);
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_12");	//Твои дела спасли нас от бесчестья.
	};
};


instance DIA_LORD_HAGEN_AUGEAMSTART(C_INFO)
{
	npc = pal_200_hagen;
	nr = 4;
	condition = dia_lord_hagen_augeamstart_condition;
	information = dia_lord_hagen_augeamstart_info;
	permanent = FALSE;
	description = "Я надел Глаз!";
};


func int dia_lord_hagen_augeamstart_condition()
{
	if((KAPITEL <= 4) && (MIS_READYFORCHAPTER4 == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_augeamstart_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_10");	//Я надел Глаз!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_11");	//(благоговейно) Ты носишь Глаз!
	if(HAGEN_KNOWSEYEKAPUTT == TRUE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_12");	//И ты восстановил его!
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_13");	//Значит ты Избранный Инноса!
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_14");	//Я должен отправляться в путь и убить всех драконов в Долине Рудников!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_15");	//Иди с Инносом и уничтожь Зло с его помощью!
};


instance DIA_LORD_HAGEN_KAP4_EXIT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 999;
	condition = dia_lord_hagen_kap4_exit_condition;
	information = dia_lord_hagen_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lord_hagen_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LORD_HAGEN_ANTIPALADINE(C_INFO)
{
	npc = pal_200_hagen;
	nr = 3;
	condition = dia_lord_hagen_antipaladine_condition;
	information = dia_lord_hagen_antipaladine_info;
	permanent = TRUE;
	description = "Элитные воины орков нападают на наши земли.";
};


func int dia_lord_hagen_antipaladine_condition()
{
	if(((TALKEDTO_ANTIPALADIN == TRUE) || Npc_HasItems(other,itri_orcelitering)) && (HAGEN_SAWORCRING == FALSE) && (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};


var int hagen_saworcring;

func void dia_lord_hagen_antipaladine_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_00");	//Элитные воины орков нападают на наши земли.
	Log_CreateTopic(TOPIC_ORCELITE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORCELITE,LOG_RUNNING);
	b_logentry(TOPIC_ORCELITE,"Я рассказал лорду Хагену о приближающихся ордах предводителей орков.");
	if((TALKEDTO_ANTIPALADIN == TRUE) && (MIS_KILLORKOBERST == 0))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_01");	//Откуда у тебя такая информация?
		AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_02");	//Я говорил с одним из них. Твое имя также упоминалось.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_03");	//Чушь. Мои люди не докладывали о массированном вторжении орков.
	AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_04");	//Возможно, какие-то их разведчики заблудились в близлежащих лесах.
	if(Npc_HasItems(other,itri_orcelitering))
	{
		AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_05");	//Это не разведчики. Я взял это кольцо с трупа одного из них.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_06");	//Покажи.
		b_giveinvitems(other,self,itri_orcelitering,1);
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_07");	//Ммм. Это действительно неприятно.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_08");	//Это знак их силы. Значит, орки выбрались из-за своих частоколов и сражаются в открытом поле.
		AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_09");	//Я не видел, чтобы их было много. В основном, это их предводители и всего несколько бойцов.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_10");	//Да? Значит, они замышляют что-то еще. Это не похоже на орков, чтобы их лидеры в одиночку покидали свои защитные частоколы.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_11");	//Но это может стать хорошей возможностью, впрочем, нанести им чувствительный удар.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_12");	//Если они потеряют своих лидеров, их боевой дух резко снизится.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_13");	//У тебя новое задание, рыцарь. Иди и убей всех лидеров орков, каких найдешь в прилежащих землях.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_14");	//Принеси мне их кольца. Это будет серьезный удар по оркам.
		b_logentry(TOPIC_ORCELITE,"Я смог принести Хагену кольцо предводителя орков в качестве доказательства. Он хочет, чтобы я принес ему все кольца предводителей, которые я найду.");
		if((Npc_IsDead(ingmar) == FALSE) && (MIS_KILLORKOBERST == 0))
		{
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_15");	//Поговори с Ингмаром. Он может дать тебе несколько тактических советов по сражению с лидерами орков.
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_16");	//Элитные воины орков - его специализация. Ему часто приходилось иметь с ними дело.
			b_logentry(TOPIC_ORCELITE,"Ингмар очень много знает об элитных воинах орков.");
		};
		HAGEN_SAWORCRING = TRUE;
		b_giveplayerxp(XP_PAL_ORCRING);
	}
	else
	{
		if(MIS_KILLORKOBERST == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_17");	//Одного твоего слова, что ты убил полководца орков, недостаточно для меня.
		};
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_18");	//Мне нужны вещественные доказательства, чтобы я мог принять меры.
		b_logentry(TOPIC_ORCELITE,"Хаген отказывается верить мне. Он требует доказательств того, что элитные воины орков нападают на цивилизованные земли. Ну, меня бы удивило, если бы он повел себя по-другому.");
	};
};


instance DIA_LORD_HAGEN_RINGEBRINGEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 5;
	condition = dia_lord_hagen_ringebringen_condition;
	information = dia_lord_hagen_ringebringen_info;
	permanent = TRUE;
	description = "Я могу еще кое-что сообщить о предводителях орков.";
};


func int dia_lord_hagen_ringebringen_condition()
{
	if((HAGEN_SAWORCRING == TRUE) && (Npc_HasItems(other,itri_orcelitering) >= 1) && (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};


var int orkringcounter;

func void dia_lord_hagen_ringebringen_info()
{
	var int ringcount;
	var int xp_pal_orcrings;
	var int orcringgeld;
	var int hagensringoffer;
	AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_00");	//Я могу еще кое-что сообщить о предводителях орков.
	AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_01");	//Рассказывай.
	hagensringoffer = 150;
	ringcount = Npc_HasItems(other,itri_orcelitering);
	if(ringcount == 1)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_02");	//Я могу дать тебе еще одно кольцо орков.
		b_giveplayerxp(XP_PAL_ORCRING);
		b_giveinvitems(other,self,itri_orcelitering,1);
		ORKRINGCOUNTER = ORKRINGCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_03");	//Я могу дать тебе еще несколько колец орков.
		b_giveinvitems(other,self,itri_orcelitering,ringcount);
		xp_pal_orcrings = ringcount * XP_PAL_ORCRING;
		ORKRINGCOUNTER = ORKRINGCOUNTER + ringcount;
		b_giveplayerxp(xp_pal_orcrings);
	};
	AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_04");	//Я горжусь тобой. Так держать!
	if(ORKRINGCOUNTER <= 10)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_05");	//Возможно, еще не все предводители орков уничтожены.
	}
	else if(ORKRINGCOUNTER <= 20)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_06");	//Но скоро мы поставим их на колени.
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_07");	//Я удивлюсь, если ты еще их повстречаешь.
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_08");	//Ты можешь приносить мне их кольца, но я думаю, орки уже получили хороший урок.
		TOPIC_END_ORCELITE = TRUE;
	};
	AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_09");	//Вот. Возьми это золото, купи себе на него хорошее снаряжение.
	orcringgeld = ringcount * hagensringoffer;
	CreateInvItems(self,itmi_gold,orcringgeld);
	b_giveinvitems(self,other,itmi_gold,orcringgeld);
};


instance DIA_LORD_HAGEN_KAP5_EXIT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 999;
	condition = dia_lord_hagen_kap5_exit_condition;
	information = dia_lord_hagen_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lord_hagen_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LORD_HAGEN_ALLDRAGONSDEAD(C_INFO)
{
	npc = pal_200_hagen;
	nr = 4;
	condition = dia_lord_hagen_alldragonsdead_condition;
	information = dia_lord_hagen_alldragonsdead_info;
	permanent = FALSE;
	description = "Драконы мертвы.";
};


func int dia_lord_hagen_alldragonsdead_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_AllDragonsDead_15_00");	//Драконы мертвы.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_19");	//Я знал, что Иннос даст тебе силы, чтобы победить драконов!
	AI_Output(self,other,"DIA_Lord_Hagen_AllDragonsDead_04_02");	//Как там с рудой?
	AI_Output(other,self,"DIA_Lord_Hagen_AllDragonsDead_15_03");	//Орки все еще осаждают замок в Долине Рудников. Гаронд не сможет покинуть замок, пока осада не снята.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_20");	//(в ярости) Черт!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_21");	//Если Гаронд не способен справиться с ситуацией, я должен взять управление в свои руки.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_22");	//Кучка орков не остановит меня! Только не меня!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_23");	//Я уже отдал приказ своим людям. Мы готовимся выступать.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_24");	//Мы ВСЕ отправимся туда. Я оставлю только минимальную охрану на корабле.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_25");	//Этого должно быть достаточно, чтобы, наконец, разделаться с этими орками!
	MIS_SCVISITSHIP = LOG_RUNNING;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"ShipFree");
};


instance DIA_LORD_HAGEN_NEEDSHIP(C_INFO)
{
	npc = pal_200_hagen;
	nr = 4;
	condition = dia_lord_hagen_needship_condition;
	information = dia_lord_hagen_needship_info;
	permanent = FALSE;
	description = "Мне нужен корабль.";
};


func int dia_lord_hagen_needship_condition()
{
	if(ITWR_SCREADSHALLSOFIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_needship_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_NeedShip_15_00");	//Мне нужен корабль.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_01");	//Он много кому нужен, солдат.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_02");	//(смеется) Я слышу это чуть ли не каждый день, дорогой. Но...
	};
	AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_03");	//У тебя даже нет капитана, не говоря уже о команде.
	AI_Output(other,self,"DIA_Lord_Hagen_NeedShip_15_04");	//Как насчет корабля, стоящего в гавани?
	AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_05");	//Он принадлежит мне, и точка. Мы должны перевозить руду на этом корабле.
	AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_06");	//Когда мы покончим с этим, ты можешь обратиться ко мне опять.
};


instance DIA_LORD_HAGEN_GATEOPEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 5;
	condition = dia_lord_hagen_gateopen_condition;
	information = dia_lord_hagen_gateopen_info;
	permanent = FALSE;
	description = "Орки ворвались в замок в Долине Рудников!";
};


func int dia_lord_hagen_gateopen_condition()
{
	if((MIS_OCGATEOPEN == TRUE) && Npc_KnowsInfo(other,dia_lord_hagen_alldragonsdead))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_gateopen_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_29");	//Орки ворвались в замок в Долине Рудников!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_30");	//О, Иннос! Что именно там произошло?
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_31");	//Почему-то ворота оказались открытыми...
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_32");	//Почему-то?! Но как это возможно... В замке наверняка есть предатель!
};


instance DIA_LORD_HAGEN_PERM5(C_INFO)
{
	npc = pal_200_hagen;
	nr = 5;
	condition = dia_lord_hagen_perm5_condition;
	information = dia_lord_hagen_perm5_info;
	permanent = TRUE;
	description = "Чего ты ждешь?";
};


func int dia_lord_hagen_perm5_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_alldragonsdead))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_perm5_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_33");	//Чего ты ждешь?
	if(MIS_OCGATEOPEN == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_26");	//Мы все еще ждем груз со снаряжением и провизией. Как только он будет у нас, мы сразу же тронемся в путь!
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_27");	//Теперь, когда замок взят штурмом, нам нужно больше провизии.
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_28");	//Но это не задержит нас надолго.
	};
};

