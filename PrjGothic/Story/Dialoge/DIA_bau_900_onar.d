
instance DIA_ONAR_EXIT(C_INFO)
{
	npc = bau_900_onar;
	nr = 999;
	condition = dia_onar_exit_condition;
	information = dia_onar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_onar_exit_condition()
{
	return TRUE;
};

func void dia_onar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ONAR_HALLO(C_INFO)
{
	npc = bau_900_onar;
	nr = 1;
	condition = dia_onar_hallo_condition;
	information = dia_onar_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_onar_hallo_condition()
{
	if((self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_onar_hallo_info()
{
	AI_Output(self,other,"DIA_Onar_Hallo_14_00");	//Кто пустил тебя сюда?!
	AI_Output(self,other,"DIA_Onar_Hallo_14_01");	//Что ты делаешь на моей ферме?!
};


instance DIA_ONAR_PERM(C_INFO)
{
	npc = bau_900_onar;
	nr = 1;
	condition = dia_onar_perm_condition;
	information = dia_onar_perm_info;
	permanent = TRUE;
	description = "Здесь все в порядке, на твоей ферме?";
};


func int dia_onar_perm_condition()
{
	return TRUE;
};

func void dia_onar_perm_info()
{
	AI_Output(other,self,"DIA_Onar_PERM_15_00");	//Здесь все в порядке, на твоей ферме?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_01");	//Я не понимаю, какое тебе до этого может быть дело. Ты не работаешь здесь!
	};
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_02");	//Очень надеюсь, что да! В конце концов, именно за это я тебе и плачу!
		AI_Output(self,other,"DIA_Onar_PERM_14_03");	//Тебе лучше пойти, поговорить с Торлофом, может быть, у него есть работа для тебя.
	};
	if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_04");	//Да, конечно. Ты можешь идти, охотиться на своих драконов.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_05");	//Вам, лицемерным ублюдкам из монастыря, сюда вход закрыт!
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_06");	//Наше гостеприимство не распространяется на войска короля.
	};
};


instance DIA_ONAR_WORK(C_INFO)
{
	npc = bau_900_onar;
	nr = 2;
	condition = dia_onar_work_condition;
	information = dia_onar_work_info;
	permanent = FALSE;
	description = "Я хочу работать на тебя!";
};


func int dia_onar_work_condition()
{
	if(LEE_SENDTOONAR == FALSE)
	{
		return TRUE;
	};
};

func void dia_onar_work_info()
{
	AI_Output(other,self,"DIA_Onar_Work_15_00");	//Я хочу работать на тебя!
	AI_Output(self,other,"DIA_Onar_Work_14_01");	//Мне сейчас не нужны рабочие.
	AI_Output(self,other,"DIA_Onar_Work_14_02");	//Мои люди прекрасно со всем справляются.
	AI_Output(self,other,"DIA_Onar_Work_14_03");	//Тебе нечего делать в моем доме, убирайся!
};


instance DIA_ONAR_WORKASSLD(C_INFO)
{
	npc = bau_900_onar;
	nr = 2;
	condition = dia_onar_workassld_condition;
	information = dia_onar_workassld_info;
	permanent = FALSE;
	description = "Я хочу поработать здесь в качестве наемника!";
};


func int dia_onar_workassld_condition()
{
	if((LEE_SENDTOONAR == FALSE) && (ONAR_WEGENSLDWERDEN == FALSE) && Npc_KnowsInfo(other,dia_onar_work))
	{
		return TRUE;
	};
};

func void dia_onar_workassld_info()
{
	AI_Output(other,self,"DIA_Onar_WorkAsSld_15_00");	//Я хочу поработать здесь в качестве наемника!
	AI_Output(self,other,"DIA_Onar_WorkAsSld_14_01");	//Ты? Наемника? Не смеши меня! Если бы из тебя мог получиться хороший наемник, Ли наверняка рассказал бы мне о тебе.
	AI_Output(self,other,"DIA_Onar_WorkAsSld_14_02");	//А теперь убирайся отсюда, и поживее!
	ONAR_WEGENSLDWERDEN = TRUE;
};


instance DIA_ONAR_AUFSTAND(C_INFO)
{
	npc = bau_900_onar;
	nr = 3;
	condition = dia_onar_aufstand_condition;
	information = dia_onar_aufstand_info;
	permanent = FALSE;
	description = "Ты противостоишь городу, как я слышал?";
};


func int dia_onar_aufstand_condition()
{
	return TRUE;
};

func void dia_onar_aufstand_info()
{
	AI_Output(other,self,"DIA_Onar_Aufstand_15_00");	//Ты противостоишь городу, как я слышал?
	AI_Output(self,other,"DIA_Onar_Aufstand_14_01");	//А теперь послушай ты. Я унаследовал эту ферму и эту землю от своего отца.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_02");	//А он унаследовал ее от СВОЕГО отца.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_03");	//Я не позволю этому жадному идиоту, называющему себя королем, разорить меня только для того, чтобы накормить свои бесполезные армии.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_04");	//Война с орками длится уже целую вечность. И к чему мы пришли? Мы стоим на грани поражения.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_05");	//Нет - я предпочитаю оборонять свою ферму самостоятельно! Деньги, что я сберегу таким образом, пойдут на оплату моей собственной армии.
};


instance DIA_ONAR_WEGENPEPE(C_INFO)
{
	npc = bau_900_onar;
	nr = 4;
	condition = dia_onar_wegenpepe_condition;
	information = dia_onar_wegenpepe_info;
	permanent = FALSE;
	description = "Можешь благодарить Булко, у тебя стало на несколько овец меньше.";
};


func int dia_onar_wegenpepe_condition()
{
	if(MIS_PEPE_KILLWOLVES == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_onar_wegenpepe_info()
{
	AI_Output(other,self,"DIA_Onar_WegenPepe_15_00");	//Можешь благодарить Булко, у тебя стало на несколько овец меньше.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_01");	//О чем это ты говоришь? Кто такой Булко?
	AI_Output(other,self,"DIA_Onar_WegenPepe_15_02");	//Один из наемников.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_03");	//Какое мне до этого дело? Если он притронулся к моим овцам, он будет отвечать перед Ли.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_04");	//Зачем ты отвлекаешь меня по таким пустякам?
	ONAR_WEGENPEPE = TRUE;
};


instance DIA_ONAR_WEGENSEKOB(C_INFO)
{
	npc = bau_900_onar;
	nr = 5;
	condition = dia_onar_wegensekob_condition;
	information = dia_onar_wegensekob_info;
	permanent = FALSE;
	description = "Я пришел по поводу ренты Секоба...";
};


func int dia_onar_wegensekob_condition()
{
	if(MIS_SEKOB_REDEMITONAR == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_onar_wegensekob_info()
{
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_00");	//Я пришел по поводу ренты Секоба...
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Onar_WegenSekob_14_01");	//Что, черт возьми, тебе нужно здесь? Отнеси деньги Торлофу.
	}
	else
	{
		AI_Output(self,other,"DIA_Onar_WegenSekob_14_02");	//Какого дьявола ты лезешь в это дело?
		AI_Output(other,self,"DIA_Onar_WegenSekob_15_03");	//Я хочу стать наемником. Собрать ренту - это мое испытание.
		ONAR_WEGENSLDWERDEN = TRUE;
	};
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_04");	//Но у Секоба нет денег. Я даже пытался выбить их из него.
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_05");	//Он сказал, что это из-за плохого урожая...
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_06");	//(вопит) Ты безмозглый кретин! Ты что думаешь, он носит деньги с собой? Он их где-то прячет!
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_07");	//Да ты знаешь, сколько дождей было в этот год? Плохой урожай! Надо же!
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_08");	//Иди, и найди способ выбить из него эти деньги.
	ONAR_WEGENSEKOB = TRUE;
};


instance DIA_ONAR_LEESENTME(C_INFO)
{
	npc = bau_900_onar;
	nr = 6;
	condition = dia_onar_leesentme_condition;
	information = dia_onar_leesentme_info;
	permanent = FALSE;
	description = "Меня послал Ли. Я хочу работать в качестве наемника!";
};


func int dia_onar_leesentme_condition()
{
	if((LEE_SENDTOONAR == TRUE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_onar_leesentme_info()
{
	AI_Output(other,self,"DIA_Onar_LeeSentMe_15_00");	//Меня послал Ли. Я хочу работать в качестве наемника!
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_01");	//Он уже говорил со мной.
	if(ONAR_WEGENSLDWERDEN == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_02");	//При нашей первой встрече у меня сложилось о тебе не самое лучшее мнение.
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_03");	//Но раз Ли полагает, что ты справишься, я, пожалуй, дам тебе шанс.
	};
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_04");	//В конце концов, он отвечает за тебя. Так что приступай к своим обязанностям.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_05");	//Но не выводи меня из себя! Оставь фермеров и служанок в покое, и даже не думай стащить что-нибудь, понятно?
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_06");	//А что касается всего остального, поговори с Ли.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_07");	//А нам с тобой нужно обсудить только твое жалование.
	ONAR_APPROVED = TRUE;
	b_logentry(TOPIC_BECOMESLD,"Онар дал мне свое одобрение. Теперь ничто не препятствует моему вступлению в ряды наемников.");
};


var int onar_sold_day;
var int onar_sold_xp;

instance DIA_ONAR_HOWMUCH(C_INFO)
{
	npc = bau_900_onar;
	nr = 7;
	condition = dia_onar_howmuch_condition;
	information = dia_onar_howmuch_info;
	permanent = FALSE;
	description = "Так что насчет моего жалования?";
};


func int dia_onar_howmuch_condition()
{
	if(ONAR_APPROVED == TRUE)
	{
		return TRUE;
	};
};

func void dia_onar_howmuch_info()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_15_00");	//Так что насчет моего жалования?
	AI_Output(self,other,"DIA_Onar_HowMuch_14_01");	//Так, посмотрим...
	SOLD = 50;
	if(ONAR_WEGENSLDWERDEN == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_02");	//Я не самого лучшего мнения о тебе.
	};
	if(ONAR_WEGENSEKOB == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_03");	//Ты не отличаешься особой сообразительностью. Это очевидно после твоих похождений к Секобу.
		SOLD = SOLD - 10;
	};
	if((ABSOLUTIONLEVEL_FARM > 1) || ((b_getgreatestpetzcrime(self) > CRIME_NONE) && (ABSOLUTIONLEVEL_FARM > 0)))
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_04");	//Ты уже неоднократно создавал проблемы здесь, на ферме.
		SOLD = SOLD - 10;
	};
	if((ONAR_WEGENPEPE == TRUE) && ((ONAR_WEGENSEKOB == TRUE) || (ONAR_WEGENSLDWERDEN == TRUE)))
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_05");	//И ты постоянно допекаешь меня всяким вздором.
		SOLD = SOLD - 10;
	};
	AI_Output(self,other,"DIA_Onar_HowMuch_14_06");	//Дай мне подумать...
	b_say_gold(self,other,SOLD);
	ONAR_SOLD_DAY = Wld_GetDay();
	ONAR_SOLD_XP = other.exp;
	AI_Output(self,other,"DIA_Onar_HowMuch_14_07");	//Что скажешь?
	Info_ClearChoices(dia_onar_howmuch);
	Info_AddChoice(dia_onar_howmuch,"Хорошо!",dia_onar_howmuch_ok);
	Info_AddChoice(dia_onar_howmuch,"Здесь не все...",dia_onar_howmuch_more);
	Info_AddChoice(dia_onar_howmuch,"В день?",dia_onar_howmuch_perday);
};

func void dia_onar_howmuch_perday()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_PerDay_15_00");	//В день?
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_01");	//Кем ты себя возомнил? В неделю! Да и это для тебя много.
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_02");	//Давай, подойди сюда и забери свои деньги.
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_03");	//Я не собираюсь подносить их тебе.
};

func void dia_onar_howmuch_more()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_More_15_00");	//Здесь не все...
	AI_Output(self,other,"DIA_Onar_HowMuch_More_14_01");	//Конечно, но ты можешь поработать на меня совсем бесплатно, если хочешь.
	AI_Output(self,other,"DIA_Onar_HowMuch_More_14_02");	//Это все, что ты получишь!
	Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
	b_logentry(TOPIC_BONUS,"Я могу получить у Онара причитающееся мне вознаграждение, когда мне это заблагорассудится.");
	Info_ClearChoices(dia_onar_howmuch);
};

func void dia_onar_howmuch_ok()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_Ok_15_00");	//Хорошо!
	AI_Output(self,other,"DIA_Onar_HowMuch_Ok_14_01");	//Я тоже так думаю. А теперь иди, поговори с Ли.
	Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
	b_logentry(TOPIC_BONUS,"Я могу получить у Онара причитающееся мне вознаграждение, когда мне это заблагорассудится.");
	Info_ClearChoices(dia_onar_howmuch);
};


instance DIA_ONAR_COLLECTGOLD(C_INFO)
{
	npc = bau_900_onar;
	nr = 8;
	condition = dia_onar_collectgold_condition;
	information = dia_onar_collectgold_info;
	permanent = TRUE;
	description = "Заплати мне мое жалование!";
};


func int dia_onar_collectgold_condition()
{
	if(Npc_KnowsInfo(other,dia_onar_howmuch) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_onar_collectgold_info()
{
	AI_Output(other,self,"DIA_Onar_CollectGold_15_00");	//Заплати мне мое жалование!
	if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_01");	//Я плачу наемникам, а не охотникам на драконов.
	}
	else if(TORLOF_THEOTHERMISSION_TOOLATE == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_02");	//Ты плохо справляешься со своими поручениями!
		AI_Output(self,other,"DIA_Onar_CollectGold_14_03");	//Я спросил Торлофа, как у тебя идут дела. И он сказал мне, что на выполнение работы у тебя уходит целая вечность.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_04");	//Я не собираюсь платить лодырям.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_05");	//Теперь ты должен отработать несколько недель без оплаты! Может быть, тогда ты усвоишь этот урок.
	}
	else if(b_getgreatestpetzcrime(self) > CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_06");	//Я слышал, что ты устроил заварушку. Сначала пойди к Ли и урегулируй этот вопрос.
	}
	else if(Wld_GetDay() <= ONAR_SOLD_DAY)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_07");	//Ты что, совсем выжил из ума?
		AI_Output(self,other,"DIA_Onar_CollectGold_14_08");	//Ты должен поработать у меня хотя бы день. Ты получишь свое жалование завтра.
	}
	else if((Wld_GetDay() - 2) >= ONAR_SOLD_DAY)
	{
		if((Wld_GetDay() - 2) == ONAR_SOLD_DAY)
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_09");	//Где ты был вчера?
		}
		else
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_10");	//Где ты был последние пару дней?
		};
		AI_Output(self,other,"DIA_Onar_CollectGold_14_11");	//Да ты здесь даже не появлялся!
		AI_Output(self,other,"DIA_Onar_CollectGold_14_12");	//Кто знает, где ты шлялся.
		ONAR_SOLD_DAY = Wld_GetDay();
		ONAR_SOLD_XP = other.exp;
	}
	else
	{
		if(other.exp > (ONAR_SOLD_XP + 200))
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_13");	//(сокрушенно) Ох, ладно. Вот твое жалование.
			b_giveinvitems(self,other,itmi_gold,SOLD);
			b_say_gold(self,other,SOLD);
		}
		else
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_14");	//Что? Да ты же ничего не делал, только спал и слонялся из угла в угол!
			AI_Output(self,other,"DIA_Onar_CollectGold_14_15");	//Я не собираюсь платить за это!
		};
		ONAR_SOLD_DAY = Wld_GetDay();
		ONAR_SOLD_XP = other.exp;
	};
};


instance DIA_ONAR_MARIAGOLD(C_INFO)
{
	npc = bau_900_onar;
	nr = 9;
	condition = dia_onar_mariagold_condition;
	information = dia_onar_mariagold_info;
	permanent = FALSE;
	description = "Мария думает, что я получаю недостаточно.";
};


func int dia_onar_mariagold_condition()
{
	if(MARIA_MEHRGOLD == TRUE)
	{
		return TRUE;
	};
};

func void dia_onar_mariagold_info()
{
	AI_Output(other,self,"DIA_Onar_MariaGold_15_00");	//Мария думает, что я получаю недостаточно.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_01");	//Что?
	AI_Output(other,self,"DIA_Onar_MariaGold_15_02");	//Она сказала, что ты должен платить мне больше.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_03");	//(ворчливо) Эта баба сует свой нос во все щели.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_04");	//Она сказала сколько?
	AI_Output(other,self,"DIA_Onar_MariaGold_15_05");	//Нет.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_06");	//Хорошо, начиная со следующего жалования, ты будешь получать на 10 монет больше.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_07");	//Но ни монетой больше, понятно?
	SOLD = SOLD + 10;
};


var int onar_sellsheep;

instance DIA_ONAR_WANNASHEEP(C_INFO)
{
	npc = bau_900_onar;
	nr = 10;
	condition = dia_onar_wannasheep_condition;
	information = dia_onar_wannasheep_info;
	permanent = TRUE;
	description = "Я хочу купить овцу!";
};


func int dia_onar_wannasheep_condition()
{
	if(ONAR_SELLSHEEP == FALSE)
	{
		return TRUE;
	};
};

func void dia_onar_wannasheep_info()
{
	AI_Output(other,self,"DIA_Onar_WannaSheep_15_00");	//Я хочу купить овцу!
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_01");	//А что ты тогда здесь делаешь? Ты где-то видишь здесь овцу?
	AI_Output(other,self,"DIA_Onar_WannaSheep_15_02");	//Я...
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_03");	//Если ты хочешь купить овцу, иди на пастбище. Оно находится справа от моего дома.
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_04");	//Пепе продаст тебе одну.
	if(Npc_IsDead(pepe))
	{
		AI_Output(other,self,"DIA_Onar_WannaSheep_15_05");	//Боюсь, что Пепе мертв.
		AI_Output(self,other,"DIA_Onar_WannaSheep_14_06");	//Ох! В таком случае... оставь 200 золота мне, и сам выбери себе овцу на пастбище.
		ONAR_SELLSHEEP = TRUE;
	};
};


instance DIA_ONAR_BUYLIESEL(C_INFO)
{
	npc = bau_900_onar;
	nr = 10;
	condition = dia_onar_buyliesel_condition;
	information = dia_onar_buyliesel_info;
	permanent = TRUE;
	description = "Вот, держи, 200 золотых монет. Дай мне овцу.";
};


func int dia_onar_buyliesel_condition()
{
	if(ONAR_SELLSHEEP == TRUE)
	{
		return TRUE;
	};
};

func void dia_onar_buyliesel_info()
{
	AI_Output(other,self,"DIA_Onar_BuyLiesel_15_00");	//Вот, держи, 200 золотых монет. Дай мне овцу.
	if(b_giveinvitems(other,self,itmi_gold,200))
	{
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_01");	//Ты можешь сам выбрать себе овцу на пастбище.
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_02");	//Одна из них обязательно пойдет за тобой. Большинство моих овец отзываются на имя Бетси.
		Wld_InsertNpc(follow_sheep,"NW_BIGFARM_SHEEP2_02");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_03");	//У тебя нет столько золота! Не трать понапрасну мое драгоценное время.
	};
};

