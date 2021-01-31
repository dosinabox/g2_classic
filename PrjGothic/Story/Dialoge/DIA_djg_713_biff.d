
func void b_kommmit()
{
	AI_Output(other,self,"DIA_AkilsSchaf_KommMit_15_00");	//Иди за мной!
};

func void b_biff_verarschen()
{
	AI_Output(self,other,"DIA_Biff_ARBEITEN_lebenlassen_07_01");	//Я не хочу, чтобы ты делал из меня дурака.
};

func void b_biffsanteil_berechnung()
{
	var int momentankohle;
	var int ueberschusskohle;
	momentankohle = Npc_HasItems(hero,itmi_gold);
	ueberschusskohle = momentankohle - DJG_BIFF_SCGOLD;
	BIFFSANTEIL = ueberschusskohle / 2;
};

func void b_biffsanteil_printscreen()
{
	var string biffsanteiltext_teil;
	var string biffsanteiltext;
	var string anteil;
	anteil = IntToString(BIFFSANTEIL);
	biffsanteiltext_teil = ConcatStrings(PRINT_BIFFSANTEIL,anteil);
	biffsanteiltext = ConcatStrings(biffsanteiltext_teil,PRINT_BIFFGOLD);
	AI_PrintScreen(biffsanteiltext,-1,45,FONT_SCREENSMALL,10);
};

func void b_biff_setrefusetalk()
{
	if(DJG_BIFF_HALBEHALBE == TRUE)
	{
		Npc_SetRefuseTalk(biff,1000);
	}
	else
	{
		Npc_SetRefuseTalk(biff,600);
	};
};


instance DIA_BIFF_EXIT(C_INFO)
{
	npc = djg_713_biff;
	nr = 999;
	condition = dia_biff_exit_condition;
	information = dia_biff_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_biff_exit_condition()
{
	return TRUE;
};

func void dia_biff_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_HALLO(C_INFO)
{
	npc = djg_713_biff;
	nr = 5;
	condition = dia_biff_hallo_condition;
	information = dia_biff_hallo_info;
	description = "Что ты делаешь здесь?";
};


func int dia_biff_hallo_condition()
{
	return TRUE;
};

func void dia_biff_hallo_info()
{
	AI_Output(other,self,"DIA_Biff_HALLO_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Biff_HALLO_07_01");	//Давно уже не слышал такого тупого вопроса. А что, по-твоему?
	Info_AddChoice(dia_biff_hallo,"Я ничего не могу понять из-за твоего идиотского выражения лица.",dia_biff_hallo_spott);
	Info_AddChoice(dia_biff_hallo,"Совершенно не представляю.",dia_biff_hallo_keineahnung);
	Info_AddChoice(dia_biff_hallo,"Ладно, забудь.",dia_biff_hallo_doof);
};

func void dia_biff_hallo_doof()
{
	AI_Output(other,self,"DIA_Biff_HALLO_doof_15_00");	//Ладно, забудь.
	Info_ClearChoices(dia_biff_hallo);
};

func void dia_biff_hallo_spott()
{
	AI_Output(other,self,"DIA_Biff_HALLO_spott_15_00");	//Я ничего не могу понять из-за твоего идиотского выражения лица. Вот почему я и спросил.
	AI_Output(self,other,"DIA_Biff_HALLO_spott_07_01");	//У тебя слишком длинный язык. Я думаю, пришло время подрезать его.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
};

func void dia_biff_hallo_keineahnung()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_15_00");	//Совершенно не представляю.
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_07_01");	//Я жду, когда что-нибудь, наконец, произойдет.
	Info_AddChoice(dia_biff_hallo,"А что должно произойти?",dia_biff_hallo_keineahnung_was);
};

func void dia_biff_hallo_keineahnung_was()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_15_00");	//А что должно произойти?
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_07_01");	//Ох, да ты еще более тупой, чем я думал. Если бы я знал это, я бы не ждал.
	Info_AddChoice(dia_biff_hallo,"А что может произойти?",dia_biff_hallo_keineahnung_was_was2);
};

func void dia_biff_hallo_keineahnung_was_was2()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_was2_15_00");	//А что может произойти?
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_was2_07_01");	//Ты начинаешь действовать мне на нервы. Послушай, меня не волнует, что произойдет. Мне нужно, чтобы что-нибудь произошло.
	Info_AddChoice(dia_biff_hallo,"А почему ты тогда ничего не делаешь?",dia_biff_hallo_keineahnung_was_was2_was3);
};

func void dia_biff_hallo_keineahnung_was_was2_was3()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_15_00");	//А почему ты тогда ничего не делаешь?
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_07_01");	//Если ты не перестанешь задавать идиотские вопросы, я подрежу твой длинный язык.
	Info_AddChoice(dia_biff_hallo,"Если ты будешь просто ждать здесь, ничего и не произойдет!",dia_biff_hallo_keineahnung_was_was2_was3_was4);
};

func void dia_biff_hallo_keineahnung_was_was2_was3_was4()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4_15_00");	//Если ты будешь просто ждать здесь, ничего и не произойдет!
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4_07_01");	//Ты достал меня!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
};


instance DIA_BIFF_WASHIERIMTAL(C_INFO)
{
	npc = djg_713_biff;
	nr = 7;
	condition = dia_biff_washierimtal_condition;
	information = dia_biff_washierimtal_info;
	description = "Что ты надеешься найти здесь, в Долине Рудников?";
};


func int dia_biff_washierimtal_condition()
{
	if(Npc_KnowsInfo(other,dia_biff_hallo))
	{
		return TRUE;
	};
};

func void dia_biff_washierimtal_info()
{
	AI_Output(other,self,"DIA_Biff_WASHIERIMTAL_15_00");	//Что ты надеешься найти здесь, в Долине Рудников?
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_07_01");	//Золото и славу. Что же еще? Когда я покончу с драконами, я буду купаться в золоте.
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_07_02");	//У меня будет достаточно, чтобы провести остаток своей жизни, пытаясь посетить все таверны и бордели в стране.
	Info_AddChoice(dia_biff_washierimtal,"Что ж, тогда я желаю тебе удачи.",dia_biff_washierimtal_vielglueck);
	Info_AddChoice(dia_biff_washierimtal,"Ну да, либо это, либо ты станешь трупом!",dia_biff_washierimtal_ihrtot);
};

func void dia_biff_washierimtal_ihrtot()
{
	AI_Output(other,self,"DIA_Biff_WASHIERIMTAL_ihrtot_15_00");	//Ну да, либо это, либо ты станешь трупом!
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_ihrtot_07_01");	//И что? Это часть игры. Если ты хочешь стать богатым, ты должен рисковать.
	Info_ClearChoices(dia_biff_washierimtal);
};

func void dia_biff_washierimtal_vielglueck()
{
	AI_Output(other,self,"DIA_Biff_WASHIERIMTAL_vielglueck_15_00");	//Что ж, тогда я желаю тебе удачи.
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_vielglueck_07_01");	//Мне не нужна удача. Достаточно моего топора.
	Info_ClearChoices(dia_biff_washierimtal);
};


instance DIA_BIFF_ARBEITEN(C_INFO)
{
	npc = djg_713_biff;
	nr = 8;
	condition = dia_biff_arbeiten_condition;
	information = dia_biff_arbeiten_info;
	permanent = TRUE;
	description = "Ты бы не хотел поработать на меня?";
};


func int dia_biff_arbeiten_condition()
{
	if((DJG_BIFFPARTY == FALSE) && Npc_KnowsInfo(other,dia_biff_hallo) && (DJG_BIFF_STAY == FALSE))
	{
		return TRUE;
	};
};

func void dia_biff_arbeiten_info()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_15_00");	//Ты бы не хотел поработать на меня?
	b_logentry(TOPIC_DRAGONHUNTER,"Охотник на драконов Бифф - типичный наемник. Если я заплачу ему, он будет сражаться вместе со мной.");
	if(DJG_BIFFPARTY_NOMORE >= 6)
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_07_01");	//Мы уже как-то пытались. Из этого не вышло ничего хорошего. Так что спасибо, не хочу.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_07_02");	//Ммм. Почему бы и нет? Как будешь платить?
	};
	Info_ClearChoices(dia_biff_arbeiten);
	Info_AddChoice(dia_biff_arbeiten,"Считай, что тебе повезло, если я оставлю тебя в живых.",dia_biff_arbeiten_lebenlassen);
	Info_AddChoice(dia_biff_arbeiten,"Ты получишь половину добычи.",dia_biff_arbeiten_halbehalbe);
	Info_AddChoice(dia_biff_arbeiten,"Я заплачу тебе 100 золотых.",dia_biff_arbeiten_100);
};

func void dia_biff_arbeiten_100()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_100_15_00");	//Я заплачу тебе 100 золотых.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_100_07_01");	//Хорошо. Меня устраивает. Иди вперед. Я пойду за тобой.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Follow");
		b_biff_setrefusetalk();
		self.aivar[AIV_PARTYMEMBER] = TRUE;
		DJG_BIFFPARTY = TRUE;
	}
	else
	{
		b_biff_verarschen();
		AI_StopProcessInfos(self);
		DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
	};
};

func void dia_biff_arbeiten_halbehalbe()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_HalbeHalbe_15_00");	//Ты получишь половину добычи.
	AI_Output(self,other,"DIA_Biff_ARBEITEN_HalbeHalbe_07_01");	//Звучит заманчиво. Но предупреждаю тебя: не пытайся обмануть меня. Ты пожалеешь об этом.
	AI_Output(self,other,"DIA_Biff_ARBEITEN_HalbeHalbe_07_02");	//И еще одно: мне не нужно оружие и другое барахло, что ты соберешь там. Меня интересует только золото. Понятно?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	DJG_BIFFPARTY = TRUE;
	DJG_BIFF_HALBEHALBE = TRUE;
	b_biff_setrefusetalk();
	if(DJG_BIFF_HALBEHALBE_AGAIN == FALSE)
	{
		DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
		DJG_BIFF_HALBEHALBE_AGAIN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_HalbeHalbe_07_03");	//Но что я говорю. Ты уже знаешь все это.
	};
};

func void dia_biff_arbeiten_lebenlassen()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_lebenlassen_15_00");	//Считай, что тебе повезло, если я оставлю тебя в живых.
	b_biff_verarschen();
	AI_StopProcessInfos(self);
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
};


var int biff_labert_geldeintreiben;

func void b_givebiffsanteil()
{
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_geben_07_01");	//Хорошо. Тогда в путь.
	AI_StopProcessInfos(self);
	b_giveinvitems(other,self,itmi_gold,BIFFSANTEIL);
	b_biff_setrefusetalk();
	BIFF_LABERT_GELDEINTREIBEN = FALSE;
	DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
};

instance DIA_BIFF_GELDEINTREIBEN(C_INFO)
{
	npc = djg_713_biff;
	nr = 9;
	condition = dia_biff_geldeintreiben_condition;
	information = dia_biff_geldeintreiben_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_biff_geldeintreiben_condition()
{
	if((DJG_BIFF_SCGOLD < (Npc_HasItems(hero,itmi_gold) - 1)) && (Npc_GetBodyState(hero) != BS_INVENTORY) && (Npc_GetBodyState(hero) != BS_MOBINTERACT_INTERRUPT) && ((Npc_GetBodyState(hero) != BS_STAND) || (BIFF_LABERT_GELDEINTREIBEN == TRUE)) && ((Npc_GetBodyState(hero) != BS_ITEMINTERACT) || (BIFF_LABERT_GELDEINTREIBEN == TRUE)) && (DJG_BIFF_HALBEHALBE == TRUE) && (DJG_BIFFPARTY == TRUE) && (DJG_BIFF_STAY == FALSE))
	{
		BIFF_LABERT_GELDEINTREIBEN = TRUE;
		return TRUE;
	};
};

func void dia_biff_geldeintreiben_info()
{
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_07_00");	//Минутку! Разве ты не говорил, что половина трофеев принадлежит мне? Давай ее сюда!
	b_biffsanteil_berechnung();
	b_biffsanteil_printscreen();
	Info_ClearChoices(dia_biff_geldeintreiben);
	Info_AddChoice(dia_biff_geldeintreiben,"Я не могу позволить себе такие расходы.",dia_biff_geldeintreiben_zuteuer);
	Info_AddChoice(dia_biff_geldeintreiben,"Вот твоя доля.",dia_biff_geldeintreiben_geben);
};

func void dia_biff_geldeintreiben_geben()
{
	AI_Output(other,self,"DIA_Biff_GELDEINTREIBEN_geben_15_00");	//Вот твоя доля.
	b_givebiffsanteil();
};

func void dia_biff_geldeintreiben_geben2()
{
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_15_02");	//Хорошо, похоже, у меня нет выбора. Давай разделим пополам.
	b_givebiffsanteil();
};

func void dia_biff_geldeintreiben_zuteuer()
{
	AI_Output(other,self,"DIA_Biff_GELDEINTREIBEN_zuTeuer_15_00");	//Я не могу позволить себе такие расходы.
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_zuTeuer_07_01");	//Хватит ныть. Мы договорились на половину.
	Info_ClearChoices(dia_biff_geldeintreiben);
	Info_AddChoice(dia_biff_geldeintreiben,"Боюсь, дальше наши пути расходятся.",dia_biff_geldeintreiben_zuteuer_trennen);
	Info_AddChoice(dia_biff_geldeintreiben,"Хорошо, похоже, у меня нет выбора. Давай разделим пополам.",dia_biff_geldeintreiben_geben2);
};

func void dia_biff_geldeintreiben_zuteuer_trennen()
{
	AI_Output(other,self,"DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_15_00");	//Боюсь, дальше наши пути расходятся.
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_07_01");	//Как скажешь. Тогда я заберу свою долю.
	BIFF_LABERT_GELDEINTREIBEN = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	b_attack(self,other,AR_NONE,1);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BIFFPARTY = FALSE;
	DJG_BIFF_HALBEHALBE = FALSE;
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
};


instance DIA_BIFF_ICHBLEIBHIER(C_INFO)
{
	npc = djg_713_biff;
	nr = 6;
	condition = dia_biff_ichbleibhier_condition;
	information = dia_biff_ichbleibhier_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_biff_ichbleibhier_condition()
{
	if((Npc_GetBodyState(hero) != BS_INVENTORY) && (Npc_GetBodyState(hero) != BS_MOBINTERACT_INTERRUPT) && (DJG_BIFFPARTY == TRUE) && (DJG_BIFF_STAY == FALSE) && (((((Npc_GetDistToWP(self,"OW_SWAMPDRAGON_01") < 4000) && (Npc_IsDead(swampdragon) == FALSE) && (swampdragon.flags != 0)) || ((Npc_GetDistToWP(self,"LOCATION_19_03_PATH_RUIN8") < 2000) && (Npc_IsDead(rockdragon) == FALSE) && (rockdragon.flags != 0)) || ((Npc_GetDistToWP(self,"CASTLE_36") < 4000) && (Npc_IsDead(firedragon) == FALSE) && (firedragon.flags != 0)) || ((Npc_GetDistToWP(self,"OW_ICEDRAGON_01") < 4000) && (Npc_IsDead(icedragon) == FALSE) && (icedragon.flags != 0))) && (Npc_HasItems(hero,itmi_innoseye_mis) >= 1)) || (Npc_GetDistToWP(self,"OC_CENTER_GUARD_02") < 4500)))
	{
		return TRUE;
	};
};

func void dia_biff_ichbleibhier_info()
{
	AI_Output(self,other,"DIA_Biff_ICHBLEIBHIER_07_00");	//Очень опасная местность. Ты иди первым. А я буду прикрывать тебя сзади.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
	if(Npc_GetDistToWP(self,"OW_SWAMPDRAGON_01") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_Swamp");
	};
	if(Npc_GetDistToWP(self,"LOCATION_19_03_PATH_RUIN8") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_Rock");
	};
	if(Npc_GetDistToWP(self,"CASTLE_36") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_Fire");
	};
	if(Npc_GetDistToWP(self,"OW_ICEDRAGON_01") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_Ice");
	};
	if(Npc_GetDistToWP(self,"OC_CENTER_GUARD_02") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_AwayFromOC");
	};
	DJG_BIFF_STAY = TRUE;
	DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
};


instance DIA_BIFF_STAY_AWAYFROMOC(C_INFO)
{
	npc = djg_713_biff;
	condition = dia_biff_stay_awayfromoc_condition;
	information = dia_biff_stay_awayfromoc_info;
	nr = 3;
	permanent = TRUE;
	description = "(опять взять с собой Биффа)";
};


func int dia_biff_stay_awayfromoc_condition()
{
	if(((Npc_GetDistToWP(self,"OW_PATH_298") < 300) || (Npc_GetDistToWP(self,"LOCATION_19_01") < 300)) && (DJG_BIFFPARTY == TRUE) && (DJG_BIFF_STAY == TRUE))
	{
		return TRUE;
	};
};

func void dia_biff_stay_awayfromoc_info()
{
	b_kommmit();
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
	DJG_BIFF_STAY = FALSE;
	DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
};


instance DIA_BIFF_KOHLEWEGGEBEN(C_INFO)
{
	npc = djg_713_biff;
	condition = dia_biff_kohleweggeben_condition;
	information = dia_biff_kohleweggeben_info;
	nr = 10;
	important = TRUE;
	permanent = TRUE;
};


func int dia_biff_kohleweggeben_condition()
{
	if((DJG_BIFF_SCGOLD > Npc_HasItems(hero,itmi_gold)) && (DJG_BIFF_HALBEHALBE == TRUE) && (DJG_BIFFPARTY == TRUE) && (DJG_BIFF_STAY == FALSE))
	{
		return TRUE;
	};
};

func void dia_biff_kohleweggeben_info()
{
	AI_Output(self,other,"DIA_Biff_KOHLEWEGGEBEN_07_00");	//Не разбрасывай свое золото.
	AI_Output(self,other,"DIA_Biff_KOHLEWEGGEBEN_07_01");	//Лучше дай мне его сюда.
	AI_StopProcessInfos(self);
	DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
};


instance DIA_BIFF_BIFFLOSWERDEN(C_INFO)
{
	npc = djg_713_biff;
	nr = 11;
	condition = dia_biff_biffloswerden_condition;
	information = dia_biff_biffloswerden_info;
	permanent = TRUE;
	description = "Я думаю, на этом наше сотрудничество можно считать оконченным.";
};


func int dia_biff_biffloswerden_condition()
{
	if(DJG_BIFFPARTY == TRUE)
	{
		return TRUE;
	};
};

func void dia_biff_biffloswerden_info()
{
	AI_Output(other,self,"DIA_Biff_BIFFLOSWERDEN_15_00");	//Я думаю, на этом наше сотрудничество можно считать оконченным.
	AI_Output(self,other,"DIA_Biff_BIFFLOSWERDEN_07_01");	//Как знаешь. Я найду себе работу и получше. Бывай.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BIFF_HALBEHALBE = FALSE;
	DJG_BIFFPARTY = FALSE;
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
};


instance DIA_BIFF_MEHRGELD(C_INFO)
{
	npc = djg_713_biff;
	nr = 12;
	condition = dia_biff_mehrgeld_condition;
	information = dia_biff_mehrgeld_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_biff_mehrgeld_condition()
{
	if((DJG_BIFFPARTY == TRUE) && (Npc_RefuseTalk(self) == FALSE) && (DJG_BIFF_STAY == FALSE))
	{
		return TRUE;
	};
};


var int dia_biff_mehrgeld_info_onetime;

func void dia_biff_mehrgeld_info()
{
	AI_Output(self,other,"DIA_Biff_MEHRGELD_07_00");	//Мне почему-то кажется, что я должен получить с тебя больше денег.
	if(DJG_BIFF_HALBEHALBE == TRUE)
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_07_01");	//100 золотых будет достаточно.
		if(dia_biff_mehrgeld_info_onetime == FALSE)
		{
			AI_Output(self,other,"DIA_Biff_MEHRGELD_07_02");	//Не бойся. Я не забыл, что мы делим трофеи поровну.
			AI_Output(self,other,"DIA_Biff_MEHRGELD_07_03");	//Вот почему я не приставал к тебе с просьбами дать мне еще денег.
			dia_biff_mehrgeld_info_onetime = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_07_04");	//Я хочу еще 100 золотых.
	};
	Info_ClearChoices(dia_biff_mehrgeld);
	Info_AddChoice(dia_biff_mehrgeld,"Я не могу платить тебе.",dia_biff_mehrgeld_zuteuer);
	Info_AddChoice(dia_biff_mehrgeld,"Хорошо. Ты этого стоишь.",dia_biff_mehrgeld_ok);
};

func void dia_biff_mehrgeld_ok()
{
	AI_Output(other,self,"DIA_Biff_MEHRGELD_ok_15_00");	//Хорошо. Ты этого стоишь.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_ok_07_01");	//Да уж, это точно. Теперь, пошли дальше.
		AI_StopProcessInfos(self);
		if(DJG_BIFF_HALBEHALBE == TRUE)
		{
			DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
		};
		b_biff_setrefusetalk();
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_ok_07_02");	//Ах ты ничтожество! Ты даже не можешь заплатить компаньону.
		AI_Output(self,other,"DIA_Biff_MEHRGELD_ok_07_03");	//Я думаю, мне стоит поискать другого партнера.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		DJG_BIFF_HALBEHALBE = FALSE;
		DJG_BIFFPARTY = FALSE;
		DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 2;
	};
};

func void dia_biff_mehrgeld_zuteuer()
{
	AI_Output(other,self,"DIA_Biff_MEHRGELD_zuTeuer_15_00");	//Я не могу платить тебе.
	AI_Output(self,other,"DIA_Biff_MEHRGELD_zuTeuer_07_01");	//Тогда тебе придется дальше топать в одиночку.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BIFFPARTY = FALSE;
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 2;
};


instance DIA_BIFF_HEILUNG(C_INFO)
{
	npc = djg_713_biff;
	nr = 4;
	condition = dia_biff_heilung_condition;
	information = dia_biff_heilung_info;
	permanent = TRUE;
	description = "Тебе нужно лечебное зелье?";
};


func int dia_biff_heilung_condition()
{
	if(DJG_BIFFPARTY == TRUE)
	{
		return TRUE;
	};
};

func void dia_biff_heilung_info()
{
	AI_Output(other,self,"DIA_Biff_HEILUNG_15_00");	//Тебе нужно лечебное зелье?
	AI_Output(self,other,"DIA_Biff_HEILUNG_07_01");	//Конечно. Не помешает.
	Info_ClearChoices(dia_biff_heilung);
	Info_AddChoice(dia_biff_heilung,"Я дам тебе что-нибудь позже.",dia_biff_heilung_spaeter);
	Info_AddChoice(dia_biff_heilung,"(самое маленькое лечебное зелье)",dia_biff_heilung_heiltranklow);
	Info_AddChoice(dia_biff_heilung,"(лучшее лечебное зелье)",dia_biff_heilung_heiltrank);
};

func void dia_biff_heilung_heiltrank()
{
	if(b_giveinvitems(other,self,itpo_health_03,1))
	{
		b_useitem(self,itpo_health_03);
	}
	else if(b_giveinvitems(other,self,itpo_health_02,1))
	{
		b_useitem(self,itpo_health_02);
	}
	else if(b_giveinvitems(other,self,itpo_health_01,1))
	{
		b_useitem(self,itpo_health_01);
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_HEILUNG_heiltrank_07_00");	//Я думаю, я могу подождать, когда ты раздобудешь его для меня.
	};
	AI_StopProcessInfos(self);
};

func void dia_biff_heilung_heiltranklow()
{
	if(b_giveinvitems(other,self,itpo_health_01,1))
	{
		b_useitem(self,itpo_health_01);
	}
	else if(b_giveinvitems(other,self,itpo_health_02,1))
	{
		b_useitem(self,itpo_health_02);
	}
	else if(b_giveinvitems(other,self,itpo_health_03,1))
	{
		b_useitem(self,itpo_health_03);
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_HEILUNG_heiltrankLow_07_00");	//К сожалению, его у тебя нет. Вернемся к этому вопросу позже.
	};
	AI_StopProcessInfos(self);
};

func void dia_biff_heilung_spaeter()
{
	AI_Output(other,self,"DIA_Biff_HEILUNG_spaeter_15_00");	//Я дам тебе что-нибудь позже.
	AI_Output(self,other,"DIA_Biff_HEILUNG_spaeter_07_01");	//Только не забудь.
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_DRACHENTOT(C_INFO)
{
	npc = djg_713_biff;
	nr = 5;
	condition = dia_biff_drachentot_condition;
	information = dia_biff_drachentot_info;
	description = "Вот так. Все драконы мертвы.";
};


func int dia_biff_drachentot_condition()
{
	if(DJG_BIFFSURVIVEDLASTDRAGON == TRUE)
	{
		return TRUE;
	};
};

func void dia_biff_drachentot_info()
{
	AI_Output(other,self,"DIA_Biff_DRACHENTOT_15_00");	//Вот так. Все драконы мертвы.
	AI_Output(self,other,"DIA_Biff_DRACHENTOT_07_01");	//Да. И я все еще жив.
	AI_Output(self,other,"DIA_Biff_DRACHENTOT_07_02");	//Ты уверен, что это был последний?
	AI_Output(other,self,"DIA_Biff_DRACHENTOT_15_03");	//Думаю, да.
	AI_Output(self,other,"DIA_Biff_DRACHENTOT_07_04");	//Жаль. А я только размялся.
	b_giveplayerxp(XP_BIFFSURVIVEDLASTDRAGON);
};


instance DIA_BIFF_KNOWWHEREENEMY(C_INFO)
{
	npc = djg_713_biff;
	nr = 2;
	condition = dia_biff_knowwhereenemy_condition;
	information = dia_biff_knowwhereenemy_info;
	permanent = TRUE;
	description = "Ты не хотел бы совершить небольшое путешествие по миру?";
};


func int dia_biff_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (BIFF_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_biff_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_15_00");	//Ты не хотел бы совершить небольшое путешествие по миру?
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_07_01");	//Что?
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_15_02");	//Ничего. Мой корабль все равно полон.
		AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_07_03");	//Тогда не беспокой меня попусту.
	}
	else
	{
		AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_15_04");	//Я собираюсь покинуть Хоринис и отправиться на другой остров. Там должны быть еще враги.
		Info_ClearChoices(dia_biff_knowwhereenemy);
		Info_AddChoice(dia_biff_knowwhereenemy,"Мне казалось, я уже говорил об этом.",dia_biff_knowwhereenemy_no);
		Info_AddChoice(dia_biff_knowwhereenemy,"Ты не хочешь присоединиться?",dia_biff_knowwhereenemy_yes);
	};
};

func void dia_biff_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_Yes_15_00");	//Ты не хочешь присоединиться?
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_Yes_07_01");	//Меня не волнуют враги. Мне нужно...
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_Yes_15_02");	//Там куда мы направляемся, больше золота, чем ты сможешь унести.
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_Yes_07_03");	//В таком случае, я в деле. Куда мы направляемся?
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_Yes_15_04");	//Сначала нам нужно выбраться из Долины Рудников.
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_Yes_07_05");	//Нет проблем. Я уже в пути. Встретимся у Прохода.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Перспектива разбогатеть убедила Биффа присоединиться ко мне. Пока он получает достаточно золота, я могу рассчитывать на него.");
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	self.flags = NPC_FLAG_IMMORTAL;
	BIFF_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	BIFF_FOLLOWSTHROUGHPASS = LOG_RUNNING;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RunsToPass");
	Info_ClearChoices(dia_biff_knowwhereenemy);
};

func void dia_biff_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_No_15_00");	//Мне казалось, я уже говорил об этом.
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_No_07_01");	//Да, да. Тогда повеселимся.
	BIFF_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_biff_knowwhereenemy);
};


instance DIA_BIFF_PASS(C_INFO)
{
	npc = djg_713_biff;
	nr = 55;
	condition = dia_biff_pass_condition;
	information = dia_biff_pass_info;
	permanent = TRUE;
	description = "Ты пройдешь сам через Проход?";
};


func int dia_biff_pass_condition()
{
	if((Npc_GetDistToWP(self,"START") < 1000) && (BIFF_ISONBOARD == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_biff_pass_info()
{
	AI_Output(other,self,"DIA_Biff_Pass_15_00");	//Ты пройдешь сам через Проход?
	AI_Output(self,other,"DIA_Biff_Pass_07_01");	//Хватит болтать. Пошли. Я хочу, наконец, опять начать действовать.
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_PICKPOCKET(C_INFO)
{
	npc = djg_713_biff;
	nr = 900;
	condition = dia_biff_pickpocket_condition;
	information = dia_biff_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_biff_pickpocket_condition()
{
	return c_beklauen(92,320);
};

func void dia_biff_pickpocket_info()
{
	Info_ClearChoices(dia_biff_pickpocket);
	Info_AddChoice(dia_biff_pickpocket,DIALOG_BACK,dia_biff_pickpocket_back);
	Info_AddChoice(dia_biff_pickpocket,DIALOG_PICKPOCKET,dia_biff_pickpocket_doit);
};

func void dia_biff_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_biff_pickpocket);
};

func void dia_biff_pickpocket_back()
{
	Info_ClearChoices(dia_biff_pickpocket);
};

