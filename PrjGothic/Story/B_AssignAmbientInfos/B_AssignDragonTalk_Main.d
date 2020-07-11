
instance DIA_DRAGONTALK_MAIN_1(C_INFO)
{
	nr = 10;
	condition = dia_dragontalk_main_1_condition;
	information = dia_dragontalk_main_1_info;
	permanent = FALSE;
	description = "Что заставило тебя появиться здесь?";
};


func int dia_dragontalk_main_1_condition()
{
	if(MIS_KILLEDDRAGONS == 0)
	{
		return TRUE;
	};
};

func void dia_dragontalk_main_1_info()
{
	AI_Output(other,self,"DIA_DragonTalk_Main_1_15_00");	//Слуга Зла. Что заставило тебя появиться здесь? Ты пришел только за тем, чтобы сеять ужас и панику?
	AI_Output(self,other,"DIA_DragonTalk_Main_1_20_01");	//Наша высшая цель в этом мире, жалкий человечишка, останется скрытой от тебя.
	Info_AddChoice(dia_dragontalk_main_1,"Как мне заставить говорить других драконов?",dia_dragontalk_main_1_reden);
	Info_AddChoice(dia_dragontalk_main_1,"Что мне нужно сделать, чтобы изгнать тебя?",dia_dragontalk_main_1_verbannen);
	DRAGONTALK_EXIT_FREE = TRUE;
};

func void dia_dragontalk_main_1_verbannen()
{
	AI_Output(other,self,"DIA_DragonTalk_MAIN_1_verbannen_15_00");	//Что, во имя Инноса должен я сделать, чтобы изгнать вас из царства людей?
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_01");	//(смеется) Прежде чем ты сможешь действовать, ты сначала должен понять смысл нашего появления здесь.
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_02");	//Однако никто не раскроет тебе эту тайну по своей собственной воле.
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_03");	//Только Глаз может развязать нам язык и раскрыть тебе наши истинные цели.
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_04");	//Но в любом случае, эта информация будет бесполезна для тебя, когда ты будешь мертв
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_05");	//Нам уже сообщили, что ты выбрал путь охотника на дракона.
		AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_06");	//Поэтому мы послали наших отпрысков в твой мир, чтобы обеспечить продолжение нашего рода здесь.
		AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_07");	//Ты уже проиграл, жалкий человечишка.
		Log_CreateTopic(TOPIC_DRACHENEIER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DRACHENEIER,LOG_RUNNING);
		b_logentry(TOPIC_DRACHENEIER,"Один из драконов пробормотал что-то об 'отпрыске' и продолжении его родового древа. Боюсь, они могли распихать свой выводок по всем миру.");
	}
	else
	{
		AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_08");	//Глаз даровал тебе информацию. Однако только бой решит, достоин ты меня или нет.
	};
};

func void dia_dragontalk_main_1_reden()
{
	AI_Output(other,self,"DIA_DragonTalk_MAIN_1_reden_15_00");	//Как мне заставить говорить других драконов?
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_reden_20_01");	//Только мое сердце может помочь восстановить силу Глаза.
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_reden_20_02");	//Но тебе не удастся лишить меня моего сердца.
};


instance DIA_DRAGONTALK_MAIN_2(C_INFO)
{
	nr = 10;
	condition = dia_dragontalk_main_2_condition;
	information = dia_dragontalk_main_2_info;
	permanent = FALSE;
	description = "Кто послал вас сюда?";
};


func int dia_dragontalk_main_2_condition()
{
	if(MIS_KILLEDDRAGONS == 1)
	{
		return TRUE;
	};
};

func void dia_dragontalk_main_2_info()
{
	AI_Output(other,self,"DIA_DragonTalk_Main_2_15_00");	//Чьи приказы вы выполняете? Кто послал вас сюда?
	AI_Output(self,other,"DIA_DragonTalk_Main_2_20_01");	//Наше будущее и настоящее контролируются Хозяином при помощи Слова Силы. Скоро никто не сможет сопротивляться ему.
	AI_Output(self,other,"DIA_DragonTalk_Main_2_20_02");	//Его длинная рука уже протянулась сюда из Царства Мертвых. Духи ночи собираются в предвкушении его скорого появления.
	AI_Output(self,other,"DIA_DragonTalk_Main_2_20_03");	//Он раздавит вас, людей, и будет править этим миром.
	AI_Output(self,other,"DIA_DragonTalk_Main_2_20_04");	//В его тени мы не более чем инструмент его созидательной силы.
	AI_Output(self,other,"DIA_DragonTalk_Main_2_20_05");	//Хозяин придет и поднимет ваши безжизненные тела из пепла и использует их для окончательного изменения облика этого мира.
	b_logentry(TOPIC_DRACHENJAGD,"Драконы не хозяева сами себе. Они служат повелителю, о котором не хотят говорить ничего кроме туманных пророчеств. Повелитель придет, чтобы уничтожить мир и все такое... Обычная чушь.");
	DRAGONTALK_EXIT_FREE = TRUE;
};


instance DIA_DRAGONTALK_MAIN_3(C_INFO)
{
	nr = 10;
	condition = dia_dragontalk_main_3_condition;
	information = dia_dragontalk_main_3_info;
	permanent = FALSE;
	description = "Как я могу победить вашего хозяина?";
};


func int dia_dragontalk_main_3_condition()
{
	if(MIS_KILLEDDRAGONS == 2)
	{
		return TRUE;
	};
};

func void dia_dragontalk_main_3_info()
{
	AI_Output(other,self,"DIA_DragonTalk_Main_3_15_00");	//Как я могу победить вашего хозяина?
	AI_Output(self,other,"DIA_DragonTalk_Main_3_20_01");	//Он всемогущ и практически неуязвим. Если у тебя хватит глупости встретиться с ним лично, ты умрешь медленной и мучительной смертью.
	AI_Output(other,self,"DIA_DragonTalk_Main_3_15_02");	//Я уже не первый раз слышу подобное. Почти неуязвимый не означает, что я не могу убить его.
	AI_Output(other,self,"DIA_DragonTalk_Main_3_15_03");	//Итак, говори: Что я должен сделать?
	AI_Output(self,other,"DIA_DragonTalk_Main_3_20_04");	//Чтобы противостоять моему Хозяину, тебе понадобятся вещи, которые ты никогда не сможешь заполучить.
	AI_Output(other,self,"DIA_DragonTalk_Main_3_15_05");	//И что это за вещи?
	AI_Output(self,other,"DIA_DragonTalk_Main_3_20_06");	//Ты должен добыть лучшие доспехи, которые встречаются в вашем земном мире, и надеть их на себя.
	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_Dragons_Add_20_01");	//Тебе понадобится меч, благословленный вашим богом.
	}
	else if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Dragons_Add_20_02");	//Тебе понадобится руна, созданная только для тебя.
	}
	else
	{
		AI_Output(self,other,"DIA_Dragons_Add_20_00");	//Тебе понадобится оружие, которое сделано только для тебя.
	};
	AI_Output(self,other,"DIA_DragonTalk_Main_3_20_08");	//Но самое сложное условие из всех - ты должен найти пятерых спутников, которые готовы пойти за тобой на смерть.
	AI_Output(self,other,"DIA_DragonTalk_Main_3_20_09");	//Тогда и только тогда ты можешь осмелиться встретиться с Хозяином.
	DRAGONTALK_EXIT_FREE = TRUE;
};


instance DIA_DRAGONTALK_MAIN_4(C_INFO)
{
	nr = 10;
	condition = dia_dragontalk_main_4_condition;
	information = dia_dragontalk_main_4_info;
	permanent = FALSE;
	description = "Как мне найти вашего хозяина?";
};


func int dia_dragontalk_main_4_condition()
{
	if(MIS_KILLEDDRAGONS == 3)
	{
		return TRUE;
	};
};

func void dia_dragontalk_main_4_info()
{
	AI_Output(other,self,"DIA_DragonTalk_Main_4_15_00");	//Как мне найти вашего хозяина?
	AI_Output(self,other,"DIA_DragonTalk_Main_4_20_01");	//Он находится в своих покоях в сплошной скале Чертогов Ирдората и ожидает там свою судьбу.
	AI_Output(self,other,"DIA_DragonTalk_Main_4_20_02");	//Пока он не сможет установить в этом мире порядок, которого он заслуживает, он будет ждать там в глубокой медитации и ...
	AI_Output(other,self,"DIA_DragonTalk_Main_4_15_03");	//Давай опустим детали. Просто скажи мне, где находятся эти священные чертоги Ирдората.
	AI_Output(self,other,"DIA_DragonTalk_Main_4_20_04");	//Ха-ха-ха. Ты разочаровал меня, жалкий человечишка. Ты вынес все опасности, и одолел большинство из нас, а теперь ты не можешь даже использовать полученные тобой знания.
	AI_Output(self,other,"DIA_DragonTalk_Main_4_20_05");	//Если слово Ирдорат ничего не значит для тебя, то тебе лучше отправиться к своим магам и попросить их, чтобы тебе позволили заниматься их мирскими делами.
	AI_Output(self,other,"DIA_DragonTalk_Main_4_20_06");	//Так как, очевидно, ты еще не готов взвалить на себя ношу их высшего знания.
	Log_CreateTopic(TOPIC_BUCHHALLENVONIRDORATH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BUCHHALLENVONIRDORATH,LOG_RUNNING);
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Говорят, что повелитель драконов нашел прибежище в огромной скале священных Чертогов Ирдората. Ммм... Это что-то знакомое. И где я читал о них?");
	b_npc_isalivecheck(OLDWORLD_ZEN);
	DRAGONTALK_EXIT_FREE = TRUE;
};

func void b_assigndragontalk_main(var C_NPC slf)
{
	dia_dragontalk_main_1.npc = Hlp_GetInstanceID(slf);
	dia_dragontalk_main_2.npc = Hlp_GetInstanceID(slf);
	dia_dragontalk_main_3.npc = Hlp_GetInstanceID(slf);
	dia_dragontalk_main_4.npc = Hlp_GetInstanceID(slf);
};

