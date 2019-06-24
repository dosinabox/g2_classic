
var int urshak_sucked;

instance DIA_URSHAK_EXIT(C_INFO)
{
	npc = none_110_urshak;
	nr = 999;
	condition = dia_urshak_exit_condition;
	information = dia_urshak_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_urshak_exit_condition()
{
	return TRUE;
};

func void dia_urshak_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_URSHAK_HALLO(C_INFO)
{
	npc = none_110_urshak;
	nr = 5;
	condition = dia_urshak_hallo_condition;
	information = dia_urshak_hallo_info;
	important = TRUE;
};


func int dia_urshak_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_hallo_info()
{
	AI_Output(self,other,"DIA_Urshak_HALLO_18_00");	//(агрессивно) КРОТОК ДЖАБАРТ!!!
	AI_Output(self,other,"DIA_Urshak_HALLO_18_01");	//Стой! Моя знать тебя. Ты друг человек с мягким голосом.
	AI_Output(self,other,"DIA_Urshak_HALLO_18_02");	//Друг убивать злого демона КРУШАКА.
	b_giveplayerxp(XP_URSHAKFOUND);
	Log_CreateTopic(TOPIC_URSHAK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_URSHAK,LOG_RUNNING);
	b_logentry(TOPIC_URSHAK,"Я нашел своего старого друга-орка - Ур-Шака.");
	Info_ClearChoices(dia_urshak_hallo);
	Info_AddChoice(dia_urshak_hallo,"Что ты делаешь здесь?",dia_urshak_hallo_freund);
	Info_AddChoice(dia_urshak_hallo,"Говорящий орк?",dia_urshak_hallo_wer);
};

func void dia_urshak_hallo_wer()
{
	AI_Output(other,self,"DIA_Urshak_HALLO_wer_15_00");	//Говорящий орк?
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_01");	//Твоя забывать Ур-Шак? Это печалить меня.
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_02");	//Ур-Шак помогать другу много дней раньше получить УЛУ-МУЛУ для ходить в моя деревня. Орки уважать друга, и друг не умирать от руки орков.
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_03");	//Друг потом ходить в храм орков и изгонять злого демона. Много дней раньше. Твоя не помнить?
};

func void dia_urshak_hallo_freund()
{
	AI_Output(other,self,"DIA_Urshak_HALLO_freund_15_00");	//Ты выбрал не лучшее время, чтобы встать у меня на пути. Я чуть не убил тебя. Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Urshak_HALLO_freund_18_01");	//Ур-Шак смотреть на землю и видеть, что стало с землей и мой народ.
	Info_ClearChoices(dia_urshak_hallo);
};


instance DIA_URSHAK_WASMACHENORKS(C_INFO)
{
	npc = none_110_urshak;
	nr = 6;
	condition = dia_urshak_wasmachenorks_condition;
	information = dia_urshak_wasmachenorks_info;
	description = "Почему орки нападают на людей?";
};


func int dia_urshak_wasmachenorks_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hallo) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_wasmachenorks_info()
{
	AI_Output(other,self,"DIA_Urshak_WASMACHENORKS_15_00");	//Почему орки нападают на людей?
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_01");	//Ур-Шак всегда говорить народ орков, что люди не зло и с ними надо дружить.
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_02");	//Но шаман не слушать Ур-Шак. Ур-Шак в немилость у свой народ.
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_03");	//Поэтому Ур-Шак не знать точно о большой план войны против людей.
	b_logentry(TOPIC_URSHAK,"Он все еще никак не может заставить свой народ выслушать его. Он все еще изгнанник.");
};


instance DIA_URSHAK_SOVIELE(C_INFO)
{
	npc = none_110_urshak;
	nr = 7;
	condition = dia_urshak_soviele_condition;
	information = dia_urshak_soviele_info;
	description = "Почему вас здесь так много?";
};


func int dia_urshak_soviele_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hallo) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_soviele_info()
{
	AI_Output(other,self,"DIA_Urshak_SOVIELE_15_00");	//Почему вас здесь так много?
	AI_Output(self,other,"DIA_Urshak_SOVIELE_18_01");	//Орки приходить с гор, но другие приплывать на кораблях и делать большой забор.
};


instance DIA_URSHAK_ZAUN(C_INFO)
{
	npc = none_110_urshak;
	nr = 8;
	condition = dia_urshak_zaun_condition;
	information = dia_urshak_zaun_info;
	description = "Что скрывается за этим частоколом орков на востоке?";
};


func int dia_urshak_zaun_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hallo) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_zaun_info()
{
	AI_Output(other,self,"DIA_Urshak_ZAUN_15_00");	//Что скрывается за этим частоколом орков на востоке?
	AI_Output(self,other,"DIA_Urshak_ZAUN_18_01");	//Орки всегда делать большой забор и готовить лагерь к война.
	AI_Output(self,other,"DIA_Urshak_ZAUN_18_02");	//Забор хорошо для война. Скрывать сила армия и защищать орков.
};


instance DIA_URSHAK_WASHASTDUVOR(C_INFO)
{
	npc = none_110_urshak;
	nr = 9;
	condition = dia_urshak_washastduvor_condition;
	information = dia_urshak_washastduvor_info;
	description = "Что ты планируешь делать дальше?";
};


func int dia_urshak_washastduvor_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hallo) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_washastduvor_info()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_15_00");	//Что вы планируете делать дальше?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_18_01");	//Ур-Шак ждать, пока разведчики орков приводить Ур-Шак к Хош-Пак.
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_15_02");	//Кто такой Хош-Пак?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_18_03");	//Очень большой шаман. Иметь большое влияние на воинов и делать большие планы для орков.
	b_logentry(TOPIC_URSHAK,"Ур-Шак хочет встретиться с шаманом орков Хош-Паком и убедить его принять Ур-Шака назад в совет шаманов.");
	Info_ClearChoices(dia_urshak_washastduvor);
	Info_AddChoice(dia_urshak_washastduvor,DIALOG_BACK,dia_urshak_washastduvor_weiter);
	Info_AddChoice(dia_urshak_washastduvor,"Где я могу найти этого Хош-Пака?",dia_urshak_washastduvor_);
	Info_AddChoice(dia_urshak_washastduvor,"Почему ты тогда не пойдешь к нему?",dia_urshak_washastduvor_hoshpak);
};

func void dia_urshak_washastduvor_hoshpak()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_hoshpak_15_00");	//Почему ты тогда не пойдешь к нему?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_01");	//Ур-Шак пытаться и пытаться получить опять честь и старое место в совет шаманов.
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_02");	//Но пока Хош-Пак не слушать Ур-Шак. Орки убивать Ур-Шак если видеть его без разведчиков. Ур-Шак должен говорить с Хош-Пак.
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_03");	//Может быть, это удаваться сегодня.
};

func void dia_urshak_washastduvor_()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_Urshak_15_00");	//Где я могу найти этого Хош-Пака?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_Urshak_18_01");	//Он там где может наблюдать за воины орков у крепости у большой вулкан, чтобы Хош-Пак мочь контролировать воины.
};

func void dia_urshak_washastduvor_weiter()
{
	Info_ClearChoices(dia_urshak_washastduvor);
};


instance DIA_URSHAK_HOSHPAKDEAD(C_INFO)
{
	npc = none_110_urshak;
	nr = 9;
	condition = dia_urshak_hoshpakdead_condition;
	information = dia_urshak_hoshpakdead_info;
	description = "Хош-Пак мертв.";
};


func int dia_urshak_hoshpakdead_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_washastduvor) && Npc_IsDead(hosh_pak) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_hoshpakdead_info()
{
	AI_Output(other,self,"DIA_Urshak_HOSHPAKDEAD_15_00");	//Хош-Пак мертв.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_01");	//Хош-Пак мертв? РУШТАСОК!
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_02");	//Мое сердце большая печаль. Ур-Шак никогда не забывать великий орк делать Ур-Шак шаман.
	AI_Output(other,self,"DIA_Urshak_HOSHPAKDEAD_15_03");	//Я понимаю. Хош-Пак был твоим учителем.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_04");	//Ур-Шак теперь должен носить ношу горя, должен дать Хош-Пак последний обряд. Ур-Шак надо идти.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_05");	//Друг лучше уходить проход. Слишком опасно здесь.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_06");	//Ур-Шак печалиться если человек тоже умирать.
	b_logentry(TOPIC_URSHAK,"Хош-Пак мертв. Мой друг орк направляется в палатку Хош-Пака. Он скорбит по своему наставнику. Я должен отпустить его.");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,20);
	Npc_ExchangeRoutine(self,"Start");
	Wld_InsertNpc(orcwarrior_rest,"FP_CAMPFIRE_HOSHPAK_01");
	Wld_InsertNpc(orcwarrior_rest,"FP_CAMPFIRE_HOSHPAK_02");
};


instance DIA_URSHAK_GEH(C_INFO)
{
	npc = none_110_urshak;
	condition = dia_urshak_geh_condition;
	information = dia_urshak_geh_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_urshak_geh_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hoshpakdead) && ((Npc_GetDistToWP(self,"OW_HOSHPAK_04") < 1000) == FALSE) && (Npc_RefuseTalk(self) == FALSE) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_geh_info()
{
	AI_Output(self,other,"DIA_Urshak_GEH_18_00");	//Друг лучше уходить проход.
	Npc_SetRefuseTalk(self,10);
	AI_StopProcessInfos(self);
};


instance DIA_URSHAK_HOSHPAKRACHE(C_INFO)
{
	npc = none_110_urshak;
	condition = dia_urshak_hoshpakrache_condition;
	information = dia_urshak_hoshpakrache_info;
	important = TRUE;
};


func int dia_urshak_hoshpakrache_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hoshpakdead) && (Npc_GetDistToWP(self,"OW_HOSHPAK_04") <= 1000) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_hoshpakrache_info()
{
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_00");	//(агрессивно) КХРОТОК! Я узнавать, что ты быть здесь когда Хош-Пак убивать. Твоя делать большая ошибка, чужак.
	AI_Output(other,self,"DIA_Urshak_HOSHPAKRACHE_15_01");	//Я вижу, ты занял свое место здесь. Ты обманул меня.
	AI_Output(other,self,"DIA_Urshak_HOSHPAKRACHE_15_02");	//Твое положение среди твоих людей выше, чем ты это говорил. Теперь ты сам не более чем инструмент в руках дьявола
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_03");	//Чужак прав. Ур-Шак наполняться только ненависть и месть теперь.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_04");	//Ур-Шак видеть большая ошибка доверять злой человек. Ур-Шак сожалеть звать человек другом и помогать ему не быть убит.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_05");	//Чужак теперь покидать долина и идти проход. Ур-Шак не будет убивать чужак сейчас. Честь шамана говорит Ур-Шак не убивать.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_06");	//Следующий раз мы встречаться мы враги. Твоя лучше уходить сейчас.
	AI_StopProcessInfos(self);
	URSHAK_SUCKED = TRUE;
	b_logentry(TOPIC_URSHAK,"Ур-Шак был принят назад, в совет шаманов орков. Теперь он на стороне врага и немного напряжен. Лучше мне не вставать у него на пути, пока я не решу все дела с орками. К тому времени, он должен успокоиться.");
	b_giveplayerxp(XP_URSHAKBECOMESSHAMAN);
};


instance DIA_URSHAK_KEINEWAHL(C_INFO)
{
	npc = none_110_urshak;
	condition = dia_urshak_keinewahl_condition;
	information = dia_urshak_keinewahl_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_urshak_keinewahl_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hoshpakrache) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_urshak_keinewahl_info()
{
	AI_Output(self,other,"DIA_Urshak_KEINEWAHL_18_00");	//Твоя уходить. Моя больше не говорить с чужак.
	AI_StopProcessInfos(self);
	URSHAK_SUCKED = TRUE;
};

