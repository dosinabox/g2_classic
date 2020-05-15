
var int lothar_imov;

instance DIA_LOTHAR_EXIT(C_INFO)
{
	npc = pal_203_lothar;
	nr = 999;
	condition = dia_lothar_exit_condition;
	information = dia_lothar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lothar_exit_condition()
{
	if(LOTHAR_IMOV == TRUE)
	{
		return TRUE;
	};
};

func void dia_lothar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOTHAR_FIRSTEXIT(C_INFO)
{
	npc = pal_203_lothar;
	nr = 999;
	condition = dia_lothar_firstexit_condition;
	information = dia_lothar_firstexit_info;
	permanent = TRUE;
	description = "Мне нужно идти! (КОНЕЦ)";
};


func int dia_lothar_firstexit_condition()
{
	if(LOTHAR_IMOV == FALSE)
	{
		return TRUE;
	};
};

func void dia_lothar_firstexit_info()
{
	AI_Output(other,self,"DIA_Lothar_FirstEXIT_15_00");	//Я должен идти!
	if(LOTHAR_REGELN == FALSE)
	{
		AI_Output(self,other,"DIA_Lothar_FirstEXIT_01_01");	//Подожди! Ты даже не знаешь новых законов города!
		AI_Output(other,self,"DIA_Lothar_FirstEXIT_15_02");	//Позже.
	}
	else
	{
		if((PLAYER_TALKEDABOUTDRAGONS == TRUE) && ((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF)))
		{
			AI_Output(self,other,"DIA_Lothar_FirstEXIT_01_03");	//Если я еще хоть раз услышу, что ты рассказываешь людям о драконах, у тебя будут большие проблемы, тебе все ясно?
		}
		else
		{
			AI_Output(self,other,"DIA_Lothar_FirstEXIT_01_04");	//Пока ты находишься в Хоринисе, ты можешь чувствовать себя в безопасности.
			if(hero.guild != GIL_PAL)
			{
				AI_Output(self,other,"DIA_Lothar_FirstEXIT_01_05");	//Город теперь охраняют паладины короля!
			};
		};
		LOTHAR_IMOV = TRUE;
		Npc_ExchangeRoutine(self,"START");
	};
	if(CANTHAR_INSTADT == FALSE)
	{
		Npc_ExchangeRoutine(canthar,"START");
		CANTHAR_INSTADT = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_LOTHAR_HALLO(C_INFO)
{
	npc = pal_203_lothar;
	nr = 1;
	condition = dia_lothar_hallo_condition;
	information = dia_lothar_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lothar_hallo_condition()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_lothar_hallo_info()
{
	AI_Output(self,other,"DIA_Lothar_Hallo_01_00");	//Стой, чужеземец!
	if((MIL_310_SCHONMALREINGELASSEN == FALSE) && (MIL_333_SCHONMALREINGELASSEN == FALSE) && ((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF)))
	{
		AI_Output(self,other,"DIA_Lothar_Hallo_01_01");	//Я не видел, чтобы ты проходил через эти ворота.
		AI_Output(other,self,"DIA_Lothar_Hallo_15_02");	//И?
		AI_Output(self,other,"DIA_Lothar_Hallo_01_03");	//А стража у других ворот получила приказ не пропускать неизвестных лиц в город.
		AI_Output(other,self,"DIA_Lothar_Hallo_15_04");	//Нуууу...
		AI_Output(self,other,"DIA_Lothar_Hallo_01_05");	//Придется серьезно поговорить с ними обоими!
		AI_Output(self,other,"DIA_Lothar_Hallo_01_06");	//Теперь, что касается нас:
	};
	AI_Output(self,other,"DIA_Lothar_Hallo_01_07");	//Я Лотар. Паладин короля и преданный слуга Инноса.
	AI_Output(self,other,"DIA_Lothar_Hallo_01_08");	//Наш командующий, лорд Хаген, вверил мне задачу объяснять всем новоприбывшим новые законы, которым должны подчиняться все жители этого города.
	if(Npc_KnowsInfo(other,dia_lester_send_xardas))
	{
		b_startotherroutine(lester,"XARDAS");
	};
};


instance DIA_LOTHAR_MESSAGE(C_INFO)
{
	npc = pal_203_lothar;
	nr = 1;
	condition = dia_lothar_message_condition;
	information = dia_lothar_message_info;
	permanent = FALSE;
	description = "У меня важное сообщение для предводителя паладинов!";
};


func int dia_lothar_message_condition()
{
	if((MIL_305_SCHONMALREINGELASSEN == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lothar_message_info()
{
	AI_Output(other,self,"DIA_Lothar_MESSAGE_15_00");	//У меня важное сообщение для предводителя паладинов!
	AI_Output(self,other,"DIA_Lothar_MESSAGE_01_01");	//Достопочтенный лорд Хаген никого не принимает.
	AI_Output(self,other,"DIA_Lothar_MESSAGE_01_02");	//За все вопросы, касающиеся простого народа, отвечает лорд Андрэ, командир городской стражи.
};


instance DIA_LOTHAR_EYEINNOS(C_INFO)
{
	npc = pal_203_lothar;
	nr = 2;
	condition = dia_lothar_eyeinnos_condition;
	information = dia_lothar_eyeinnos_info;
	permanent = FALSE;
	description = "Я пришел, чтобы получить Глаз Инноса!";
};


func int dia_lothar_eyeinnos_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_message) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lothar_eyeinnos_info()
{
	AI_Output(other,self,"DIA_Lothar_EyeInnos_15_00");	//Я пришел, чтобы получить Глаз Инноса!
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_01");	//Вопрос о Глазе должен решать лорд Хаген. Поговори с ним об этом.
	}
	else
	{
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_02");	//Священный Глаз Инноса! Откуда ты знаешь о нем?! Ты не принадлежишь к нашему ордену!
		AI_Output(other,self,"DIA_Lothar_EyeInnos_15_03");	//Мне сказал о нем маг.
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_04");	//Я не знаю, какими мотивами он руководствовался, когда доверил один из секретов нашего ордена тебе...
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_05");	//Но он, наверняка, не имел в виду, что ТЫ можешь коснуться его своими руками.
		AI_Output(other,self,"DIA_Lothar_EyeInnos_15_06");	//Но...
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_07");	//Я ничего об этом даже слышать не хочу!
		if(PLAYER_TALKEDABOUTDRAGONS == TRUE)
		{
			AI_Output(self,other,"DIA_Lothar_EyeInnos_01_08");	//Сначала ты нес всякую чушь о драконах, и теперь - вот это. Невероятно!
		};
	};
};


instance DIA_LOTHAR_DRAGONS(C_INFO)
{
	npc = pal_203_lothar;
	nr = 1;
	condition = dia_lothar_dragons_condition;
	information = dia_lothar_dragons_info;
	permanent = FALSE;
	description = "Послушай - этому городу угрожают драконы!";
};


func int dia_lothar_dragons_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_message) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lothar_dragons_info()
{
	AI_Output(other,self,"DIA_Lothar_Dragons_15_00");	//Послушай - этому городу угрожают драконы!
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lothar_Dragons_01_01");	//Это не может быть правдой!
		AI_Output(self,other,"DIA_Lothar_Dragons_01_02");	//Еще один сумасшедший!
		AI_Output(self,other,"DIA_Lothar_Dragons_01_03");	//В городе и без этого полно проблем. Не хватает только еще идиота, пугающего людей баснями о драконах!
		AI_Output(self,other,"DIA_Lothar_Dragons_01_04");	//Я немедля посадил в тюрьму последнего, кто рассказывал здесь сказки о драконах, и отправил его тюремным транспортом в Долину Рудников. Так что придержи свой язык!
		AI_Output(self,other,"DIA_Lothar_Dragons_01_05");	//Мы не можем позволить, чтобы кто-либо здесь сеял панику среди людей!
	}
	else
	{
		AI_Output(self,other,"DIA_Lothar_Dragons_01_06");	//Я часто слышу об этом. Но в это трудно поверить.
		AI_Output(self,other,"DIA_Lothar_Dragons_01_07");	//Будет лучше, если ты оставишь эти мысли при себе. Мы должны всеми силами избегать паники среди людей.
	};
	PLAYER_TALKEDABOUTDRAGONS = TRUE;
};


instance DIA_LOTHAR_WHODRAGONS(C_INFO)
{
	npc = pal_203_lothar;
	nr = 1;
	condition = dia_lothar_whodragons_condition;
	information = dia_lothar_whodragons_info;
	permanent = FALSE;
	description = "Кто-то уже докладывал о драконах?";
};


func int dia_lothar_whodragons_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_dragons) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lothar_whodragons_info()
{
	AI_Output(other,self,"DIA_Lothar_WhoDragons_15_00");	//Кто-то уже докладывал о драконах?
	AI_Output(self,other,"DIA_Lothar_WhoDragons_01_01");	//Да. Парень по имени Диего. Если я не ошибаюсь.
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lothar_WhoDragons_01_02");	//(угрожающе) Я предупреждал его - как и тебя! Но этот безумец не переставал действовать мне на нервы!
	};
};


instance DIA_LOTHAR_REGELN(C_INFO)
{
	npc = pal_203_lothar;
	nr = 3;
	condition = dia_lothar_regeln_condition;
	information = dia_lothar_regeln_info;
	permanent = FALSE;
	description = "Хорошо - объясни мне законы этого города!";
};


func int dia_lothar_regeln_condition()
{
	return TRUE;
};

func void dia_lothar_regeln_info()
{
	AI_Output(other,self,"DIA_Lothar_Regeln_15_00");	//(легкий вздох) Хорошо - объясни мне законы этого города!
	AI_Output(self,other,"DIA_Lothar_Regeln_01_01");	//Во-первых, достопочтенный паладин лорд Хаген расквартирован в верхнем квартале, вместе со своими войсками.
	AI_Output(self,other,"DIA_Lothar_Regeln_01_02");	//Вот почему доступ в верхнюю часть города разрешен только уважаемым горожанам.
	AI_Output(self,other,"DIA_Lothar_Add_01_04");	//Во-вторых, городская ратуша, находящаяся в верхнем квартале, в настоящее время является командным пунктом паладинов. Доступ туда имеют только сами паладины и члены ополчения.
	AI_Output(self,other,"DIA_Lothar_Add_01_05");	//И в третьих, тот, кто обвиняется в преступлении, должен предстать перед командиром ополчения.
	AI_Output(self,other,"DIA_Lothar_Regeln_01_05");	//Есть вопросы?
	LOTHAR_REGELN = TRUE;
};


instance DIA_LOTHAR_HOWCITIZEN(C_INFO)
{
	npc = pal_203_lothar;
	nr = 4;
	condition = dia_lothar_howcitizen_condition;
	information = dia_lothar_howcitizen_info;
	permanent = FALSE;
	description = "Как я могу стать гражданином этого города?";
};


func int dia_lothar_howcitizen_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_regeln) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lothar_howcitizen_info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_06");	//Как я могу стать гражданином этого города?
	AI_Output(self,other,"DIA_Lothar_Add_01_07");	//Гражданином города может считаться только тот, кто имеет постоянную работу!
	AI_Output(self,other,"DIA_Lothar_Add_01_09");	//Но не думай, что ты сможешь предстать перед лордом Хагеном только потому, что ты являешься гражданином!
	AI_Output(self,other,"DIA_Lothar_Add_01_10");	//Как гражданин, ты получишь доступ в верхнюю часть города - и не более того!
	AI_Output(self,other,"DIA_Lothar_Add_01_11");	//Только будучи членом ополчения, ты сможешь получить доступ в ратушу!
};


instance DIA_LOTHAR_WOARBEIT(C_INFO)
{
	npc = pal_203_lothar;
	nr = 5;
	condition = dia_lothar_woarbeit_condition;
	information = dia_lothar_woarbeit_info;
	permanent = FALSE;
	description = "Где я могу найти работу?";
};


func int dia_lothar_woarbeit_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_howcitizen) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lothar_woarbeit_info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_14");	//Где я могу найти работу?
	AI_Output(self,other,"DIA_Lothar_Add_01_15");	//Тебе придется стать учеником одного из мастеров в нижней части города.
	AI_Output(self,other,"DIA_Lothar_Add_01_16");	//Как только мастер примет тебя на работу, ты станешь гражданином этого города.
	AI_Output(self,other,"DIA_Lothar_Add_01_17");	//Однако другие мастера должны согласиться с этим, таковы обычаи Хориниса.
	AI_Output(self,other,"DIA_Lothar_Add_01_18");	//Если ты думал найти работу в портовом квартале, забудь об этом!
	AI_Output(self,other,"DIA_Lothar_Add_01_19");	//Там живут отбросы общества. Даже не суй туда свой нос, ты пожалеешь об этом!
};


instance DIA_LOTHAR_TOOV(C_INFO)
{
	npc = pal_203_lothar;
	nr = 6;
	condition = dia_lothar_toov_condition;
	information = dia_lothar_toov_info;
	permanent = FALSE;
	description = "Как мне попасть в верхний квартал?";
};


func int dia_lothar_toov_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_regeln) && (MIL_305_SCHONMALREINGELASSEN == FALSE) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lothar_toov_info()
{
	AI_Output(other,self,"DIA_Lothar_ToOV_15_00");	//Как мне попасть в верхний квартал?
	AI_Output(self,other,"DIA_Lothar_ToOV_01_01");	//Скажи, ты меня вообще слушаешь?!
	AI_Output(self,other,"DIA_Lothar_ToOV_01_02");	//Ты не являешься гражданином этого города. Ты можешь даже не пытаться - стража все равно тебя не пустит.
	AI_Output(self,other,"DIA_Lothar_ToOV_01_03");	//Все, что находится за внутренними вратами, для тебя является запретной зоной!
};


instance DIA_LOTHAR_TOMILIZ(C_INFO)
{
	npc = pal_203_lothar;
	nr = 7;
	condition = dia_lothar_tomiliz_condition;
	information = dia_lothar_tomiliz_info;
	permanent = FALSE;
	description = "Как я могу поступить на службу в ополчение?";
};


func int dia_lothar_tomiliz_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_regeln) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lothar_tomiliz_info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_26");	//Как я могу поступить на службу в ополчение?
	if(PLAYER_ISAPPRENTICE == APP_NONE)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_27");	//По прямому указанию лорда Хагена, на службу в ополчение принимаются только граждане города.
		AI_Output(other,self,"DIA_Lothar_Add_15_28");	//Понимаю.
	};
	AI_Output(self,other,"DIA_Lothar_Add_01_29");	//Если ты хочешь узнать больше, поговори с лордом Андрэ в казармах.
};


instance DIA_LOTHAR_TOPALADINS(C_INFO)
{
	npc = pal_203_lothar;
	nr = 7;
	condition = dia_lothar_topaladins_condition;
	information = dia_lothar_topaladins_info;
	permanent = FALSE;
	description = "Что мне нужно сделать, чтобы получить доспехи как у тебя?";
};


func int dia_lothar_topaladins_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_tomiliz) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_lothar_topaladins_info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_30");	//Что мне нужно сделать, чтобы получить доспехи как у тебя?
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_31");	//(напыщенно) Что? Ты даже не являешься членом ополчения!
	};
	if(PLAYER_ISAPPRENTICE == APP_NONE)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_32");	//Ты даже не ГРАЖДАНИН!
	};
	AI_Output(self,other,"DIA_Lothar_Add_01_33");	//Как ты даже думать смеешь о том, чтобы носить доспехи ПАЛАДИНА?
	AI_Output(self,other,"DIA_Lothar_Add_01_34");	//Только немногим из солдат ополчения, успешно выполнившим необычайно важные задания, была дарована такая честь.
	AI_Output(self,other,"DIA_Lothar_Add_01_35");	//(сурово) Если ты хочешь стать паладином, впереди тебя ждет очень долгий и тернистый путь, мой мальчик!
};


instance DIA_LOTHAR_WOANDRE(C_INFO)
{
	npc = pal_203_lothar;
	nr = 8;
	condition = dia_lothar_woandre_condition;
	information = dia_lothar_woandre_info;
	permanent = FALSE;
	description = "Где мне найти командира городской стражи?";
};


func int dia_lothar_woandre_condition()
{
	if((Npc_KnowsInfo(other,dia_lothar_regeln) || Npc_KnowsInfo(other,dia_lothar_message)) && (andre.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lothar_woandre_info()
{
	AI_Output(other,self,"DIA_Lothar_WoAndre_15_00");	//Где мне найти командира городской стражи?
	AI_Output(self,other,"DIA_Lothar_WoAndre_01_01");	//Лорда Андрэ можно найти в казармах в противоположном конце города.
};


instance DIA_LOTHAR_SCHLAFEN(C_INFO)
{
	npc = pal_203_lothar;
	nr = 9;
	condition = dia_lothar_schlafen_condition;
	information = dia_lothar_schlafen_info;
	permanent = FALSE;
	description = "Где я могу провести ночь?";
};


func int dia_lothar_schlafen_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_lothar_schlafen_info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_22");	//Где я могу провести ночь?
	AI_Output(self,other,"DIA_Lothar_Add_01_23");	//Если ты ищешь место для ночлега, иди в отель, находящийся перед казармами.
	AI_Output(self,other,"DIA_Lothar_Add_01_24");	//Паладины платят за ночлег всех путников, которые заходят в этот город.
	AI_Output(self,other,"DIA_Lothar_Add_01_25");	//Странствующие торговцы с рыночной площади также ночуют там.
};


instance DIA_LOTHAR_PERMB4OV(C_INFO)
{
	npc = pal_203_lothar;
	nr = 3;
	condition = dia_lothar_permb4ov_condition;
	information = dia_lothar_permb4ov_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_lothar_permb4ov_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIL_305_SCHONMALREINGELASSEN == FALSE) && (LOTHAR_REGELN == TRUE))
	{
		return TRUE;
	};
};

func void dia_lothar_permb4ov_info()
{
	AI_Output(self,other,"DIA_Lothar_PermB4OV_01_00");	//Обо всем остальном ты можешь поговорить с лордом Андрэ!
	AI_StopProcessInfos(self);
};

func void b_lothar_blubb()
{
	/*AI_Output(other,self,"DIA_Lothar_Add_15_00");	//Но я ДОЛЖЕН увидеться с лордом Хагеном!
	AI_Output(self,other,"DIA_Lothar_Add_01_45");	//Как я понимаю, он принял тебя в ряды ополчения.
	AI_Output(self,other,"DIA_Lothar_Add_01_46");	//Хмм... Надеюсь, он знает, что делает.
	AI_Output(other,self,"DIA_Lothar_Add_15_20");	//Сколько мастеров работает в городе?
	AI_Output(self,other,"DIA_Lothar_Add_01_21");	//Насколько я знаю, всего их пять.
	AI_Output(self,other,"DIA_Lothar_Add_01_62");	//Скажи мне, разве я говорил недостаточно внятно? Хватит разговоров о драконах!
	AI_Output(other,self,"DIA_Lothar_Add_15_63");	//Откуда тебе знать?..
	AI_Output(self,other,"DIA_Lothar_Add_01_64");	//Это НЕ ТВОЕ дело!
	AI_Output(self,other,"DIA_Lothar_Add_01_65");	//Это было последний раз, понятно?!
	AI_Output(other,self,"DIA_Lothar_Add_15_66");	//Где мне найти командира ополчения?
	AI_Output(other,self,"DIA_Lothar_Add_15_08");	//Теперь я ученик одного из мастеров!
	AI_Output(self,other,"DIA_Lothar_Add_01_47");	//Опять ты.
	AI_Output(self,other,"DIA_Lothar_Add_01_43");	//Как я слышал, ты разговаривал с лордом Андрэ?
	AI_Output(self,other,"DIA_Lothar_Add_01_44");	//Я говорил тебе, что ты можешь присоединиться к ополчению, только если станешь гражданином города.
	AI_Output(self,other,"DIA_Lothar_Add_01_48");	//Я доложил лорду Хагену, что ты желаешь поговорить с ним...
	AI_Output(other,self,"DIA_Lothar_Add_15_49");	//И? Что он сказал?
	AI_Output(self,other,"DIA_Lothar_Add_01_50");	//Он никогда не слышал о тебе.
	AI_Output(other,self,"DIA_Lothar_Add_15_51");	//Конечно нет. Ты сказал ему о драконах?
	AI_Output(self,other,"DIA_Lothar_Add_01_52");	//Разве я не говорил тебе, чтобы ты прекратил нести этот вздор?!
	AI_Output(self,other,"DIA_Lothar_Add_01_12");	//Я слышал, ты уже получил одобрение некоторых мастеров.
	AI_Output(self,other,"DIA_Lothar_Add_01_13");	//Похоже, ты полон решимости добиться своего, да?
	AI_Output(self,other,"DIA_Lothar_Add_01_01");	//Ты должен повиноваться законам, как и все остальные!
	AI_Output(self,other,"DIA_Lothar_Add_01_02");	//Лорд Хаген не принимает.
	AI_Output(self,other,"DIA_Lothar_Add_01_03");	//Если у тебя действительно есть что-то ВАЖНОЕ, иди к лорду Андрэ. Он поможет тебе!*/
};


instance DIA_LOTHAR_HELLOAGAIN(C_INFO)
{
	npc = pal_203_lothar;
	nr = 1;
	condition = dia_lothar_helloagain_condition;
	information = dia_lothar_helloagain_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lothar_helloagain_condition()
{
	if(MIL_305_SCHONMALREINGELASSEN == TRUE)
	{
		return TRUE;
	};
};

func void dia_lothar_helloagain_info()
{
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_00");	//Ах! Опять ты!
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_01");	//Так тебе все же удалось получить доступ в верхний квартал!
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_36");	//Где ты взял эту мантию?
		AI_Output(other,self,"DIA_Lothar_Add_15_37");	//Я прошел Испытание Огнем.
		AI_Output(self,other,"DIA_Lothar_Add_01_38");	//Невероятно. Тогда то, что происходит здесь, может быть волей Инноса...
	};
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_39");	//Ты ведь не присоединился к наемникам Онара, нет?
		AI_Output(self,other,"DIA_Lothar_Add_01_40");	//Как ты попал сюда?
		AI_Output(other,self,"DIA_Lothar_Add_15_41");	//Я принес предложение мира от Ли...
		AI_Output(self,other,"DIA_Lothar_Add_01_42");	//Ха! Лорд Хаген никогда не согласится на это.
	};
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_02");	//Есть вещи, о которых ты всегда должен помнить. В противном случае ты будешь вышвырнут отсюда так же быстро, как попал сюда.
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_03");	//Тебе можно входить только в дома торговцев. Ты узнаешь их по вывескам над дверьми - тут тяжело ошибиться.
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_04");	//Другие здания здесь принадлежат знатным горожанам - там тебе совершенно нечего делать!
	if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_05");	//Даже несмотря на то, что ты теперь член ордена Инноса.
	};
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_06");	//Будучи членом ополчения, ты также получаешь доступ в покои паладинов.
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_07");	//Но твое место по-прежнему в казармах.
	};
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_08");	//В этом квартале живут знатные горожане. Так что относись к ним с уважением.
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_09");	//Мы поняли друг друга?
	AI_Output(other,self,"DIA_Lothar_HelloAgain_15_10");	//Конечно.
};


instance DIA_LOTHAR_HAGEN(C_INFO)
{
	npc = pal_203_lothar;
	nr = 2;
	condition = dia_lothar_hagen_condition;
	information = dia_lothar_hagen_info;
	permanent = TRUE;
	description = "Где я могу найти лорда Хагена?";
};


func int dia_lothar_hagen_condition()
{
	if((MIL_305_SCHONMALREINGELASSEN == TRUE) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lothar_hagen_info()
{
	AI_Output(other,self,"DIA_Lothar_Hagen_15_00");	//Где я могу найти лорда Хагена?
	AI_Output(self,other,"DIA_Lothar_Hagen_01_01");	//Он в ратуше, в конце верхнего квартала.
	AI_Output(self,other,"DIA_Lothar_Hagen_01_02");	//Но тебя не примут там без веской на то причины.
};


instance DIA_LOTHAR_OWRUNNING(C_INFO)
{
	npc = pal_203_lothar;
	nr = 2;
	condition = dia_lothar_owrunning_condition;
	information = dia_lothar_owrunning_info;
	permanent = FALSE;
	description = "Я пришел увидеться с лордом Хагеном...";
};


func int dia_lothar_owrunning_condition()
{
	if((MIS_OLDWORLD == LOG_RUNNING) && (Npc_HasItems(hero,itwr_paladinletter_mis) == 0))
	{
		return TRUE;
	};
};

func void dia_lothar_owrunning_info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_53");	//Я пришел увидеться с лордом Хагеном...
	AI_Output(self,other,"DIA_Lothar_Add_01_54");	//И? Ты не докучал ему своими россказнями о драконах, нет?
	AI_Output(other,self,"DIA_Lothar_Add_15_55");	//Да, я говорил ему...
	AI_Output(self,other,"DIA_Lothar_Add_01_56");	//Скажи мне, что это неправда...
	AI_Output(other,self,"DIA_Lothar_Add_15_57");	//Он послал меня добыть доказательства...
	AI_Output(self,other,"DIA_Lothar_Add_01_58");	//Ну что ж, тогда удачи. (себе под нос) Что за безумец...
	AI_StopProcessInfos(self);
};


instance DIA_LOTHAR_OWRUNNINGBRIEF(C_INFO)
{
	npc = pal_203_lothar;
	nr = 2;
	condition = dia_lothar_owrunningbrief_condition;
	information = dia_lothar_owrunningbrief_info;
	permanent = FALSE;
	description = "У меня есть доказательство! Вот письмо от командующего Гаронда!";
};


func int dia_lothar_owrunningbrief_condition()
{
	if((MIS_OLDWORLD == LOG_RUNNING) && (Npc_HasItems(hero,itwr_paladinletter_mis) > 0))
	{
		return TRUE;
	};
};

func void dia_lothar_owrunningbrief_info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_59");	//У меня есть доказательство! Вот письмо от командующего Гаронда!
	AI_Output(self,other,"DIA_Lothar_Add_01_60");	//Так драконы действительно существуют?
	AI_Output(self,other,"DIA_Lothar_Add_01_61");	//Я был несправедлив к тебе. Я буду молить Инноса о прощении за мое поведение.
	AI_StopProcessInfos(self);
};


instance DIA_LOTHAR_PERM(C_INFO)
{
	npc = pal_203_lothar;
	nr = 3;
	condition = dia_lothar_perm_condition;
	information = dia_lothar_perm_info;
	permanent = TRUE;
	description = "Ничего интересного не было?";
};


func int dia_lothar_perm_condition()
{
	if((MIL_305_SCHONMALREINGELASSEN == TRUE) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lothar_perm_info()
{
	AI_Output(other,self,"DIA_Lothar_PERM_15_00");	//Ничего интересного не было за последнее время?
	if((other.guild == GIL_NONE) || (other.guild == GIL_SLD))
	{
		AI_Output(self,other,"DIA_Lothar_PERM_01_01");	//Да, сюда стали пускать оборванцев вроде тебя. Такого не случалось уже многие века.
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lothar_PERM_01_02");	//Ты должен зарубить себе на носу. В качестве члена городской стражи в твои обязанности входит поддерживать в городе закон и порядок!
	}
	else
	{
		AI_Output(self,other,"DIA_Lothar_PERM_01_03");	//Нет.
	};
};


instance DIA_LOTHAR_PICKPOCKET(C_INFO)
{
	npc = pal_203_lothar;
	nr = 900;
	condition = dia_lothar_pickpocket_condition;
	information = dia_lothar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_lothar_pickpocket_condition()
{
	return c_beklauen(56,95);
};

func void dia_lothar_pickpocket_info()
{
	Info_ClearChoices(dia_lothar_pickpocket);
	Info_AddChoice(dia_lothar_pickpocket,DIALOG_BACK,dia_lothar_pickpocket_back);
	Info_AddChoice(dia_lothar_pickpocket,DIALOG_PICKPOCKET,dia_lothar_pickpocket_doit);
};

func void dia_lothar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_lothar_pickpocket);
};

func void dia_lothar_pickpocket_back()
{
	Info_ClearChoices(dia_lothar_pickpocket);
};

