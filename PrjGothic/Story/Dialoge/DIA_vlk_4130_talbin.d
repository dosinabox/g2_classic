
instance DIA_TALBIN_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_exit_condition;
	information = dia_talbin_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_talbin_exit_info()
{
	AI_StopProcessInfos(self);
};


var int talbin_runs;

instance DIA_TALBIN_HALLO(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 5;
	condition = dia_talbin_hallo_condition;
	information = dia_talbin_hallo_info;
	important = TRUE;
};


func int dia_talbin_hallo_condition()
{
	if(KAPITEL <= 3)
	{
		return TRUE;
	};
};

func void dia_talbin_hallo_info()
{
	AI_Output(self,other,"DIA_Talbin_HALLO_07_00");	//Стой! Ни шагу дальше!
	AI_Output(other,self,"DIA_Talbin_HALLO_15_01");	//Ох! Нет проблем!
	AI_Output(self,other,"DIA_Talbin_HALLO_07_02");	//Эх! Еще один маленький ягненок, ха? Сначала я принял тебя за одного из этих ублюдков, что постоянно шляются здесь.
	AI_Output(self,other,"DIA_Talbin_HALLO_07_03");	//Но теперь я вижу, что ты не один из них. Ты выглядишь слишком беззащитным!
};


instance DIA_TALBIN_WASMACHTIHR(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 6;
	condition = dia_talbin_wasmachtihr_condition;
	information = dia_talbin_wasmachtihr_info;
	description = "А ты похож на охотника, который не знает, куда девать свободное время.";
};


func int dia_talbin_wasmachtihr_condition()
{
	if(TALBIN_RUNS == FALSE)
	{
		return TRUE;
	};
};

func void dia_talbin_wasmachtihr_info()
{
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_15_00");	//А ты похож на охотника, который не знает, куда девать свободное время.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_01");	//Ха-ха! Да - ты угадал. Но что мне еще делать - я не могу вернуться через Проход!
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_02");	//Поэтому я остаюсь здесь и занимаюсь тем, что умею лучше всего.
	if(Npc_IsDead(engrom) == FALSE)
	{
		AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_03");	//Мне жаль, впрочем, моего приятеля Энгрома.
	};
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_04");	//Садись ближе к моему костру. Погрейся немного.
	Info_ClearChoices(dia_talbin_wasmachtihr);
	Info_AddChoice(dia_talbin_wasmachtihr,DIALOG_BACK,dia_talbin_wasmachtihr_back);
	Info_AddChoice(dia_talbin_wasmachtihr,"Но мне кажется, ты комфортно чувствуешь себя здесь.",dia_talbin_wasmachtihr_gut);
	Info_AddChoice(dia_talbin_wasmachtihr,"Ты бывший каторжник из-за Барьера?",dia_talbin_wasmachtihr_strf);
};

func void dia_talbin_wasmachtihr_back()
{
	Info_ClearChoices(dia_talbin_wasmachtihr);
};

func void dia_talbin_wasmachtihr_strf()
{
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_strf_15_00");	//Ты бывший каторжник из-за Барьера?
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_01");	//Нет, нет! С чего ты взял? Я просто хотел подзаработать здесь.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_02");	//Кто-то сказал мне, что здесь лучшие охотничьи угодья на острове.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_03");	//Райские угодья, если ты понимаешь, что я имею в виду.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_04");	//Но единственное, что можно заработать здесь после того, как появились эти чертовы орки, - это удар топором, если зайдешь слишком далеко!
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_05");	//И я позволил этим идиотам обмануть меня.
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_strf_15_06");	//Я знаю этих шутников!
};

func void dia_talbin_wasmachtihr_gut()
{
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_gut_15_00");	//Но мне кажется, ты комфортно чувствуешь себя здесь.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_gut_07_01");	//О да! Я думаю, мне не на что жаловаться. Несмотря на этих чертовых орков, район у реки наименее опасен.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_gut_07_02");	//Похоже, они не осмеливаются приближаться к воде. Ммм. Хотя, возможно, это просто совпадение.
};


instance DIA_TALBIN_SORRYFORENGROM(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 7;
	condition = dia_talbin_sorryforengrom_condition;
	information = dia_talbin_sorryforengrom_info;
	description = "Почему тебе жаль Энгрома?";
};


func int dia_talbin_sorryforengrom_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_wasmachtihr) && (Npc_IsDead(engrom) == FALSE) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (KAPITEL <= 3) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_sorryforengrom_info()
{
	AI_Output(other,self,"DIA_Talbin_SORRYFORENGROM_15_00");	//Почему тебе жаль Энгрома?
	AI_Output(self,other,"DIA_Talbin_SORRYFORENGROM_07_01");	//Потому что он просто пошел за мной, не задавая вопросов.
	AI_Output(self,other,"DIA_Talbin_SORRYFORENGROM_07_02");	//И вот мы попали в эту передрягу. Жадность никогда не доводит до добра.
};


instance DIA_TALBIN_WASJAGDIHR(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 8;
	condition = dia_talbin_wasjagdihr_condition;
	information = dia_talbin_wasjagdihr_info;
	description = "А на кого ты охотишься у реки?";
};


func int dia_talbin_wasjagdihr_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_wasmachtihr) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_wasjagdihr_info()
{
	AI_Output(other,self,"DIA_Talbin_WASJAGDIHR_15_00");	//А на кого ты охотишься у реки?
	AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_01");	//Что за вопрос! Просто пройди вдоль реки, и ты поймешь, на кого я охочусь. На луркеров, конечно же!
	AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_02");	//Этих тварей нелегко завалить, но их мясо очень вкусное.
	AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_03");	//Иногда также я натыкаюсь на падальщиков. Я не привередливый, и от них нос тоже не ворочу!
};


instance DIA_TALBIN_ENGROMANGRY(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 9;
	condition = dia_talbin_engromangry_condition;
	information = dia_talbin_engromangry_info;
	description = "Мне кажется, твой приятель какой-то напряженный!";
};


func int dia_talbin_engromangry_condition()
{
	if(Npc_KnowsInfo(other,dia_engrom_whataboutleaving) && Npc_KnowsInfo(other,dia_talbin_sorryforengrom) && (Npc_IsDead(engrom) == FALSE) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (KAPITEL <= 3) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_engromangry_info()
{
	AI_Output(other,self,"DIA_Talbin_ENGROMANGRY_15_00");	//Мне кажется, твой приятель какой-то напряженный!
	AI_Output(self,other,"DIA_Talbin_ENGROMANGRY_07_01");	//Брось. Не провоцируй его, или он меня прикончит. Сейчас я ничем не могу помочь ему.
	AI_Output(self,other,"DIA_Talbin_ENGROMANGRY_07_02");	//Но я что-нибудь придумаю!
};


instance DIA_TALBIN_ASKTEACHER(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 10;
	condition = dia_talbin_askteacher_condition;
	information = dia_talbin_askteacher_info;
	description = "Ты можешь научить меня охотиться?";
};


func int dia_talbin_askteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_wasjagdihr) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_askteacher_info()
{
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_00");	//Ты можешь научить меня охотиться?
	AI_Output(self,other,"DIA_Talbin_AskTeacher_07_01");	//Понимаю! Это и тебя увлекло. Хорошо. Но не бесплатно!
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_02");	//Что ты хочешь за это?
	AI_Output(self,other,"DIA_Talbin_AskTeacher_07_03");	//У тебя ничего нет поесть кроме мяса луркеров? Может быть, кусок сыра? Да, кусок сыра. Жизнь бы отдал за этот кусок...
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_04");	//Я посмотрю, что можно сделать.
	Log_CreateTopic(TOPIC_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_TEACHER,"Талбин может обучить меня добывать трофеи животных.");
};


instance DIA_TALBIN_PAYTEACHER(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 11;
	condition = dia_talbin_payteacher_condition;
	information = dia_talbin_payteacher_info;
	permanent = TRUE;
	description = "Вот твой сыр. Ты обучишь меня теперь?";
};


var int dia_talbin_payteacher_noperm;

func int dia_talbin_payteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_askteacher) && (DIA_TALBIN_PAYTEACHER_NOPERM == FALSE) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_payteacher_info()
{
	if(b_giveinvitems(other,self,itfo_cheese,1))
	{
		AI_Output(other,self,"DIA_Talbin_PayTeacher_15_00");	//Вот твой сыр. Ты обучишь меня теперь?
		AI_Output(self,other,"DIA_Talbin_PayTeacher_07_01");	//У тебя действительно есть сыр? Ох, давненько я не ел ничего подобного. Спасибо. Ээ, а что насчет... Ах, да, конечно!
		TALBIN_TEACHANIMALTROPHY = TRUE;
		DIA_TALBIN_PAYTEACHER_NOPERM = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Talbin_PayTeacher_15_02");	//У меня сейчас нет сыра!
		AI_Output(self,other,"DIA_Talbin_PayTeacher_07_03");	//Это было бы слишком хорошо, чтобы быть правдой. Ладно, скажешь, когда раздобудешь его!
	};
};


instance DIA_TALBIN_TEACHHUNTING(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 12;
	condition = dia_talbin_teachhunting_condition;
	information = dia_talbin_teachhunting_info;
	permanent = TRUE;
	description = "Чему ты можешь обучить меня?";
};


func int dia_talbin_teachhunting_condition()
{
	if((TALBIN_TEACHANIMALTROPHY == TRUE) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_teachhunting_info()
{
	AI_Output(other,self,"DIA_Talbin_TEACHHUNTING_15_00");	//Чему ты можешь обучить меня?
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_HEART] == FALSE))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_07_01");	//А что ты хочешь знать?
		Info_AddChoice(dia_talbin_teachhunting,DIALOG_BACK,dia_talbin_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE)
		{
			Info_AddChoice(dia_talbin_teachhunting,b_buildlearnstring("Удаление когтей",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_talbin_teachhunting_claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
		{
			Info_AddChoice(dia_talbin_teachhunting,b_buildlearnstring("Снятие шкур",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_talbin_teachhunting_fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE)
		{
			Info_AddChoice(dia_talbin_teachhunting,b_buildlearnstring("Рог мракориса",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_talbin_teachhunting_shadowhorn);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_HEART] == FALSE)
		{
			Info_AddChoice(dia_talbin_teachhunting,b_buildlearnstring("Удаление сердца",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_talbin_teachhunting_heart);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_07_02");	//Я разочарую тебя. Ты уже знаешь все, чему я могу научить. Но все же, спасибо за сыр!
	};
};

func void dia_talbin_teachhunting_back()
{
	Info_ClearChoices(dia_talbin_teachhunting);
};

func void dia_talbin_teachhunting_claws()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Claws_07_00");	//Отрезать когти - это просто. Берешь коготь за основание и прижимаешь его к земле.
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Claws_07_01");	//Затем берешь нож и аккуратно отрезаешь коготь.
	};
	Info_ClearChoices(dia_talbin_teachhunting);
};

func void dia_talbin_teachhunting_fur()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Fur_07_00");	//Проще всего снять шкуру с луркера, сделав разрез вдоль всего живота...
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Fur_07_01");	//...затем тянешь за задние ноги и стягиваешь шкуру с зада наперед.
	};
	Info_ClearChoices(dia_talbin_teachhunting);
};

func void dia_talbin_teachhunting_shadowhorn()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_SHADOWHORN))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_ShadowHorn_07_00");	//Рога мракорисов очень твердые, и из них делают статуи и инструменты.
	};
	Info_ClearChoices(dia_talbin_teachhunting);
};

func void dia_talbin_teachhunting_heart()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_HEART))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Heart_07_00");	//Сердца магических существ очень редки, и их очень тяжело добыть. Будь осторожен, когда пытаешься сделать это, особенно в случае големов.
	};
	Info_ClearChoices(dia_talbin_teachhunting);
};


instance DIA_TALBIN_KAP3_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_kap3_exit_condition;
	information = dia_talbin_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_talbin_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_KAP4_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_kap4_exit_condition;
	information = dia_talbin_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_talbin_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_KAP4_WASNEUES(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 13;
	condition = dia_talbin_kap4_wasneues_condition;
	information = dia_talbin_kap4_wasneues_info;
	description = "Здесь никто не проходил?";
};


func int dia_talbin_kap4_wasneues_condition()
{
	if((KAPITEL >= 4) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_kap4_wasneues_info()
{
	AI_Output(other,self,"DIA_Talbin_KAP4_WASNEUES_15_00");	//Здесь никто не проходил?
	AI_Output(self,other,"DIA_Talbin_KAP4_WASNEUES_07_01");	//Походил. Недавно здесь были очень забавные парни! Они расхаживали в расфуфыренных доспехах, и у них был очень важный и напыщенный вид.
};


instance DIA_TALBIN_KAP4_WASWOLLTENDJG(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 14;
	condition = dia_talbin_kap4_waswolltendjg_condition;
	information = dia_talbin_kap4_waswolltendjg_info;
	description = "А что этим 'забавным парням' было нужно здесь?";
};


func int dia_talbin_kap4_waswolltendjg_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_kap4_wasneues) && (KAPITEL >= 4) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_kap4_waswolltendjg_info()
{
	AI_Output(other,self,"DIA_Talbin_KAP4_WASWOLLTENDJG_15_00");	//А что этим 'забавным парням' было нужно здесь?
	AI_Output(self,other,"DIA_Talbin_KAP4_WASWOLLTENDJG_07_01");	//Они спрашивали меня насчет провизии и снаряжения. Я и так-то еле концы с концами свожу!
	AI_Output(self,other,"DIA_Talbin_KAP4_WASWOLLTENDJG_07_02");	//Они болтали что-то о том, что собираются убить дракона. Одному богу ведомо, откуда они взялись такие, но они не вызвали у меня особого доверия!
	if(KAPITEL == 4)
	{
		b_logentry(TOPIC_DRAGONHUNTER,"Несколько охотников на драконов остановились на охотничьих угодьях Талбина.");
	};
};


instance DIA_TALBIN_WOENGROM(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 15;
	condition = dia_talbin_woengrom_condition;
	information = dia_talbin_woengrom_info;
	description = "Ты сейчас один?";
};


func int dia_talbin_woengrom_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_wasmachtihr) && (KAPITEL >= 4) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (ENGROMISGONE == TRUE) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_woengrom_info()
{
	AI_Output(other,self,"DIA_Talbin_WOENGROM_15_00");	//Ты сейчас один?
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_01");	//Да. Мой приятель Энгром ушел. Вчера он сказал, что ему было видение - кто-то очень ласково говорил с ним.
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_02");	//Я ничего не слышал. Я подумал про себя, что он просто дошел до точки...
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_03");	//...а затем он неожиданно исчез. Понятия не имею, куда он направился.
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_04");	//Если ты где-нибудь увидишь Энгрома, скажи ему, что он все еще должен мне шкуру луркера.
	if(Npc_KnowsInfo(other,dia_engrom_whataboutleaving))
	{
		AI_Output(other,self,"DIA_Talbin_WOENGROM_15_05");	//Но у меня было впечатление, что он не собирался уходить отсюда, пока орки все еще в долине.
		AI_Output(self,other,"DIA_Talbin_WOENGROM_07_06");	//Я же сказал: у него крыша поехала.
	};
	MIS_TABIN_LOOKFORENGROM = LOG_RUNNING;
};


instance DIA_TALBIN_FOUNDENGROM(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 16;
	condition = dia_talbin_foundengrom_condition;
	information = dia_talbin_foundengrom_info;
	description = "Я нашел твоего приятеля Энгрома.";
};


func int dia_talbin_foundengrom_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_woengrom) && ((NPCOBSESSEDBYDMT_ENGROM == TRUE) || Npc_HasItems(other,itat_talbinslurkerskin)) && (KAPITEL >= 4) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_foundengrom_info()
{
	AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_00");	//Я нашел твоего приятеля Энгрома.
	AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_01");	//Да? Где он?
	if(Npc_IsDead(engrom))
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_02");	//Он мертв.
	}
	else
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_03");	//Я не думаю, что ты когда-нибудь его увидишь.
	};
	if(b_giveinvitems(other,self,itat_talbinslurkerskin,1))
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_04");	//Вот. Я нашел при нем эту шкуру луркера.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_05");	//Ищущие овладели им.
		AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_06");	//Ищущие? Кто это такие?
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_07");	//Приспешники преисподней. Это они командуют орками.
	};
	AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_08");	//О, Иннос. Мне нужно выбираться отсюда, даже если я при этом найду свою смерть. Сейчас или никогда!
	AI_StopProcessInfos(self);
	Log_CreateTopic(TOPIC_TALBIN_RUNS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TALBIN_RUNS,LOG_RUNNING);
	b_logentry(TOPIC_TALBIN_RUNS,"Талбин, охотник из Долины рудников, бежал через проход, как будто за ним по пятам гнался рой кровавых мух. Я думаю, он направился в Хоринис.");
	b_giveplayerxp(XP_AMBIENT);
	Npc_ExchangeRoutine(self,"FleePass");
	Wld_InsertNpc(snapper,"START");
	TALBIN_RUNS = TRUE;
};


instance DIA_TALBIN_WOHIN(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 17;
	condition = dia_talbin_wohin_condition;
	information = dia_talbin_wohin_info;
	permanent = TRUE;
	description = "Куда ты собрался? ";
};


func int dia_talbin_wohin_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_foundengrom) && (TALBIN_FOLLOWSTHROUGHPASS == 0))
	{
		return TRUE;
	};
};

func void dia_talbin_wohin_info()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_15_00");	//Куда ты собрался?
	if(Npc_GetDistToWP(self,"START") < 1000)
	{
		AI_Output(self,other,"DIA_Talbin_WOHIN_07_01");	//Доведи меня до Прохода. Пожалуйста!!
		Info_ClearChoices(dia_talbin_wohin);
		Info_AddChoice(dia_talbin_wohin,"У меня нет времени на тебя.",dia_talbin_wohin_);
		Info_AddChoice(dia_talbin_wohin,"Просто иди вперед.",dia_talbin_wohin_durch);
		Info_AddChoice(dia_talbin_wohin,"Хорошо.",dia_talbin_wohin_ok);
	}
	else
	{
		AI_Output(self,other,"DIA_Talbin_WOHIN_07_02");	//Я должен выбраться отсюда, через Проход!
		AI_StopProcessInfos(self);
	};
};

func void dia_talbin_wohin_ok()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_ok_15_00");	//Хорошо.
	AI_Output(self,other,"DIA_Talbin_WOHIN_ok_07_01");	//Спасибо. Я просто пойду за тобой.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"IntoPass");
	TALBIN_FOLLOWSTHROUGHPASS = LOG_RUNNING;
	self.flags = NPC_FLAG_IMMORTAL;
};

func void dia_talbin_wohin_durch()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_durch_15_00");	//Просто иди вперед.
	AI_Output(self,other,"DIA_Talbin_WOHIN_durch_07_01");	//Там так темно. Я бы ни за что не пошел бы туда один.
};

func void dia_talbin_wohin_()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_schwein_15_00");	//У меня нет времени на тебя.
	AI_Output(self,other,"DIA_Talbin_WOHIN_schwein_07_01");	//Ты оставляешь меня здесь умирать?! Ты будешь гореть в аду за это!
	TALBIN_FOLLOWSTHROUGHPASS = LOG_OBSOLETE;
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_VERSCHWINDE(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 15;
	condition = dia_talbin_verschwinde_condition;
	information = dia_talbin_verschwinde_info;
	permanent = TRUE;
	description = "Эй.";
};


func int dia_talbin_verschwinde_condition()
{
	if(TALBIN_FOLLOWSTHROUGHPASS == LOG_OBSOLETE)
	{
		return TRUE;
	};
};

func void dia_talbin_verschwinde_info()
{
	AI_Output(other,self,"DIA_Talbin_VERSCHWINDE_15_00");	//Эй.
	AI_Output(self,other,"DIA_Talbin_VERSCHWINDE_07_01");	//Проваливай. Я справлюсь и без тебя, дерьмо!
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_KAP5_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_kap5_exit_condition;
	information = dia_talbin_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_talbin_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_KAP6_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_kap6_exit_condition;
	information = dia_talbin_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_talbin_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_PICKPOCKET(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 900;
	condition = dia_talbin_pickpocket_condition;
	information = dia_talbin_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_talbin_pickpocket_condition()
{
	return c_beklauen(40,25);
};

func void dia_talbin_pickpocket_info()
{
	Info_ClearChoices(dia_talbin_pickpocket);
	Info_AddChoice(dia_talbin_pickpocket,DIALOG_BACK,dia_talbin_pickpocket_back);
	Info_AddChoice(dia_talbin_pickpocket,DIALOG_PICKPOCKET,dia_talbin_pickpocket_doit);
};

func void dia_talbin_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_talbin_pickpocket);
};

func void dia_talbin_pickpocket_back()
{
	Info_ClearChoices(dia_talbin_pickpocket);
};

