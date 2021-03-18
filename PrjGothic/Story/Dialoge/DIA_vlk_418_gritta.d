
instance DIA_GRITTA_EXIT(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 999;
	condition = dia_gritta_exit_condition;
	information = dia_gritta_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gritta_exit_condition()
{
	if(KAPITEL <= 2)
	{
		return TRUE;
	};
};

func void dia_gritta_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GRITTA_PICKPOCKET(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 900;
	condition = dia_gritta_pickpocket_condition;
	information = dia_gritta_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20_FEMALE;
};


func int dia_gritta_pickpocket_condition()
{
	return c_beklauen(20,20);
};

func void dia_gritta_pickpocket_info()
{
	Info_ClearChoices(dia_gritta_pickpocket);
	Info_AddChoice(dia_gritta_pickpocket,DIALOG_BACK,dia_gritta_pickpocket_back);
	Info_AddChoice(dia_gritta_pickpocket,DIALOG_PICKPOCKET,dia_gritta_pickpocket_doit);
};

func void dia_gritta_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_gritta_pickpocket);
};

func void dia_gritta_pickpocket_back()
{
	Info_ClearChoices(dia_gritta_pickpocket);
};


instance DIA_GRITTA_HELLO(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 10;
	condition = dia_gritta_hello_condition;
	information = dia_gritta_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gritta_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_gritta_hello_info()
{
	AI_Output(self,other,"DIA_Gritta_Hello_16_00");	//Что тебе нужно, чужеземец? Если ты пришел просить милостыню, я вынуждена разочаровать тебя. Я бедная вдова.
	AI_Output(self,other,"DIA_Gritta_Hello_16_01");	//Меня зовут Гритта. С тех пор, как умер мой муж, я слежу за домом моего дяди, Торбена.
};


instance DIA_GRITTA_WANTSMONEY(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 2;
	condition = dia_gritta_wantsmoney_condition;
	information = dia_gritta_wantsmoney_info;
	permanent = FALSE;
	description = "Меня прислал Маттео. Он говорит, что ты задолжала ему.";
};


func int dia_gritta_wantsmoney_condition()
{
	if(MIS_MATTEO_GOLD == LOG_RUNNING)
	{
		return TRUE;
	};
};


var int gritta_wantpay;
var int gritta_threatened;

func void dia_gritta_wantsmoney_info()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_15_00");	//Меня прислал Маттео. Он говорит, что ты задолжала ему.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_01");	//Он хочет получить деньги? За что? То, что он мне прислал, ни на что не годится. Ткань отвратительная, а швы расползаются прямо на глазах.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_02");	//А ты выдел, какого они цвета? Это не тот цвет, что я заказывала. Это надувательство!
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_03");	//Послушай, если бы мой муж был жив, он бы не посмел заявлять такое. Ох, мой бедный муж...
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Хватит. Где золото?",dia_gritta_wantsmoney_wheremoney);
	Info_AddChoice(dia_gritta_wantsmoney,"(слушать дальше)",dia_gritta_wantsmoney_continue01);
};

func void dia_gritta_wantsmoney_continue01()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue01_16_00");	//...он был таким хорошим человеком. Красивый, работящий, настоящий джентльмен. У нас было все. Богатство, счастье...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue01_16_01");	//...иногда нас даже приглашали в высший свет. На торжества, где можно было похвастаться нарядом и прической...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue01_16_02");	//...на званые обеды... Тогда все было совсем по-другому. Тогда никто бы не осмелился унижать бедную вдову такими...
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Хватит. Где золото?",dia_gritta_wantsmoney_wheremoney);
	Info_AddChoice(dia_gritta_wantsmoney,"(слушать дальше)",dia_gritta_wantsmoney_continue02);
};

func void dia_gritta_wantsmoney_continue02()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue02_16_00");	//...нелепыми заявлениями. А что мне теперь делать? Моя пенсия еле позволяет сводить концы с концами, а жизнь становится все труднее и труднее. Да ты сам это можешь видеть...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue02_16_01");	//...людям приходится экономить и потуже затягивать пояса. Уже много недель ни один корабль не заходил в город. Мой муж был капитаном торгового корабля - на самом деле, он даже владел этим кораблем...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue02_16_02");	//...из своих долгих плаваний он всегда привозил мне подарки - изысканные ткани с материка, дорогие специи из южных стран...
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Хватит. Где золото?",dia_gritta_wantsmoney_wheremoney);
	Info_AddChoice(dia_gritta_wantsmoney,"(слушать дальше)",dia_gritta_wantsmoney_continue03);
};

func void dia_gritta_wantsmoney_continue03()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue03_16_00");	//...большинство даже не слышали о таких вещах. Но однажды, я получила известие, что Гритта затонула - так назывался этот корабль, мой муж назвал его так из...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue03_16_01");	//...любви ко мне. Я плакала и молилась, чтобы моему мужу удалось выжить в этой катастрофе. Я надеялась, я ждала новостей о нем, но все мои молитвы были тщетными...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue04_16_02");	//...да смилостивится Иннос над его душой. Пусть он спит спокойно. С тех пор мне приходится жить вот в этих скромных условиях. А теперь этот бездушный, бессердечный Маттео...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue04_16_03");	//...хочет отнять у меня последние сбережения. Пожалуйста, сжалься над бедной женщиной. Если бы мой муж был жив, Маттео не посмел бы сделать это. Ох, мой бедный муж...
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Хватит. Где золото?",dia_gritta_wantsmoney_wheremoney);
	Info_AddChoice(dia_gritta_wantsmoney,"(слушать дальше)",dia_gritta_wantsmoney_continue01);
};

func void dia_gritta_wantsmoney_wheremoney()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_WhereMoney_15_00");	//Хватит. Где золото?
	AI_Output(self,other,"DIA_Gritta_WantsMoney_WhereMoney_16_01");	//(вызывающе) Но у меня нет золота, я бедная вдова!
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Выкладывай деньги, или мне придется проучить тебя!",dia_gritta_wantsmoney_beatup);
	Info_AddChoice(dia_gritta_wantsmoney,"Тогда мы просто продадим некоторые из твоих тряпок.",dia_gritta_wantsmoney_enoughstuff);
	Info_AddChoice(dia_gritta_wantsmoney,"Я собираюсь заплатить эту сумму за тебя.",dia_gritta_wantsmoney_iwillpay);
};

func void dia_gritta_wantsmoney_enoughstuff()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_EnoughStuff_15_00");	//Тогда мы просто продадим некоторые из твоих тряпок. Я уверен, что в твоем сундуке их целая груда...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_01");	//Как ты смеешь, деревенщина! Ладно, вот, возьми золото.
	b_giveinvitems(self,other,itmi_gold,100);
	AI_Output(other,self,"DIA_Gritta_WantsMoney_EnoughStuff_15_02");	//(ухмыляется) Видишь, это было не так уж сложно.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_03");	//(раздраженно) А теперь, пожалуйста, покинь мой дом.
	GRITTA_GOLDGIVEN = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_gritta_wantsmoney_iwillpay()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_IWillPay_15_00");	//Я собираюсь заплатить эту сумму за тебя.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_IWillPay_16_01");	//Ты сделаешь это ради меня? Ох, я знала, что ты не такой жадный как этот Маттео!
	AI_Output(other,self,"DIA_Gritta_WantsMoney_IWillPay_15_02");	//Да, да, не стоит благодарностей.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_IWillPay_16_03");	//Возвращайся, когда вернешь деньги Маттео - я хочу отблагодарить тебя.
	Info_ClearChoices(dia_gritta_wantsmoney);
	GRITTA_WANTPAY = TRUE;
};

func void dia_gritta_wantsmoney_beatup()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_BeatUp_15_00");	//(угрожающе) Выкладывай деньги, или мне придется проучить тебя!
	AI_Output(self,other,"DIA_Gritta_WantsMoney_BeatUp_16_01");	//(вызывающе) Да ты просто обычный бандит. Давай, доставая свое оружие, и я позову стражу!
	GRITTA_THREATENED = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_GRITTA_WINE(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 2;
	condition = dia_gritta_wine_condition;
	information = dia_gritta_wine_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gritta_wine_condition()
{
	if(Npc_IsInState(self,zs_talk) && (GRITTA_WANTPAY == TRUE) && (MIS_MATTEO_GOLD == LOG_SUCCESS) && (Npc_HasItems(self,itmi_gold) >= 100))
	{
		return TRUE;
	};
};

func void dia_gritta_wine_info()
{
	AI_Output(self,other,"DIA_Gritta_WINE_16_00");	//Это было очень благородно с твоей стороны заплатить за меня. Я хочу отблагодарить тебя.
	AI_Output(self,other,"DIA_Gritta_WINE_16_01");	//Вот бутылка вина, которую мой муж, да упокоит Иннос его душу, привез с южных островов.
	AI_Output(self,other,"DIA_Gritta_WINE_16_02");	//Также я расскажу о тебе всем! Наконец-то в городе появился человек, чья добродетель...
	AI_Output(other,self,"DIA_Gritta_WINE_15_03");	//Да-да, не стоит благодарностей.
	b_giveplayerxp(XP_PAYFORGRITTA);
	b_giveinvitems(self,other,itfo_wine,1);
	AI_StopProcessInfos(self);
};


instance DIA_GRITTA_PERM(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 3;
	condition = dia_gritta_perm_condition;
	information = dia_gritta_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_gritta_perm_condition()
{
	if(Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(other,dia_gritta_wantsmoney) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_gritta_perm_info()
{
	if(Npc_KnowsInfo(other,dia_gritta_wine) && (Npc_HasItems(self,itmi_gold) >= 100))
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_00");	//Пока в городе есть такие люди как ты, меня не оставляет надежда, что все еще будет хорошо.
	}
	else if((GRITTA_WANTPAY == TRUE) && (Npc_HasItems(self,itmi_gold) >= 100))
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_01");	//Возвращайся, когда уладишь вопрос с Маттео.
	}
	else if((GRITTA_THREATENED == TRUE) && (Npc_HasItems(self,itmi_gold) >= 100))
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_02");	//Что ты уставился на меня как идиот? Ты все равно не осмелишься ударить меня!
	}
	else
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_03");	//Что еще тебе нужно? Ты получил мое золото! Убирайся!
	};
	AI_StopProcessInfos(self);
};


instance DIA_GRITTA_KAP3_EXIT(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 999;
	condition = dia_gritta_kap3_exit_condition;
	information = dia_gritta_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gritta_kap3_exit_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_gritta_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


var int grittaxp_once;

instance DIA_GRITTA_PERM3U4U5(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 31;
	condition = dia_gritta_perm3u4u5_condition;
	information = dia_gritta_perm3u4u5_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int dia_gritta_perm3u4u5_condition()
{
	return TRUE;
};

func void dia_gritta_perm3u4u5_info()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_15_00");	//Как дела?
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_01");	//Все здесь катится в тартарары. Куда не взглянешь, везде одни преступления и насилие. Только представь, недавно убили даже паладина!
			Info_ClearChoices(dia_gritta_perm3u4u5);
			Info_AddChoice(dia_gritta_perm3u4u5,DIALOG_BACK,dia_gritta_perm3u4u5_back);
			Info_AddChoice(dia_gritta_perm3u4u5,"Эта война - ради вас. Такое случается.",dia_gritta_perm3u4u5_war);
			Info_AddChoice(dia_gritta_perm3u4u5,"Все будет хорошо.",dia_gritta_perm3u4u5_turnsgood);
			Info_AddChoice(dia_gritta_perm3u4u5,"Что ты слышала?",dia_gritta_perm3u4u5_rumors);
		}
		else
		{
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_02");	//Ох, я так взволнована. Лорд Хаген освободил этого наемника.
			AI_Output(other,self,"DIA_Gritta_Perm3U4U5_15_03");	//А какое это имеет отношение к тебе?
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_04");	//Да ты сам подумай. Ты веришь, что наемники сидели бы, сложа руки, когда их товарища собирались повесить?
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_05");	//Они бы попытались освободить его, и пролилось бы много крови. Но, слава Инносу, все разрешилось удачно.
		};
	}
	else if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_06");	//Паладины к чему-то готовятся. Похоже, они собираются уходить из города.
	}
	else
	{
		AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_07");	//Все как всегда, но я не хочу жаловаться.
	};
};

func void dia_gritta_perm3u4u5_back()
{
	Info_ClearChoices(dia_gritta_perm3u4u5);
};

func void dia_gritta_perm3u4u5_war()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_War_15_00");	//Эта война - ради вас. Такое случается.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_War_16_01");	//Да, всему виной эта ужасная война. Все страдают от нее. Не знаю даже, как им удается сводить концы с концами.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_War_16_02");	//Иногда я спрашиваю себя, что мы сделали, чтобы заслужить такое наказание от Инноса.
};

func void dia_gritta_perm3u4u5_turnsgood()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_TurnsGood_15_00");	//Все будет хорошо.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_TurnsGood_16_01");	//Ты пытаешься подбодрить меня. Это мило.
	if(GRITTAXP_ONCE == FALSE)
	{
		b_giveplayerxp(XP_AMBIENT);
		GRITTAXP_ONCE = TRUE;
	};
};

func void dia_gritta_perm3u4u5_rumors()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_Rumors_15_00");	//Что ты слышала?
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_Rumors_16_01");	//Только то, что говорят на улицах.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_Rumors_16_02");	//Я слышала, что убийцу уже поймали, но я не знаю, правда это или нет.
};

