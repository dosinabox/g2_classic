
instance DIA_BUSTER_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_exit_condition;
	information = dia_buster_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_buster_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_HELLO(C_INFO)
{
	npc = sld_802_buster;
	nr = 1;
	condition = dia_buster_hello_condition;
	information = dia_buster_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_buster_hello_condition()
{
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_LOST) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_buster_hello_info()
{
	AI_Output(self,other,"DIA_Buster_Hello_13_00");	//Посмотрите, кто у нас здесь?! Я тебя случайно не знаю?
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Как скажешь. Я хочу увидеть лендлорда.",dia_buster_hello_goingtofarm);
	Info_AddChoice(dia_buster_hello,"А кто спрашивает?",dia_buster_hello_whoareyou);
};

func void dia_buster_hello_whoareyou()
{
	AI_Output(other,self,"DIA_Buster_Hello_WhoAreYou_15_00");	//А кто спрашивает?
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_01");	//Я Бастер, один из наемников Ли!
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_02");	//И тебе лучше быть повежливее со мной, а не то мне придется поучить тебя манерам!
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_03");	//Ладно, что тебе нужно здесь?
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Это не твое дело.",dia_buster_hello_notyourbusiness);
	Info_AddChoice(dia_buster_hello,"Я знаю Ли!",dia_buster_hello_iknowlee);
	Info_AddChoice(dia_buster_hello,"Я хочу увидеть лендлорда.",dia_buster_hello_goingtofarm);
};

func void dia_buster_hello_iknowlee()
{
	AI_Output(other,self,"DIA_Buster_Hello_IKnowLee_15_00");	//Я знаю Ли!
	AI_Output(self,other,"DIA_Buster_Hello_IKnowLee_13_01");	//Все знают Ли! Это ни чего не значит, приятель. Сейчас, ты разговариваешь со МНОЙ!
	AI_Output(self,other,"DIA_Buster_Hello_IKnowLee_13_02");	//Итак, куда ты направляешься?
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Это не твое дело.",dia_buster_hello_notyourbusiness);
	Info_AddChoice(dia_buster_hello,"Я хочу увидеть лендлорда.",dia_buster_hello_goingtofarm);
};

func void dia_buster_hello_notyourbusiness()
{
	AI_Output(other,self,"DIA_Buster_Hello_NotYourBusiness_15_00");	//Это не твое дело.
	AI_Output(self,other,"DIA_Buster_Hello_NotYourBusiness_13_01");	//Я никому не позволю так разговаривать со мной, ты, грязный червь! По-моему, ты заслуживаешь хорошей взбучки.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_buster_hello_goingtofarm()
{
	AI_Output(other,self,"DIA_Buster_Hello_GoingToFarm_15_00");	//Как скажешь. Я хочу увидеть лендлорда.
	AI_Output(self,other,"DIA_Buster_Hello_GoingToFarm_13_01");	//Да?.. Хм - ты не кажешься мне таким уж опасным.
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Хочешь проверить?",dia_buster_hello_wannatestit);
	Info_AddChoice(dia_buster_hello,"Я тоже убил парочку другую тварей.",dia_buster_hello_slewbeasts);
	Info_AddChoice(dia_buster_hello,"Тебе правильно кажется.",dia_buster_hello_imnodanger);
};

func void dia_buster_hello_imnodanger()
{
	AI_Output(other,self,"DIA_Buster_Hello_ImNoDanger_15_00");	//Тебе правильно кажется.
	AI_Output(self,other,"DIA_Buster_Hello_ImNoDanger_13_01");	//(самодовольно) Да, за долгие годы я научился распознавать такие вещи, приятель.
	AI_Output(self,other,"DIA_Buster_Hello_ImNoDanger_13_02");	//Нам постоянно приходится сражаться с орками. Или со стражниками из города. Они такие настырные. (смеется)
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Ты имеешь в виду НАСТОЯЩИХ орков? Этих больших тварей?",dia_buster_hello_realorcs);
	Info_AddChoice(dia_buster_hello,"И?",dia_buster_hello_sowhat);
	Info_AddChoice(dia_buster_hello,"Потрясающе.",dia_buster_hello_impressive);
};

func void dia_buster_hello_slewbeasts()
{
	AI_Output(other,self,"DIA_Buster_Hello_SlewBeasts_15_00");	//Я тоже убил парочку другую тварей.
	AI_Output(self,other,"DIA_Buster_Hello_SlewBeasts_13_01");	//Ха! (смеется) Ты, наверное, прихлопнул несколько долгоносиков на поле и выгнал парочку крыс из их нор.
	AI_Output(self,other,"DIA_Buster_Hello_SlewBeasts_13_02");	//А мы здесь имеем дело с орками! Да, и с этими коварными городскими стражниками. (иронический смех)
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Ты имеешь в виду НАСТОЯЩИХ орков? Этих больших тварей?",dia_buster_hello_realorcs);
	Info_AddChoice(dia_buster_hello,"И?",dia_buster_hello_sowhat);
	Info_AddChoice(dia_buster_hello,"Потрясающе.",dia_buster_hello_impressive);
};

func void dia_buster_hello_wannatestit()
{
	AI_Output(other,self,"DIA_Buster_Hello_WannaTestIt_15_00");	//Хочешь проверить?
	AI_Output(self,other,"DIA_Buster_Hello_WannaTestIt_13_01");	//Надо же! Я напал не на того парня, да?
	AI_Output(other,self,"DIA_Buster_Hello_WannaTestIt_15_02");	//Можно сказать и так.
	AI_Output(self,other,"DIA_Buster_Hello_WannaTestIt_13_03");	//Тогда давай, покажи мне, на что ты годен.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_buster_hello_impressive()
{
	AI_Output(other,self,"DIA_Buster_Hello_Impressive_15_00");	//Потрясающе.
	AI_Output(self,other,"DIA_Buster_Hello_Impressive_13_01");	//(смеется) Это наша работа, парень! Мы даже делаем свое собственное оружие и доспехи!
	AI_Output(self,other,"DIA_Buster_Hello_Impressive_13_02");	//Мы каждый день ходим рука об руку со смертью. Но деревенщине вроде тебя этого не понять.
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Похоже, мне придется показать тебе, что я знаю об этом!",dia_buster_hello_letmeshowyou);
	Info_AddChoice(dia_buster_hello,"Как скажешь.",dia_buster_hello_ifyousayso);
};

func void dia_buster_hello_ifyousayso()
{
	AI_Output(other,self,"DIA_Buster_Hello_IfYouSaySo_15_00");	//Как скажешь.
	AI_Output(self,other,"DIA_Buster_Hello_IfYouSaySo_13_01");	//(со скучающим хрюканьем) Проходи, зануда!
	AI_StopProcessInfos(self);
};

func void dia_buster_hello_letmeshowyou()
{
	AI_Output(other,self,"DIA_Buster_Hello_LetMeShowYou_15_00");	//Похоже, мне придется показать тебе, что я знаю об этом!
	AI_Output(self,other,"DIA_Buster_Hello_LetMeShowYou_13_01");	//Ты что, строишь из себя буйного крестьянина, да?
	AI_Output(self,other,"DIA_Buster_Hello_LetMeShowYou_13_02");	//Хорошо, давай, покажи, на что ты способен.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_buster_hello_sowhat()
{
	AI_Output(other,self,"DIA_Buster_Hello_SoWhat_15_00");	//И?
	AI_Output(self,other,"DIA_Buster_Hello_SoWhat_13_01");	//(фыркает) Как будто ты понимаешь, о чем я говорю. Ты думаешь, что ты крут, да?
	AI_Output(self,other,"DIA_Buster_Hello_SoWhat_13_02");	//(сердито) Похоже, пришло время преподнести тебе урок!
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Всегда готов!",dia_buster_hello_whenever);
	Info_AddChoice(dia_buster_hello,"Я просто шучу...",dia_buster_hello_justjoking);
};

func void dia_buster_hello_realorcs()
{
	AI_Output(other,self,"DIA_Buster_Hello_RealOrcs_15_00");	//Ты имеешь в виду НАСТОЯЩИХ орков? Этих больших тварей?
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_01");	//(вздыхает) Я имею в виду... Минутку! Ты что, издеваешься надо мной?
	AI_Output(other,self,"DIA_Buster_Hello_RealOrcs_15_02");	//(улыбаясь) Даже и не думал.
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_03");	//Ах ты червь навозный! (агрессивно) Ты сам напрашиваешься, да?
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_04");	//Тогда давай, покажи, на что ты способен, герой!
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Всегда готов!",dia_buster_hello_whenever);
	Info_AddChoice(dia_buster_hello,"Я просто шучу...",dia_buster_hello_justjoking);
};

func void dia_buster_hello_whenever()
{
	AI_Output(other,self,"DIA_Buster_Hello_Whenever_15_00");	//Всегда готов!
	AI_Output(self,other,"DIA_Buster_Hello_Whenever_13_01");	//Тогда иди сюда, приятель!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_buster_hello_justjoking()
{
	AI_Output(other,self,"DIA_Buster_Hello_JustJoking_15_00");	//Я просто шучу...
	AI_Output(self,other,"DIA_Buster_Hello_JustJoking_13_01");	//Поосторожнее с такими шутками! А теперь проваливай!
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_FIGHTNONE(C_INFO)
{
	npc = sld_802_buster;
	nr = 1;
	condition = dia_buster_fightnone_condition;
	information = dia_buster_fightnone_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_buster_fightnone_condition()
{
	if(Npc_KnowsInfo(other,dia_buster_hello) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_buster_fightnone_info()
{
	AI_Output(self,other,"DIA_Buster_FightNone_13_00");	//Что тебе нужно, слизняк?
};


instance DIA_BUSTER_DUELL(C_INFO)
{
	npc = sld_802_buster;
	nr = 3;
	condition = dia_buster_duell_condition;
	information = dia_buster_duell_info;
	permanent = TRUE;
	description = "Я вызываю тебя на дуэль!";
};


func int dia_buster_duell_condition()
{
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_LOST)
	{
		return TRUE;
	};
};

func void dia_buster_duell_info()
{
	AI_Output(other,self,"DIA_Buster_Duell_15_00");	//Я вызываю тебя на дуэль!
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE)
	{
		AI_Output(self,other,"DIA_Buster_Duell_13_01");	//Ах-ах! Тебе все неймется, да? Ладно, иди сюда!
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_Duell_13_02");	//Ты хочешь попробовать еще раз? Ну, ты зануда, ладно, иди сюда!
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_CANCEL)
		{
			AI_Output(self,other,"DIA_Buster_Duell_13_03");	//Только больше не убегай!
		};
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_BUSTER_WANNAJOIN(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_wannajoin_condition;
	information = dia_buster_wannajoin_info;
	permanent = TRUE;
	description = "Я хочу присоединиться к наемникам!";
};


func int dia_buster_wannajoin_condition()
{
	if((other.guild == GIL_NONE) && (BUSTER_DUELL == FALSE))
	{
		return TRUE;
	};
};

func void dia_buster_wannajoin_info()
{
	AI_Output(other,self,"DIA_Buster_WannaJoin_15_00");	//Я хочу присоединиться к наемникам!
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON) || (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST))
	{
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_01");	//У парня с таким ударом как у тебя, не должно возникнуть с этим особых проблем.
		}
		else
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_02");	//Ты не особенно хороший боец, но и трусом тебя назвать нельзя.
		};
		AI_Output(self,other,"DIA_Buster_WannaJoin_13_03");	//Мой голос не много значит, так как я здесь не очень давно, но если Ли спросит, я проголосую за тебя.
		BUSTER_DUELL = TRUE;
		Log_CreateTopic(TOPIC_SLDRESPEKT,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SLDRESPEKT,LOG_RUNNING);
		b_logentry(TOPIC_SLDRESPEKT,"С тех пор, как я победил Бастера, он не имеет ничего против моего вступления в ряды наемников.");
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_WannaJoin_13_04");	//Ты? Я не помню, чтобы таких трусов как ты когда-либо принимали в наемники...
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_CANCEL)
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_05");	//Ты убегаешь от дуэли - таким как ты здесь нечего делать!
		};
	};
};


var int buster_sentenzatip;

instance DIA_BUSTER_OTHERSLD(C_INFO)
{
	npc = sld_802_buster;
	nr = 1;
	condition = dia_buster_othersld_condition;
	information = dia_buster_othersld_info;
	permanent = FALSE;
	description = "Я хочу узнать больше о наемниках и этой местности.";
};


func int dia_buster_othersld_condition()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_buster_othersld_info()
{
	AI_Output(other,self,"DIA_Buster_OtherSld_15_00");	//Я хочу узнать больше о наемниках и этой местности.
	AI_Output(self,other,"DIA_Buster_OtherSld_13_01");	//О местности я мало что могу сказать. Тебе лучше поспрашивать фермеров.
	AI_Output(self,other,"DIA_Buster_OtherSld_13_02");	//А что касается наемников - то правила у нас просты: если можешь постоять за себя - добро пожаловать к нам.
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Buster_OtherSld_13_03");	//Я думаю, ты достоин стать одним из нас.
		AI_Output(self,other,"DIA_Buster_OtherSld_13_04");	//Но не стоит обольщаться. Тебе просто повезло во время нашего последнего боя.
		AI_Output(self,other,"DIA_Buster_OtherSld_13_05");	//На этой ферме полно парней, которые будут получше меня...
		AI_Output(self,other,"DIA_Buster_OtherSld_13_06");	//Сентенза, например. Он охраняет вход на ферму. Тебе лучше не связываться с ним.
		BUSTER_SENTENZATIP = TRUE;
	}
	else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
	{
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_OtherSld_13_07");	//Но зачем я говорю тебе все это, слизняк?!
		AI_StopProcessInfos(self);
	};
};


var int buster_goldzumbrennen;
var int buster_bonus;

instance DIA_BUSTER_ABOUTSENTENZA(C_INFO)
{
	npc = sld_802_buster;
	nr = 1;
	condition = dia_buster_aboutsentenza_condition;
	information = dia_buster_aboutsentenza_info;
	permanent = FALSE;
	description = "Что там насчет Сентензы?";
};


func int dia_buster_aboutsentenza_condition()
{
	if(BUSTER_SENTENZATIP == TRUE)
	{
		return TRUE;
	};
};

func void dia_buster_aboutsentenza_info()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_15_00");	//Что там насчет Сентензы?
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_01");	//Он попытается вытрясти из тебя золото, когда ты будешь входить на ферму - он делает это со всеми.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_02");	//На твоем месте, я бы заплатил. Я сам так и сделал, когда пришел туда первый раз. И что хорошо, он проголосовал за меня после этого.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_03");	//Услуга за услугу, как он сказал. Я потерял при этом все свое золото, но его все равно было немного. А потом я даже порадовался этому.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_04");	//Я видел, как он избивал парня, который решил НЕ платить ему.
	AI_Output(other,self,"DIA_Buster_AboutSentenza_15_05");	//Спасибо за совет.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_06");	//Пожалуйста. Он много для тебя значит?
	Info_ClearChoices(dia_buster_aboutsentenza);
	Info_AddChoice(dia_buster_aboutsentenza,"Нет.",dia_buster_aboutsentenza_no);
	Info_AddChoice(dia_buster_aboutsentenza,"Да, вот держи - 5 золотых монет.",dia_buster_aboutsentenza_give);
};

func void dia_buster_aboutsentenza_give()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_Give_15_00");	//Да, вот держи - 5 золотых монет.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_Give_13_01");	//Спасибо. Похоже, все не так уж плохо. Я не забуду твоей доброты.
	BUSTER_GOLDZUMBRENNEN = TRUE;
	BUSTER_BONUS = 50;
	Info_ClearChoices(dia_buster_aboutsentenza);
};

func void dia_buster_aboutsentenza_no()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_No_15_00");	//Нет.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_No_13_01");	//Я так и думал.
	Info_ClearChoices(dia_buster_aboutsentenza);
};


instance DIA_BUSTER_LEELEADER(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_leeleader_condition;
	information = dia_buster_leeleader_info;
	permanent = FALSE;
	description = "Наемников возглавляет Ли, да?";
};


func int dia_buster_leeleader_condition()
{
	if(BUSTER_DUELL == TRUE)
	{
		return TRUE;
	};
};

func void dia_buster_leeleader_info()
{
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_00");	//Наемников возглавляет Ли, да?
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_01");	//Правильно - эй, теперь я вспомнил, где видел тебя! Ты тоже был в колонии.
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_02");	//(вздыхает) Как и я.
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_03");	//Я не видел тебя, когда все рвануло. И незадолго перед этим тоже.
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_04");	//У меня были другие проблемы.
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_05");	//Тогда ты многое пропустил - с тех пор многое изменилось.
};


instance DIA_BUSTER_WHATHAPPENED(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_whathappened_condition;
	information = dia_buster_whathappened_info;
	permanent = FALSE;
	description = "Что стало с наемниками из колонии?";
};


func int dia_buster_whathappened_condition()
{
	if(Npc_KnowsInfo(other,dia_buster_leeleader) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_buster_whathappened_info()
{
	AI_Output(other,self,"DIA_Buster_WhatHappened_15_00");	//Что стало с наемниками из колонии?
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_01");	//После того, как Барьера не стало, Ли вывел нас из колонии. Он сказал, что нам ничего не страшно, если мы будем держаться вместе. И он был прав.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_02");	//Вскоре мы нашли здесь себе тепленькое местечко. Лендлорд платит нам, чтобы мы не пускали ополчение из города.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_03");	//Хотя большинство из нас готово делать это даже бесплатно.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_04");	//Онар кормит нас всех, и мы можем спокойно ждать, когда подвернется возможность убраться с этого проклятого острова.
};


instance DIA_BUSTER_TEACH(C_INFO)
{
	npc = sld_802_buster;
	nr = 8;
	condition = dia_buster_teach_condition;
	information = dia_buster_teach_info;
	permanent = TRUE;
	description = "Ты можешь научить меня сражаться?";
};


func int dia_buster_teach_condition()
{
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) <= 30)
	{
		return TRUE;
	};
};

func void dia_buster_teach_info()
{
	AI_Output(other,self,"DIA_Buster_Teach_15_00");	//Ты можешь научить меня сражаться?
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Buster_Teach_13_01");	//Да, я могу показать тебе парочку приемов...
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_Teach_13_02");	//Ты не так уж глуп, как кажешься. Хорошо, я научу тебя тому, что знаю сам. Тогда, может быть, у тебя появятся шансы против меня...
	};
	if(BUSTERLOG == FALSE)
	{
		Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
		b_logentry(TOPIC_SOLDIERTEACHER,"Бастер может обучить меня искусству владения одноручным оружием.");
		BUSTERLOG = TRUE;
	};
	Info_ClearChoices(dia_buster_teach);
	Info_AddChoice(dia_buster_teach,DIALOG_BACK,dia_buster_teach_back);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_buster_teach_1h_1);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_buster_teach_1h_5);
};

func void dia_buster_teach_back()
{
	Info_ClearChoices(dia_buster_teach);
};

func void dia_buster_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,30);
	Info_ClearChoices(dia_buster_teach);
	Info_AddChoice(dia_buster_teach,DIALOG_BACK,dia_buster_teach_back);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_buster_teach_1h_1);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_buster_teach_1h_5);
};

func void dia_buster_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,30);
	Info_ClearChoices(dia_buster_teach);
	Info_AddChoice(dia_buster_teach,DIALOG_BACK,dia_buster_teach_back);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_buster_teach_1h_1);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_buster_teach_1h_5);
};


instance DIA_BUSTER_KAP3_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_kap3_exit_condition;
	information = dia_buster_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_buster_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_SHADOWBEASTS(C_INFO)
{
	npc = sld_802_buster;
	nr = 30;
	condition = dia_buster_shadowbeasts_condition;
	information = dia_buster_shadowbeasts_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_buster_shadowbeasts_condition()
{
	if(((KAPITEL == 3) || (KAPITEL == 4)) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void b_dia_buster_shadowbeasts_ok()
{
	AI_StopProcessInfos(self);
};

func void dia_buster_shadowbeasts_info()
{
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_00");	//Эй, приятель!
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_15_01");	//Что тебе нужно?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_02");	//Последнее время я все думаю, как можно заработать денег в этой дыре.
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_15_03");	//И?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_04");	//Мне кажется, я знаю, как это можно сделать.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_05");	//Торговец из города готов выложить круглую сумму за определенный товар.
	Info_ClearChoices(dia_buster_shadowbeasts);
	Info_AddChoice(dia_buster_shadowbeasts,"Кто этот торговец, о котором ты говоришь?",dia_buster_shadowbeasts_wer);
	Info_AddChoice(dia_buster_shadowbeasts,"Что ты там придумал?",dia_buster_shadowbeasts_was);
	Info_AddChoice(dia_buster_shadowbeasts,"Зачем ты говоришь мне все это?",dia_buster_shadowbeasts_ich);
};

func void dia_buster_shadowbeasts_ich()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_ich_15_00");	//Зачем ты говоришь мне все это?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_ich_13_01");	//Сам я не могу это сделать. Я должен оставаться здесь и присматривать за этими чертовыми баранами.
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_ich_15_02");	//Ты хочешь сказать, за фермерами.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_ich_13_03");	//Ну, я так и сказал.
};

func void dia_buster_shadowbeasts_was()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_15_00");	//Что ты там придумал?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_13_01");	//Этот торговец утверждает, что может очень выгодно продать рога мракорисов.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_13_02");	//Кто-то должен сходить в лес и поохотиться на этих тварей. Вот для этого ты и нужен.
	Info_AddChoice(dia_buster_shadowbeasts,"Сколько на этом можно заработать?",dia_buster_shadowbeasts_was_wieviel);
};

func void dia_buster_shadowbeasts_was_wieviel()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_wieviel_15_00");	//Сколько на этом можно заработать?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_wieviel_13_01");	//Целую кучу денег! Этого хватит нам обоим.
	if(BUSTER_GOLDZUMBRENNEN == TRUE)
	{
		AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_wieviel_13_02");	//А помня о том золоте, что ты дал мне, я сделаю для тебя особую цену.
	};
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_wieviel_15_03");	//Звучит заманчиво! Я дам тебе знать, когда добуду эти рога.
	MIS_BUSTER_KILLSHADOWBEASTS_DJG = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BUSTER_KILLSHADOWBEASTS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BUSTER_KILLSHADOWBEASTS,LOG_RUNNING);
	b_logentry(TOPIC_BUSTER_KILLSHADOWBEASTS,"Бастер даст хорошую цену за каждый рог мракориса, что я принесу ему.");
	Info_ClearChoices(dia_buster_shadowbeasts);
};

func void dia_buster_shadowbeasts_wer()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_wer_15_00");	//Кто этот торговец, о котором ты говоришь?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_wer_13_01");	//Так не пойдет, приятель. Я что, по-твоему, дурак - раскрывать свои источники? Ты что, хочешь обмануть меня?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_wer_13_02");	//Либо ты будешь иметь дело со МНОЙ, или можешь забыть об этом, понятно?
};


instance DIA_BUSTER_BRINGTROPHYSHADOWBEAST(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_bringtrophyshadowbeast_condition;
	information = dia_buster_bringtrophyshadowbeast_info;
	permanent = TRUE;
	description = "Насчет рогов мракорисов ...";
};


func int dia_buster_bringtrophyshadowbeast_condition()
{
	if((MIS_BUSTER_KILLSHADOWBEASTS_DJG == LOG_RUNNING) && (Npc_HasItems(other,itat_shadowhorn) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE)) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};


var int bustertrophyshadowbeastcounter;

func void dia_buster_bringtrophyshadowbeast_info()
{
	var int bustertrophyshadowbeastcount;
	var int xp_bringbustertrophyshadowbeast;
	var int xp_bringbustertrophyshadowbeasts;
	var int bustersbustertrophyshadowbeastoffer;
	var int bustertrophyshadowbeastgeld;
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_00");	//Мой торговец из города передал прощальный привет.
		AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_01");	//Что это значит?
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_02");	//Он мертв. Можешь оставить эти рога себе. Теперь я все равно не знаю, что с ними делать.
		MIS_BUSTER_KILLSHADOWBEASTS_DJG = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
	}
	else if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE)
	{
		AI_Output(other,self,"DIA_Buster_ANIMALTROPHYSHADOWBEAST_15_03");	//А как нужно потрошить мракориса?
		AI_Output(self,other,"DIA_Buster_ANIMALTROPHYSHADOWBEAST_13_04");	//Ты этого не знаешь? Ох, парень, я думал о тебе лучше.
		Info_ClearChoices(dia_buster_bringtrophyshadowbeast);
		Info_AddChoice(dia_buster_bringtrophyshadowbeast,"Я вернусь к тебе с рогами.",dia_buster_bringtrophyshadowbeast_back);
		Info_AddChoice(dia_buster_bringtrophyshadowbeast,b_buildlearnstring("Научи меня.",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_buster_bringtrophyshadowbeast_teach);
	}
	else
	{
		bustertrophyshadowbeastcount = Npc_HasItems(other,itat_shadowhorn);
		xp_bringbustertrophyshadowbeast = shadowbeast.level * XP_PER_VICTORY;
		bustersbustertrophyshadowbeastoffer = VALUE_SHADOWHORN + BUSTER_BONUS;
		if(bustertrophyshadowbeastcount == 1)
		{
			AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_05");	//Я принес тебе рог мракориса.
			b_giveplayerxp(xp_bringbustertrophyshadowbeast);
			b_giveinvitems(other,self,itat_shadowhorn,1);
			BUSTERTROPHYSHADOWBEASTCOUNTER = BUSTERTROPHYSHADOWBEASTCOUNTER + 1;
		}
		else
		{
			AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_06");	//Я принес рога мракорисов для твоего торговца.
			b_giveinvitems(other,self,itat_shadowhorn,bustertrophyshadowbeastcount);
			xp_bringbustertrophyshadowbeasts = bustertrophyshadowbeastcount * xp_bringbustertrophyshadowbeast;
			BUSTERTROPHYSHADOWBEASTCOUNTER = BUSTERTROPHYSHADOWBEASTCOUNTER + bustertrophyshadowbeastcount;
			b_giveplayerxp(xp_bringbustertrophyshadowbeasts);
		};
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_07");	//Отлично. Давай сюда. И принеси еще, если сможешь. Кто знает, как долго торговцу будут интересны эти рога.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_08");	//Вот твоя доля.
		bustertrophyshadowbeastgeld = bustertrophyshadowbeastcount * bustersbustertrophyshadowbeastoffer;
		CreateInvItems(self,itmi_gold,bustertrophyshadowbeastgeld);
		b_giveinvitems(self,other,itmi_gold,bustertrophyshadowbeastgeld);
	};
};

func void dia_buster_bringtrophyshadowbeast_teach()
{
	AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_teach_15_00");	//Научи меня.
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_SHADOWHORN))
	{
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_01");	//Ладно, слушай. Убиваешь мракориса, и как можно крепче берешь его рог правой рукой.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_02");	//Затем приставляешь нож к его лбу и делаешь глубокий разрез вокруг рога.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_03");	//Ну, а потом просто поддеваешь рог ножом, используя его как рычаг, и кладешь рог себе в карман.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_04");	//И приносишь его мне. Я думаю, у тебя получится.
	};
	Info_ClearChoices(dia_buster_bringtrophyshadowbeast);
};

func void dia_buster_bringtrophyshadowbeast_back()
{
	AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_back_15_00");	//Я вернусь к тебе с рогами.
	AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_back_13_01");	//Надеюсь.
	Info_ClearChoices(dia_buster_bringtrophyshadowbeast);
};


instance DIA_BUSTER_KAP4_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_kap4_exit_condition;
	information = dia_buster_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_buster_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_PERM4(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_perm4_condition;
	information = dia_buster_perm4_info;
	permanent = TRUE;
	description = "Что ты думаешь об охотников на драконов?";
};


func int dia_buster_perm4_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_buster_perm4_info()
{
	AI_Output(other,self,"DIA_Buster_Perm4_15_00");	//Что ты думаешь об охотников на драконов?
	AI_Output(self,other,"DIA_Buster_Perm4_13_01");	//Эти парни могут заработать целую кучу золота - если не сыграют в ящик.
	AI_Output(self,other,"DIA_Buster_Perm4_13_02");	//А я предпочитаю остаться с Ли.
};


instance DIA_BUSTER_KAP5_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_kap5_exit_condition;
	information = dia_buster_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_buster_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_KAP6_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_kap6_exit_condition;
	information = dia_buster_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_buster_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_PICKPOCKET(C_INFO)
{
	npc = sld_802_buster;
	nr = 900;
	condition = dia_buster_pickpocket_condition;
	information = dia_buster_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_buster_pickpocket_condition()
{
	return c_beklauen(34,60);
};

func void dia_buster_pickpocket_info()
{
	Info_ClearChoices(dia_buster_pickpocket);
	Info_AddChoice(dia_buster_pickpocket,DIALOG_BACK,dia_buster_pickpocket_back);
	Info_AddChoice(dia_buster_pickpocket,DIALOG_PICKPOCKET,dia_buster_pickpocket_doit);
};

func void dia_buster_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_buster_pickpocket);
};

func void dia_buster_pickpocket_back()
{
	Info_ClearChoices(dia_buster_pickpocket);
};

