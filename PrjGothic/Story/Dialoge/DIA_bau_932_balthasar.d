
instance DIA_BALTHASAR_EXIT(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 999;
	condition = dia_balthasar_exit_condition;
	information = dia_balthasar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_balthasar_exit_condition()
{
	return TRUE;
};

func void dia_balthasar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BALTHASAR_HALLO(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 3;
	condition = dia_balthasar_hallo_condition;
	information = dia_balthasar_hallo_info;
	description = "Как дела?";
};


func int dia_balthasar_hallo_condition()
{
	return TRUE;
};

func void dia_balthasar_hallo_info()
{
	AI_Output(other,self,"DIA_Balthasar_HALLO_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Balthasar_HALLO_05_01");	//Ах, новое лицо на ферме. Неужели этот старый скряга, наконец, подарил мне ученика?
	AI_Output(other,self,"DIA_Balthasar_HALLO_15_02");	//Я не ученик.
	AI_Output(self,other,"DIA_Balthasar_HALLO_05_03");	//Ох. Понятно. Но я ведь уже не так молод, как раньше, понимаешь? И я уже много лет жду себе замену.
	AI_Output(self,other,"DIA_Balthasar_HALLO_05_04");	//Ты ведь здесь не потому, что тебя послали разгневанные соседи, правда?
};


instance DIA_BALTHASAR_WASMACHSTDU(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 4;
	condition = dia_balthasar_wasmachstdu_condition;
	information = dia_balthasar_wasmachstdu_info;
	description = "А чем ты тут занимаешься?";
};


func int dia_balthasar_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_hallo))
	{
		return TRUE;
	};
};

func void dia_balthasar_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Balthasar_WASMACHSTDU_15_00");	//А чем ты тут занимаешься?
	AI_Output(self,other,"DIA_Balthasar_WASMACHSTDU_05_01");	//Ох, я стерегу овец. Я всю свою жизнь этим занимаюсь.
	AI_Output(self,other,"DIA_Balthasar_WASMACHSTDU_05_02");	//Эти животные очень послушны и очень умны. Если ты хорошо с ними обращаешься, они пойдут за тобой куда угодно.
};


instance DIA_BALTHASAR_AERGERMITNACHBARN(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 5;
	condition = dia_balthasar_aergermitnachbarn_condition;
	information = dia_balthasar_aergermitnachbarn_info;
	description = "А что за проблемы с соседями?";
};


func int dia_balthasar_aergermitnachbarn_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_wasmachstdu) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && ((Npc_IsDead(balthasarsheep1) == FALSE) || (Npc_IsDead(balthasarsheep2) == FALSE) || (Npc_IsDead(balthasarsheep3) == FALSE)))
	{
		return TRUE;
	};
};

func void dia_balthasar_aergermitnachbarn_info()
{
	AI_Output(other,self,"DIA_Balthasar_AERGERMITNACHBARN_15_00");	//А что за проблемы с соседями?
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_01");	//Трава в этой части большого поля чахлая и пожухлая. Поэтому я часто пасу овец на больших пастбищах других ферм.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_02");	//Лендлорд не возражает, но Бенгар, фермер, владеющий высокогорными пастбищами, каждый раз орет как резаный, когда видит моих овец там.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_03");	//Он говорит, что Секоб должен платить, если хочет пасти овец на его пастбищах.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_04");	//Но Секоб скорее удавится, чем потратит хоть цент на это, поэтому я больше не хожу на плато.
};


instance DIA_BALTHASAR_WOBENGAR(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 10;
	condition = dia_balthasar_wobengar_condition;
	information = dia_balthasar_wobengar_info;
	description = "Как я могу попасть на эти высокогорные пастбища и ферму Бенгара?";
};


func int dia_balthasar_wobengar_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_aergermitnachbarn) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (BalthasarMovedToBengar == FALSE))
	{
		return TRUE;
	};
};

func void dia_balthasar_wobengar_info()
{
	AI_Output(other,self,"DIA_Balthasar_WOBENGAR_15_00");	//Как я могу попасть на эти высокогорные пастбища и ферму Бенгара?
	AI_Output(self,other,"DIA_Balthasar_WOBENGAR_05_01");	//Иди по этой дороге до перекрестка.
	AI_Output(self,other,"DIA_Balthasar_WOBENGAR_05_02");	//Если там ты повернешь направо, ты увидишь большую скалу. За ней, справа, и находятся высокогорные пастбища и Проход.
};


instance DIA_BALTHASAR_TALKTOBENGAR(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 6;
	condition = dia_balthasar_talktobengar_condition;
	information = dia_balthasar_talktobengar_info;
	description = "Возможно, мне стоит поговорить с Бенгаром.";
};


func int dia_balthasar_talktobengar_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_aergermitnachbarn) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && ((Npc_IsDead(balthasarsheep1) == FALSE) || (Npc_IsDead(balthasarsheep2) == FALSE) || (Npc_IsDead(balthasarsheep3) == FALSE)))
	{
		return TRUE;
	};
};

func void dia_balthasar_talktobengar_info()
{
	AI_Output(other,self,"DIA_Balthasar_TALKTOBENGAR_15_00");	//Возможно, мне стоит поговорить с Бенгаром.
	AI_Output(self,other,"DIA_Balthasar_TALKTOBENGAR_05_01");	//Ты сделаешь это для меня? Но что бы ты не говорил ему, имей в виду, я не хочу никаких проблем, хорошо?
	AI_Output(other,self,"DIA_Balthasar_TALKTOBENGAR_15_02");	//Посмотрим.
	Log_CreateTopic(TOPIC_BALTHASARSSCHAFE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BALTHASARSSCHAFE,LOG_RUNNING);
	b_logentry(TOPIC_BALTHASARSSCHAFE,"Фермер Бенгар запретил пастуху Бальтазару пасти овец на его высокогорных пастбищах.");
	MIS_BALTHASAR_BENGARSWEIDE = LOG_RUNNING;
};


instance DIA_BALTHASAR_BENGARUEBERREDET(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 8;
	condition = dia_balthasar_bengarueberredet_condition;
	information = dia_balthasar_bengarueberredet_info;
	description = "Ты можешь опять водить своих овец на пастбища Бенгара.";
};


func int dia_balthasar_bengarueberredet_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_talktobengar) && (MIS_BALTHASAR_BENGARSWEIDE == LOG_SUCCESS) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && ((Npc_IsDead(balthasarsheep1) == FALSE) || (Npc_IsDead(balthasarsheep2) == FALSE) || (Npc_IsDead(balthasarsheep3) == FALSE)))
	{
		return TRUE;
	};
};

func void dia_balthasar_bengarueberredet_info()
{
	AI_Output(other,self,"DIA_Balthasar_BENGARUEBERREDET_15_00");	//Ты можешь опять водить своих овец на пастбища Бенгара. Я поговорил с ним.
	AI_Output(self,other,"DIA_Balthasar_BENGARUEBERREDET_05_01");	//Спасибо. Я отправлюсь туда прямо сейчас.
	AI_Output(self,other,"DIA_Balthasar_BENGARUEBERREDET_05_02");	//Вот, возьми эти овечьи шкуры в знак моей благодарности.
	b_giveinvitems(self,other,itat_sheepfur,10);
	BalthasarMovedToBengar = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"BengarsWeide");
	b_giveplayerxp(XP_BALTHASAR_BENGARSWEIDE);
	Wld_InsertNpc(sheep,"NW_BIGMILL_FARM3_BALTHASAR");
	Wld_InsertNpc(sheep,"NW_BIGMILL_FARM3_BALTHASAR");
	Wld_InsertNpc(hammel,"NW_BIGMILL_FARM3_BALTHASAR");
	BALTHASARSHEEP1 = Hlp_GetNpc(balthasar_sheep1);
	if(Hlp_IsValidNpc(balthasarsheep1) && !Npc_IsDead(balthasarsheep1))
	{
		AI_StartState(balthasarsheep1,zs_mm_rtn_follow_sheep_balthasar,1,"");
	};
	BALTHASARSHEEP2 = Hlp_GetNpc(balthasar_sheep2);
	if(Hlp_IsValidNpc(balthasarsheep2) && !Npc_IsDead(balthasarsheep2))
	{
		AI_StartState(balthasarsheep2,zs_mm_rtn_follow_sheep_balthasar,1,"");
	};
	BALTHASARSHEEP3 = Hlp_GetNpc(balthasar_sheep3);
	if(Hlp_IsValidNpc(balthasarsheep3) && !Npc_IsDead(balthasarsheep3))
	{
		AI_StartState(balthasarsheep3,zs_mm_rtn_follow_sheep_balthasar,1,"");
	};
};


instance DIA_BALTHASAR_PERMKAP1(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 70;
	condition = dia_balthasar_permkap1_condition;
	information = dia_balthasar_permkap1_info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int dia_balthasar_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_balthasar_permkap1_info()
{
	AI_Output(other,self,"DIA_Balthasar_PERMKAP1_15_00");	//Все в порядке?
	Npc_PerceiveAll(self);
	if((Wld_DetectNpc(self,balthasar_sheep1,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,balthasar_sheep2,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,balthasar_sheep3,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,hammel,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)))
	{
		AI_Output(self,hero,"DIA_Balthasar_PERMKAP1_05_01");	//Мне не на что жаловаться. Спасибо, что спросил.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,hero,"DIA_Balthasar_PERMKAP1_05_02");	//Настали тяжелые времена. Я не могу найти моих овец!
		if(Npc_IsDead(sekob) == FALSE)
		{
			AI_Output(self,hero,"DIA_Balthasar_PERMKAP1_05_03");	//Я думаю, лучше пойти к Секобу и признаться.
		};
		AI_StopProcessInfos(self);
		if(BalthasarMovedToBengar == TRUE)
		{
			if(KAPITEL < 3)
			{
				Npc_ExchangeRoutine(self,"Start");
			}
			else if(Npc_IsDead(dmt_dementorambientsekob1) && Npc_IsDead(dmt_dementorambientsekob2) && Npc_IsDead(dmt_dementorambientsekob3) && Npc_IsDead(dmt_dementorambientsekob4))
			{
				Npc_ExchangeRoutine(self,"Start");
			}
			else
			{
				Npc_ExchangeRoutine(self,"FleeDMT");
			};
			BalthasarMovedToBengar = FALSE;
		};
	};
};


instance DIA_BALTHASAR_PICKPOCKET(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 900;
	condition = dia_balthasar_pickpocket_condition;
	information = dia_balthasar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_balthasar_pickpocket_condition()
{
	return c_beklauen(10,10);
};

func void dia_balthasar_pickpocket_info()
{
	Info_ClearChoices(dia_balthasar_pickpocket);
	Info_AddChoice(dia_balthasar_pickpocket,DIALOG_BACK,dia_balthasar_pickpocket_back);
	Info_AddChoice(dia_balthasar_pickpocket,DIALOG_PICKPOCKET,dia_balthasar_pickpocket_doit);
};

func void dia_balthasar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_balthasar_pickpocket);
};

func void dia_balthasar_pickpocket_back()
{
	Info_ClearChoices(dia_balthasar_pickpocket);
};

