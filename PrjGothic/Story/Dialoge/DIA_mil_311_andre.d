
instance DIA_ANDRE_EXIT(C_INFO)
{
	npc = mil_311_andre;
	nr = 999;
	condition = dia_andre_exit_condition;
	information = dia_andre_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_andre_exit_condition()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_andre_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ANDRE_FIRSTEXIT(C_INFO)
{
	npc = mil_311_andre;
	nr = 999;
	condition = dia_andre_firstexit_condition;
	information = dia_andre_firstexit_info;
	permanent = FALSE;
	description = DIALOG_ENDE;
};


func int dia_andre_firstexit_condition()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_andre_firstexit_info()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	b_startotherroutine(wulfgar,"START");
};


var int andre_steckbrief;

func void b_andre_steckbrief()
{
	AI_Output(self,other,"DIA_Andre_Add_08_00");	//Один из моих людей сказал мне, что бандиты распространяют объявления о розыске с твоим изображением.
	AI_Output(self,other,"DIA_Andre_Add_08_01");	//Он также сказал, что поначалу ты это отрицал.
	AI_Output(self,other,"DIA_Andre_Add_08_02");	//Так что все это значит?
	AI_Output(other,self,"DIA_Andre_Add_15_03");	//Я не знаю, почему они ищут меня...
	AI_Output(self,other,"DIA_Andre_Add_08_04");	//Надеюсь, ради твоего же блага, что ты говоришь мне правду.
	AI_Output(self,other,"DIA_Andre_Add_08_05");	//Мне не нужны в ополчении люди с запятнанной репутацией.
	AI_Output(self,other,"DIA_Andre_Add_08_06");	//Большинство из этих бандитов - бывшие каторжники из колонии.
	AI_Output(self,other,"DIA_Andre_Add_08_07");	//Я надеюсь, что ты никак не связан с этими головорезами!
	ANDRE_STECKBRIEF = TRUE;
};


var int andre_cantharfalle;

func void b_andre_cantharfalle()
{
	AI_Output(self,other,"B_Andre_CantharFalle_08_00");	//Ко мне приходил торговец Кантар. Он сказал, что ты беглый каторжник из колонии.
	AI_Output(self,other,"B_Andre_CantharFalle_08_01");	//Я не знаю, правда ли это, и предпочитаю не спрашивать тебя об этом, но ты должен уладить этот вопрос.
	b_removenpc(vlk_470_sarah);
	b_startotherroutine(canthar,"MARKTSTAND");
	AI_Teleport(canthar,"NW_CITY_SARAH");
	if((CANTHAR_SPERRE == FALSE) && (CANTHAR_PAY == FALSE))
	{
		CANTHAR_SPERRE = TRUE;
	};
	MIS_CANTHARS_KOMPROBRIEF = LOG_OBSOLETE;
	b_checklog();
	ANDRE_CANTHARFALLE = TRUE;
};


instance DIA_ANDRE_CANTHARFALLE(C_INFO)
{
	npc = mil_311_andre;
	nr = 3;
	condition = dia_andre_cantharfalle_condition;
	information = dia_andre_cantharfalle_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_andre_cantharfalle_condition()
{
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() - 2)) && (ANDRE_CANTHARFALLE == FALSE))
	{
		return TRUE;
	};
	if((PABLO_ANDREMELDEN == TRUE) && !Npc_IsDead(pablo) && (ANDRE_STECKBRIEF == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_cantharfalle_info()
{
	if(ANDRE_STECKBRIEF == FALSE)
	{
		b_andre_steckbrief();
	};
	if((ANDRE_CANTHARFALLE == FALSE) && (MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() - 2)))
	{
		b_andre_cantharfalle();
	};
};


var int andre_lastpetzcounter;
var int andre_lastpetzcrime;

instance DIA_ANDRE_PMSCHULDEN(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_pmschulden_condition;
	information = dia_andre_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_andre_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (ANDRE_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= ANDRE_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_andre_pmschulden_info()
{
	var int diff;
	AI_Output(self,other,"DIA_Andre_PMSchulden_08_00");	//Ты пришел заплатить штраф?
	if((PABLO_ANDREMELDEN == TRUE) && !Npc_IsDead(pablo) && (ANDRE_STECKBRIEF == FALSE))
	{
		b_andre_steckbrief();
	};
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() - 2)) && (ANDRE_CANTHARFALLE == FALSE))
	{
		b_andre_cantharfalle();
	};
	if(b_gettotalpetzcounter(self) > ANDRE_LASTPETZCOUNTER)
	{
		AI_Output(self,other,"DIA_Andre_PMSchulden_08_01");	//Я даже задавался вопросом, осмелишься ли ты появиться здесь?!
		AI_Output(self,other,"DIA_Andre_PMSchulden_08_02");	//Обвинения против тебя только множатся!
		if(ANDRE_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_03");	//Я предупреждал тебя! Теперь штраф, который тебе придется заплатить, только увеличился!
			AI_Output(other,self,"DIA_Andre_PMAdd_15_00");	//Сколько?
			diff = b_gettotalpetzcounter(self) - ANDRE_LASTPETZCOUNTER;
			if(diff > 0)
			{
				ANDRE_SCHULDEN = ANDRE_SCHULDEN + (diff * 50);
			};
			if(ANDRE_SCHULDEN > 1000)
			{
				ANDRE_SCHULDEN = 1000;
			};
			b_say_gold(self,other,ANDRE_SCHULDEN);
		}
		else
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_04");	//Ты глубоко разочаровал меня!
		};
	}
	else if(b_getgreatestpetzcrime(self) < ANDRE_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Andre_PMSchulden_08_05");	//Выяснились новые подробности.
		if(ANDRE_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_06");	//Неожиданно не осталось никого, кто бы мог обвинить тебя в убийстве.
		};
		if((ANDRE_LASTPETZCRIME == CRIME_THEFT) || ((ANDRE_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_07");	//Никто больше не помнит, чтобы ты что-то крал.
		};
		if((ANDRE_LASTPETZCRIME == CRIME_ATTACK) || ((ANDRE_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_08");	//Больше нет свидетелей того, как ты принимал участие в драке.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_09");	//Похоже, что все обвинения против тебя оказались несостоятельными.
		};
		AI_Output(self,other,"DIA_Andre_PMSchulden_08_10");	//Я не знаю, что произошло, но я предупреждаю тебя: не пытайся провести меня!
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_11");	//Как бы то ни было, я решил снять с тебя все обвинения.
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_12");	//Смотри, чтобы больше не было никаких проблем!
			ANDRE_SCHULDEN = 0;
			ANDRE_LASTPETZCOUNTER = 0;
			ANDRE_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_13");	//Я хочу, чтобы тебе было понятно: тебе все равно придется заплатить полную сумму штрафа.
			b_say_gold(self,other,ANDRE_SCHULDEN);
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_14");	//Что скажешь?
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_andre_pmschulden);
		Info_ClearChoices(dia_andre_petzmaster);
		Info_AddChoice(dia_andre_pmschulden,"У меня недостаточно золота.",dia_andre_petzmaster_paylater);
		Info_AddChoice(dia_andre_pmschulden,"Сколько там еще?",dia_andre_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= ANDRE_SCHULDEN)
		{
			Info_AddChoice(dia_andre_pmschulden,"Я хочу заплатить штраф!",dia_andre_petzmaster_paynow);
		};
	};
};

func void dia_andre_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Andre_PMSchulden_HowMuchAgain_15_00");	//Сколько там еще?
	b_say_gold(self,other,ANDRE_SCHULDEN);
	Info_ClearChoices(dia_andre_pmschulden);
	Info_ClearChoices(dia_andre_petzmaster);
	Info_AddChoice(dia_andre_pmschulden,"У меня недостаточно золота.",dia_andre_petzmaster_paylater);
	Info_AddChoice(dia_andre_pmschulden,"Сколько там еще?",dia_andre_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= ANDRE_SCHULDEN)
	{
		Info_AddChoice(dia_andre_pmschulden,"Я хочу заплатить штраф!",dia_andre_petzmaster_paynow);
	};
};


instance DIA_ANDRE_PETZMASTER(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_petzmaster_condition;
	information = dia_andre_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_andre_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > ANDRE_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_andre_petzmaster_info()
{
	ANDRE_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_00");	//Ты тот новичок, что баламутит город.
	};
	if((PABLO_ANDREMELDEN == TRUE) && !Npc_IsDead(pablo) && (ANDRE_STECKBRIEF == FALSE))
	{
		b_andre_steckbrief();
	};
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() - 2)) && (ANDRE_CANTHARFALLE == FALSE))
	{
		b_andre_cantharfalle();
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_01");	//Хорошо, что ты пришел ко мне пока все еще можно уладить.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_02");	//Убийство - серьезное преступление!
		ANDRE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		ANDRE_SCHULDEN = ANDRE_SCHULDEN + 500;
		if((PETZCOUNTER_CITY_THEFT + PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_03");	//Не говоря уже о других делах, что ты натворил.
		};
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_04");	//Страже приказано казнить убийц на месте.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_05");	//И большинство горожан не потерпят убийц в городе!
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_06");	//Но я не заинтересован в том, чтобы повесить тебя. Идет война, и нам нужен каждый солдат.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_07");	//Но будет не так-то просто успокоить народ.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_08");	//Ты мог бы подтвердить свое раскаяние, заплатив штраф - естественно, он должен быть довольно значительным.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_09");	//Хорошо, что ты пришел! Тебя обвиняют в воровстве! Есть свидетели!
		if((PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_10");	//Не говоря уже о других твоих прегрешениях, о которых я слышал.
		};
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_11");	//Я не потерплю такого поведения в моем городе!
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_12");	//Ты должен заплатить штраф, чтобы искупить свою вину.
		ANDRE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_13");	//Если ты дерешься со всяким сбродом в гавани - это одно...
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_14");	//Но когда ты нападаешь на граждан или королевских солдат, я должен принимать меры.
		if(PETZCOUNTER_CITY_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_15");	//А эту овцу было обязательно убивать?
		};
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_16");	//Если я просто так отпущу тебя, скоро все будут делать то, что хотят.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_17");	//Так что тебе придется заплатить соответствующий штраф - и твои прегрешения будут забыты.
		ANDRE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_18");	//Я слышал, что ты зарезал овцу.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_19");	//Ты же понимаешь, что я не могу оставить это дело просто так.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_20");	//Тебе придется заплатить компенсацию!
		ANDRE_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Andre_PETZMASTER_15_21");	//Сколько?
	if(ANDRE_SCHULDEN > 1000)
	{
		ANDRE_SCHULDEN = 1000;
	};
	b_say_gold(self,other,ANDRE_SCHULDEN);
	Info_ClearChoices(dia_andre_pmschulden);
	Info_ClearChoices(dia_andre_petzmaster);
	Info_AddChoice(dia_andre_petzmaster,"У меня недостаточно золота.",dia_andre_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= ANDRE_SCHULDEN)
	{
		Info_AddChoice(dia_andre_petzmaster,"Я хочу заплатить штраф!",dia_andre_petzmaster_paynow);
	};
};

func void dia_andre_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Andre_PETZMASTER_PayNow_15_00");	//Я хочу заплатить штраф!
	b_giveinvitems(other,self,itmi_gold,ANDRE_SCHULDEN);
	AI_Output(self,other,"DIA_Andre_PETZMASTER_PayNow_08_01");	//Хорошо! Я позабочусь, чтобы все в городе узнали об этом - это хоть как-то восстановит твою репутацию.
	b_grantabsolution(LOC_CITY);
	ANDRE_SCHULDEN = 0;
	ANDRE_LASTPETZCOUNTER = 0;
	ANDRE_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_andre_petzmaster);
	Info_ClearChoices(dia_andre_pmschulden);
};

func void dia_andre_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Andre_PETZMASTER_PayLater_15_00");	//У меня недостаточно золота.
	AI_Output(self,other,"DIA_Andre_PETZMASTER_PayLater_08_01");	//Тогда постарайся собрать необходимую сумму как можно быстрее.
	AI_Output(self,other,"DIA_Andre_PETZMASTER_PayLater_08_02");	//Но должен предупредить тебя: если ты при этом усугубишь свою вину, то твой штраф только возрастет.
	ANDRE_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	ANDRE_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_ANDRE_HALLO(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_hallo_condition;
	information = dia_andre_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_andre_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_hallo_info()
{
	AI_Output(self,other,"DIA_Andre_Hallo_08_00");	//Да пребудет с тобой Иннос, чужеземец! Что привело тебя ко мне?
};


instance DIA_ANDRE_MESSAGE(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_message_condition;
	information = dia_andre_message_info;
	permanent = FALSE;
	description = "У меня есть важное сообщение для лорда Хагена.";
};


func int dia_andre_message_condition()
{
	if((KAPITEL < 3) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_NOV)))
	{
		return TRUE;
	};
};

func void dia_andre_message_info()
{
	AI_Output(other,self,"DIA_Andre_Message_15_00");	//У меня есть важное сообщение для лорда Хагена.
	AI_Output(self,other,"DIA_Andre_Message_08_01");	//Ну, ты стоишь перед его представителем. Так что там такое?
	Info_ClearChoices(dia_andre_message);
	Info_AddChoice(dia_andre_message,"Это я могу сказать только лорду Хагену.",dia_andre_message_personal);
	Info_AddChoice(dia_andre_message,"Армию орков, возглавляют ДРАКОНЫ!",dia_andre_message_dragons);
	Info_AddChoice(dia_andre_message,"Это насчет священного артефакта - Глаза Инноса.",dia_andre_message_eyeinnos);
};

func void b_andre_lordhagennichtzusprechen()
{
	AI_Output(self,other,"B_Andre_LordHagenNichtZuSprechen_08_00");	//Лорд Хаген принимает только паладинов и тех, кто служит паладинам.
	AI_Output(self,other,"B_Andre_LordHagenNichtZuSprechen_08_01");	//Он считает ниже своего достоинства тратить время на простых людей.
};

func void dia_andre_message_eyeinnos()
{
	AI_Output(other,self,"DIA_Andre_Message_EyeInnos_15_00");	//Это насчет священного артефакта - Глаза Инноса.
	AI_Output(self,other,"DIA_Andre_Message_EyeInnos_08_01");	//Глаз Инноса - никогда не слышал о таком. Но это еще ничего не значит.
	AI_Output(self,other,"DIA_Andre_Message_EyeInnos_08_02");	//Если действительно существует артефакт, носящий Его имя, только самые высокопоставленные члены нашего ордена могут знать о нем.
	AI_Output(other,self,"DIA_Andre_Message_EyeInnos_15_03");	//Вот почему мне нужно поговорить именно с лордом Хагеном.
	ANDRE_EYEINNOS = TRUE;
	b_andre_lordhagennichtzusprechen();
	Info_ClearChoices(dia_andre_message);
};

func void dia_andre_message_dragons()
{
	AI_Output(other,self,"DIA_Andre_Message_Dragons_15_00");	//Армия орков, возглавляемая ДРА...
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_01");	//(прерывает) Я ЗНАЮ, что армия орков становится все сильнее
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_02");	//Ты же не хочешь мне сказать, что ты ТОЛЬКО это хочешь доложить лорду Хагену.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_03");	//Он оторвет тебе голову, если ты будешь попусту тратить его время, отвлекая его такими историями.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_04");	//Я уверен, что ты достаточно умен и понимаешь это сам.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_05");	//Так все-таки, зачем тебе нужно увидеть его?
};

func void dia_andre_message_personal()
{
	AI_Output(other,self,"DIA_Andre_Message_Personal_15_00");	//Это я могу сказать только лорду Хагену.
	AI_Output(self,other,"DIA_Andre_Message_Personal_08_01");	//Как знаешь. Но ты должен понять одно:
	b_andre_lordhagennichtzusprechen();
	Info_ClearChoices(dia_andre_message);
};


instance DIA_ANDRE_PALADINE(C_INFO)
{
	npc = mil_311_andre;
	nr = 3;
	condition = dia_andre_paladine_condition;
	information = dia_andre_paladine_info;
	permanent = FALSE;
	description = "Что паладины делают в городе?";
};


func int dia_andre_paladine_condition()
{
	if((other.guild != GIL_MIL) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_andre_paladine_info()
{
	AI_Output(other,self,"DIA_Andre_Paladine_15_00");	//Почему паладины прибыли в город?
	AI_Output(self,other,"DIA_Andre_Paladine_08_01");	//Цели нашей операции являются тайной.
	AI_Output(self,other,"DIA_Andre_Paladine_08_02");	//Я могу сказать тебе только, что гражданам города не грозит никакая опасность.
	AI_Output(self,other,"DIA_Andre_Paladine_08_03");	//Тебе не о чем волноваться.
};


instance DIA_ANDRE_PALADINEAGAIN(C_INFO)
{
	npc = mil_311_andre;
	nr = 3;
	condition = dia_andre_paladineagain_condition;
	information = dia_andre_paladineagain_info;
	permanent = FALSE;
	description = "Что паладины делают в городе?";
};


func int dia_andre_paladineagain_condition()
{
	if((other.guild == GIL_MIL) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_andre_paladineagain_info()
{
	if(Npc_KnowsInfo(other,dia_andre_paladine))
	{
		AI_Output(other,self,"DIA_Andre_PaladineAgain_15_00");	//Так ты скажешь мне, зачем паладины прибыли в Хоринис?
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_PaladineAgain_15_01");	//Что паладины делают в городе?
	};
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_02");	//Теперь, когда ты вступил в городскую стражу, ты подчиняешься паладинам.
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_03");	//И теперь я могу доверять тебе.
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_04");	//Мы прибыли по поручению короля Робара. С разрушением Барьера поставки руды прекратились.
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_05");	//Поэтому теперь мы добываем руду и доставляем ее на материк. При помощи этой руды мы выкуем новое оружие и победим орков.
	KNOWSPALADINS_ORE = TRUE;
};


instance DIA_ANDRE_ASKTOJOIN(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_asktojoin_condition;
	information = dia_andre_asktojoin_info;
	permanent = FALSE;
	description = "Я хочу поступить на службу к паладинам!";
};


func int dia_andre_asktojoin_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_andre_asktojoin_info()
{
	AI_Output(other,self,"DIA_Andre_AskToJoin_15_00");	//Я хочу поступить на службу к паладинам!
	if(Npc_KnowsInfo(other,dia_andre_message))
	{
		AI_Output(self,other,"DIA_Andre_AskToJoin_08_01");	//Хорошо. Нам нужны люди. И меня не интересует, почему ты решил присоединиться к нам.
		AI_Output(self,other,"DIA_Andre_AskToJoin_08_02");	//Если ты поступишь на службы к паладинам, я помогу тебе добиться аудиенции у лорда Хагена.
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_AskToJoin_08_03");	//Достойное решение.
	};
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_04");	//Однако у меня есть приказ принимать в ополчение только граждан этого города.
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_05");	//Мой командующий опасается, что в наши ряды могут проникнуть шпионы или диверсанты.
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_06");	//Он хочет таким образом свести риск к минимуму.
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_07");	//Поэтому, ты сначала должен стать гражданином города. Не знаю, имеет это правило смысл или нет, но приказ есть приказ.
	Log_CreateTopic(TOPIC_BECOMEMIL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BECOMEMIL,LOG_RUNNING);
	b_logentry(TOPIC_BECOMEMIL,"Прежде чем я смогу вступить в ряды городской стражи, я должен стать гражданином города.");
};


instance DIA_ANDRE_ABOUTMILIZ(C_INFO)
{
	npc = mil_311_andre;
	nr = 5;
	condition = dia_andre_aboutmiliz_condition;
	information = dia_andre_aboutmiliz_info;
	permanent = FALSE;
	description = "Что я получу от вступления в ополчение?";
};


func int dia_andre_aboutmiliz_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_andre_asktojoin))
	{
		return TRUE;
	};
};

func void dia_andre_aboutmiliz_info()
{
	AI_Output(other,self,"DIA_Andre_AboutMiliz_15_00");	//Что я получу от вступления в ополчение?
	AI_Output(self,other,"DIA_Andre_AboutMiliz_08_01");	//Позволь мне прояснить один момент. Обязанности солдата ополчения не ограничиваются расхаживанием по городу в униформе.
	AI_Output(self,other,"DIA_Andre_AboutMiliz_08_02");	//Это грязная и даже кровавая работа. Когда ты станешь одним из нас, тебя будет ждать целая гора работы.
	AI_Output(self,other,"DIA_Andre_AboutMiliz_08_03");	//Но это того стоит. Помимо жалования, у тебя появляется шанс однажды стать священным воином Инноса.
};


instance DIA_ANDRE_ALTERNATIVE(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_alternative_condition;
	information = dia_andre_alternative_info;
	permanent = FALSE;
	description = "А нет более быстрого способа присоединиться к вам?";
};


func int dia_andre_alternative_condition()
{
	if(Npc_KnowsInfo(other,dia_andre_asktojoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_andre_alternative_info()
{
	AI_Output(other,self,"DIA_Andre_Alternative_15_00");	//А нет более быстрого способа присоединиться к вам?
	AI_Output(self,other,"DIA_Andre_Alternative_08_01");	//М-м-м. (задумывается) У тебя действительно серьезные намерения, да?
	AI_Output(self,other,"DIA_Andre_Alternative_08_02");	//Хорошо. Слушай. У меня есть проблема. Если ты решишь ее для меня, я обещаю, что ты будешь зачислен в ополчение.
	AI_Output(self,other,"DIA_Andre_Alternative_08_03");	//И самое главное: никому ни слова!
};


instance DIA_ANDRE_GUILDOFTHIEVES(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_guildofthieves_condition;
	information = dia_andre_guildofthieves_info;
	permanent = FALSE;
	description = "В чем твоя проблема?";
};


func int dia_andre_guildofthieves_condition()
{
	if(Npc_KnowsInfo(other,dia_andre_alternative))
	{
		return TRUE;
	};
};

func void dia_andre_guildofthieves_info()
{
	AI_Output(other,self,"DIA_Andre_GuildOfThieves_15_00");	//Что у тебя за проблема?
	AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_01");	//Последнее время в городе развелось слишком много воров. И мы никак не можем поймать ни одного из них. Воры действуют очень осторожно.
	AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_02");	//Эти мерзавцы знают свое дело. Я уверен, что в городе действует организованная банда.
	AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_03");	//Я не удивлюсь, если в Хоринисе появилась гильдия воров. Найди главарей этой банды и ликвидируй их.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_04");	//Тогда я смогу гарантировать, что ты будешь принят в ополчение - неважно, гражданин ты или нет.
		AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_05");	//Но ты никому не должен говорить о нашем соглашении!
	};
	MIS_ANDRE_GUILDOFTHIEVES = LOG_RUNNING;
	b_logentry(TOPIC_BECOMEMIL,"Есть также другой способ вступить в ряды городской стражи - найти и уничтожить гильдию воров Хориниса.");
};


instance DIA_ANDRE_WHERETHIEVES(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_wherethieves_condition;
	information = dia_andre_wherethieves_info;
	permanent = FALSE;
	description = "Где мне лучше начать искать этих воров?";
};


func int dia_andre_wherethieves_condition()
{
	if(Npc_KnowsInfo(other,dia_andre_guildofthieves) && (MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_andre_wherethieves_info()
{
	AI_Output(other,self,"DIA_Andre_WhereThieves_15_00");	//Где мне лучше начать искать этих воров?
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_01");	//Если бы я знал это, я бы сделал это сам!
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_02");	//Могу сказать одно: мы недавно перевернули вверх дном весь портовый квартал и ничего не нашли. Абсолютно ничего.
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_03");	//Люди, живущие там, не склонны к сотрудничеству, особенно, если на тебе доспехи паладина.
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_04");	//Но ты нездешний. Возможно, тебе они будут больше доверять.
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_05");	//Ты можешь поспрашивать в портовом квартале. Но будь осторожен. Если люди поймут, что ты работаешь на паладинов, ты не узнаешь НИЧЕГО!
	b_logentry(TOPIC_BECOMEMIL,"Если я хочу найти гильдию воров, мне лучше начать прислушиваться к тому, что говорят в портовом квартале.");
};


instance DIA_ANDRE_WHATTODO(C_INFO)
{
	npc = mil_311_andre;
	nr = 3;
	condition = dia_andre_whattodo_condition;
	information = dia_andre_whattodo_info;
	permanent = FALSE;
	description = "Что мне делать, когда я найду этих воров?";
};


func int dia_andre_whattodo_condition()
{
	if(Npc_KnowsInfo(other,dia_andre_guildofthieves) && (MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_andre_whattodo_info()
{
	AI_Output(other,self,"DIA_Andre_WhatToDo_15_00");	//Что мне делать, когда я найду этих воров?
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_01");	//Если дело касается мелкой рыбешки - рядового вора или наводчика, лучше всего избежать схватки.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_02");	//Просто приди ко мне и доложи. А я позабочусь, чтобы эта мразь оказалась за решеткой.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_03");	//Городская стража может вмешаться в драку и у тебя не будет возможности объяснить им, что происходит.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_04");	//Кроме того, за каждого преступника, который с твоей помощью будет засажен за решетку, тебе полагается награда.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_05");	//Однако, если ты найдешь логово главарей - ну, тогда тебе, вероятно, не удастся избежать боя.
	b_logentry(TOPIC_BECOMEMIL,"Если я поймаю какую-нибудь мелкую рыбешку гильдии воров, я должен привести его прямо к лорду Андре. А чтобы ликвидировать гильдию воров, я должен найти их логово.");
};


instance DIA_ANDRE_AUSLIEFERUNG(C_INFO)
{
	npc = mil_311_andre;
	nr = 200;
	condition = dia_andre_auslieferung_condition;
	information = dia_andre_auslieferung_info;
	permanent = TRUE;
	description = "Я пришел получить награду за преступника.";
};


func int dia_andre_auslieferung_condition()
{
	if((RENGARU_AUSGELIEFERT == FALSE) || (HALVOR_AUSGELIEFERT == FALSE) || (NAGUR_AUSGELIEFERT == FALSE) || (MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_andre_auslieferung_info()
{
	AI_Output(other,self,"DIA_Andre_Auslieferung_15_00");	//Я пришел получить награду за преступника.
	Info_ClearChoices(dia_andre_auslieferung);
	Info_AddChoice(dia_andre_auslieferung,"Я зайду позже (НАЗАД)",dia_andre_auslieferung_back);
	if((RENGARU_INKNAST == TRUE) && (RENGARU_AUSGELIEFERT == FALSE))
	{
		Info_AddChoice(dia_andre_auslieferung,"Ренгару украл у торговца Джоры.",dia_andre_auslieferung_rengaru);
	};
	if((BETRAYAL_HALVOR == TRUE) && (HALVOR_AUSGELIEFERT == FALSE))
	{
		Info_AddChoice(dia_andre_auslieferung,"Халвор торгует краденым.",dia_andre_auslieferung_halvor);
	};
	if((MIS_NAGUR_BOTE == LOG_RUNNING) && (NAGUR_AUSGELIEFERT == FALSE))
	{
		Info_AddChoice(dia_andre_auslieferung,"Нагур убил посыльного Бальтрама.",dia_andre_auslieferung_nagur);
	};
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (MIS_CANTHARS_KOMPROBRIEF_DAY > (Wld_GetDay() - 2)))
	{
		Info_AddChoice(dia_andre_auslieferung,"Кантар пытается избавиться от Сары!",dia_andre_auslieferung_canthar);
	};
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (Npc_HasItems(sarah,itwr_canthars_komprobrief_mis) >= 1) && (MIS_CANTHARS_KOMPROBRIEF_DAY > (Wld_GetDay() - 2)))
	{
		Info_AddChoice(dia_andre_auslieferung,"Сара продает оружие Онару.",dia_andre_auslieferung_sarah);
	};
};

func void dia_andre_auslieferung_back()
{
	Info_ClearChoices(dia_andre_auslieferung);
};

func void dia_andre_auslieferung_rengaru()
{
	AI_Teleport(rengaru,"NW_CITY_HABOUR_KASERN_RENGARU");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Rengaru_15_00");	//Ренгар украл у торговца Джоры. Он пытался скрыться, но я поймал его.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Rengaru_08_01");	//Хорошо, мои люди уже схватили его. Больше он не сможет воровать у добропорядочных граждан.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Rengaru_08_02");	//Вот твои деньги.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD);
	RENGARU_AUSGELIEFERT = TRUE;
	MIS_THIEFGUILD_SUCKED = TRUE;
	b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
	Info_ClearChoices(dia_andre_auslieferung);
	b_startotherroutine(rengaru,"PRISON");
};

func void dia_andre_auslieferung_halvor()
{
	AI_Teleport(halvor,"NW_CITY_HABOUR_KASERN_HALVOR");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Halvor_15_00");	//Халвор торгует краденым. Он продает товары, украденные бандитами у торговцев.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Halvor_08_01");	//Так вот, кто этим занимается. Мои люди немедленно схватят его.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Halvor_08_02");	//Я не думаю, что это будет сложно. Я готов вручить тебе твою награду прямо сейчас.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD);
	b_startotherroutine(halvor,"PRISON");
	MIS_THIEFGUILD_SUCKED = TRUE;
	HALVOR_AUSGELIEFERT = TRUE;
	b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
	Info_ClearChoices(dia_andre_auslieferung);
};

func void dia_andre_auslieferung_nagur()
{
	AI_Teleport(nagur,"NW_CITY_HABOUR_KASERN_NAGUR");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Nagur_15_00");	//Нагур убил посыльного Бальтрама. Он пытался использовать меня в качестве нового посыльного, чтобы перехватить товар с фермы Акила.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Nagur_08_01");	//Он понесет заслуженное наказание. Я немедленно прикажу посадить его за решетку.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Nagur_08_02");	//Вот, получи награду. Ты ее заслужил.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD);
	b_startotherroutine(nagur,"PRISON");
	MIS_THIEFGUILD_SUCKED = TRUE;
	NAGUR_AUSGELIEFERT = TRUE;
	b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
	Info_ClearChoices(dia_andre_auslieferung);
};

func void dia_andre_auslieferung_canthar()
{
	AI_Teleport(canthar,"NW_CITY_HABOUR_KASERN_RENGARU");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Canthar_15_00");	//Торговец Кантар пытается избавиться от Сары!
	AI_Output(self,other,"DIA_Andre_Auslieferung_Canthar_08_01");	//Сары? Торговки оружием с рыночной площади?
	AI_Output(other,self,"DIA_Andre_Auslieferung_Canthar_15_02");	//Я должен был подсунуть Саре письмо, которое подтвердило бы, что она поставляет оружие Онару.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Canthar_08_03");	//Понимаю. Я с радостью заплачу награду за этого ублюдка. Можешь считать, что он уже за решеткой.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD);
	b_startotherroutine(canthar,"KNAST");
	MIS_CANTHARS_KOMPROBRIEF = LOG_FAILED;
	b_checklog();
	CANTHAR_AUSGELIEFERT = TRUE;
	b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
	Info_ClearChoices(dia_andre_auslieferung);
};

func void dia_andre_auslieferung_sarah()
{
	AI_Teleport(sarah,"NW_CITY_HABOUR_KASERN_RENGARU");
	AI_Teleport(canthar,"NW_CITY_SARAH");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Sarah_15_00");	//Сара продает оружие Онару.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Sarah_08_01");	//Сара? Торговка оружием с рыночной площади? У тебя есть доказательство?
	AI_Output(other,self,"DIA_Andre_Auslieferung_Sarah_15_02");	//В ее кармане письмо, с деталями поставки оружия ему.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Sarah_08_03");	//Она поплатится за это. Я прикажу арестовать ее.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD);
	b_startotherroutine(sarah,"KNAST");
	b_startotherroutine(canthar,"MARKTSTAND");
	SARAH_AUSGELIEFERT = TRUE;
	MIS_CANTHARS_KOMPROBRIEF = LOG_SUCCESS;
	b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
	Info_ClearChoices(dia_andre_auslieferung);
};


instance DIA_ANDRE_DGRUNNING(C_INFO)
{
	npc = mil_311_andre;
	nr = 4;
	condition = dia_andre_dgrunning_condition;
	information = dia_andre_dgrunning_info;
	permanent = TRUE;
	description = "Насчет гильдии воров...";
};


func int dia_andre_dgrunning_condition()
{
	if(MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_andre_dgrunning_info()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_15_00");	//Насчет гильдии воров...
	if(ANDRE_DIEBESGILDE_AUFGERAEUMT == TRUE)
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_08_01");	//Ты можешь забыть об этом деле. Я послал своих людей в канализацию.
		AI_Output(self,other,"DIA_Andre_DGRunning_08_02");	//Гильдия воров теперь не более чем перевернутая страница истории этого города.
		MIS_ANDRE_GUILDOFTHIEVES = LOG_OBSOLETE;
		if(MIS_CASSIAKELCHE == LOG_RUNNING)
		{
			MIS_CASSIAKELCHE = LOG_OBSOLETE;
		};
		if(MIS_RAMIREZSEXTANT == LOG_RUNNING)
		{
			MIS_RAMIREZSEXTANT = LOG_OBSOLETE;
		};
		return;
	};
	AI_Output(self,other,"DIA_Andre_DGRunning_08_03");	//Да?
	Info_ClearChoices(dia_andre_dgrunning);
	Info_AddChoice(dia_andre_dgrunning,"Я работаю над этим...",dia_andre_dgrunning_back);
	if(Npc_IsDead(cassia) && Npc_IsDead(jesper) && Npc_IsDead(ramirez))
	{
		Info_AddChoice(dia_andre_dgrunning,"Я всех их ликвидировал!",dia_andre_dgrunning_success);
	};
	if(((cassia.aivar[AIV_TALKEDTOPLAYER] == TRUE) || (jesper.aivar[AIV_TALKEDTOPLAYER] == TRUE) || (ramirez.aivar[AIV_TALKEDTOPLAYER] == TRUE)) && (DIEBESGILDE_VERRATEN == FALSE))
	{
		Info_AddChoice(dia_andre_dgrunning,"Я нашел логово гильдии воров!",dia_andre_dgrunning_verrat);
	};
};

func void dia_andre_dgrunning_back()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_BACK_15_00");	//Я работаю над этим...
	if(DIEBESGILDE_VERRATEN == TRUE)
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_BACK_08_01");	//Хорошо. Я дам тебе еще немного времени на выполнение этого задания.
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_BACK_08_02");	//Хорошо! Держи меня в курсе.
	};
	Info_ClearChoices(dia_andre_dgrunning);
};

func void dia_andre_dgrunning_verrat()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_00");	//Я нашел логово гильдии воров!
	AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_01");	//Где?
	AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_02");	//В канализации под городом.
	AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_03");	//Что? Мы запечатали канализацию...
	AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_04");	//Похоже, это не помешало им проникнуть туда.
	AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_05");	//Ты ликвидировал этих преступников?
	DIEBESGILDE_VERRATEN = TRUE;
	DG_GEFUNDEN = TRUE;
};

func void dia_andre_dgrunning_success()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_Success_15_00");	//Я всех их ликвидировал!
	AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_01");	//Ты оказал городу большую услугу.
	DG_GEFUNDEN = TRUE;
	MIS_ANDRE_GUILDOFTHIEVES = LOG_SUCCESS;
	b_giveplayerxp(XP_GUILDOFTHIEVESPLATT);
	if(MIS_CASSIAKELCHE == LOG_RUNNING)
	{
		MIS_CASSIAKELCHE = LOG_OBSOLETE;
	};
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_02");	//Если ты все еще хочешь вступить в ополчение, дай мне знать.
	}
	else if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_03");	//Ты выполнил нашу работу, как настоящий слуга Инноса и солдат короля.
	};
	AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_04");	//Тебе полагается награда за этих бандитов. Вот, возьми.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD * 3);
	Info_ClearChoices(dia_andre_dgrunning);
};


instance DIA_ANDRE_JOIN(C_INFO)
{
	npc = mil_311_andre;
	nr = 100;
	condition = dia_andre_join_condition;
	information = dia_andre_join_info;
	permanent = TRUE;
	description = "Я готов вступить в ополчение!";
};


func int dia_andre_join_condition()
{
	if((hero.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_andre_asktojoin))
	{
		return TRUE;
	};
};

func void dia_andre_join_info()
{
	AI_Output(other,self,"DIA_Andre_JOIN_15_00");	//Я готов вступить в ополчение!
	if((MIS_ANDRE_GUILDOFTHIEVES == LOG_SUCCESS) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		AI_Output(self,other,"DIA_Andre_JOIN_08_01");	//Я сдержу свое слово и приму тебя в ополчение, даже хотя ты и не являешься гражданином этого города.
		AI_Output(self,other,"DIA_Andre_JOIN_08_02");	//Но никому об этом не говори! Чем меньше людей будут знать об этом исключении, тем меньше мне придется оправдываться.
	}
	else if(PLAYER_ISAPPRENTICE > APP_NONE)
	{
		AI_Output(self,other,"DIA_Andre_JOIN_08_03");	//А ты являешься гражданином Хориниса?
		if(PLAYER_ISAPPRENTICE == APP_HARAD)
		{
			AI_Output(other,self,"DIA_Andre_JOIN_15_04");	//Кузнец взял меня в ученики.
			AI_Output(self,other,"DIA_Andre_JOIN_08_05");	//Гарад? Я знаю его. Он работает на нас. Он достойный человек.
		};
		if(PLAYER_ISAPPRENTICE == APP_CONSTANTINO)
		{
			AI_Output(other,self,"DIA_Andre_JOIN_15_06");	//Я ученик алхимика!
			AI_Output(self,other,"DIA_Andre_JOIN_08_07");	//У нас, в ополчении, не так уж много ученых мужей. Возможно, твои навыки весьма пригодятся нам.
			AI_Output(self,other,"DIA_Andre_JOIN_08_08");	//Я мало что знаю об алхимии. Но люди говорят, что он уважаемый человек.
		};
		if(PLAYER_ISAPPRENTICE == APP_BOSPER)
		{
			AI_Output(other,self,"DIA_Andre_JOIN_15_09");	//Боспер, мастер-лучник, взял меня в ученики.
			AI_Output(self,other,"DIA_Andre_JOIN_08_10");	//Тогда ты наверняка знаешь кое-что о том, как выжить в лесу? Это хорошо, потому что ополчению приходится выполнять задачи не только в городе.
			AI_Output(self,other,"DIA_Andre_JOIN_08_11");	//Нам, определенно, нужны люди, умеющие ориентироваться в дикой местности.
			AI_Output(self,other,"DIA_Andre_JOIN_08_12");	//И Боспер уважаемый человек в этом городе.
		};
		AI_Output(self,other,"DIA_Andre_JOIN_08_13");	//Если он поручился за тебя, ничто не мешает твоему вступлению в ряды ополчения.
		if(MIS_ANDRE_GUILDOFTHIEVES == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Andre_JOIN_08_14");	//Кроме того, тебе удалось избавить город от гильдии воров. Я бы принял тебя только за этот подвиг.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_JOIN_08_15");	//Может быть - но ты все еще не гражданин этого города, а у меня есть приказ.
		return;
	};
	AI_Output(self,other,"DIA_Andre_JOIN_08_16");	//Ты можешь вступить в наши ряды, если хочешь. Но твое решение должно быть окончательным.
	AI_Output(self,other,"DIA_Andre_JOIN_08_17");	//После того, как ты наденешь доспехи ополчения, ты уже не сможешь просто так снять его и выйти из наших рядов.
	AI_Output(self,other,"DIA_Andre_JOIN_08_18");	//Ты готов сражаться вместе с нами за Инноса и короля?
	Info_ClearChoices(dia_andre_join);
	Info_AddChoice(dia_andre_join,"Я пока не уверен...",dia_andre_join_no);
	Info_AddChoice(dia_andre_join,"Я готов!",dia_andre_join_yes);
};

func void dia_andre_join_yes()
{
	AI_Output(other,self,"DIA_Andre_JOIN_Yes_15_00");	//Я готов!
	AI_Output(self,other,"DIA_Andre_JOIN_Yes_08_01");	//Тогда так тому и быть. Добро пожаловать в ряды ополчения.
	Npc_SetTrueGuild(other,GIL_MIL);
	other.guild = GIL_MIL;
	Snd_Play("LEVELUP");
	AI_Output(self,other,"DIA_Andre_JOIN_Yes_08_02");	//Вот твои доспехи.
	b_giveinvitems(self,other,itar_mil_l,1);
	AI_Output(self,other,"DIA_Andre_JOIN_Yes_08_03");	//Носи их с гордостью и достоинством.
	SLD_AUFNAHME = LOG_OBSOLETE;
	KDF_AUFNAHME = LOG_OBSOLETE;
	MIL_AUFNAHME = LOG_SUCCESS;
	b_giveplayerxp(XP_BECOMEMILIZ);
	Info_ClearChoices(dia_andre_join);
};

func void dia_andre_join_no()
{
	AI_Output(other,self,"DIA_Andre_JOIN_No_15_00");	//Я пока не уверен...
	AI_Output(self,other,"DIA_Andre_JOIN_No_08_01");	//Если ты еще сомневаешься в своем решении, я не могу принять тебя в ополчение.
	Info_ClearChoices(dia_andre_join);
};


instance DIA_ANDRE_LORDHAGEN(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_lordhagen_condition;
	information = dia_andre_lordhagen_info;
	permanent = FALSE;
	description = "Могу я теперь увидеть лорда Хагена?";
};


func int dia_andre_lordhagen_condition()
{
	if((other.guild == GIL_MIL) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_andre_lordhagen_info()
{
	AI_Output(other,self,"DIA_Andre_LORDHAGEN_15_00");	//Могу я теперь увидеть лорда Хагена?
	AI_Output(self,other,"DIA_Andre_LORDHAGEN_08_01");	//Теперь ты состоишь нас службе у паладинов. Они пропустят тебя. Но твое сообщение должно быть действительно важным.
	AI_Output(other,self,"DIA_Andre_LORDHAGEN_15_02");	//Не волнуйся, это так и есть...
	AI_Output(self,other,"DIA_Andre_LORDHAGEN_08_03");	//Помни, что ты встречаешься с главой паладинов. Веди себя соответствующе. Теперь ты представляешь не только себя, но все ополчение.
};


instance DIA_ANDRE_WAFFE(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_waffe_condition;
	information = dia_andre_waffe_info;
	permanent = FALSE;
	description = "А я получу оружие?";
};


func int dia_andre_waffe_condition()
{
	if((other.guild == GIL_MIL) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_andre_waffe_info()
{
	AI_Output(other,self,"DIA_Andre_Waffe_15_00");	//А я получу оружие?
	AI_Output(self,other,"DIA_Andre_Waffe_08_01");	//Конечно. Обычно этим занимается Пек. Но что-то я давно его не видел.
	AI_Output(self,other,"DIA_Andre_Waffe_08_02");	//Найди, где он скрывается, и приведи его сюда. Тогда он выдаст тебе оружие.
	AI_Output(self,other,"DIA_Andre_Waffe_08_03");	//А если ты хочешь поспать, можешь выбрать любую койку в наших казармах.
	MIS_ANDRE_PECK = LOG_RUNNING;
	Log_CreateTopic(TOPIC_PECK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PECK,LOG_RUNNING);
	b_logentry(TOPIC_PECK,"Пек где-то в городе. Если я приведу его назад, в казармы, я смогу получить от него оружие.");
	AI_StopProcessInfos(self);
};


instance DIA_ANDRE_FOUND_PECK(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_found_peck_condition;
	information = dia_andre_found_peck_info;
	permanent = FALSE;
	description = "Мне удалось найти Пека.";
};


func int dia_andre_found_peck_condition()
{
	if(Npc_KnowsInfo(hero,dia_peck_found_peck) && (MIS_ANDRE_PECK == LOG_RUNNING) && (Npc_IsDead(peck) == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_found_peck_info()
{
	AI_Output(other,self,"DIA_Andre_FOUND_PECK_15_00");	//Мне удалось найти Пека.
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_08_01");	//Да, он уже вернулся на свой пост и приступил к выполнению своих обязанностей. Где ты нашел его?
	Info_ClearChoices(dia_andre_found_peck);
	Info_AddChoice(dia_andre_found_peck,"Я случайно наткнулся на него в городе.",dia_andre_found_peck_somewhere);
	Info_AddChoice(dia_andre_found_peck,"В 'Красном Фонаре'...",dia_andre_found_peck_redlight);
};

func void dia_andre_found_peck_somewhere()
{
	AI_Output(other,self,"DIA_Andre_FOUND_PECK_SOMEWHERE_15_00");	//Я случайно наткнулся на него в городе.
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_SOMEWHERE_08_01");	//Хорошо, а теперь иди к нему и получи оружие.
	MIS_ANDRE_PECK = LOG_OBSOLETE;
	b_giveplayerxp(XP_FOUNDPECK);
	Info_ClearChoices(dia_andre_found_peck);
};

func void dia_andre_found_peck_redlight()
{
	AI_Output(other,self,"DIA_Andre_FOUND_PECK_REDLIGHT_15_00");	//"Он был в ""Красном Фонаре""."
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_REDLIGHT_08_01");	//То есть он развлекался с девочками вместо того, чтобы выполнять свои обязанности.
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_REDLIGHT_08_02");	//Я думаю, мне нужно серьезно поговорить с ним.
	b_giveplayerxp(XP_FOUNDPECK * 2);
	MIS_ANDRE_PECK = LOG_SUCCESS;
	Info_ClearChoices(dia_andre_found_peck);
};

func void b_andresold()
{
	AI_Output(self,other,"DIA_Andre_Sold_08_00");	//Вот твое жалование.
	b_giveinvitems(self,other,itmi_gold,ANDRE_SOLD);
};


instance DIA_ANDRE_FIRSTMISSION(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_firstmission_condition;
	information = dia_andre_firstmission_info;
	permanent = FALSE;
	description = "У тебя есть задание для меня?";
};


func int dia_andre_firstmission_condition()
{
	if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void dia_andre_firstmission_info()
{
	AI_Output(other,self,"DIA_Andre_FIRSTMISSION_15_00");	//У тебя есть задание для меня?
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_01");	//Последнее время в городе появилось очень много болотной травы.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_02");	//Мы не можем позволить, чтобы эта зараза расползлась по городу.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_03");	//В противном случае, все будут только курить травку и не смогут работать, не говоря уже о том, чтобы держать оружие.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_04");	//Это недопустимо. Особенно сейчас, когда так велика опасность нападения орков или наемников.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_05");	//Я подозреваю, что к этому имеют отношение наемники. Ручаюсь, это они принесли траву в город.
	AI_Output(other,self,"DIA_Andre_FIRSTMISSION_15_06");	//Что я могу сделать?
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_07");	//Мортис, один из наших людей, слышал в портовом кабаке, что где-то в порту находится целый тюк этой травы.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_08");	//Поищи там и принеси этот тюк мне.
	MIS_ANDRE_WAREHOUSE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_WAREHOUSE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WAREHOUSE,LOG_RUNNING);
	b_logentry(TOPIC_WAREHOUSE,"Тюк болотной травы прибыл в гавань. Мортис прослышал об этом в местном пабе. Я должен найти этот тюк и принести его лорду Андре.");
};


instance DIA_ANDRE_FOUND_STUFF(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_found_stuff_condition;
	information = dia_andre_found_stuff_info;
	permanent = TRUE;
	description = "Насчет тюка...";
};


func int dia_andre_found_stuff_condition()
{
	if(MIS_ANDRE_WAREHOUSE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_andre_found_stuff_info()
{
	AI_Output(other,self,"DIA_Andre_FOUND_STUFF_15_00");	//Насчет тюка...
	AI_Output(self,other,"DIA_Andre_FOUND_STUFF_08_01");	//Ты нашел его?
	if((Npc_HasItems(other,itmi_herbpaket) > 0) || (MIS_CIPHER_PAKET == LOG_SUCCESS))
	{
		Info_ClearChoices(dia_andre_found_stuff);
		if(Npc_HasItems(other,itmi_herbpaket) > 0)
		{
			Info_AddChoice(dia_andre_found_stuff,"Да, вот он.",dia_andre_found_stuff_ja);
		};
		Info_AddChoice(dia_andre_found_stuff,"Я выбросил ее в море.",dia_andre_found_stuff_becken);
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_FOUND_STUFF_15_02");	//Пока нет.
	};
};

func void dia_andre_found_stuff_ja()
{
	AI_Output(other,self,"DIA_Andre_FOUND_STUFF_Ja_15_00");	//Да, вот он.
	b_giveinvitems(other,self,itmi_herbpaket,1);
	AI_Output(self,other,"DIA_Andre_FOUND_STUFF_Ja_08_01");	//Отлично. Мы будем охранять эту траву.
	b_andresold();
	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	MIS_CIPHER_PAKET = LOG_FAILED;
	b_giveplayerxp(XP_WAREHOUSE_SUPER * 2);
	Info_ClearChoices(dia_andre_found_stuff);
};

func void dia_andre_found_stuff_becken()
{
	AI_Output(other,self,"DIA_Andre_FOUND_STUFF_Becken_15_00");	//Я выбросил ее в море.
	AI_Output(self,other,"DIA_Andre_FOUND_STUFF_Becken_08_01");	//Да? Ну, главное, что она теперь не сможет попасть в плохие руки.
	b_andresold();
	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	b_giveplayerxp(XP_WAREHOUSE_SUPER);
	Info_ClearChoices(dia_andre_found_stuff);
};


instance DIA_ANDRE_FIND_DEALER(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_find_dealer_condition;
	information = dia_andre_find_dealer_info;
	permanent = FALSE;
	description = "У тебя есть еще работа для меня?";
};


func int dia_andre_find_dealer_condition()
{
	if((MIS_ANDRE_WAREHOUSE == LOG_SUCCESS) && (Npc_IsDead(borka) == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_find_dealer_info()
{
	AI_Output(other,self,"DIA_Andre_FIND_DEALER_15_00");	//У тебя есть еще работа для меня?
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_01");	//Ты вывел болотную траву из оборота - это хорошо.
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_02");	//Но я хочу знать, кто распространяет ее среди горожан.
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_03");	//Это, должно быть, кто-то в портовом квартале.
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_04");	//Если бы этот человек часто приходил в город, он давно бы был пойман.
	AI_Output(other,self,"DIA_Andre_FIND_DEALER_15_05");	//Что именно мне нужно сделать?
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_06");	//Найди торговца и заставь его продать тебе этой травы. Это будет непросто, но иначе мы не сможем арестовать его.
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_07");	//Поговори с Мортисом. Он хорошо знает портовый квартал. Возможно, он сможет помочь тебе.
	MIS_ANDRE_REDLIGHT = LOG_RUNNING;
	b_startotherroutine(nadja,"SMOKE");
	Log_CreateTopic(TOPIC_REDLIGHT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_REDLIGHT,LOG_RUNNING);
	b_logentry(TOPIC_REDLIGHT,"Я должен найти человека, продающего болотную траву в портовом квартале. Я должен заставить его продать мне немного травы. Мортис может помочь мне в этом.");
};


instance DIA_ANDRE_REDLIGHT_SUCCESS(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_redlight_success_condition;
	information = dia_andre_redlight_success_info;
	permanent = TRUE;
	description = "Насчет травы...";
};


func int dia_andre_redlight_success_condition()
{
	if(MIS_ANDRE_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_andre_redlight_success_info()
{
	AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_00");	//Насчет травы...
	if((Npc_IsDead(borka) == TRUE) || (UNDERCOVER_FAILED == TRUE))
	{
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_01");	//Я не думаю, что мы теперь сможем что-то узнать в портовом квартале.
		if(Npc_IsDead(borka) == TRUE)
		{
			AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_02");	//Только не теперь, когда этот вышибала мертв.
		};
		if(NADJA_VICTIM == TRUE)
		{
			AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_03");	//Эта девочка из Красного Фонаря, Надя, мертва. Возможно, это просто случайное совпадение.
			b_removenpc(vlk_435_nadja);
		};
		if(UNDERCOVER_FAILED == TRUE)
		{
			AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_04");	//Ты был недостаточно осторожен.
		};
		MIS_ANDRE_REDLIGHT = LOG_FAILED;
		b_checklog();
	}
	else if(BORKA_DEAL == 2)
	{
		AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_05");	//Я знаю, кто распространяет траву в городе. Это Борка, вышибала в Красном Фонаре.
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_06");	//Точно? У тебя есть доказательства?
		AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_07");	//Он продал мне болотной травы.
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_08");	//Отлично, этого достаточно для нас. Я прикажу немедленно арестовать его.
		b_startotherroutine(borka,"PRISON");
		MIS_ANDRE_REDLIGHT = LOG_SUCCESS;
		b_giveplayerxp(XP_REDLIGHT);
		b_andresold();
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_09");	//...я все еще работаю над этим.
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_10");	//Хорошо. Помни, что ты должен заставить этого человека совершить сделку с тобой.
	};
};


instance DIA_ANDRE_HILFBAUERLOBART(C_INFO)
{
	npc = mil_311_andre;
	nr = 3;
	condition = dia_andre_hilfbauerlobart_condition;
	information = dia_andre_hilfbauerlobart_info;
	description = "У тебя есть еще задания для меня?";
};


func int dia_andre_hilfbauerlobart_condition()
{
	if(MIS_ANDRE_WAREHOUSE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_andre_hilfbauerlobart_info()
{
	AI_Output(other,self,"DIA_Andre_HILFBAUERLOBART_15_00");	//У тебя есть еще задания для меня?
	AI_Output(self,other,"DIA_Andre_HILFBAUERLOBART_08_01");	//У фермера Лобарта какие-то проблемы на его полях.
	AI_Output(self,other,"DIA_Andre_HILFBAUERLOBART_08_02");	//Если мы поможем ему, это укрепит его отношения с городом. Так что отправляйся туда и посмотри, что там не так.
	Log_CreateTopic(TOPIC_FELDRAEUBER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FELDRAEUBER,LOG_RUNNING);
	b_logentry(TOPIC_FELDRAEUBER,"Андре отправил меня на ферму Лобарта. Я опять должен помочь Лобарту восстановить порядок на ферме.");
	MIS_ANDREHELPLOBART = LOG_RUNNING;
	Wld_InsertNpc(lobarts_giant_bug1,"NW_FARM1_FIELD_06");
	Wld_InsertNpc(lobarts_giant_bug2,"NW_FARM1_FIELD_06");
	Wld_InsertNpc(lobarts_giant_bug3,"NW_FARM1_FIELD_05");
	Wld_InsertNpc(lobarts_giant_bug4,"NW_FARM1_FIELD_05");
	Wld_InsertNpc(lobarts_giant_bug5,"NW_FARM1_FIELD_04");
	Wld_InsertNpc(lobarts_giant_bug6,"NW_FARM1_FIELD_04");
	Wld_InsertNpc(lobarts_giant_bug7,"NW_FARM1_FIELD_03");
	b_startotherroutine(vino,"BUGSTHERE");
	b_startotherroutine(lobartsbauer1,"BUGSTHERE");
	b_startotherroutine(lobartsbauer2,"BUGSTHERE");
	AI_StopProcessInfos(self);
};


instance DIA_ANDRE_LOBART_SUCCESS(C_INFO)
{
	npc = mil_311_andre;
	condition = dia_andre_lobart_success_condition;
	information = dia_andre_lobart_success_info;
	description = "Я помог Лобарту.";
};


func int dia_andre_lobart_success_condition()
{
	if(MIS_ANDREHELPLOBART == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_andre_lobart_success_info()
{
	AI_Output(other,self,"DIA_Andre_LOBART_SUCCESS_15_00");	//Я помог Лобарту.
	AI_Output(self,other,"DIA_Andre_LOBART_SUCCESS_08_01");	//Превосходно. Если Лобарт будет счастлив, он продолжит продавать репу городу.
	b_giveplayerxp(XP_LOBARTBUGS);
	b_andresold();
};

func void b_andre_gotolordhagen()
{
	AI_Output(self,other,"DIA_Andre_Add_08_11");	//Тебе лучше отправиться прямо к нему.
};


instance DIA_ANDRE_BERICHTDRACHEN(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_berichtdrachen_condition;
	information = dia_andre_berichtdrachen_info;
	permanent = FALSE;
	description = "Я был в Долине Рудников и видел драконов!";
};


func int dia_andre_berichtdrachen_condition()
{
	if((ENTEROW_KAPITEL2 == TRUE) && (MIS_OLDWORLD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_andre_berichtdrachen_info()
{
	AI_Output(other,self,"DIA_Andre_Add_15_13");	//Я был в Долине Рудников и видел драконов!
	if(Npc_HasItems(hero,itwr_paladinletter_mis) > 0)
	{
		AI_Output(other,self,"DIA_Andre_Add_15_14");	//У меня есть письмо от командующего Гаронда, подтверждающее то, что я сказал.
	};
	AI_Output(self,other,"DIA_Andre_Add_08_10");	//Это заинтересует лорда Хагена!
	b_andre_gotolordhagen();
};


instance DIA_ANDRE_BENNETINPRISON(C_INFO)
{
	npc = mil_311_andre;
	condition = dia_andre_bennetinprison_condition;
	information = dia_andre_bennetinprison_info;
	permanent = TRUE;
	description = "А что насчет Беннета, кузнеца?";
};


func int dia_andre_bennetinprison_condition()
{
	if(MIS_RESCUEBENNET == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_andre_bennetinprison_info()
{
	AI_Output(other,self,"DIA_Andre_BennetInPrison_15_00");	//А что насчет Беннета, кузнеца?
	AI_Output(self,other,"DIA_Andre_BennetInPrison_08_01");	//Ты имеешь в виду этого наемника? Он сидит за решеткой, где ему самое место.
	AI_Output(other,self,"DIA_Andre_BennetInPrison_Talk_15_00");	//Могу я поговорить с ним?
	AI_Output(self,other,"DIA_Andre_BennetInPrison_Talk_08_01");	//Конечно. Но если ты попытаешься помочь ему бежать, ты окажешься за решеткой рядом с ним.
};


instance DIA_ANDRE_CORNELIUS_LIAR(C_INFO)
{
	npc = mil_311_andre;
	condition = dia_andre_cornelius_liar_condition;
	information = dia_andre_cornelius_liar_info;
	permanent = TRUE;
	description = "Я думаю, Корнелиус лжет.";
};


func int dia_andre_cornelius_liar_condition()
{
	if((CORNELIUS_THREATENBYMILSC == TRUE) && (CORNELIUSFLEE != TRUE))
	{
		return TRUE;
	};
};

func void dia_andre_cornelius_liar_info()
{
	AI_Output(other,self,"DIA_Andre_Cornelius_Liar_15_00");	//Я думаю, Корнелиус лжет.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_08_01");	//Ты уверен?
	Info_ClearChoices(dia_andre_cornelius_liar);
	Info_AddChoice(dia_andre_cornelius_liar,"Нет.",dia_andre_cornelius_liar_no);
	Info_AddChoice(dia_andre_cornelius_liar,"Да.",dia_andre_cornelius_liar_yes);
};

func void dia_andre_cornelius_liar_no()
{
	AI_Output(other,self,"DIA_Andre_Cornelius_Liar_No_15_00");	//Нет.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_No_08_01");	//Тогда не стоит заявлять о своих подозрениях во весь голос.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_No_08_02");	//Корнелиус - влиятельный человек. Он может сделать твою жизнь адом, если захочет.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_No_08_03");	//Пока у тебя нет доказательств, я ничем не могу помочь тебе.
	Info_ClearChoices(dia_andre_cornelius_liar);
};

func void dia_andre_cornelius_liar_yes()
{
	AI_Output(other,self,"DIA_Andre_Cornelius_Liar_Yes_15_00");	//Да.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_01");	//Что за доказательства у тебя есть?
	if(CORNELIUS_ISLIAR == TRUE)
	{
		AI_Output(other,self,"DIA_Andre_Cornelius_Liar_Yes_15_02");	//Я прочел его дневник! Его подкупили. Все, что он сказал, было ложью.
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_03");	//Если это действительно так, ты должен немедленно сообщить об этом лорду Хагену.
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_04");	//Покажи ему этот дневник. Он разберется в этом деле.
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_Cornelius_Liar_Yes_15_05");	//Э-э-э, ну, я думаю...
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_06");	//Мне нужны доказательства, а не предположения. Принеси доказательства, и тогда я смогу что-нибудь сделать.
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_07");	//А до того времени тебе стоит поосторожнее выбирать слова.
	};
	Info_ClearChoices(dia_andre_cornelius_liar);
};


instance DIA_ANDRE_PALADIN(C_INFO)
{
	npc = mil_311_andre;
	condition = dia_andre_paladin_condition;
	information = dia_andre_paladin_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_andre_paladin_condition()
{
	if(other.guild == GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_andre_paladin_info()
{
	AI_Output(self,other,"DIA_Andre_Paladin_08_00");	//Теперь ты паладин! Поздравляю!
	AI_Output(self,other,"DIA_Andre_Paladin_08_01");	//Я с самого начала знал, что ты не задержишься долго в ополчении.
};


instance DIA_ANDRE_PERM(C_INFO)
{
	npc = mil_311_andre;
	nr = 100;
	condition = dia_andre_perm_condition;
	information = dia_andre_perm_info;
	permanent = TRUE;
	description = "Как обстановка в городе?";
};


func int dia_andre_perm_condition()
{
	if(other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_andre_perm_info()
{
	AI_Output(other,self,"DIA_Andre_PERM_15_00");	//Как обстановка в городе?
	AI_Output(self,other,"DIA_Andre_PERM_08_01");	//Все под контролем.
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Andre_PERM_08_02");	//Выполняй свои задания.
	};
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Andre_PERM_08_03");	//С этого времени ты должен докладывать непосредственно Лорду Хагену. Иди, поговори с ним.
	};
};


instance DIA_ANDRE_BERICHTDRACHENTOT(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_berichtdrachentot_condition;
	information = dia_andre_berichtdrachentot_info;
	permanent = FALSE;
	description = "Я убил всех драконов в Долине Рудников!";
};


func int dia_andre_berichtdrachentot_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_andre_berichtdrachentot_info()
{
	AI_Output(other,self,"DIA_Andre_Add_15_15");	//Я убил всех драконов в Долине Рудников!
	AI_Output(self,other,"DIA_Andre_Add_08_08");	//Если это правда, ты должен рассказать об этом лорду Хагену.
	b_andre_gotolordhagen();
};


instance DIA_ANDRE_BERICHTTORAUF(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_berichttorauf_condition;
	information = dia_andre_berichttorauf_info;
	permanent = FALSE;
	description = "Замок в Долине Рудников штурмовали орки!";
};


func int dia_andre_berichttorauf_condition()
{
	if((KAPITEL == 5) && (MIS_OCGATEOPEN == TRUE) && Npc_KnowsInfo(other,dia_andre_berichtdrachentot))
	{
		return TRUE;
	};
};

func void dia_andre_berichttorauf_info()
{
	AI_Output(other,self,"DIA_Andre_Add_15_16");	//Замок в Долине Рудников штурмовали орки!
	AI_Output(self,other,"DIA_Andre_Add_08_09");	//Нет! Лорд Хаген должен услышать об этом.
	b_andre_gotolordhagen();
};

