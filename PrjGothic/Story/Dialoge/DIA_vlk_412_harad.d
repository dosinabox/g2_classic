
instance DIA_HARAD_EXIT(C_INFO)
{
	npc = vlk_412_harad;
	nr = 999;
	condition = dia_harad_exit_condition;
	information = dia_harad_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_harad_exit_condition()
{
	return TRUE;
};

func void dia_harad_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HARAD_HALLO(C_INFO)
{
	npc = vlk_412_harad;
	nr = 2;
	condition = dia_harad_hallo_condition;
	information = dia_harad_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_harad_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_harad_hallo_info()
{
	AI_Output(self,other,"DIA_Harad_Hallo_12_00");	//(раздраженно) Что ты хочешь?
};


instance DIA_HARAD_ARBEIT(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_arbeit_condition;
	information = dia_harad_arbeit_info;
	permanent = FALSE;
	description = "Я ищу работу!";
};


func int dia_harad_arbeit_condition()
{
	return TRUE;
};

func void dia_harad_arbeit_info()
{
	AI_Output(other,self,"DIA_Harad_Arbeit_15_00");	//Я ищу работу!
	AI_Output(self,other,"DIA_Harad_Arbeit_12_01");	//Хм - мне не помешал бы новый ученик.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_02");	//Брайан скоро закончит свое обучение, а затем покинет город.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_03");	//А ты на что-нибудь годишься?
	AI_Output(other,self,"DIA_Harad_Arbeit_15_04");	//Если ты имеешь в виду, знаю ли я работу кузнеца ...
	AI_Output(self,other,"DIA_Harad_Arbeit_12_05");	//Нет. Я о другом.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_06");	//Рано или поздно, придут орки и возьмут город в кольцо. И тогда в расчет будут приниматься только мужчины, способные защищать город.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Harad_Arbeit_12_07");	//А я не хочу, чтобы мой ученик опозорил мое имя, сбежав из города вместе с женщинами и никчемными бездельниками, вместо того, чтобы держать оборону вместе с другими мужчинами.
	};
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"Если я смогу убедить Гарада, что я хоть на что-нибудь гожусь,  он примет меня в ученики.");
};


instance DIA_HARAD_TAUGENICHTS(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_taugenichts_condition;
	information = dia_harad_taugenichts_info;
	permanent = FALSE;
	description = "Я не никчемный!";
};


func int dia_harad_taugenichts_condition()
{
	if(Npc_KnowsInfo(other,dia_harad_arbeit))
	{
		return TRUE;
	};
};

func void dia_harad_taugenichts_info()
{
	AI_Output(other,self,"DIA_Harad_Taugenichts_15_00");	//Я не никчемный!
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_01");	//Это громкие слова! А ты можешь подтвердить их такими же громкими делами?
	AI_Output(other,self,"DIA_Harad_Taugenichts_15_02");	//На что ты намекаешь?
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_03");	//Принеси мне оружие орков.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_04");	//Орков недавно видели около города. Я думаю, тебе не придется искать их слишком долго.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_05");	//Если тебе удастся завалить одного из них, я возьму тебя в ученики.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_06");	//Если, конечно, другие мастера будут согласны.
	MIS_HARAD_ORC = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HARADORK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HARADORK,LOG_RUNNING);
	b_logentry(TOPIC_HARADORK,"Неподалеку от города видели орка. Кузнец Гарад хочет, чтобы я убил его. Оружие орка послужит достаточным доказательством.");
};


instance DIA_HARAD_ORCRUNNING(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_orcrunning_condition;
	information = dia_harad_orcrunning_info;
	permanent = FALSE;
	description = "Давай еще поговорим об этих орках ...";
};


func int dia_harad_orcrunning_condition()
{
	if((MIS_HARAD_ORC == LOG_RUNNING) && (HARAD_HAKONMISSION == FALSE))
	{
		return TRUE;
	};
};

func void dia_harad_orcrunning_info()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_15_00");	//Давай еще поговорим об этих орках ...
	AI_Output(self,other,"DIA_Harad_OrcRunning_12_01");	//(отрывисто) Что?
	Info_ClearChoices(dia_harad_orcrunning);
	Info_AddChoice(dia_harad_orcrunning,"Можешь считать своего орка мертвым!",dia_harad_orcrunning_done);
	Info_AddChoice(dia_harad_orcrunning,"Орк это очень серьезный противник ... ...",dia_harad_orcrunning_toohard);
};

func void dia_harad_orcrunning_toohard()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_TooHard_15_00");	//Но орк это очень серьезный противник ...
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_01");	//Хм - судя по тому, как ты выглядишь, возможно ты прав. У тебя слишком мало мяса на костях. Но это можно поправить.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_02");	//Том не менее, ты должен доказать мне, что у тебя хватит мужества сражаться, если это будет необходимо.
	AI_Output(other,self,"DIA_Harad_OrcRunning_TooHard_15_03");	//А нет ли для меня противника немного поменьше?
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_04");	//Хм - (задумчиво) Хакон, торговец оружием на рыночной площади, сказал мне, что на него напали бандиты несколько дней назад.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_05");	//Эти ублюдки, по слухам, устроили себе логово где-то за восточными воротами.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_06");	//Эти трусливые шакалы не должны быть так уж сильны.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_07");	//Убей этих ублюдков! Всех! Тогда я пойму, что ты не опозоришь наш город.
	HARAD_HAKONMISSION = TRUE;
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	if(MIS_HAKONBANDITS != LOG_RUNNING)
	{
		b_logentry(TOPIC_LEHRLING,"Гарад сказал мне, что бандиты ограбили торговца Хакона недалеко от города. Если я смогу убить их, это убедит его, что я хоть на что-то гожусь. Я должен поговорить с Хаконом. Возможно, он знает, где скрываются эти бандиты.");
	}
	else
	{
		b_logentry(TOPIC_LEHRLING,"Гарад сказал мне, что бандиты ограбили торговца Хакона недалеко от города. Если я смогу убить их, это убедит его, что я хоть на что-то гожусь.");
	};
	Info_ClearChoices(dia_harad_orcrunning);
};

func void dia_harad_orcrunning_done()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_Done_15_00");	//Можешь считать своего орка мертвым!
	AI_Output(self,other,"DIA_Harad_OrcRunning_Done_12_01");	//Хорошо! Тогда не трать слова попусту. Пусть твои дела сами говорят за себя.
	Info_ClearChoices(dia_harad_orcrunning);
};


instance DIA_HARAD_ORCSUCCESS(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_orcsuccess_condition;
	information = dia_harad_orcsuccess_info;
	permanent = FALSE;
	description = "Я принес тебе оружие орков, как ты хотел.";
};


func int dia_harad_orcsuccess_condition()
{
	if(MIS_HARAD_ORC == LOG_RUNNING)
	{
		if((Npc_HasItems(other,itmw_2h_orcaxe_01) > 0) || (Npc_HasItems(other,itmw_2h_orcaxe_02) > 0) || (Npc_HasItems(other,itmw_2h_orcaxe_03) > 0) || (Npc_HasItems(other,itmw_2h_orcaxe_04) > 0) || (Npc_HasItems(other,itmw_2h_orcsword_01) > 0))
		{
			return TRUE;
		};
	};
};

func void dia_harad_orcsuccess_info()
{
	AI_Output(other,self,"DIA_Harad_OrcSuccess_15_00");	//Я принес тебе оружие орков, как ты хотел.
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_01");	//Покажи ...
	if(Npc_HasItems(other,itmw_2h_orcaxe_01) > 0)
	{
		b_giveinvitems(other,self,itmw_2h_orcaxe_01,1);
	}
	else if(Npc_HasItems(other,itmw_2h_orcaxe_02) > 0)
	{
		b_giveinvitems(other,self,itmw_2h_orcaxe_02,1);
	}
	else if(Npc_HasItems(other,itmw_2h_orcaxe_03) > 0)
	{
		b_giveinvitems(other,self,itmw_2h_orcaxe_03,1);
	}
	else if(Npc_HasItems(other,itmw_2h_orcaxe_04) > 0)
	{
		b_giveinvitems(other,self,itmw_2h_orcaxe_04,1);
	}
	else
	{
		b_giveinvitems(other,self,itmw_2h_orcsword_01,1);
	};
	if(HARAD_HAKONMISSION == TRUE)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_02");	//Ты ВСЕ ЖЕ сделал это?! Ты настоящий мужчина!
	};
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_03");	//Давно уже не держал я подобного оружия в своих руках - с тех пор как был солдатом во время Войны с Орками.
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_04");	//Да уж, суровые то были времена, скажу я тебе.
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_05");	//Я знал, что из тебя получится хороший ученик. Отличная работа!
	}
	else if(PLAYER_ISAPPRENTICE == APP_NONE)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_06");	//Я не думал, что тебе удастся это. Я поражен.
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_07");	//Жаль, только, что ты выбрал другое ремесло.
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_08");	//Ты бы очень пригодился мне.
	};
	MIS_HARAD_ORC = LOG_SUCCESS;
	b_giveplayerxp(XP_HARAD_ORC);
	b_logentry(TOPIC_LEHRLING,"Гарад примет меня в ученики, если я смогу получить одобрение других мастеров.");
};


var int harad_startguild;

instance DIA_HARAD_LEHRLING(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_lehrling_condition;
	information = dia_harad_lehrling_info;
	permanent = TRUE;
	description = "Когда я могу стать твоим учеником?";
};


func int dia_harad_lehrling_condition()
{
	if(Npc_KnowsInfo(other,dia_harad_arbeit) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_harad_lehrling_info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Harad_LEHRLING_15_00");	//Когда я могу стать твоим учеником?
	if((MIS_HARAD_ORC == LOG_SUCCESS) || ((MIS_HAKONBANDITS == LOG_SUCCESS) && (HARAD_HAKONMISSION == TRUE)))
	{
		if(MIS_HARAD_ORC == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_01");	//Нам здесь совсем не помешал бы человек, способный прикончить орка.
			if(MIS_HAKONBANDITS == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_02");	//Кроме того, Хакон рассказал мне, как ты решил проблему с бандитами. Ты настоящий мужчина!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_03");	//Ты не убил орка, но Хакон рассказал мне, как ты решил проблему с бандитами. Это хорошо!
		};
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_04");	//Что касается моего мнения, то ты можешь приступать к работе хоть сейчас.
		stimmen = stimmen + 1;
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_05");	//А другие мастера ...
		if(thorben.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_THORBEN_GETBLESSINGS == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_06");	//Торбен дал тебе свое благословение.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_07");	//Старый добрый Торбен хочет, чтобы ты получил благословение богов. Я думаю, это хорошая идея.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_08");	//Торбен говорит, что никогда не видел тебя.
		};
		if(bosper.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_09");	//Боспер пытался оговорить меня от идеи взять тебя в ученики. Он хочет, чтобы ты стал ЕГО учеником.
			if((MIS_BOSPER_BOGEN == LOG_SUCCESS) || (MIS_BOSPER_WOLFFURS == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_10");	//Я имел краткий, но напряженный разговор с ним по этому вопросу.
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_11");	//В конце концов, он согласился.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_12");	//Он попросил меня, чтобы я дал тебе возможность хотя бы попробовать себя в его ремесле.
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_13");	//Попробуй - ты можешь принять решение чуть позже. Если, конечно, тебе нужен его голос.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_14");	//Боспер пока не знает, кто ты такой
		};
		if(constantino.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(b_getgreatestpetzcrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_15");	//Как всегда, Константино ничего не волнует. Он сказал, что с его точки зрения, ты можешь стать моим учеником в любой момент.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_16");	//Константино говорит, что ты обвиняешься в преступлении в городе - это правда?
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_17");	//Если это так, то тебе нужно уладить эту проблему как можно быстрее!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_18");	//Константино никогда не слышал о тебе.
		};
		if(matteo.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_MATTEO_GOLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_19");	//Маттео говорит, что ты вернул ему его золото. Мне кажется, ты благородный молодой человек.
				stimmen = stimmen + 1;
			}
			else if(MIS_MATTEO_GOLD == LOG_RUNNING)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_20");	//Маттео говорит, что ты ему что-то должен. Я не знаю, что у вас там за дела, но ты должен урегулировать эту проблему.
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_21");	//Маттео говорит, что никогда не говорил об этом с тобой.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_22");	//Маттео говорит, что никогда не видел тебя в своей лавке.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_23");	//Это означает, что ты получил одобрение всех мастеров!
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_24");	//Это означает, что ты получил одобрение четырех мастеров. Этого достаточно, чтобы быть принятым в ученики.
			};
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_25");	//Ты готов стать моим учеником?
			Info_ClearChoices(dia_harad_lehrling);
			Info_AddChoice(dia_harad_lehrling,"Хорошо - я подумаю над этим.",dia_harad_lehrling_later);
			Info_AddChoice(dia_harad_lehrling,"Я готов стать твоим учеником!",dia_harad_lehrling_ok);
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_26");	//Тебе нужно получить одобрение, по крайней мере, четырех  мастеров. Иначе ты не сможешь стать учеником в нижней части города.
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_27");	//Поэтому ты должен поговорить со всеми мастерами, которые еще не уверены в тебе.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_28");	//Не раньше, чем докажешь мне, что хоть на что-то годен.
	};
};

func void dia_harad_lehrling_ok()
{
	AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_00");	//Я готов!
	AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_01");	//Отлично! Я научу тебя ковать хорошие мечи.
	if(PLAYER_TALENT_SMITH[WEAPON_COMMON] == TRUE)
	{
		AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_02");	//Я уже умею это!
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_03");	//Что ж. Тем лучше!
	};
	if(other.attribute[ATR_STRENGTH] < 50)
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_04");	//Кроме того, пришло время стать немного сильнее. Ты чахнешь прямо у меня на глазах!
	};
	PLAYER_ISAPPRENTICE = APP_HARAD;
	HARAD_STARTGUILD = other.guild;
	HARAD_LEHRLING_DAY = Wld_GetDay();
	Wld_AssignRoomToGuild("schmied",GIL_NONE);
	MIS_APPRENTICE = LOG_SUCCESS;
	b_logentry(TOPIC_BONUS,"Гарад принял меня в ученики. Теперь я смогу попасть в верхний квартал.");
	b_logentry(TOPIC_BONUS,"Гарад будет покупать оружие, выкованное мной, по хорошей цене.");
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_giveplayerxp(XP_LEHRLING);
	b_logentry(TOPIC_CITYTEACHER,"Гарад может обучить меня кузнечному делу. Также он может помочь мне стать сильнее.");
	Info_ClearChoices(dia_harad_lehrling);
};

func void dia_harad_lehrling_later()
{
	AI_Output(other,self,"DIA_Harad_LEHRLING_Later_15_00");	//Хорошо - я подумаю над этим.
	if(!Npc_IsDead(brian))
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_Later_12_01");	//Как знаешь. Брайан все равно еще поработает здесь некоторое время.
	};
	Info_ClearChoices(dia_harad_lehrling);
};


instance DIA_HARAD_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_412_harad;
	nr = 2;
	condition = dia_harad_zustimmung_condition;
	information = dia_harad_zustimmung_info;
	permanent = TRUE;
	description = "Могу я стать учеником другого мастера?";
};


func int dia_harad_zustimmung_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_NONE) && Npc_KnowsInfo(other,dia_harad_arbeit))
	{
		return TRUE;
	};
};


var int dia_harad_zustimmung_permanent;

func void dia_harad_zustimmung_info()
{
	AI_Output(other,self,"DIA_Harad_Zustimmung_15_00");	//Могу я стать учеником другого мастера?
	if((MIS_HARAD_ORC == LOG_SUCCESS) || ((MIS_HAKONBANDITS == LOG_SUCCESS) && (HARAD_HAKONMISSION == TRUE)))
	{
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_01");	//Ты хороший человек.
		if(MIS_HAKONBANDITS == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Harad_Zustimmung_12_02");	//Хакон рассказал мне, как ты разделался с бандитами.
		};
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_03");	//Я дам тебе свое одобрение.
		if(DIA_HARAD_ZUSTIMMUNG_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_ZUSTIMMUNG);
			DIA_HARAD_ZUSTIMMUNG_PERMANENT = TRUE;
		};
		b_logentry(TOPIC_LEHRLING,"Гарад даст мне свое одобрение, если я захочу стать учеником другого мастера.");
		if(!Npc_IsDead(brian))
		{
			AI_Output(self,other,"DIA_Harad_Zustimmung_12_04");	//Брайан еще поработает здесь некоторое время. И я уверен, что рано или поздно найдется крепкий парень, способный заменить его.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_05");	//Другие мастера могут дать свое согласие на это. Но я дам сое одобрение только после того, как ты докажешь, что хоть на что-то годен!
	};
};


var int harad_milkommentar;
var int harad_palkommentar;
var int harad_innoskommentar;

instance DIA_HARAD_ALSLEHRLING(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_alslehrling_condition;
	information = dia_harad_alslehrling_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_harad_alslehrling_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_HARAD) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_harad_alslehrling_info()
{
	if((other.guild == GIL_MIL) && (HARAD_STARTGUILD != GIL_MIL) && (HARAD_MILKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_00");	//Ты теперь служишь в ополчении? Я горжусь тобой!
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_01");	//Пока ты служишь в армии, естественно я не могу рассчитывать, что ты будешь выполнять еще и свои обязанности ученика.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_02");	//Но если тебе что-нибудь понадобится, можешь заходить ко мне, когда захочешь.
		HARAD_MILKOMMENTAR = TRUE;
	}
	else if((other.guild == GIL_PAL) && (HARAD_STARTGUILD != GIL_PAL) && (HARAD_PALKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_03");	//Тебе удалось стать паладином!
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_04");	//Я рад, что когда-то взял тебя в ученики. Даже хотя ты и не проводил много времени за наковальней.
		HARAD_PALKOMMENTAR = TRUE;
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (HARAD_STARTGUILD != GIL_NOV) && (HARAD_STARTGUILD != GIL_KDF) && (HARAD_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_05");	//Так ты постригся в монастырь. Я бы предпочел, чтобы ты оставался в городе. Нам нужны сильные люди.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_06");	//Но если ты решил следовать пути Инноса, то так тому и быть.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_07");	//Если тебе будет что-нибудь нужно от меня, я всегда буду рад помочь.
		HARAD_INNOSKOMMENTAR = TRUE;
	}
	else if((HARAD_LEHRLING_DAY <= (Wld_GetDay() - 4)) && (HARAD_MILKOMMENTAR == FALSE) && (HARAD_PALKOMMENTAR == FALSE) && (HARAD_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_08");	//Давненько тебя не было видно здесь. Где ты был все это время, хм?
		HARAD_LEHRLING_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_09");	//Опять ты ...
		HARAD_LEHRLING_DAY = Wld_GetDay();
	};
};


instance DIA_HARAD_WAFFEN(C_INFO)
{
	npc = vlk_412_harad;
	nr = 3;
	condition = dia_harad_waffen_condition;
	information = dia_harad_waffen_info;
	permanent = FALSE;
	description = "Ты продаешь оружие?";
};


func int dia_harad_waffen_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_harad_waffen_info()
{
	AI_Output(other,self,"DIA_Harad_Waffen_15_00");	//Ты продаешь оружие?
	AI_Output(self,other,"DIA_Harad_Waffen_12_01");	//Забудь об этом. Все, что я делаю, уходит паладинам или ополчению.
	AI_Output(self,other,"DIA_Harad_Add_12_00");	//У меня заказ на 100 мечей от лорда Хагена. Он хочет вооружить городскую стражу.
};


instance DIA_HARAD_AUFGABEN(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_aufgaben_condition;
	information = dia_harad_aufgaben_info;
	permanent = FALSE;
	description = "Что должен делать ученик?";
};


func int dia_harad_aufgaben_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		return TRUE;
	};
};

func void dia_harad_aufgaben_info()
{
	AI_Output(other,self,"DIA_Harad_Aufgaben_15_00");	//Что должен делать ученик?
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_01");	//Три вещи. Попробуй угадать.
	AI_Output(other,self,"DIA_Harad_Aufgaben_15_02");	//Ковать, ковать и ковать?
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_03");	//Ты не так уж бестолков, как кажешься. Я плачу за каждый меч. Если ты не работаешь, то и денег не получаешь. Это просто.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_05");	//Кроме того, я научу тебя всему, что нужно знать для изготовления обычных мечей.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_06");	//Изготовление магических мечей - работа для опытного кузнеца. Тебе до этого еще далеко ...
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_07");	//Если тебе нужно место для сна, ты можешь прилечь где-нибудь в моем доме. Все понятно?
};


instance DIA_HARAD_SELLBLADES(C_INFO)
{
	npc = vlk_412_harad;
	nr = 200;
	condition = dia_harad_sellblades_condition;
	information = dia_harad_sellblades_info;
	permanent = TRUE;
	description = "Я хочу продать оружие, выкованное мной.";
};


func int dia_harad_sellblades_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		return TRUE;
	};
};

func void dia_harad_sellblades_info()
{
	var int anzahl;
	var C_ITEM equipweap;
	AI_Output(other,self,"DIA_Harad_SellBlades_15_00");	//Я хочу продать оружие, выкованное мной.
	anzahl = Npc_HasItems(other,itmw_1h_common_01);
	equipweap = Npc_GetEquippedMeleeWeapon(other);
	if(Hlp_IsItem(equipweap,itmw_1h_common_01) == TRUE)
	{
		anzahl = anzahl - 1;
		if(anzahl == 0)
		{
			AI_Output(self,other,"DIA_Harad_SellBlades_12_01");	//Все, что у тебя есть - это меч, висящий на поясе. Ты лучше оставь его себе.
			return;
		};
	};
	if(anzahl >= 1)
	{
		AI_Output(self,other,"DIA_Harad_SellBlades_12_02");	//Хорошо - давай сюда.
		b_giveinvitems(other,self,itmw_1h_common_01,anzahl);
		AI_Output(self,other,"DIA_Harad_SellBlades_12_03");	//Отлично. Держи, что заработал.
		b_giveinvitems(self,other,itmi_gold,VALUE_COMMON1 * anzahl);
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_SellBlades_12_04");	//Тогда сделай его! Я принимаю только обычные мечи.
	};
};


instance DIA_HARAD_TEACHCOMMON(C_INFO)
{
	npc = vlk_412_harad;
	nr = 50;
	condition = dia_harad_teachcommon_condition;
	information = dia_harad_teachcommon_info;
	permanent = TRUE;
	description = b_buildlearnstring("Научи меня ковать хорошие мечи!",b_getlearncosttalent(other,NPC_TALENT_SMITH));
};


func int dia_harad_teachcommon_condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE) && (PLAYER_ISAPPRENTICE == APP_HARAD))
	{
		return TRUE;
	};
};

func void dia_harad_teachcommon_info()
{
	AI_Output(other,self,"DIA_Harad_TeachCommon_15_00");	//Научи меня ковать хорошие мечи!
	if(b_teachplayertalentsmith(self,other,WEAPON_COMMON))
	{
		AI_Output(self,other,"DIA_Harad_TeachCommon_12_01");	//Это довольно просто, парень. Берешь кусок сырой стали, и держишь его над огнем, пока он не раскалится.
		AI_Output(self,other,"DIA_Harad_TeachCommon_12_02");	//Потом придаешь клинку форму на наковальне.
		AI_Output(self,other,"DIA_Harad_TeachCommon_12_03");	//Твой первый меч конечно не станет произведением искусства, но всему остальному ты научишься чуть позже.
	};
};


var int harad_merke_str;

instance DIA_HARAD_TEACHSTR(C_INFO)
{
	npc = vlk_412_harad;
	nr = 100;
	condition = dia_harad_teachstr_condition;
	information = dia_harad_teachstr_info;
	permanent = 1;
	description = "Я хочу стать сильнее!";
};


func int dia_harad_teachstr_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		return TRUE;
	};
};

func void dia_harad_teachstr_info()
{
	AI_Output(other,self,"DIA_Harad_TeachSTR_15_00");	//Я хочу стать сильнее!
	HARAD_MERKE_STR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(dia_harad_teachstr);
	Info_AddChoice(dia_harad_teachstr,DIALOG_BACK,dia_harad_teachstr_back);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_harad_teachstr_1);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_harad_teachstr_5);
};

func void dia_harad_teachstr_back()
{
	if(HARAD_MERKE_STR < other.attribute[ATR_STRENGTH])
	{
		AI_Output(self,other,"DIA_Harad_TeachSTR_BACK_12_01");	//Ты уже нарастил немного мускулов.
	};
	if(other.attribute[ATR_STRENGTH] < 50)
	{
		AI_Output(self,other,"DIA_Harad_TeachSTR_BACK_12_02");	//Возвращайся, если хочешь поучиться еще.
	};
	Info_ClearChoices(dia_harad_teachstr);
};

func void dia_harad_teachstr_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,50);
	Info_ClearChoices(dia_harad_teachstr);
	Info_AddChoice(dia_harad_teachstr,DIALOG_BACK,dia_harad_teachstr_back);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_harad_teachstr_1);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_harad_teachstr_5);
};

func void dia_harad_teachstr_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,50);
	Info_ClearChoices(dia_harad_teachstr);
	Info_AddChoice(dia_harad_teachstr,DIALOG_BACK,dia_harad_teachstr_back);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_harad_teachstr_1);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_harad_teachstr_5);
};


instance DIA_HARAD_IMMERNOCH(C_INFO)
{
	npc = vlk_412_harad;
	nr = 3;
	condition = dia_harad_immernoch_condition;
	information = dia_harad_immernoch_info;
	permanent = FALSE;
	description = "Ты все еще работаешь на паладинов?";
};


func int dia_harad_immernoch_condition()
{
	if(KAPITEL >= 2)
	{
		return TRUE;
	};
};

func void dia_harad_immernoch_info()
{
	AI_Output(other,self,"DIA_Harad_Add_15_01");	//Ты все еще работаешь на паладинов?
	AI_Output(self,other,"DIA_Harad_Add_12_02");	//Я закончил заказ лорда Хагена.
	AI_Output(self,other,"DIA_Harad_Add_12_03");	//Теперь я делаю доля него мечи из магической руды - но на этот раз за плату.
	AI_Output(self,other,"DIA_Harad_Add_12_04");	//Но теперь у меня также есть время, чтобы делать оружие для торговцев на рыночной площади.
	AI_Output(self,other,"DIA_Harad_Add_12_05");	//Так что если ты ищешь хороший меч, обратись к ним.
};


instance DIA_HARAD_ABOUTERZKLINGEN(C_INFO)
{
	npc = vlk_412_harad;
	nr = 3;
	condition = dia_harad_abouterzklingen_condition;
	information = dia_harad_abouterzklingen_info;
	permanent = FALSE;
	description = "Расскажи мне о мечах из магической руды!";
};


func int dia_harad_abouterzklingen_condition()
{
	if(Npc_KnowsInfo(other,dia_harad_immernoch))
	{
		return TRUE;
	};
};

func void dia_harad_abouterzklingen_info()
{
	AI_Output(other,self,"DIA_Harad_Add_15_06");	//Расскажи мне о мечах из магической руды!
	AI_Output(self,other,"DIA_Harad_Waffen_12_02");	//Создание магического меча - очень сложный и дорогой процесс, но в результате получается очень удобный и практически не тупящийся меч.
	AI_Output(self,other,"DIA_Harad_Waffen_12_03");	//Это очень хороший меч, но все его достоинства раскрываются только в руках паладина.
	AI_Output(self,other,"DIA_Harad_Waffen_12_04");	//Меч паладина освящается самим Инносом. В результате, он становится зачарованным оружием, наносящим огромный урон врагу!
};


instance DIA_HARAD_ERZKLINGEN(C_INFO)
{
	npc = vlk_412_harad;
	nr = 3;
	condition = dia_harad_erzklingen_condition;
	information = dia_harad_erzklingen_info;
	permanent = TRUE;
	description = "Я хочу купить меч из магической руды.";
};


func int dia_harad_erzklingen_condition()
{
	if((OREBLADEBOUGHT == FALSE) && Npc_KnowsInfo(other,dia_harad_abouterzklingen))
	{
		return TRUE;
	};
};


var int orebladebought;

func void dia_harad_erzklingen_info()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_15_00");	//Я хочу купить меч из магической руды.
	if(hero.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_01");	//Я подаю магические мечи только паладинам. И только по одному в одни руки.
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_02");	//Вы, паладины, можете считать себя счастливчиками, что вам дозволено владеть такими превосходными мечами.
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_03");	//Согласно декрету лорда Хагена, я могу продать тебе только одно магическое оружие.
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_04");	//Так, что я могу предложить тебе?
		Info_ClearChoices(dia_harad_erzklingen);
		Info_AddChoice(dia_harad_erzklingen,DIALOG_BACK,dia_harad_erzklingen_back);
		Info_AddChoice(dia_harad_erzklingen,"Двуручный меч (2000 золота)",dia_harad_erzklingen_2h);
		Info_AddChoice(dia_harad_erzklingen,"Одноручный меч (2000 золота)",dia_harad_erzklingen_1h);
	};
};

func void dia_harad_erzklingen_back()
{
	Info_ClearChoices(dia_harad_erzklingen);
};

func void b_harad_notenoughgold()
{
	AI_Output(self,other,"B_Harad_NotEnoughGold_12_00");	//У тебя недостаточно золота.
};

func void b_harad_havefunwithyoursword()
{
	AI_Output(self,other,"B_Harad_HaveGunWithYourSword_12_00");	//Береги свое новое оружие. Оно стоит целое состояние.
	OREBLADEBOUGHT = TRUE;
	Info_ClearChoices(dia_harad_erzklingen);
};

func void dia_harad_erzklingen_2h()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_2h_15_00");	//Я возьму двуручный меч!
	if(Npc_HasItems(other,itmi_gold) >= VALUE_BLESSED_2H_1)
	{
		b_giveinvitems(other,self,itmi_gold,VALUE_BLESSED_2H_1);
		CreateInvItems(self,itmw_2h_blessed_01,1);
		b_giveinvitems(self,other,itmw_2h_blessed_01,1);
		b_harad_havefunwithyoursword();
	}
	else
	{
		b_harad_notenoughgold();
		Info_ClearChoices(dia_harad_erzklingen);
		Info_AddChoice(dia_harad_erzklingen,DIALOG_BACK,dia_harad_erzklingen_back);
		Info_AddChoice(dia_harad_erzklingen,"Двуручный меч (2000 золота)",dia_harad_erzklingen_2h);
		Info_AddChoice(dia_harad_erzklingen,"Одноручный меч (2000 золота)",dia_harad_erzklingen_1h);
	};
};

func void dia_harad_erzklingen_1h()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_1h_15_00");	//Я возьму одноручный меч!
	if(Npc_HasItems(other,itmi_gold) >= VALUE_BLESSED_1H_1)
	{
		b_giveinvitems(other,self,itmi_gold,VALUE_BLESSED_1H_1);
		CreateInvItems(self,itmw_1h_blessed_01,1);
		b_giveinvitems(self,other,itmw_1h_blessed_01,1);
		b_harad_havefunwithyoursword();
	}
	else
	{
		b_harad_notenoughgold();
		Info_ClearChoices(dia_harad_erzklingen);
		Info_AddChoice(dia_harad_erzklingen,DIALOG_BACK,dia_harad_erzklingen_back);
		Info_AddChoice(dia_harad_erzklingen,"Двуручный меч (2000 золота)",dia_harad_erzklingen_2h);
		Info_AddChoice(dia_harad_erzklingen,"Одноручный меч (2000 золота)",dia_harad_erzklingen_1h);
	};
};


instance DIA_HARAD_REPAIRNECKLACE(C_INFO)
{
	npc = vlk_412_harad;
	nr = 8;
	condition = dia_harad_repairnecklace_condition;
	information = dia_harad_repairnecklace_info;
	permanent = FALSE;
	description = "Ты можешь ремонтировать ювелирные изделия?";
};


func int dia_harad_repairnecklace_condition()
{
	if((MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)))
	{
		return TRUE;
	};
};

func void dia_harad_repairnecklace_info()
{
	AI_Output(other,self,"DIA_Harad_RepairNecklace_15_00");	//Ты можешь синить драгоценности?
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_01");	//Я оружейник, а не ювелир. Пожалуй, здесь в городе ты не найдешь никого, кто мог бы помочь тебе.
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_02");	//Сейчас мало у кого водятся деньги, и давно уже никому не удавалось разбогатеть здесь.
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_03");	//Большинство радо хотя бы тому, что им хватает на хлеб.
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
};


instance DIA_HARAD_GOLDSMITH(C_INFO)
{
	npc = vlk_412_harad;
	nr = 8;
	condition = dia_harad_goldsmith_condition;
	information = dia_harad_goldsmith_info;
	permanent = FALSE;
	description = "Где мне найти ювелира?";
};


func int dia_harad_goldsmith_condition()
{
	if(Npc_KnowsInfo(other,dia_harad_repairnecklace))
	{
		return TRUE;
	};
};

func void dia_harad_goldsmith_info()
{
	AI_Output(other,self,"DIA_Harad_Goldsmith_15_00");	//Где мне найти ювелира?
	AI_Output(self,other,"DIA_Harad_Goldsmith_12_01");	//Я слышал, что у наемников на ферме Онара есть хороший кузнец.
	AI_Output(self,other,"DIA_Harad_Goldsmith_12_02");	//Может, тебе стоит поспрашивать там.
};


instance DIA_HARAD_PICKPOCKET(C_INFO)
{
	npc = vlk_412_harad;
	nr = 900;
	condition = dia_harad_pickpocket_condition;
	information = dia_harad_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_harad_pickpocket_condition()
{
	return c_beklauen(14,35);
};

func void dia_harad_pickpocket_info()
{
	Info_ClearChoices(dia_harad_pickpocket);
	Info_AddChoice(dia_harad_pickpocket,DIALOG_BACK,dia_harad_pickpocket_back);
	Info_AddChoice(dia_harad_pickpocket,DIALOG_PICKPOCKET,dia_harad_pickpocket_doit);
};

func void dia_harad_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_harad_pickpocket);
};

func void dia_harad_pickpocket_back()
{
	Info_ClearChoices(dia_harad_pickpocket);
};

