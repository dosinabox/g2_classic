
instance DIA_MORGAHARD_EXIT(C_INFO)
{
	npc = bdt_1030_morgahard;
	nr = 999;
	condition = dia_morgahard_exit_condition;
	information = dia_morgahard_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_morgahard_exit_condition()
{
	return TRUE;
};

func void dia_morgahard_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MORGAHARD_HALLO(C_INFO)
{
	npc = bdt_1030_morgahard;
	nr = 3;
	condition = dia_morgahard_hallo_condition;
	information = dia_morgahard_hallo_info;
	description = "Ты Моргахард.";
};


func int dia_morgahard_hallo_condition()
{
	return TRUE;
};

func void dia_morgahard_hallo_info()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_00");	//Ты Моргахард.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_01");	//Откуда ты знаешь мое имя?
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_02");	//Тебя ищет судья. Ты сбежал из тюрьмы.
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_03");	//Что ты сделал такого? Украл его бумажник?
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_04");	//Не его. Губернатора. По его наводке.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_05");	//А после того как мы напали на губернатора, он не захотел делиться награбленным с нами и посадил нас за решетку.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_06");	//Нам не хотелось болтаться на виселице, поэтому мы сбежали.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_07");	//Мы думали, что нас здесь не найдут. Но похоже, мы ошибались.
	Info_ClearChoices(dia_morgahard_hallo);
	Info_AddChoice(dia_morgahard_hallo,"Хватит хныкать. Доставай свое оружие.",dia_morgahard_hallo_attack);
	Info_AddChoice(dia_morgahard_hallo,"Что мы можем сделать с судьей?",dia_morgahard_hallo_richter);
	Info_AddChoice(dia_morgahard_hallo,"Судья приказал мне убить тебя.",dia_morgahard_hallo_tot);
	b_logentry(TOPIC_RICHTERLAKAI,"Я нашел Моргахарда, главаря бродяг.");
	SCFOUNDMORGAHARD = TRUE;
	b_giveplayerxp(XP_FOUNDMORGAHARD);
};

func void dia_morgahard_hallo_tot()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_tot_15_00");	//Судья приказал мне убить тебя.
	AI_Output(self,other,"DIA_Morgahard_HALLO_tot_07_01");	//Да, конечно. За этим ты и пришел, да?
};

func void dia_morgahard_hallo_richter()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_00");	//Что мы можем сделать с судьей?
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_01");	//Ничего. Он засел в верхнем квартале города как паук в паутине. Неприкосновенный.
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_02");	//Я бы так не сказал. Нам нужно доказательство его вины в деле губернатора.
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_03");	//Доказательство говоришь? У меня есть оно. Но кто послушает беглого преступника?
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_04");	//Дай мне это доказательство, и я позабочусь, чтобы за вами больше никто не охотился.
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_05");	//Ты уверен? Хорошо. Вот, возьми это письмо. Оно подписано судьей.
	b_giveinvitems(self,other,itwr_richterkomprobrief_mis,1);
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_06");	//Если это и не снимет с меня вину, оно позволит доказать, что судья был соучастником в этом деле.
	b_logentry(TOPIC_RICHTERLAKAI,"Моргахард передал мне бумагу с приказом судьи. Этот клочок бумаги доказывает, что судья ограбил губернатора Лариуса. Я думаю, это именно то, что хотел найти Ли.");
	AI_StopProcessInfos(self);
};


var int morgahardsucked;

func void dia_morgahard_hallo_attack()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_attack_15_00");	//Хватит хныкать. Доставай свое оружие. Мы положим этому делу конец.
	AI_Output(self,other,"DIA_Morgahard_HALLO_attack_07_01");	//Отлично. Мне все равно нечего терять.
	AI_StopProcessInfos(self);
	MORGAHARDSUCKED = TRUE;
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};


instance DIA_MORGAHARD_PERM(C_INFO)
{
	npc = bdt_1030_morgahard;
	nr = 3;
	condition = dia_morgahard_perm_condition;
	information = dia_morgahard_perm_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_morgahard_perm_condition()
{
	if(Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(other,dia_morgahard_hallo) && (MORGAHARDSUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_morgahard_perm_info()
{
	AI_Output(self,other,"DIA_Morgahard_Perm_07_00");	//А этот подлец судья... Я еще увижу его болтающимся на виселице.
	AI_StopProcessInfos(self);
};


instance DIA_MORGAHARD_PERM2(C_INFO)
{
	npc = bdt_1030_morgahard;
	nr = 3;
	condition = dia_morgahard_perm2_condition;
	information = dia_morgahard_perm2_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_morgahard_perm2_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MORGAHARDSUCKED == TRUE))
	{
		return TRUE;
	};
};

func void dia_morgahard_perm2_info()
{
	AI_Output(self,other,"DIA_Morgahard_Perm2_07_00");	//Почему бы тебе просто не исчезнуть?
	AI_StopProcessInfos(self);
};


instance DIA_MORGAHARD_PICKPOCKET(C_INFO)
{
	npc = bdt_1030_morgahard;
	nr = 900;
	condition = dia_morgahard_pickpocket_condition;
	information = dia_morgahard_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_morgahard_pickpocket_condition()
{
	return c_beklauen(73,45);
};

func void dia_morgahard_pickpocket_info()
{
	Info_ClearChoices(dia_morgahard_pickpocket);
	Info_AddChoice(dia_morgahard_pickpocket,DIALOG_BACK,dia_morgahard_pickpocket_back);
	Info_AddChoice(dia_morgahard_pickpocket,DIALOG_PICKPOCKET,dia_morgahard_pickpocket_doit);
};

func void dia_morgahard_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_morgahard_pickpocket);
};

func void dia_morgahard_pickpocket_back()
{
	Info_ClearChoices(dia_morgahard_pickpocket);
};

