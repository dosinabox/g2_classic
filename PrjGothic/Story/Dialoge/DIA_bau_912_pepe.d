
instance DIA_PEPE_EXIT(C_INFO)
{
	npc = bau_912_pepe;
	nr = 999;
	condition = dia_pepe_exit_condition;
	information = dia_pepe_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pepe_exit_condition()
{
	return TRUE;
};

func void dia_pepe_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PEPE_HALLO(C_INFO)
{
	npc = bau_912_pepe;
	nr = 1;
	condition = dia_pepe_hallo_condition;
	information = dia_pepe_hallo_info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int dia_pepe_hallo_condition()
{
	return TRUE;
};

func void dia_pepe_hallo_info()
{
	AI_Output(other,self,"DIA_Pepe_Hallo_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Pepe_Hallo_03_01");	//(скучая) Стерегу овец! (вздыхает) И, по возможности, стараюсь держаться подальше от неприятностей.
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(other,self,"DIA_Pepe_Hallo_15_02");	//Это не всегда возможно, да?
		AI_Output(self,other,"DIA_Pepe_Hallo_03_03");	//Да уж, особенно когда дело касается наемников. Я очень рад, что работаю здесь, на пастбище, подальше от них. Хотя и здесь не совсем безопасно.
	};
};


instance DIA_PEPE_DANGER(C_INFO)
{
	npc = bau_912_pepe;
	nr = 2;
	condition = dia_pepe_danger_condition;
	information = dia_pepe_danger_info;
	permanent = FALSE;
	description = "А что опасного на пастбище?";
};


func int dia_pepe_danger_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_hallo))
	{
		return TRUE;
	};
};

func void dia_pepe_danger_info()
{
	AI_Output(other,self,"DIA_Pepe_Danger_15_00");	//А что опасного на пастбище?
	AI_Output(self,other,"DIA_Pepe_Danger_03_01");	//Неподалеку бродит небольшая стая волков. Эти проклятые твари почти каждый день утаскивают одну из моих овец.
	AI_Output(self,other,"DIA_Pepe_Danger_03_02");	//Несколько дней назад у меня было в два раза больше овец. Мне не хочется даже думать, что Онар сделает со мной, когда узнает об этом.
};


instance DIA_PEPE_WHYNOTSLD(C_INFO)
{
	npc = bau_912_pepe;
	nr = 3;
	condition = dia_pepe_whynotsld_condition;
	information = dia_pepe_whynotsld_info;
	permanent = FALSE;
	description = "Почему ты не скажешь наемникам о волках? Мне казалось, это их работа.";
};


func int dia_pepe_whynotsld_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_danger) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_pepe_whynotsld_info()
{
	AI_Output(other,self,"DIA_Pepe_WhyNotSLD_15_00");	//Почему ты не скажешь наемникам о волках? Мне казалось, это их работа.
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_01");	//Да, я знаю. Я должен был сделать это. Но не сделал, черт!
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_02");	//А теперь, когда столько овец пропало, я боюсь кому-нибудь говорить об этом.
	AI_Output(other,self,"DIA_Pepe_WhyNotSLD_15_03");	//Но ты только что сказал МНЕ...
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_04");	//(сердито) Я уже пожалел об этом.
};


instance DIA_PEPE_KILLWOLVES(C_INFO)
{
	npc = bau_912_pepe;
	nr = 4;
	condition = dia_pepe_killwolves_condition;
	information = dia_pepe_killwolves_info;
	permanent = FALSE;
	description = "Что если я убью этих волков?";
};


func int dia_pepe_killwolves_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_danger))
	{
		return TRUE;
	};
};

func void dia_pepe_killwolves_info()
{
	AI_Output(other,self,"DIA_Pepe_KillWolves_15_00");	//Что если я убью этих волков?
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_01");	//(насмешливо) Ты, сам? Ха ха. Я не верю в это. Я скорее поверю, что мой баран-вожак расправится с ними.
	AI_Output(other,self,"DIA_Pepe_KillWolves_15_02");	//Забудь об этом. Это было всего лишь предположение. Я пойду к парням, и посмотрим, что ОНИ скажут насчет этого...
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_03");	//(испуганно) Подожди минутку. Хорошо, хорошо! Эээ... ты величайший воин, и ты можешь уложить сотню волков одной левой. Нет проблем!
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_04");	//Обычно они шныряют в лесу около пастбища. (как бы между прочим) Я думаю, их всего четверо...
	AI_StopProcessInfos(self);
	Wld_InsertNpc(pepes_ywolf1,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_01");
	Wld_InsertNpc(pepes_ywolf2,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_02");
	Wld_InsertNpc(pepes_ywolf3,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_03");
	Wld_InsertNpc(pepes_ywolf4,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_04");
	MIS_PEPE_KILLWOLVES = LOG_RUNNING;
	Log_CreateTopic(TOPIC_PEPEWOLVES,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PEPEWOLVES,LOG_RUNNING);
	b_logentry(TOPIC_PEPEWOLVES,"Овцы Пепе страдают от волков. Я должен прогнать их.");
};


instance DIA_PEPE_KILLEDWOLVES(C_INFO)
{
	npc = bau_912_pepe;
	nr = 5;
	condition = dia_pepe_killedwolves_condition;
	information = dia_pepe_killedwolves_info;
	permanent = TRUE;
	description = "Я расправился с волками.";
};


func int dia_pepe_killedwolves_condition()
{
	if(MIS_PEPE_KILLWOLVES == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_pepe_killedwolves_info()
{
	AI_Output(other,self,"DIA_Pepe_KilledWolves_15_00");	//Я расправился с волками.
	if(Npc_IsDead(pepes_ywolf1) && Npc_IsDead(pepes_ywolf2) && Npc_IsDead(pepes_ywolf3) && Npc_IsDead(pepes_ywolf4))
	{
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_01");	//(пораженно) Ты сделал это! Слава Инносу!
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_02");	//Но я все равно не знаю, как сказать Онару, что его овцы пропали.
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_03");	//(себе под нос) Это все этот чертов Булко виноват!
		MIS_PEPE_KILLWOLVES = LOG_SUCCESS;
		b_giveplayerxp(XP_PEPEWOLVES);
	}
	else
	{
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_04");	//ты меня считаешь за идиота? Эти звери еще не все мертвы.
	};
};


instance DIA_PEPE_BULLCO(C_INFO)
{
	npc = bau_912_pepe;
	nr = 5;
	condition = dia_pepe_bullco_condition;
	information = dia_pepe_bullco_info;
	permanent = FALSE;
	description = "Что ты сказал насчет Булко?";
};


func int dia_pepe_bullco_condition()
{
	if((MIS_PEPE_KILLWOLVES == LOG_SUCCESS) && !Npc_IsDead(bullco) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_pepe_bullco_info()
{
	AI_Output(other,self,"DIA_Pepe_Bullco_15_00");	//Что ты сказал насчет Булко?
	AI_Output(self,other,"DIA_Pepe_Bullco_03_01");	//Это один из наемников. Это его работа охранять пастбище.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_02");	//Но вместо этого он и его приятель Сильвио день напролет ошиваются в кухне у Теклы.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_03");	//Это этот ублюдок будет виноват, если мне не заплатят за многие недели работы из-за потери овец.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_04");	//Как я хотел бы набить ему морду. Но никому это не по силам. Этот парень - убийца.
	MIS_PEPE_KICKBULLCO = LOG_RUNNING;
	Log_CreateTopic(TOPIC_KICKBULLCO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KICKBULLCO,LOG_RUNNING);
	b_logentry(TOPIC_KICKBULLCO,"Булко плохо охраняет овец Пепе. Пепе хочет, чтобы кто-нибудь проучил его.");
};


instance DIA_PEPE_BULLCODEFEATED(C_INFO)
{
	npc = bau_912_pepe;
	nr = 5;
	condition = dia_pepe_bullcodefeated_condition;
	information = dia_pepe_bullcodefeated_info;
	permanent = FALSE;
	description = "Булко получил по заслугам.";
};


func int dia_pepe_bullcodefeated_condition()
{
	if(MIS_PEPE_KICKBULLCO == LOG_RUNNING)
	{
		if((bullco.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (djg_bullco.aivar[AIV_DEFEATEDBYPLAYER] == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_pepe_bullcodefeated_info()
{
	AI_Output(other,self,"DIA_Pepe_BullcoDefeated_15_00");	//Булко получил по заслугам. Я преподал ему урок.
	AI_Output(self,other,"DIA_Pepe_BullcoDefeated_03_01");	//Эта свинья заслужила это.
	MIS_PEPE_KICKBULLCO = LOG_SUCCESS;
	b_giveplayerxp(XP_KICKBULLCO);
};


instance DIA_PEPE_PERM(C_INFO)
{
	npc = bau_912_pepe;
	nr = 6;
	condition = dia_pepe_perm_condition;
	information = dia_pepe_perm_info;
	permanent = TRUE;
	description = "Как дела, как твои овцы?";
};


func int dia_pepe_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_hallo))
	{
		return TRUE;
	};
};

func void dia_pepe_perm_info()
{
	AI_Output(other,self,"DIA_Pepe_PERM_15_00");	//Как дела, как твои овцы?
	if(KAPITEL <= 1)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_01");	//Прекрасно. И с овцами все в порядке. Ну, с теми, что еще остались у меня, все в порядке.
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_02");	//Хорошо. Но могут придти другие волки. И, возможно, в большем количестве!
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_03");	//Я слышал странные вещи. Говорят, что на ферме Секоба появились страшные личности. Они заняли его дом.
	};
	if(KAPITEL >= 4)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_04");	//Я слышал, что какие-то бандиты поселились на ферме Лобарта. Кто-нибудь должен помочь ему.
	};
};


instance DIA_PEPE_LIESEL(C_INFO)
{
	npc = bau_912_pepe;
	nr = 7;
	condition = dia_pepe_liesel_condition;
	information = dia_pepe_liesel_info;
	permanent = FALSE;
	description = "Могу я купить овцу?";
};


func int dia_pepe_liesel_condition()
{
	if(Npc_KnowsInfo(hero,dia_pepe_hallo))
	{
		return TRUE;
	};
};

func void dia_pepe_liesel_info()
{
	AI_Output(other,self,"DIA_Pepe_Liesel_15_00");	//Могу я купить овцу?
	AI_Output(self,other,"DIA_Pepe_Liesel_03_01");	//Когда захочешь, если у тебя есть деньги. Овца стоит 100 золотых монет.
	AI_Output(self,other,"DIA_Pepe_Liesel_03_02");	//Если ты заплатишь, можешь выбрать себе овцу. Но ты должен пообещать хорошо с ней обращаться.
};


var int pepe_schafgekauft;

instance DIA_PEPE_BUYLIESEL(C_INFO)
{
	npc = bau_912_pepe;
	nr = 8;
	condition = dia_pepe_buyliesel_condition;
	information = dia_pepe_buyliesel_info;
	permanent = TRUE;
	description = "Вот 100 золотых монет. Давай мне овцу.";
};


func int dia_pepe_buyliesel_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_liesel))
	{
		return TRUE;
	};
};

func void dia_pepe_buyliesel_info()
{
	AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_00");	//Вот 100 золотых монет. Давай мне овцу.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		if(PEPE_SCHAFGEKAUFT == 0)
		{
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_01");	//Хорошо. Возьми Бетси - ты найдешь ее на пастбище.
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_02");	//Просто скажи ей, что она должна идти с тобой. Она очень умна для овцы. Не обижай ее!
		}
		else
		{
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_03");	//Опять? Хорошо. Возьми Бетси.
			AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_04");	//Бетси? Но последнюю овцу, что я взял у тебя, тоже звали Бетси...
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_05");	//Всех овец зовут Бетси.
			if(PEPE_SCHAFGEKAUFT == 3)
			{
				AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_06");	//За исключением баранов, конечно же.
				AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_07");	//А как их зовут?
				AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_08");	//Брюс.
			};
		};
		PEPE_SCHAFGEKAUFT = PEPE_SCHAFGEKAUFT + 1;
		Wld_InsertNpc(follow_sheep,"NW_BIGFARM_SHEEP2_02");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_09");	//У тебя недостаточно золота. А я не могу продать овцу дешевле.
	};
};


instance DIA_PEPE_PICKPOCKET(C_INFO)
{
	npc = bau_912_pepe;
	nr = 900;
	condition = dia_pepe_pickpocket_condition;
	information = dia_pepe_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_pepe_pickpocket_condition()
{
	return c_beklauen(15,25);
};

func void dia_pepe_pickpocket_info()
{
	Info_ClearChoices(dia_pepe_pickpocket);
	Info_AddChoice(dia_pepe_pickpocket,DIALOG_BACK,dia_pepe_pickpocket_back);
	Info_AddChoice(dia_pepe_pickpocket,DIALOG_PICKPOCKET,dia_pepe_pickpocket_doit);
};

func void dia_pepe_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_pepe_pickpocket);
};

func void dia_pepe_pickpocket_back()
{
	Info_ClearChoices(dia_pepe_pickpocket);
};

