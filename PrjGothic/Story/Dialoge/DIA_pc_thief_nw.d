
instance DIA_DIEGONW_EXIT(C_INFO)
{
	npc = pc_thief_nw;
	nr = 999;
	condition = dia_diegonw_exit_condition;
	information = dia_diegonw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_diegonw_exit_condition()
{
	return TRUE;
};

func void dia_diegonw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DIEGONW_PERM(C_INFO)
{
	npc = pc_thief_nw;
	nr = 800;
	condition = dia_diegonw_perm_condition;
	information = dia_diegonw_perm_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int dia_diegonw_perm_condition()
{
	if((Diego_IsOnBoard == FALSE) && (Kapitel > 3))
	{
		return TRUE;
	};
};

func void dia_diegonw_perm_info()
{
	AI_Output(other,self,"DIA_DiegoNW_Perm_15_00");	//Как дела?
	AI_Output(self,other,"DIA_DiegoNW_Perm_11_01");	//Паршиво. Почему никто не сказал мне, что Хоринис за это время полностью разорился?
	AI_Output(other,self,"DIA_DiegoNW_Perm_15_02");	//Понятия не имею. Я знаю этот город только таким.
	AI_Output(self,other,"DIA_DiegoNW_Perm_11_03");	//Ты бы видел его несколько лет назад. Он бы тебе совсем не понравился в нынешнем состоянии.
};


instance DIA_DIEGONW_NEEDHELP(C_INFO)
{
	npc = pc_thief_nw;
	nr = 1;
	condition = dia_diegonw_needhelp_condition;
	information = dia_diegonw_needhelp_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_diegonw_needhelp_condition()
{
	if(DIEGO_ISONBOARD == FALSE)
	{
		return TRUE;
	};
};

func void dia_diegonw_needhelp_info()
{
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_11_00");	//Хорошо, что ты здесь. Ты должен помочь мне.
	Info_ClearChoices(dia_diegonw_needhelp);
	if(!Npc_KnowsInfo(other,DIA_DiegoOW_Hallo))
	{
		Info_AddChoice(DIA_DiegoNW_NeedHelp,"Кто ты?",DIA_DiegoNW_NeedHelp_WhoAreYou);
	};
	Info_AddChoice(dia_diegonw_needhelp,"Что это на тебе за одежда?",dia_diegonw_needhelp_clothes);
	Info_AddChoice(dia_diegonw_needhelp,"Что ты делаешь здесь?",dia_diegonw_needhelp_plan);
	Info_AddChoice(dia_diegonw_needhelp,"Какие планы?",dia_diegonw_needhelp_problem);
};

func void dia_diegonw_needhelp_plan()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Plan_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Plan_11_01");	//За мной следит стража. Они всегда начеку.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Plan_11_02");	//Не думаю, что мне будет легко устроиться здесь.
};

func void dia_diegonw_needhelp_whoareyou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_01");	//Черт, это все, наверное, из-за одежды. В старой одежде стражники не пустили бы меня в город.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_02");	//Вот почему я купил это одеяние у торговца за городом. Теперь-то, надеюсь, ты вспомнил меня? Я Диего.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_03");	//В старой колонии я учил тебя всему, что необходимо для выживания.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_04");	//Ты же не мог вот так просто все забыть.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_05");	//Ээ... а что именно произошло там?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_06");	//Черт побери! Ты действительно ничего не помнишь.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_07");	//Послушай, у меня действительно нет времени объяснять все тебе теперь. Послушай только одно: мы были чертовски хорошими друзьями, и я не раз спасал твою жизнь.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_08");	//А теперь мне нужна твоя помощь.
};

func void dia_diegonw_needhelp_clothes()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Clothes_15_00");	//Что это на тебе за одежда?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_01");	//Я купил ее у торговца за городом. Стража не хотела пропускать меня в город.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_02");	//Также не стоит никому говорить, откуда я пришел.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Clothes_15_03");	//Это имеет смысл.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_04");	//Я тоже так думаю. Но даже хотя я снял свой старый наряд, я все равно остался прежним.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_05");	//И у меня большие планы касательно этого города.
};

func void dia_diegonw_needhelp_problem()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_00");	//Какие планы?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_01");	//Здесь многое переменилось с тех пор, как я покинул его. Мне как-то нужно опять встать на ноги.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_02");	//В чем проблема?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_03");	//Я должен попасть в верхний квартал.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_04");	//Но я не гражданин этого города, и у меня нет денег, чтобы подкупить стражу. Вот зачем нужен ты!
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_05");	//То есть, ты хочешь, чтобы я одолжил тебе золота?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_06");	//Чушь. У меня есть золото. Я бы сказал даже целая куча золота! Но, к сожалению, оно не при мне.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_07");	//Ты должен забрать мое золото там, где оно находится.
	Info_ClearChoices(dia_diegonw_needhelp);
	Info_AddChoice(dia_diegonw_needhelp,"У меня нет времени на это.",dia_diegonw_needhelp_problem_notime);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Что мне с этого будет?",DIA_DiegoNW_NeedHelp_Problem_Reward);
	Info_AddChoice(dia_diegonw_needhelp,"Ладно, я помогу тебе.",dia_diegonw_needhelp_problem_willhelpyou);
};

func void dia_diegonw_needhelp_problem_notime()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_00");	//У меня нет времени на это.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_01");	//Эй, я думал мы друзья! Это ведь я, не забывай, спасал твою задницу, когда тебя бросили в колонию.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_02");	//Ты преувеличиваешь.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_03");	//Да?! А ты задумайся на минутку, что могло бы быть, если бы я не объяснил тебе тогда, как нужно вести себя в колонии.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_04");	//Рудные бароны сожрали бы тебя на завтрак, и ты бы подох жалкой смертью где-нибудь в шахте.
	MIS_HELPDIEGONW = LOG_FAILED;
	Info_ClearChoices(dia_diegonw_needhelp);
};

func void dia_diegonw_needhelp_problem_reward()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_Reward_15_00");	//Что мне с этого будет?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_Reward_11_01");	//Я когда-нибудь спрашивал тебя, что ты мне дашь взамен? Мы же друзья, разве этого недостаточно?
};

func void dia_diegonw_needhelp_problem_willhelpyou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_15_00");	//Ладно, я помогу тебе.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_01");	//Прекрасно. Слушай внимательно. Когда Барьер еще был на месте, я спрятал в Долине Рудников небольшой клад.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_02");	//Это было довольно давно, и поэтому когда я оттуда уходил, я забыл его забрать.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_03");	//А сейчас мне очень нужны эти деньги.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_11_03");	//Если вкратце, ты должен пойти в Долину Рудников и забрать мое золото.
	MIS_HELPDIEGONW = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HELPDIEGONW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HELPDIEGONW,LOG_RUNNING);
	B_LogEntry(TOPIC_HelpDiegoNW,"Золото Диего находится в Долине Рудников. Оно нужно ему, чтобы попасть в верхнюю часть города, и он попросил меня найти это золото.");
	Info_ClearChoices(dia_diegonw_needhelp);
	Info_AddChoice(dia_diegonw_needhelp,"Что ты собираешься делать с этим золотом?",dia_diegonw_needhelp_problem_willhelpyou_yourplan);
	Info_AddChoice(dia_diegonw_needhelp,"Откуда у тебя это золото?",dia_diegonw_needhelp_problem_willhelpyou_howgold);
	Info_AddChoice(dia_diegonw_needhelp,"Где спрятано это золото?",dia_diegonw_needhelp_problem_willhelpyou_wheregold);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Почему ты не заберешь его сам?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_Why);
};

func void dia_diegonw_needhelp_problem_willhelpyou_yourplan()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_15_00");	//Что ты собираешься делать с этим золотом?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_01");	//Я хочу свести счеты с одним из торговцев в верхнем квартале. Я очень этого хочу.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_02");	//А затем я буду готов начать новую карьеру!
};

func void dia_diegonw_needhelp_problem_willhelpyou_howgold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_15_00");	//Откуда у тебя это золото?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_01");	//Я что, единственный что ли, кто откладывал золото для себя в Долине Рудников?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_02");	//Украсть несколько кусков золота было легче легкого. Просто на случай, если нам когда-нибудь удастся выбраться оттуда.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_HowGold_11_03");	//Все были так сосредоточены на руде, что на золото никто не обращал внимания...
};

func void dia_diegonw_needhelp_problem_willhelpyou_wheregold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_00");	//Где спрятано это золото?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_01");	//Прямо на торговой площади. Над заброшенной шахтой. Оно в кожаном кошельке.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_11_02");	//Я собирался пойти и забрать его, но неожиданно около этого места появилась банда орков.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_02");	//Но проверь, чтобы это был тот самый кошелек, чтобы не ходить туда вхолостую.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_03");	//Как я опознаю его?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_04");	//Он полон золота. Доверху полон!
	Info_AddChoice(dia_diegonw_needhelp,"Я попытаюсь найти твое золото.",dia_diegonw_needhelp_problem_willhelpyou_wheregold_end_tryit);
	b_logentry(TOPIC_HELPDIEGONW,"Золото Диего находится где-то на старой торговой площади, там, где товары переправлялись в колонию по канатной дороге, над заброшенной шахтой.");
};

func void dia_diegonw_needhelp_problem_willhelpyou_wheregold_end_tryit()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_TryIt_15_00");	//Я попытаюсь найти твое золото.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_TryIt_11_01");	//(ухмыляется) Сделай это. Этого будет достаточно для меня.
	Info_ClearChoices(dia_diegonw_needhelp);
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_Why()
{
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_04");	//Почему ты не заберешь его сам?
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_05");	//Потому что там, где оно спрятано, ошиваются орки. Ты как нельзя лучше подходишь для этой работы, поверь мне.
};


instance DIA_DIEGONW_HELPYOU(C_INFO)
{
	npc = pc_thief_nw;
	nr = 30;
	condition = dia_diegonw_helpyou_condition;
	information = dia_diegonw_helpyou_info;
	permanent = FALSE;
	description = "Ладно, я все же помогу тебе.";
};


func int dia_diegonw_helpyou_condition()
{
	if((DIEGO_ISONBOARD == FALSE) && (MIS_HELPDIEGONW == LOG_FAILED) && (DIEGO_ISONBOARD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_diegonw_helpyou_info()
{
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_00");	//Ладно, я все же помогу тебе.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_01");	//Я знал это.
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_02");	//Давай перейдем сразу к делу.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_03");	//Хорошо. Я спрятал золото в Долине Рудников, и ты должен забрать его оттуда для меня.
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_04");	//Почему ты не заберешь его сам?
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_05");	//Потому что там, где оно спрятано, ошиваются орки. Ты как нельзя лучше подходишь для этой работы, поверь мне.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_06");	//А я буду ждать здесь и все подготовлю для дальнейших действий.
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold();
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_Why();
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt();
	MIS_HELPDIEGONW = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HelpDiegoNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HelpDiegoNW,LOG_Running);
	B_LogEntry(TOPIC_HelpDiegoNW,"Золото Диего находится в Долине Рудников. Оно нужно ему, чтобы попасть в верхнюю часть города, и он попросил меня найти это золото.");
};


instance DIA_DIEGONW_HAVEYOURGOLD(C_INFO)
{
	npc = pc_thief_nw;
	nr = 31;
	condition = dia_diegonw_haveyourgold_condition;
	information = dia_diegonw_haveyourgold_info;
	permanent = TRUE;
	description = "Я нашел твое золото!";
};


func int dia_diegonw_haveyourgold_condition()
{
	if(((OpenedDiegosBag == TRUE) || Npc_HasItems(other,ItSe_DiegosTreasure_Mis)) && (MIS_HelpDiegoNW == LOG_Running) && (Diego_IsOnBoard != LOG_Success))
	{
		return TRUE;
	};
};

func void b_diegonw_diegosrevenge()
{
	AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_05");	//Очень хорошо. Пусть Гербрандт теперь дрожит от страха.
};


var int diegosrevenge;

func void dia_diegonw_haveyourgold_info()
{
	AI_Output(other,self,"DIA_DiegoNW_HaveYourGold_15_00");	//Я нашел твое золото!
	AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_01");	//Отлично. Покажи.
	if(Npc_HasItems(other,ItSe_DiegosTreasure_Mis))
	{
		b_giveinvitems(other,self,itse_diegostreasure_mis,1);
		b_diegonw_diegosrevenge();
		DIEGOSREVENGE = TRUE;
	}
	else if(Npc_HasItems(other,itmi_gold) < DIEGOSTREASURE)
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_02");	//Но здесь не все! Ты что, не доверяешь мне? Мне нужна вся сумма.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_03");	//Если мой план сработает, золота останется достаточно и для тебя.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_04");	//Так что, пожалуйста, принеси всю сумму. Это очень важно!
	}
	else
	{
		b_giveinvitems(other,self,itmi_gold,DIEGOSTREASURE);
		b_diegonw_diegosrevenge();
		DIEGOSREVENGE = TRUE;
	};
	if(!Npc_IsDead(Gerbrandt) && (DiegosRevenge == TRUE))
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_06");	//Послушай, я все еще не договорился со стражей.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_07");	//Я хочу, чтобы ты отнес это письмо Гербрандту. Это один из торговцев в верхнем квартале.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_08");	//Передай ему привет от меня. А затем встретимся перед домом Гербрандта.
		CreateInvItems(self,itwr_diegosletter_mis,1);
		b_giveinvitems(self,other,itwr_diegosletter_mis,1);
		b_startotherroutine(gerbrandt,"WaitForDiego");
		MIS_HELPDIEGONW = LOG_SUCCESS;
		MIS_DIEGOSRESIDENCE = LOG_RUNNING;
		b_giveplayerxp(XP_HELPDIEGONW);
		Log_CreateTopic(TOPIC_DIEGOSRESIDENCE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DIEGOSRESIDENCE,LOG_RUNNING);
		b_logentry(TOPIC_DIEGOSRESIDENCE,"Диего дал мне письмо для торговца Гербрандта.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_DIEGONW_DELIVEREDLETTER(C_INFO)
{
	npc = pc_thief_nw;
	nr = 30;
	condition = dia_diegonw_deliveredletter_condition;
	information = dia_diegonw_deliveredletter_info;
	permanent = FALSE;
	description = "Я доставил твое письмо.";
};


func int dia_diegonw_deliveredletter_condition()
{
	if((DIEGO_ISONBOARD == FALSE) && (MIS_DIEGOSRESIDENCE == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_diegonw_deliveredletter_info()
{
	AI_Output(other,self,"DIA_DiegoNW_DeliveredLetter_15_00");	//Я доставил твое письмо.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_01");	//Очень хорошо. Как Гербрандт воспринял это?
	AI_Output(other,self,"DIA_DiegoNW_DeliveredLetter_15_02");	//Он был в шоке и моментально исчез куда-то.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_03");	//(удовлетворенно) Я так и думал.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_04");	//Боюсь, правда, что в первую очередь мне придется заняться обстановкой моего нового дома. Если я правильно помню, вкус у Гербрандта просто ужасный.
	b_giveplayerxp(XP_DIEGOHASANEWHOME);
	Wld_AssignRoomToGuild("reich01",GIL_PUBLIC);
	B_StartOtherRoutine(Gerbrandt,"NEWLIFE");
	Info_ClearChoices(dia_diegonw_deliveredletter);
	Info_AddChoice(dia_diegonw_deliveredletter,"Как тебе удалось провернуть это?",dia_diegonw_deliveredletter_yourtrick);
	Info_AddChoice(dia_diegonw_deliveredletter,"Значит, это теперь твой дом?",dia_diegonw_deliveredletter_yourhouse);
};

func void dia_diegonw_deliveredletter_gerbrandt()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_15_00");	//Что насчет Гербрандта?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_01");	//Он наслаждался беззаботной жизнью слишком долго.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_02");	//Он жил здесь, купаясь в роскоши, когда я питался похлебкой из мясных жуков.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_03");	//Понятия не имею, куда он сбежал отсюда, но он больше не осмелится появиться в Хоринисе вновь - я позабочусь об этом.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_04");	//Если ты ищешь его, попробуй пошарить в портовом квартале.
};

func void dia_diegonw_deliveredletter_yourhouse()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_00");	//Значит, это теперь твой дом?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_01");	//Да, от погреба до чердака! Со всей мебелью!
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_02");	//Я столько лет провел в невыносимых условиях и теперь мечтаю о том, как я буду спать в огромной кровати с балдахином.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_03");	//А потом, на завтрак, я буду есть превосходный окорок и запивать его дорогим вином.
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_04");	//Да, ты своего не упустишь.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_05");	//Точно.
};

func void dia_diegonw_deliveredletter_yourtrick()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_00");	//Как тебе удалось провернуть это?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_01");	//Ты думаешь, Гербрандт заработал свое состояние на честном бизнесе?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_02");	//Конечно, он никогда не марал руки, когда доходило до грязных дел. У него для этого был помощник.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_03");	//А на моей совести тогда много чего было. Гербрандт, в конце концов, решил избавиться от меня. Вероятно, он опасался, что я знаю слишком много.
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_04");	//Ты никогда не говорил мне об этом.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_05");	//А ты никогда и не спрашивал.
	Info_ClearChoices(dia_diegonw_deliveredletter);
	Info_AddChoice(dia_diegonw_deliveredletter,DIALOG_BACK,dia_diegonw_deliveredletter_yourtrick_back);
	Info_AddChoice(dia_diegonw_deliveredletter,"Что насчет моей доли?",dia_diegonw_deliveredletter_yourtrick_reward);
	Info_AddChoice(dia_diegonw_deliveredletter,"Что насчет Гербрандта?",dia_diegonw_deliveredletter_gerbrandt);
};

func void dia_diegonw_deliveredletter_yourtrick_reward()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_15_00");	//Что насчет моей доли?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_01");	//Похоже, ты ничего не забыл из того, чему я учил тебя.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_02");	//Но ты прав, у меня ничего бы не вышло без твоей помощи. Вот твоя доля.
	CreateInvItems(self,itmi_gold,500);
	b_giveinvitems(self,other,itmi_gold,500);
};

func void dia_diegonw_deliveredletter_yourtrick_back()
{
	Info_ClearChoices(dia_diegonw_deliveredletter);
};


var int diego_teach;

instance DIA_DIEGONW_CANYOUTEACH(C_INFO)
{
	npc = pc_thief_nw;
	nr = 888;
	condition = dia_diegonw_canyouteach_condition;
	information = dia_diegonw_canyouteach_info;
	permanent = TRUE;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int dia_diegonw_canyouteach_condition()
{
	if(Diego_Teach == FALSE)
	{
		return TRUE;
	};
};

func void dia_diegonw_canyouteach_info()
{
	AI_Output(other,self,"DIA_DiegoNW_CanYouTeach_15_00");	//Ты можешь научить меня чему-нибудь?
	if(Npc_KnowsInfo(other,dia_diegonw_deliveredletter))
	{
		AI_Output(self,other,"DIA_DiegoNW_CanYouTeach_11_01");	//Да, конечно. Дай мне знать, когда будешь готов.
		DIEGO_TEACH = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoOW_Teach_11_01");	//Сейчас не время для этого. У меня есть дела поважнее.
		AI_Output(self,other,"DIA_DiegoNW_CanYouTeach_11_02");	//Сначала мне нужно решить свои проблемы.
	};
};


var int diegonw_merke_dex;
var int DiegoNW_Merke_STR;

instance DIA_DIEGONW_TEACH(C_INFO)
{
	npc = pc_thief_nw;
	nr = 888;
	condition = dia_diegonw_teach_condition;
	information = dia_diegonw_teach_info;
	permanent = TRUE;
	description = "Обучи меня.";
};


func int dia_diegonw_teach_condition()
{
	if(Diego_Teach == TRUE)
	{
		return TRUE;
	};
};

func void dia_diegonw_teach_info()
{
	AI_Output(other,self,"DIA_DiegoNW_Teach_15_00");	//Обучи меня.
	AI_Output(self,other,"DIA_DiegoNW_Teach_11_01");	//Я могу научить тебя, как стать более ловким.
	AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_01");	//Конечно. Что ты хочешь знать?
	DIEGONW_MERKE_DEX = other.attribute[ATR_DEXTERITY];
	Info_ClearChoices(dia_diegonw_teach);
	Info_AddChoice(dia_diegonw_teach,DIALOG_BACK,dia_diegonw_teach_back);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_diegonw_teachdex_1);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_diegonw_teachdex_5);
};

func void dia_diegonw_teach_back()
{
	if(DIEGONW_MERKE_DEX < other.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,other,"DIA_DiegoNW_Teach_BACK_11_00");	//Ты уже стал более ловким. Так держать!
	};
	Info_ClearChoices(dia_diegonw_teach);
};

func void dia_diegonw_teachdex_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,100);
	Info_ClearChoices(dia_diegonw_teach);
	Info_AddChoice(dia_diegonw_teach,DIALOG_BACK,dia_diegonw_teach_back);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_diegonw_teachdex_1);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_diegonw_teachdex_5);
};

func void dia_diegonw_teachdex_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,100);
	Info_ClearChoices(dia_diegonw_teach);
	Info_AddChoice(dia_diegonw_teach,DIALOG_BACK,dia_diegonw_teach_back);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_diegonw_teachdex_1);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_diegonw_teachdex_5);
};


instance DIA_DIEGONW_KNOWWHEREENEMY(C_INFO)
{
	npc = pc_thief_nw;
	nr = 55;
	condition = dia_diegonw_knowwhereenemy_condition;
	information = dia_diegonw_knowwhereenemy_info;
	permanent = TRUE;
	description = "Я собираюсь покинуть Хоринис.";
};


func int dia_diegonw_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (DIEGO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};


var int SCToldDiegoHeKnowWhereEnemy;

func void dia_diegonw_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_15_00");	//Я собираюсь покинуть Хоринис.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_01");	//Мудрое решение. Я был бы не прочь отправиться с тобой. Этот город изменился слишком быстро - времена, когда здесь можно было разбогатеть, уже в прошлом.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_02");	//Я мог бы научить тебя метко стрелять, пользоваться отмычками и мог бы повысить твою ловкость.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_03");	//Также, я уверен, тебе не помешает хороший вор.
	if(SCToldDiegoHeKnowWhereEnemy == FALSE)
	{
		Log_CreateTopic(Topic_Crew,LOG_MISSION);
		Log_SetTopicStatus(Topic_Crew,LOG_Running);
		B_LogEntry(Topic_Crew,"Конечно же, Диего готов пойти со мной. Ему кажется, что чем скорее он покинет Хоринис, тем лучше. Он мог бы научить меня, как стать более ловким и сделать из меня отличного лучника. Также он может научить меня пользоваться отмычками.");
		SCToldDiegoHeKnowWhereEnemy = TRUE;
	};
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_15_04");	//Я подумаю над этим. Но пока моя команда полностью укомплектована.
		AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_05");	//Не торопись. Я все равно никуда не денусь.
	}
	else
	{
		Info_ClearChoices(dia_diegonw_knowwhereenemy);
		Info_AddChoice(dia_diegonw_knowwhereenemy,"Возможно, я дам тебе знать, когда придет время.",dia_diegonw_knowwhereenemy_no);
		Info_AddChoice(DIA_DiegoNW_KnowWhereEnemy,"Почему бы тебе не отправиться в путь со мной? Встретимся в гавани.",DIA_DiegoNW_KnowWhereEnemy_Yes);
	};
};

func void dia_diegonw_knowwhereenemy_yes()
{
	var C_Item DiegoArmor;
	DiegoArmor = Npc_GetEquippedArmor(self);
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_Yes_15_00");	//Почему бы тебе не отправиться в путь со мной? Встретимся в гавани.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_01");	//Ммм. Ты прав, в Хоринисе все равно нечего делать. Я поплыву с тобой.
	self.flags = NPC_FLAG_IMMORTAL;
	DIEGO_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_UPTOWN_PATH_23") && !Hlp_IsItem(DiegoArmor,ITAR_Diego))
	{
		AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_02");	//Подожди, я буду готов через минуту.
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		if(!Npc_HasItems(self,ITAR_Diego))
		{
			CreateInvItems(self,ITAR_Diego,1);
		};
		AI_EquipArmor(self,itar_diego);
		AI_Wait(self,1);
		AI_GotoWP(self,"NW_CITY_UPTOWN_PATH_23");
	};
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_03");	//Ну, я готов. Встретимся у корабля.
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_diegonw_knowwhereenemy);
};

func void dia_diegonw_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_No_15_00");	//Возможно, я дам тебе знать, когда придет время.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_No_11_01");	//Попробуй. И, возможно, я даже присоединюсь к тебе. Кто знает?
	DIEGO_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_diegonw_knowwhereenemy);
};


instance DIA_DIEGONW_LEAVEMYSHIP(C_INFO)
{
	npc = pc_thief_nw;
	nr = 55;
	condition = dia_diegonw_leavemyship_condition;
	information = dia_diegonw_leavemyship_info;
	permanent = TRUE;
	description = "Ты должен заботиться о городе.";
};


func int dia_diegonw_leavemyship_condition()
{
	if((DIEGO_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_diegonw_leavemyship_info()
{
	var C_Item DiegoArmor;
	DiegoArmor = Npc_GetEquippedArmor(self);
	AI_Output(other,self,"DIA_DiegoNW_LeaveMyShip_15_00");	//Ты должен заботиться о городе.
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_01");	//Да? Я тебе больше не нужен? Ох, ладно. Не забудь заглянуть ко мне, когда вернешься в город.
	AI_Output(other,self,"DIA_DiegoNW_LeaveMyShip_15_02");	//Ты думаешь, мы еще встретимся?
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_03");	//Я никогда не забуду выражение твоего лица, когда ты лежал на земле после того, как Буллит вырубил тебя. Тогда мы встретились в первый раз.
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_04");	//Им никогда не одолеть тебя. Мы ОБЯЗАТЕЛЬНО встретимся снова. Береги себя.
	if(!Npc_HasItems(self,ITAR_Vlk_H))
	{
		CreateInvItems(self,ITAR_Vlk_H,1);
	};
	if(!Hlp_IsItem(DiegoArmor,ITAR_Vlk_H))
	{
		AI_EquipArmor(self,ITAR_Vlk_H);
	};
	DIEGO_ISONBOARD = LOG_OBSOLETE;
	Crewmember_Count -= 1;
	if(MIS_DiegosResidence == LOG_Success)
	{
		Npc_ExchangeRoutine(self,"Gerbrandt");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Start");
	};
};


instance DIA_DIEGONW_STILLNEEDYOU(C_INFO)
{
	npc = pc_thief_nw;
	nr = 55;
	condition = dia_diegonw_stillneedyou_condition;
	information = dia_diegonw_stillneedyou_info;
	permanent = TRUE;
	description = "Возвращайся. Я хочу, чтобы ты сопровождал меня.";
};


func int dia_diegonw_stillneedyou_condition()
{
	if(((DIEGO_ISONBOARD == LOG_OBSOLETE) || (DIEGO_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_diegonw_stillneedyou_info()
{
	var C_Item DiegoArmor;
	DiegoArmor = Npc_GetEquippedArmor(self);
	AI_Output(other,self,"DIA_DiegoNW_StillNeedYou_15_00");	//Возвращайся. Я хочу, чтобы ты сопровождал меня.
	AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_01");	//Куда подевалась твоя решительность, друг? Конечно, я присоединюсь к тебе - ты только определись с тем, что тебе нужно.
	self.flags = NPC_FLAG_IMMORTAL;
	DIEGO_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_UPTOWN_PATH_23") && !Hlp_IsItem(DiegoArmor,ITAR_Diego))
	{
		AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_02");	//Подожди, я буду готов через минуту.
		AI_SetWalkMode(self,NPC_RUN);
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		if(!Npc_HasItems(self,ITAR_Diego))
		{
			CreateInvItems(self,ITAR_Diego,1);
		};
		AI_EquipArmor(self,itar_diego);
		AI_Wait(self,1);
		AI_GotoWP(self,"NW_CITY_UPTOWN_PATH_23");
	};
	AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_03");	//Отлично, мы можем идти.
	AI_StopProcessInfos(self);
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	B_CheckLog();
};


instance DIA_THIEF_NW_PICKPOCKET(C_INFO)
{
	npc = pc_thief_nw;
	nr = 900;
	condition = dia_thief_nw_pickpocket_condition;
	information = dia_thief_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_thief_nw_pickpocket_condition()
{
	return c_beklauen(120,600);
};

func void dia_thief_nw_pickpocket_info()
{
	Info_ClearChoices(dia_thief_nw_pickpocket);
	Info_AddChoice(dia_thief_nw_pickpocket,DIALOG_BACK,dia_thief_nw_pickpocket_back);
	Info_AddChoice(dia_thief_nw_pickpocket,DIALOG_PICKPOCKET,dia_thief_nw_pickpocket_doit);
};

func void dia_thief_nw_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thief_nw_pickpocket);
};

func void dia_thief_nw_pickpocket_back()
{
	Info_ClearChoices(dia_thief_nw_pickpocket);
};

