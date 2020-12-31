
instance DIA_BOSPER_EXIT(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 999;
	condition = dia_bosper_exit_condition;
	information = dia_bosper_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bosper_exit_condition()
{
	return TRUE;
};

func void dia_bosper_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BOSPER_HALLO(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_hallo_condition;
	information = dia_bosper_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bosper_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bosper_hallo_info()
{
	AI_Output(self,other,"DIA_Bosper_HALLO_11_00");	//Добро пожаловать в мою лавку, чужеземец!
	AI_Output(self,other,"DIA_Bosper_HALLO_11_01");	//Я Боспер. Я делаю луки и торгую шкурами.
	AI_Output(self,other,"DIA_Bosper_HALLO_11_02");	//Что привело тебя в Хоринис?
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Боспер делает луки и торгует шкурами. Его лавка находится у южных ворот, в нижней части города.");
};


instance DIA_BOSPER_INTOOV(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 1;
	condition = dia_bosper_intoov_condition;
	information = dia_bosper_intoov_info;
	permanent = FALSE;
	description = "Мне нужно попасть в верхний квартал...";
};


func int dia_bosper_intoov_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_bosper_intoov_info()
{
	AI_Output(other,self,"DIA_Bosper_IntoOV_15_00");	//Мне нужно попасть в верхний квартал...
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_01");	//Где живут паладины? Забудь об этом.
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_02");	//Тебе нужно быть уважаемым гражданином или, хотя бы, иметь приличную работу.
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_03");	//А чужаку вроде тебя ни за что туда не попасть.
	if(torwache_305.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(other,self,"DIA_Bosper_IntoOV_15_04");	//Я это заметил...
	};
	Log_CreateTopic(TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OV,LOG_RUNNING);
	b_logentry(TOPIC_OV,"Чтобы попасть в верхний квартал, я либо должен стать уважаемым гражданином, либо получить работу.");
};


instance DIA_BOSPER_SEEKWORK(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_seekwork_condition;
	information = dia_bosper_seekwork_info;
	permanent = FALSE;
	description = "Я ищу работу!";
};


func int dia_bosper_seekwork_condition()
{
	return TRUE;
};

func void dia_bosper_seekwork_info()
{
	AI_Output(other,self,"DIA_Bosper_SeekWork_15_00");	//Я ищу работу!
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_01");	//Ммм - мне не помешал бы новый ученик.
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_02");	//Последний, что у меня был, бросил свою работу пару дней назад.
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_03");	//Ты что-нибудь знаешь об охоте, а?
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
	{
		AI_Output(other,self,"DIA_Bosper_SeekWork_15_04");	//Нуууу...
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_05");	//Я мог бы научить тебя снимать шкуры с животных.
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_06");	//Я буду хорошо платить тебе за каждую шкуру, что ты принесешь мне.
	}
	else
	{
		AI_Output(other,self,"DIA_Bosper_SeekWork_15_07");	//Я могу дать тебе несколько шкур, если ты это имел в виду.
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_08");	//Превосходно! Приноси мне все шкуры, что тебе удастся добыть - я куплю их у тебя по очень хорошей цене.
	};
	b_logentry(TOPIC_LEHRLING,"Боспер ищет нового ученика. Я могу начать работать у него.");
};


var int bosper_hinttojob;
var int bosper_startguild;

instance DIA_BOSPER_LEHRLING(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_lehrling_condition;
	information = dia_bosper_lehrling_info;
	permanent = TRUE;
	description = "Я хочу стать твоим учеником!";
};


func int dia_bosper_lehrling_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_seekwork) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_bosper_lehrling_info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Bosper_LEHRLING_15_00");	//Я хочу стать твоим учеником!
	if(MIS_BOSPER_WOLFFURS == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bosper_LEHRLING_11_01");	//(ухмыляется) Отлично! Похоже, ты уже знаешь основы.
		stimmen = stimmen + 1;
		if(harad.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if((MIS_HARAD_ORC == LOG_SUCCESS) || (MIS_HAKONBANDITS == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_02");	//Гарад считает, что ты хороший человек.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_03");	//Но Гарад пока не уверен в твоих способностях.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_04");	//Но Гарад говорит, что никогда не видел тебя.
		};
		if(thorben.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_THORBEN_GETBLESSINGS == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_05");	//Торбен дает тебе свое благословение. Я не так набожен, как он, но все же это хорошо.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_06");	//Торбен даст тебе свое одобрение только с благословения богов.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_07");	//Торбен понятия не имеет, кто ты такой.
		};
		if(constantino.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(b_getgreatestpetzcrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_08");	//Константино говорит, что ты можешь стать учеником кого захочешь.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_09");	//Константино говорит, что ты обвиняешься в преступлении в городе - надеюсь, это какая-нибудь ерунда?
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_10");	//Позаботься, чтобы этот вопрос был улажен.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_11");	//Константино никогда даже не слышал о тебе.
		};
		if(matteo.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_MATTEO_GOLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_12");	//Маттео говорит, что ты стоишь столько же, сколько золото равное твоему весу.
				stimmen = stimmen + 1;
			}
			else if(MIS_MATTEO_GOLD == LOG_RUNNING)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_13");	//Маттео упомянул о каких-то долгах - я не знаю, что он имеет в виду, но тебе лучше поговорить с ним.
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_14");	//Маттео говорит, что еще не говорил с тобой об этом.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_15");	//Маттео говорит, что никогда не видел тебя.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_16");	//Это означает, что ты получил одобрение всех мастеров!
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_17");	//Ты получил одобрение четырех мастеров. Этого достаточно, чтобы быть принятым в ученики.
			};
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_18");	//Ты можешь начать работать на меня когда только захочешь.
			Info_ClearChoices(dia_bosper_lehrling);
			Info_AddChoice(dia_bosper_lehrling,"Хорошо - я подумаю над этим.",dia_bosper_lehrling_later);
			Info_AddChoice(dia_bosper_lehrling,"Я готов стать твоим учеником!",dia_bosper_lehrling_ok);
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_19");	//Тебе нужно получить одобрение хотя бы четырех мастеров. Без этого ты не сможешь стать учеником в нижней части города.
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_20");	//Это означает, что ты должен поговорить со всеми, кто еще сомневается в тебе.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_LEHRLING_11_21");	//Прежде чем взять тебя к себе, я должен сначала понять, годен ли ты вообще хоть на что-то.
		if(MIS_BOSPER_BOGEN == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_22");	//Ты вернул назад мой лук, но это ничего не говорит о твоем таланте охотника.
		};
		BOSPER_HINTTOJOB = TRUE;
	};
};

func void dia_bosper_lehrling_ok()
{
	AI_Output(other,self,"DIA_Bosper_LEHRLING_OK_15_00");	//Я готов стать твоим учеником!
	AI_Output(self,other,"DIA_Bosper_LEHRLING_OK_11_01");	//Ты не пожалеешь об этом! Думаю, мы сработаемся.
	PLAYER_ISAPPRENTICE = APP_BOSPER;
	BOSPER_STARTGUILD = other.guild;
	BOSPER_LEHRLING_DAY = Wld_GetDay();
	Wld_AssignRoomToGuild("gritta",GIL_NONE);
	MIS_APPRENTICE = LOG_SUCCESS;
	b_giveplayerxp(XP_LEHRLING);
	b_logentry(TOPIC_BONUS,"Боспер принял меня в ученики. Теперь я смогу попасть в верхний квартал.");
	Info_ClearChoices(dia_bosper_lehrling);
};

func void dia_bosper_lehrling_later()
{
	AI_Output(other,self,"DIA_Bosper_LEHRLING_Later_15_00");	//Хорошо - я подумаю над этим.
	AI_Output(self,other,"DIA_Bosper_LEHRLING_Later_11_01");	//Смотри, не прими ошибочного решения! Ты лучше всего подходишь именно для моей работы.
	Info_ClearChoices(dia_bosper_lehrling);
};


instance DIA_BOSPER_OTHERMASTERS(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 3;
	condition = dia_bosper_othermasters_condition;
	information = dia_bosper_othermasters_info;
	permanent = FALSE;
	description = "А что если я захочу поступить в ученики к другому мастеру?";
};


func int dia_bosper_othermasters_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_seekwork) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_bosper_othermasters_info()
{
	AI_Output(other,self,"DIA_Bosper_OtherMasters_15_00");	//А что если я захочу поступить в ученики к другому мастеру?
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_01");	//(раздраженно) Бред!
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_02");	//Гарад и Маттео уже имеют учеников.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_03");	//Алхимик Константино - одинокий волк. У него не было ученика уже многие годы.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_04");	//А что касается Торбена - все знают, что он обанкротился. Он, вероятно, даже не сможет платить тебе.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_05");	//А мне вот, например, очень нужен ученик. И плачу я хорошо.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_06");	//Но не важно, чьим учеником ты хочешь стать - тебе понадобится одобрение всех мастеров из нижней части города...
};


instance DIA_BOSPER_BARTOK(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 4;
	condition = dia_bosper_bartok_condition;
	information = dia_bosper_bartok_info;
	permanent = FALSE;
	description = "А почему твой ученик бросил работу?";
};


func int dia_bosper_bartok_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_seekwork))
	{
		return TRUE;
	};
};

func void dia_bosper_bartok_info()
{
	AI_Output(other,self,"DIA_Bosper_Bartok_15_00");	//А почему твой ученик бросил работу?
	AI_Output(self,other,"DIA_Bosper_Bartok_11_01");	//Как он сказал, последнее время охотиться стало слишком опасно.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_02");	//Если тебе это действительно интересно, ты можешь спросить его об этом сам.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_03");	//Его зовут Барток. Он, вероятно, ошивается где-то у таверны Корагона.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_04");	//Пройди через подземный проход у кузницы и окажешься прямо перед ним.
};


instance DIA_BOSPER_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 3;
	condition = dia_bosper_zustimmung_condition;
	information = dia_bosper_zustimmung_info;
	permanent = TRUE;
	description = "Я получу твое одобрение на работу с другим мастером?";
};


func int dia_bosper_zustimmung_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_othermasters) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};


var int bosper_zustimmung_once;

func void dia_bosper_zustimmung_info()
{
	AI_Output(other,self,"DIA_Bosper_ZUSTIMMUNG_15_00");	//Я получу твое одобрение на работу с другим мастером?
	if((MIS_BOSPER_BOGEN == LOG_SUCCESS) || (MIS_BOSPER_WOLFFURS == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_01");	//(разочарованно) Я надеялся, что ты выберешь меня.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_02");	//Но если ты решил так...
		AI_Output(other,self,"DIA_Bosper_ZUSTIMMUNG_15_03");	//Это означает, что ты проголосуешь за меня?
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_04");	//Если никто больше из мастеров не будет возражать - то да.
		if(MIS_BOSPER_BOGEN == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_05");	//Ты ведь все же вернул назад мой лук.
		};
		if(MIS_BOSPER_WOLFFURS == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_06");	//Но из тебя бы получился такой хороший охотник!
		};
		if(BOSPER_ZUSTIMMUNG_ONCE == FALSE)
		{
			b_giveplayerxp(XP_ZUSTIMMUNG);
			BOSPER_ZUSTIMMUNG_ONCE = TRUE;
		};
		b_logentry(TOPIC_LEHRLING,"Боспер даст мне свое одобрение, если я захочу стать учеником другого мастера.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_07");	//(вздыхает) Хорошо! Ты получишь мое одобрение - но при одном условии.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_08");	//Поработай на меня, хотя бы недолго.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_09");	//Таким образом, ты сможешь понять, нравится тебе мое ремесло или нет.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_10");	//И кто знает - может это тебе так понравится, что ты останешься со мной.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_11");	//Если ты достаточно хорош, чтобы стать МОИМ учеником, то ты также подойдешь и другим мастерам.
		BOSPER_HINTTOJOB = TRUE;
	};
};


instance DIA_BOSPER_JOB(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_job_condition;
	information = dia_bosper_job_info;
	permanent = FALSE;
	description = "Что ты хочешь, чтобы я сделал для тебя?";
};


func int dia_bosper_job_condition()
{
	if(BOSPER_HINTTOJOB == TRUE)
	{
		return TRUE;
	};
};

func void dia_bosper_job_info()
{
	AI_Output(other,self,"DIA_Bosper_Job_15_00");	//Что ты хочешь, чтобы я сделал для тебя?
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_01");	//Я научу тебя снимать шкуры с животных, и ты принесешь мне - скажем - полдюжины волчьих шкур.
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"Боспер может обучить меня снимать шкуры с животных.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_02");	//Принеси мне полдюжины волчьих шкур.
	};
	AI_Output(self,other,"DIA_Bosper_Job_11_03");	//Тогда я пойму, что ты освоил это ремесло.
	AI_Output(self,other,"DIA_Bosper_Job_11_04");	//Если только у тебя не уйдет на это целая вечность, и если шкуры будут в приемлемом состоянии. И тогда я возьму тебя к себе, если ты захочешь.
	if(Npc_KnowsInfo(other,dia_bosper_othermasters))
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_05");	//Или (вздыхает) ты сможешь стать учеником другого мастера - если ты этого действительно хочешь.
	};
	MIS_BOSPER_WOLFFURS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BOSPERWOLF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BOSPERWOLF,LOG_RUNNING);
	b_logentry(TOPIC_BOSPERWOLF,"Я должен принести Босперу шесть волчьих шкур. Тогда я смогу либо работать на него, либо получу его одобрение на работу с другими мастерами.");
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
	{
		b_logentry(TOPIC_BOSPERWOLF,"Я должен попросить его обучить меня снимать шкуры с животных.");
	};
};


instance DIA_BOSPER_BRINGFUR(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 102;
	condition = dia_bosper_bringfur_condition;
	information = dia_bosper_bringfur_info;
	permanent = TRUE;
	description = "Насчет волчьих шкур...";
};


func int dia_bosper_bringfur_condition()
{
	if(MIS_BOSPER_WOLFFURS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_bosper_bringfur_info()
{
	AI_Output(other,self,"DIA_Bosper_BringFur_15_00");	//Насчет волчьих шкур...
	if(PLAYER_ISAPPRENTICE > APP_NONE)
	{
		AI_Output(self,other,"DIA_Bosper_BringFur_11_01");	//Ты уже стал учеником другого мастера. Я буду покупать у тебя шкуры по обычной цене.
		MIS_BOSPER_WOLFFURS = LOG_OBSOLETE;
		return;
	};
	if(b_giveinvitems(other,self,itat_wolffur,6))
	{
		AI_Output(other,self,"DIA_Bosper_BringFur_15_02");	//Я принес их - вот.
		AI_Output(self,other,"DIA_Bosper_BringFur_11_03");	//Отлично! Я знал, что ты подходишь для этой работы.
		AI_Output(self,other,"DIA_Bosper_BringFur_11_04");	//Вот деньги, как я и обещал тебе.
		b_giveinvitems(self,other,itmi_gold,VALUE_WOLFFUR * 6);
		BosperFurCounter += 6;
		ApprenticeGoldCounter += VALUE_WOLFFUR * 6;
		AI_Output(self,other,"DIA_Bosper_BringFur_11_05");	//И? Что скажешь? Разве это не лучше, чем корпеть над мечами день напролет или наполнять бутылочки в пыльной каморке?
		MIS_BOSPER_WOLFFURS = LOG_SUCCESS;
		b_logentry(TOPIC_LEHRLING,"Боспер примет меня в ученики, если другие мастера не будут против.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_BringFur_11_06");	//Мы договорились на полдюжины - но у тебя еще есть время. Иди и добудь эти шкуры.
	};
};


instance DIA_BOSPER_TEACHFUR(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_teachfur_condition;
	information = dia_bosper_teachfur_info;
	permanent = TRUE;
	description = "Научи меня снимать шкуры с животных! (5 очков обучения)";
};


func int dia_bosper_teachfur_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_job) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE))
	{
		return TRUE;
	};
};

func void dia_bosper_teachfur_info()
{
	AI_Output(other,self,"DIA_Bosper_TeachFUR_15_00");	//Научи меня снимать шкуры с животных!
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
	{
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_01");	//Хорошо. Слушай. Это довольно просто.
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_02");	//Берешь острый нож и разрезаешь брюхо животного. Затем делаешь несколько небольших надрезов на внутренней стороне ног, и снимаешь шкуру.
		if(MIS_BOSPER_WOLFFURS == LOG_RUNNING)
		{
			AI_Output(self,other,"DIA_Bosper_TeachFUR_11_03");	//Принеси мне волчьи шкуры, а там посмотрим...
			b_logentry(TOPIC_BOSPERWOLF,"Боспер научил меня снимать шкуры с животных.");
		};
	};
};


instance DIA_BOSPER_TRADE(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 700;
	condition = dia_bosper_trade_condition;
	information = dia_bosper_trade_info;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
};


func int dia_bosper_trade_condition()
{
	if(MIS_BOSPER_WOLFFURS != LOG_RUNNING)
	{
		dia_bosper_trade.trade = TRUE;
	};
	return TRUE;
};

func void dia_bosper_trade_info()
{
	var int mcbolzenamount;
	var int mcarrowamount;
	AI_Output(other,self,"DIA_Bosper_Trade_15_00");	//Покажи мне свои товары.
	if(dia_bosper_trade.trade == TRUE)
	{
		b_givetradeinv(self);
		Npc_RemoveInvItems(self,itrw_bolt,Npc_HasItems(self,itrw_bolt));
		mcbolzenamount = KAPITEL * 50;
		CreateInvItems(self,itrw_bolt,mcbolzenamount);
		Npc_RemoveInvItems(self,itrw_arrow,Npc_HasItems(self,itrw_arrow));
		mcarrowamount = KAPITEL * 50;
		CreateInvItems(self,itrw_arrow,mcarrowamount);
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_Trade_11_01");	//Ты здесь не для того, чтобы разглядывать мои товары, ты должен принести мне шкуры!
		AI_Output(self,other,"DIA_Bosper_Trade_11_02");	//Так что берись за дело!
	};
};


instance DIA_BOSPER_BOGENRUNNING(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 5;
	condition = dia_bosper_bogenrunning_condition;
	information = dia_bosper_bogenrunning_info;
	permanent = FALSE;
	description = "Я слышал, что у тебя что-то украли.";
};


func int dia_bosper_bogenrunning_condition()
{
	if(MIS_BOSPER_BOGEN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_bosper_bogenrunning_info()
{
	AI_Output(other,self,"DIA_Bosper_BogenRunning_15_00");	//Я слышал, что у тебя что-то украли.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_01");	//Кто сказал тебе это? Вероятно Барток, да? Ему что, больше нечего было сказать тебе? Ох, ладно.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_02");	//Но если я доберусь до этого ублюдка, никакие молитвы ему не помогут!
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_03");	//Я отлучился из своей лавки всего на минуту. А когда вернулся, я увидел только, как он выходил - с моим луком на плече.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_04");	//Я тут же позвал стражу, но этот подонок побежал к гавани. И они потеряли его там!
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_05");	//Я спустил на них всех собак за это, и стражники обыскали весь портовый квартал. Но ничего не нашли.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_06");	//Бестолочи!
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_07");	//Готов поклясться, что мой лук все еще находится где-то в городе. Я поговорил со стражей у обоих городских ворот, но они не видели, чтобы кто-нибудь выходил из города с луком.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_08");	//Когда я доберусь до этого ублюдка...
	Log_CreateTopic(TOPIC_BOSPERBOGEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BOSPERBOGEN,LOG_RUNNING);
	b_logentry(TOPIC_BOSPERBOGEN,"У Боспера был украден лук. Вор побежал к гавани, и скрылся там. Ополчение обыскало портовый квартал, но они ничего не нашли, хотя лук все еще должен быть в городе.");
};


instance DIA_BOSPER_BOGENSUCCESS(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 6;
	condition = dia_bosper_bogensuccess_condition;
	information = dia_bosper_bogensuccess_info;
	permanent = FALSE;
	description = "Я думаю, это твой лук...";
};


func int dia_bosper_bogensuccess_condition()
{
	if(Npc_HasItems(other,itrw_bow_l_03_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_bosper_bogensuccess_info()
{
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_00");	//Я думаю, это твой лук...
	b_giveinvitems(other,self,itrw_bow_l_03_mis,1);
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_01");	//Мой лук! Где ты нашел его?
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_02");	//В темной дыре, полной крыс.
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_03");	//Надеюсь, у тебя не возникло проблем из-за этого...
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_04");	//Нет - мне приходилось делать такое и раньше.
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_05");	//Хм - но все же спасибо. Я твой должник!
	MIS_BOSPER_BOGEN = LOG_SUCCESS;
	b_giveplayerxp(XP_BOSPER_BOGEN);
	Npc_RemoveInvItems(self,itrw_bow_l_03_mis,1);
};


var int bosper_island;

instance DIA_BOSPER_PERM(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 10;
	condition = dia_bosper_perm_condition;
	information = dia_bosper_perm_info;
	permanent = TRUE;
	description = "Как обстановка в городе?";
};


func int dia_bosper_perm_condition()
{
	if(KAPITEL >= 2)
	{
		return TRUE;
	};
};

func void dia_bosper_perm_info()
{
	AI_Output(other,self,"DIA_Bosper_PERM_15_00");	//Как обстановка в городе?
	if(BOSPER_ISLAND == FALSE)
	{
		AI_Output(self,other,"DIA_Bosper_PERM_11_01");	//Если орки действительно решатся напасть на нас, здесь станет совсем паршиво.
		AI_Output(self,other,"DIA_Bosper_PERM_11_02");	//В гавани стоит только один корабль - и его охраняют паладины. Я не думаю, что они используют его для спасения горожан.
		AI_Output(other,self,"DIA_Bosper_PERM_15_03");	//А нет другого способа выбраться отсюда?
		AI_Output(self,other,"DIA_Bosper_PERM_11_04");	//Нет, никому из нас не покинуть этот остров без корабля.
		BOSPER_ISLAND = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_PERM_11_05");	//Пока нет никаких новостей. Если хочешь, зайди позже.
	};
};


var int bosper_milkommentar;
var int bosper_palkommentar;
var int bosper_innoskommentar;

instance DIA_BOSPER_ALSLEHRLING(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 1;
	condition = dia_bosper_alslehrling_condition;
	information = dia_bosper_alslehrling_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_bosper_alslehrling_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_BOSPER) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bosper_alslehrling_info()
{
	if((other.guild == GIL_MIL) && (BOSPER_STARTGUILD != GIL_MIL) && (BOSPER_MILKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_00");	//Ты что, вступил в ополчение, да?
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_01");	//Мне, в общем-то, все равно. Лишь бы ты, помимо орков и бандитов, охотился также и на волков. (ухмыляется)
		BOSPER_MILKOMMENTAR = TRUE;
	}
	else if((other.guild == GIL_PAL) && (BOSPER_STARTGUILD != GIL_PAL) && (BOSPER_PALKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_02");	//Похоже, твоя карьера переживает стремительный взлет. Паладин короля!
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_03");	//Но куда бы ни занесло тебя, прошу, не забывай своего старого учителя...
		BOSPER_PALKOMMENTAR = TRUE;
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (BOSPER_STARTGUILD != GIL_NOV) && (BOSPER_STARTGUILD != GIL_KDF) && (BOSPER_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_04");	//Ты постригся в монастырь, да? Надеюсь, они будут отпускать тебя хоть иногда, и ты сможешь приносить мне шкуры...
		BOSPER_INNOSKOMMENTAR = TRUE;
	}
	else if((BOSPER_LEHRLING_DAY <= (Wld_GetDay() - 4)) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_05");	//Где ты болтался так долго?
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_06");	//Мне нужны еще шкуры. Ты принес их?
		BOSPER_LEHRLING_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_07");	//Пришел, наконец...
		BOSPER_LEHRLING_DAY = Wld_GetDay();
	};
};


instance DIA_BOSPER_AUFGABEN(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 1;
	condition = dia_bosper_aufgaben_condition;
	information = dia_bosper_aufgaben_info;
	permanent = FALSE;
	description = "Что должен делать ученик?";
};


func int dia_bosper_aufgaben_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_BOSPER)
	{
		return TRUE;
	};
};

func void dia_bosper_aufgaben_info()
{
	AI_Output(other,self,"DIA_Bosper_Aufgaben_15_00");	//Что должен делать ученик?
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_01");	//Это просто. Приноси мне все шкуры, что сможешь добыть.
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_02");	//Я дам тебе за них более высокую цену, чем любой другой из местных торговцев.
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_03");	//Ну, а в остальное время, тебе не обязательно появляться в моей лавке. Я и один тут неплохо справляюсь.
	if(other.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Bosper_Aufgaben_15_04");	//А где я буду спать?
		AI_Output(self,other,"DIA_Bosper_Aufgaben_11_05");	//У меня здесь нет места для тебя. Но ты всегда найдешь свободную койку в отеле на рыночной площади.
	};
	Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
	b_logentry(TOPIC_BONUS,"Боспер готов платить очень хорошую цену за шкуры животных.");
};


var int bosper_trollfursold;

instance DIA_BOSPER_SELLFUR(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 600;
	condition = dia_bosper_sellfur_condition;
	information = dia_bosper_sellfur_info;
	permanent = TRUE;
	description = "Я принес несколько шкур для тебя...";
};


func int dia_bosper_sellfur_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_BOSPER)
	{
		return TRUE;
	};
};

func void dia_bosper_sellfur_info()
{
	var int furs;
	AI_Output(other,self,"DIA_Bosper_SellFur_15_00");	//Я принес несколько шкур для тебя...
	furs = Npc_HasItems(other,itat_sheepfur) + Npc_HasItems(other,itat_wolffur) + Npc_HasItems(other,itat_wargfur) + Npc_HasItems(other,itat_shadowfur) + Npc_HasItems(other,itat_trollfur) + Npc_HasItems(other,itat_trollblackfur);
	if(furs > 0)
	{
		BosperFurCounter += furs;
		ApprenticeGoldCounter += (Npc_HasItems(other,itat_sheepfur) * VALUE_SHEEPFUR) + (Npc_HasItems(other,itat_wolffur) * VALUE_WOLFFUR) + (Npc_HasItems(other,itat_wargfur) * VALUE_WARGFUR) + (Npc_HasItems(other,itat_shadowfur) * VALUE_SHADOWFUR) + (Npc_HasItems(other,itat_trollfur) * VALUE_TROLLFUR) + (Npc_HasItems(other,itat_trollblackfur) * VALUE_TROLLBLACKFUR);
		if(Npc_HasItems(other,itat_sheepfur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_01");	//Овечьи шкуры? Ты ведь не убивал овец фермеров на пастбищах, нет?
			AI_Output(other,self,"DIA_Bosper_SellFur_15_02");	//Я даже и не думал заниматься этим...
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_sheepfur) * VALUE_SHEEPFUR);
			b_giveinvitems(other,self,itat_sheepfur,Npc_HasItems(other,itat_sheepfur));
		};
		if(Npc_HasItems(other,itat_wolffur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_03");	//Волчьи шкуры это хорошо...
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_wolffur) * VALUE_WOLFFUR);
			b_giveinvitems(other,self,itat_wolffur,Npc_HasItems(other,itat_wolffur));
		};
		if(Npc_HasItems(other,itat_wargfur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_04");	//Шкура варга? Это опасные звери ...
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_wargfur) * VALUE_WARGFUR);
			b_giveinvitems(other,self,itat_wargfur,Npc_HasItems(other,itat_wargfur));
		};
		if(Npc_HasItems(other,itat_shadowfur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_05");	//Ах, и даже шкура мракориса - она дорогого стоит.
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_shadowfur) * VALUE_SHADOWFUR);
			b_giveinvitems(other,self,itat_shadowfur,Npc_HasItems(other,itat_shadowfur));
		};
		if((Npc_HasItems(other,itat_trollfur) > 0) || (Npc_HasItems(other,itat_trollblackfur) > 0))
		{
			if(BOSPER_TROLLFURSOLD == FALSE)
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_06");	//А это что за шкура, черт побери?
				AI_Output(other,self,"DIA_Bosper_SellFur_15_07");	//Я снял ее с тролля.
				AI_Output(self,other,"DIA_Bosper_SellFur_11_08");	//Это... она стоит целое состояние.
				BOSPER_TROLLFURSOLD = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_09");	//Еще одна шкура огромного тролля... ты что, охотишься на них?
				AI_Output(other,self,"DIA_Bosper_SellFur_15_10");	//Когда я натыкаюсь на одного из них, я не упускаю такой возможности...
			};
			if(Npc_HasItems(other,itat_trollfur) > 0)
			{
				b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_trollfur) * VALUE_TROLLFUR);
				b_giveinvitems(other,self,itat_trollfur,Npc_HasItems(other,itat_trollfur));
			};
			if(Npc_HasItems(other,itat_trollblackfur) > 0)
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_11");	//И шкура черного тролля, надо же!
				b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_trollblackfur) * VALUE_TROLLBLACKFUR);
				b_giveinvitems(other,self,itat_trollblackfur,Npc_HasItems(other,itat_trollblackfur));
			};
		};
		AI_Output(self,other,"DIA_Bosper_SellFur_11_12");	//Отличная работа. Заходи ко мне еще, когда у тебя будут шкуры...
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_SellFur_11_13");	//Но, знаешь - меня интересуют только шкуры волков, мракорисов и им подобные...
	};
};


instance DIA_BOSPER_MINENANTEIL(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 3;
	condition = dia_bosper_minenanteil_condition;
	information = dia_bosper_minenanteil_info;
	description = "Я вижу, ты продаешь акции шахт.";
};


func int dia_bosper_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_bosper_minenanteil_info()
{
	AI_Output(other,self,"DIA_Bosper_Minenanteil_15_00");	//Я вижу, ты продаешь акции шахт.
	AI_Output(self,other,"DIA_Bosper_Minenanteil_11_01");	//Гм. Я ничего не знаю об этом. Ты можешь забрать их, если хочешь.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BOSPER_PICKPOCKET(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 900;
	condition = dia_bosper_pickpocket_condition;
	information = dia_bosper_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_bosper_pickpocket_condition()
{
	return c_beklauen(67,120);
};

func void dia_bosper_pickpocket_info()
{
	Info_ClearChoices(dia_bosper_pickpocket);
	Info_AddChoice(dia_bosper_pickpocket,DIALOG_BACK,dia_bosper_pickpocket_back);
	Info_AddChoice(dia_bosper_pickpocket,DIALOG_PICKPOCKET,dia_bosper_pickpocket_doit);
};

func void dia_bosper_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bosper_pickpocket);
};

func void dia_bosper_pickpocket_back()
{
	Info_ClearChoices(dia_bosper_pickpocket);
};

