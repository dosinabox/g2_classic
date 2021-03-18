
instance DIA_LEE_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_exit_condition;
	information = dia_lee_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_lee_exit_info()
{
	AI_StopProcessInfos(self);
};


var int lee_teleport;

func void b_lee_teleport()
{
	AI_Output(self,other,"DIA_Lee_Add_04_05");	//Ах. Хорошо, что ты пришел.
	AI_Output(other,self,"DIA_Lee_Add_15_06");	//Что случилось?
	AI_Output(self,other,"DIA_Lee_Add_04_07");	//Я нашел это в старой часовне.
	b_giveinvitems(self,other,itru_teleportfarm,1);
	AI_Output(self,other,"DIA_Lee_Add_04_08");	//Это магическая руна. Я думаю, она может в любое время перенести тебя сюда, на ферму.
	AI_Output(self,other,"DIA_Lee_Add_04_09");	//Я подумал, что ты сможешь пользоваться ей.
	LEE_TELEPORT = TRUE;
};


var int lee_lastpetzcounter;
var int lee_lastpetzcrime;

instance DIA_LEE_PMSCHULDEN(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_pmschulden_condition;
	information = dia_lee_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_lee_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (LEE_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= LEE_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_lee_pmschulden_info()
{
	var int diff;
	if((KAPITEL >= 3) && (LEE_TELEPORT == FALSE))
	{
		b_lee_teleport();
	};
	AI_Output(self,other,"DIA_Lee_PMSchulden_04_00");	//Ты здесь, чтобы принести деньги Онару?
	if(b_gettotalpetzcounter(self) > LEE_LASTPETZCOUNTER)
	{
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_01");	//Я уже сказал тебе, что не надо творить глупости здесь.
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_02");	//Онар узнал, что ты успел заслужить себе дурную славу здесь.
		if(LEE_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_03");	//Ну и естественно, он теперь хочет больше денег.
			AI_Output(other,self,"DIA_Lee_PMAdd_15_00");	//Сколько?
			diff = b_gettotalpetzcounter(self) - LEE_LASTPETZCOUNTER;
			if(diff > 0)
			{
				LEE_SCHULDEN = LEE_SCHULDEN + (diff * 50);
			};
			if(LEE_SCHULDEN > 1000)
			{
				LEE_SCHULDEN = 1000;
			};
			b_say_gold(self,other,LEE_SCHULDEN);
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_04");	//Я думал, ты умнее.
		};
	}
	else if(b_getgreatestpetzcrime(self) < LEE_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_05");	//Теперь хорошие новости для тебя.
		if(LEE_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_06");	//Неожиданно, не осталось никого, кто видел, как ты совершил убийство.
		};
		if((LEE_LASTPETZCRIME == CRIME_THEFT) || ((LEE_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_07");	//Никто теперь не может подтвердить, что видел, как ты воруешь.
		};
		if((LEE_LASTPETZCRIME == CRIME_ATTACK) || ((LEE_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_08");	//Не осталось никого, кто ВИДЕЛ бы, как ты избил одного из фермеров.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_09");	//Похоже, что все обвинения против тебя растворились в воздухе.
		};
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_10");	//Да уж, скажу тебе, это способ избавиться от подобных проблем.
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_11");	//Как бы то ни было, тебе больше не нужно платить.
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_12");	//Но будь осторожнее в будущем.
			LEE_SCHULDEN = 0;
			LEE_LASTPETZCOUNTER = 0;
			LEE_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_13");	//Ясно одно: ты должен, тем не менее, заплатить штраф полностью.
			b_say_gold(self,other,LEE_SCHULDEN);
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_14");	//Так как насчет этого?
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_lee_pmschulden);
		Info_ClearChoices(dia_lee_petzmaster);
		Info_AddChoice(dia_lee_pmschulden,"У меня нет столько золота!",dia_lee_petzmaster_paylater);
		Info_AddChoice(dia_lee_pmschulden,"Сколько там нужно?",dia_lee_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= LEE_SCHULDEN)
		{
			Info_AddChoice(dia_lee_pmschulden,"Я хочу заплатить штраф!",dia_lee_petzmaster_paynow);
		};
	};
};

func void dia_lee_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Lee_PMSchulden_HowMuchAgain_15_00");	//Сколько там нужно?
	b_say_gold(self,other,LEE_SCHULDEN);
	Info_ClearChoices(dia_lee_pmschulden);
	Info_ClearChoices(dia_lee_petzmaster);
	Info_AddChoice(dia_lee_pmschulden,"У меня нет столько золота!",dia_lee_petzmaster_paylater);
	Info_AddChoice(dia_lee_pmschulden,"Сколько там нужно?",dia_lee_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= LEE_SCHULDEN)
	{
		Info_AddChoice(dia_lee_pmschulden,"Я хочу заплатить штраф!",dia_lee_petzmaster_paynow);
	};
};


instance DIA_LEE_PETZMASTER(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_petzmaster_condition;
	information = dia_lee_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_lee_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > LEE_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_lee_petzmaster_info()
{
	if((KAPITEL >= 3) && (LEE_TELEPORT == FALSE))
	{
		b_lee_teleport();
	};
	LEE_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_00");	//Какого дьявола ТЕБЯ позволили пустить сюда? (удивленно) Это ТЫ новичок, от которого одни проблемы?
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_01");	//Я слышал от Горна, что ты все еще жив. Но что ты придешь сюда... А, ладно...
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_02");	//Хорошо, что ты все же пришел ко мне, пока твои дела не стали совсем паршивыми.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_03");	//Наемники - крутые парни, и фермеры здесь тоже могут постоять за себя, но ты не можешь просто так убивать людей.
		LEE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		LEE_SCHULDEN = LEE_SCHULDEN + 500;
		if((PETZCOUNTER_FARM_THEFT + PETZCOUNTER_FARM_ATTACK + PETZCOUNTER_FARM_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_04");	//Не говоря уже о других твоих преступлениях здесь.
		};
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_05");	//Я могу помочь тебе выбраться из этого дерьма.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_06");	//Это обойдется тебе в кругленькую сумму, впрочем. Онар жадный человек, и только если ОН закроет на все это глаза, вопрос можно будет считать улаженным.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_07");	//Хорошо, что ты пришел. Я слышал, что ты что-то украл.
		if(PETZCOUNTER_FARM_ATTACK > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_08");	//И вышиб дух из нескольких фермеров.
		};
		if(PETZCOUNTER_FARM_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_09");	//И убил несколько овец.
		};
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_10");	//Ты не можешь просто так творить подобное здесь. В таких случаях Онар настаивает, чтобы я наказывал преступников деньгами.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_11");	//Это означает: ты платишь, он набивает себе карман, но, по крайней мере, об этом деле можно будет забыть.
		LEE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_12");	//Если ты обвиняешься в дуэли с наемником, это одно...
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_13");	//Но если ты избил фермера, они сразу бегут к Онару. И он ожидает определенных действий от меня.
		if(PETZCOUNTER_FARM_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_14");	//Не говоря уже о том, что он приходит в бешенство, когда кто-то убивает овцу.
		};
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_15");	//Ты должен заплатить штраф. Твои деньги переходят в карман Онару, но это единственный способ решить проблему.
		LEE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_16");	//Онар ожидает от меня, что я буду защищать его ферму. Включая его овец.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_17");	//Тебе придется заплатить ему компенсацию!
		LEE_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Lee_PETZMASTER_15_18");	//Сколько?
	if(LEE_SCHULDEN > 1000)
	{
		LEE_SCHULDEN = 1000;
	};
	b_say_gold(self,other,LEE_SCHULDEN);
	Info_ClearChoices(dia_lee_pmschulden);
	Info_ClearChoices(dia_lee_petzmaster);
	Info_AddChoice(dia_lee_petzmaster,"У меня нет столько золота!",dia_lee_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= LEE_SCHULDEN)
	{
		Info_AddChoice(dia_lee_petzmaster,"Я хочу заплатить штраф!",dia_lee_petzmaster_paynow);
	};
};

func void dia_lee_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Lee_PETZMASTER_PayNow_15_00");	//Я хочу заплатить штраф!
	b_giveinvitems(other,self,itmi_gold,LEE_SCHULDEN);
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayNow_04_01");	//Хорошо! Я прослежу, чтобы эти деньги дошли до Онара. Можешь считать эту проблему забытой.
	b_grantabsolution(LOC_FARM);
	LEE_SCHULDEN = 0;
	LEE_LASTPETZCOUNTER = 0;
	LEE_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_lee_petzmaster);
	Info_ClearChoices(dia_lee_pmschulden);
};

func void dia_lee_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Lee_PETZMASTER_PayLater_15_00");	//У меня нет столько золота!
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayLater_04_01");	//Тогда добудь его и поскорее.
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayLater_04_02");	//Но я не думаю, что ты сможешь украсть его здесь, на ферме. Если тебя поймают, тебе так просто не отвертеться.
	LEE_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	LEE_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_LEE_HALLO(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_hallo_condition;
	information = dia_lee_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lee_hallo_condition()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_lee_hallo_info()
{
	AI_Output(self,other,"DIA_Lee_Hallo_04_00");	//Какого дьявола ТЕБЯ позволили пустить сюда? (удивленно) Что ты делаешь здесь? Я думал, ты мертв!
	AI_Output(other,self,"DIA_Lee_Hallo_15_01");	//С чего ты так думал?
	AI_Output(self,other,"DIA_Lee_Hallo_04_02");	//Горн сказал мне, что это ты разрушил Барьер.
	AI_Output(other,self,"DIA_Lee_Hallo_15_03");	//Да, это действительно был я.
	AI_Output(self,other,"DIA_Lee_Hallo_04_04");	//Никогда бы не подумал, что человек может выжить после всего этого. Что привело тебя сюда? Ты же здесь не просто так...
};


instance DIA_LEE_PALADINE(C_INFO)
{
	npc = sld_800_lee;
	nr = 2;
	condition = dia_lee_paladine_condition;
	information = dia_lee_paladine_info;
	permanent = FALSE;
	description = "Мне крайне необходимо поговорить с паладинами в городе...";
};


func int dia_lee_paladine_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_lee_paladine_info()
{
	AI_Output(other,self,"DIA_Lee_Paladine_15_00");	//Мне крайне необходимо поговорить с паладинами в городе. Ты не мог бы помочь мне добраться до них?
	AI_Output(self,other,"DIA_Lee_Paladine_04_01");	//(недоверчиво) Какие у тебя могут быть дела с паладинами?
	AI_Output(other,self,"DIA_Lee_Paladine_15_02");	//Это долгая история...
	AI_Output(self,other,"DIA_Lee_Paladine_04_03");	//У меня есть время.
	AI_Output(other,self,"DIA_Lee_Paladine_15_04");	//(вздыхает) Ксардас дал мне задание. Он хочет, чтобы я заполучил мощный амулет, Глаз Инноса.
	AI_Output(self,other,"DIA_Lee_Paladine_04_05");	//Значит, ты все еще в союзе с этим некромантом. Понятно. А этот амулет находится у паладинов, да?
	AI_Output(other,self,"DIA_Lee_Paladine_15_06");	//Насколько я знаю, да.
	AI_Output(self,other,"DIA_Lee_Paladine_04_07");	//Я могу помочь тебе добраться до паладинов. Но сначала ты должен стать одним из нас.
};


instance DIA_LEE_PALADINEHOW(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_paladinehow_condition;
	information = dia_lee_paladinehow_info;
	permanent = FALSE;
	description = "Как ты можешь помочь мне добраться до паладинов?";
};


func int dia_lee_paladinehow_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lee_paladine))
	{
		return TRUE;
	};
};

func void dia_lee_paladinehow_info()
{
	AI_Output(other,self,"DIA_Lee_PaladineHOW_15_00");	//Как ты можешь помочь мне добраться до паладинов?
	AI_Output(self,other,"DIA_Lee_PaladineHOW_04_01");	//Доверяй мне. У меня есть план. Я думаю, ты как раз подходишь для него...
	AI_Output(self,other,"DIA_Lee_PaladineHOW_04_02");	//Я сведу тебя с паладинами, а ты окажешь мне услугу. Но сначала присоединись к нам!
};


instance DIA_LEE_LEESPLAN(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_leesplan_condition;
	information = dia_lee_leesplan_info;
	permanent = FALSE;
	description = "А чем ты здесь занимаешься?";
};


func int dia_lee_leesplan_condition()
{
	if(LEE_ISONBOARD == FALSE)
	{
		return TRUE;
	};
};

func void dia_lee_leesplan_info()
{
	AI_Output(other,self,"DIA_Lee_LeesPlan_15_00");	//А чем ты здесь занимаешься?
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_01");	//Это просто: я делаю все возможное, чтобы мы все смогли убраться с этого острова.
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_02");	//Онар нанял нас для защиты его фермы, и именно этим мы и намерены заниматься.
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_03");	//Но наша награда - нечто большее, чем просто плата за работу. Помогая фермерам, мы отрезаем город от провизии.
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_04");	//А чем меньше паладины едят, тем скорее они прислушаются, когда, наконец, я сделаю им предложение о мире.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_LeesPlan_04_05");	//Плохо только, что тебе пришлось присоединиться именно к ним.
	};
	AI_Output(other,self,"DIA_Lee_LeesPlan_15_06");	//Что за предложение ты хочешь сделать?
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_07");	//Естественно, условием будет наше помилование и свободный путь на материк. Ты все узнаешь, когда придет время.
};


instance DIA_LEE_WANNAJOIN(C_INFO)
{
	npc = sld_800_lee;
	nr = 5;
	condition = dia_lee_wannajoin_condition;
	information = dia_lee_wannajoin_info;
	permanent = FALSE;
	description = "Я хочу присоединиться к вам!";
};


func int dia_lee_wannajoin_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_lee_wannajoin_info()
{
	AI_Output(other,self,"DIA_Lee_WannaJoin_15_00");	//Я хочу присоединиться к вам!
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_01");	//Я надеялся, что ты скажешь это! Нам здесь нужны каждые надежные руки.
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_02");	//От последних наемников, что я нанял, не было никакого толку, одни проблемы!
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_03");	//В принципе, ты можешь приступать прямо сейчас. Ну, правда есть парочка вопросов, которые нужно урегулировать, но, я думаю, это не будет проблемой...
};


instance DIA_LEE_CLEARWHAT(C_INFO)
{
	npc = sld_800_lee;
	nr = 6;
	condition = dia_lee_clearwhat_condition;
	information = dia_lee_clearwhat_info;
	permanent = FALSE;
	description = "Что нужно 'урегулировать' прежде чем я смогу присоединиться к вам?";
};


func int dia_lee_clearwhat_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_wannajoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lee_clearwhat_info()
{
	AI_Output(other,self,"DIA_Lee_ClearWhat_15_00");	//Что нужно 'урегулировать' прежде чем я смогу присоединиться к вам?
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_01");	//Нас нанимает Онар, лендлорд. Ты можешь находиться на ферме только с его одобрения.
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_02");	//Также, дело еще в наших парнях. Я смогу принять тебя, только если большинство наемников согласится, что ты можешь присоединиться к нам.
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_03");	//Но не ходи к Онару пока все не будет улажено. Он очень раздражительный тип...
	Log_CreateTopic(TOPIC_BECOMESLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BECOMESLD,LOG_RUNNING);
	b_logentry(TOPIC_BECOMESLD,"Чтобы быть принятым в ряды наемников, я должен получить одобрение Онара, после того, как заручусь одобрением наемников.");
};


instance DIA_LEE_OTHERSLD(C_INFO)
{
	npc = sld_800_lee;
	nr = 7;
	condition = dia_lee_othersld_condition;
	information = dia_lee_othersld_info;
	permanent = FALSE;
	description = "Как мне убедить наемников проголосовать за меня?";
};


func int dia_lee_othersld_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_wannajoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lee_othersld_info()
{
	AI_Output(other,self,"DIA_Lee_OtherSld_15_00");	//Как мне убедить наемников проголосовать за меня?
	AI_Output(self,other,"DIA_Lee_OtherSld_04_01");	//Делая то, что ожидается от тебя, когда ты будешь наемником, я бы сказал.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_02");	//Поговори с Торлофом. Он обычно находится перед домом. Он даст тебе испытание.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_03");	//Если ты сможешь пройти его, ты завоюешь большую часть необходимого уважения.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_04");	//Он расскажет тебе обо всем, что тебе нужно знать.
	b_logentry(TOPIC_BECOMESLD,"Чтобы быть принятым в ряды наемников, я должен пройти испытание Торлофа и заслужить уважение остальных наемников.");
};


var int lee_probeok;
var int lee_stimmenok;
var int lee_onarok;

instance DIA_LEE_JOINNOW(C_INFO)
{
	npc = sld_800_lee;
	nr = 8;
	condition = dia_lee_joinnow_condition;
	information = dia_lee_joinnow_info;
	permanent = TRUE;
	description = "Я готов присоединиться к вам!";
};


func int dia_lee_joinnow_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lee_othersld) && (LEE_ONAROK == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_joinnow_info()
{
	AI_Output(other,self,"DIA_Lee_JoinNOW_15_00");	//Я готов присоединиться к вам!
	if(LEE_PROBEOK == FALSE)
	{
		if((MIS_TORLOF_HOLPACHTVONSEKOB != LOG_SUCCESS) && (MIS_TORLOF_BENGARMILIZKLATSCHEN != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_01");	//Сначала ты должен пройти испытание Торлофа.
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_02");	//Так ты прошел испытание Торлофа?
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_03");	//Да.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_04");	//Это хорошо.
			LEE_PROBEOK = TRUE;
		};
	};
	if((LEE_PROBEOK == TRUE) && (LEE_STIMMENOK == FALSE))
	{
		AI_Output(self,other,"DIA_Lee_JoinNOW_04_05");	//А что говорят другие наемники?
		if(TORLOF_GENUGSTIMMEN == FALSE)
		{
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_06");	//Я не уверен, достаточно ли наемников на моей стороне.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_07");	//Тогда поговори с Торлофом, он знает обо всем, о чем говорят на этой ферме.
		}
		else
		{
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_08");	//Большинство из них на моей стороне.
			LEE_STIMMENOK = TRUE;
		};
	};
	if((LEE_STIMMENOK == TRUE) && (LEE_ONAROK == FALSE))
	{
		if(ONAR_APPROVED == FALSE)
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_09");	//Хорошо, тогда иди прямо к Онару. Я уже переговорил с ним.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_10");	//Но ты должен договориться о своем жаловании сам.
			LEE_SENDTOONAR = TRUE;
			b_logentry(TOPIC_BECOMESLD,"Все, что мне нужно теперь - это одобрение Онара.");
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_11");	//Ты беседовал с Онаром?
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_12");	//Он согласился.
			LEE_ONAROK = TRUE;
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_13");	//Тогда добро пожаловать в наши ряды, приятель!
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_14");	//Вот, возьми для начала эти доспехи!
			Npc_SetTrueGuild(other,GIL_SLD);
			other.guild = GIL_SLD;
			CreateInvItems(other,itar_sld_l,1);
			AI_EquipArmor(other,itar_sld_l);
			Snd_Play("LEVELUP");
			KDF_AUFNAHME = LOG_OBSOLETE;
			SLD_AUFNAHME = LOG_SUCCESS;
			MIL_AUFNAHME = LOG_OBSOLETE;
			b_giveplayerxp(XP_BECOMEMERCENARY);
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_15");	//Я рад, что ты с нами.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_16");	//У меня уже есть первое поручение для тебя.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_17");	//Оно имеет отношение к паладинам. Пришло время тебе увидеться с ними.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_18");	//Ты все равно хотел туда идти.
		};
	};
};


instance DIA_LEE_KEINSLD(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_keinsld_condition;
	information = dia_lee_keinsld_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lee_keinsld_condition()
{
	if(((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (LEE_ISONBOARD == FALSE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_lee_keinsld_info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_KeinSld_04_00");	//Я вижу, ты поступил на службу к паладинам.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lee_KeinSld_04_01");	//Ты постригся в монастырь? (смеется) Я всего ожидал, только не этого.
	};
	AI_Output(self,other,"DIA_Lee_KeinSld_04_02");	//Что ж, теперь ты не сможешь стать наемником.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_03");	//Но кто знает, может быть, ты сможешь сделать что-нибудь для меня - или я для тебя.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_04");	//Посмотрим. Но, как бы то ни было я желаю тебе всего наилучшего.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_05");	//Но даже и не думай обвести меня вокруг пальца, понял?
};


instance DIA_LEE_TOHAGEN(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_tohagen_condition;
	information = dia_lee_tohagen_info;
	permanent = FALSE;
	description = "И как мне теперь добраться до паладинов?";
};


func int dia_lee_tohagen_condition()
{
	if(other.guild == GIL_SLD)
	{
		return TRUE;
	};
};

func void dia_lee_tohagen_info()
{
	AI_Output(other,self,"DIA_Lee_ToHagen_15_00");	//И как мне теперь добраться до паладинов?
	AI_Output(self,other,"DIA_Lee_ToHagen_04_01");	//Очень просто. Ты отнесешь им наше предложение о мире.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_02");	//Я знаю лорда Хагена, командующего паладинов, со времен моей службы в королевской армии.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_03");	//Я знаю, о чем он думает - у него недостаточно людей. Он примет это предложение. По крайней мере, он выслушает тебя.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_04");	//Я написал ему письмо - держи.
	b_giveinvitems(self,other,itwr_passage_mis,1);
	AI_Output(self,other,"DIA_Lee_ToHagen_04_05");	//В любом случае, это должно тебе позволить получить аудиенцию у командующего паладинов.
	MIS_LEE_FRIEDENSANGEBOT = LOG_RUNNING;
	Log_CreateTopic(TOPIC_FRIEDEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FRIEDEN,LOG_RUNNING);
	b_logentry(TOPIC_FRIEDEN,"Ли отправляет меня к лорду Хагену с предложением мира. Так я могу добиться аудиенции у паладинов.");
};


instance DIA_LEE_ANGEBOTSUCCESS(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_angebotsuccess_condition;
	information = dia_lee_angebotsuccess_info;
	permanent = FALSE;
	description = "Я отнес лорду Хагену твое предложение о мире.";
};


func int dia_lee_angebotsuccess_condition()
{
	if(HAGEN_FRIEDENABGELEHNT == TRUE)
	{
		return TRUE;
	};
};

func void dia_lee_angebotsuccess_info()
{
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_00");	//Я отнес лорду Хагену твое предложение о мире.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_01");	//Что он сказал?
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_02");	//Он сказал, что он готов даровать помилование тебе, но не твоим людям.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_03");	//Вот упрямый дурак. Большинство людей в КОРОЛЕВСКОЙ армии большие головорезы, чем мои парни.
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_04");	//Что ты собираешься делать теперь?
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_05");	//Я должен найти другой способ вытащить нас отсюда. Если понадобится, мы захватим корабль. Мне нужно подумать об этом.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_06");	//Вытащить свою голову из петли и бросить моих людей - это даже не обсуждается.
	MIS_LEE_FRIEDENSANGEBOT = LOG_SUCCESS;
};


instance DIA_LEE_BACKGROUND(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_background_condition;
	information = dia_lee_background_info;
	permanent = FALSE;
	description = "Почему ты так рвешься на материк?";
};


func int dia_lee_background_condition()
{
	if(MIS_LEE_FRIEDENSANGEBOT == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_lee_background_info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_10");	//Почему ты так рвешься на материк?
	AI_Output(self,other,"DIA_Lee_Add_04_11");	//Как ты знаешь, я был генералом в армии короля.
	AI_Output(self,other,"DIA_Lee_Add_04_12");	//Но его лизоблюды предали меня, потому что я знал кое-что, чего не должен был знать.
	AI_Output(self,other,"DIA_Lee_Add_04_13");	//Они засунули меня в эту колонию, и король позволил это.
	AI_Output(self,other,"DIA_Lee_Add_04_14");	//У меня было много свободного времени, чтобы все обдумать.
	AI_Output(self,other,"DIA_Lee_Add_04_15");	//Я должен отомстить.
	AI_Output(other,self,"DIA_Lee_Add_15_16");	//(изумленно) Королю?
	AI_Output(self,other,"DIA_Lee_Add_04_17");	//(решительно) Королю! И его прихвостням. Они все горько пожалеют о том, что сделали со мной...
};


instance DIA_LEE_RESCUEGORN(C_INFO)
{
	npc = sld_800_lee;
	nr = 2;
	condition = dia_lee_rescuegorn_condition;
	information = dia_lee_rescuegorn_info;
	permanent = FALSE;
	description = "Я собираюсь отправиться в Долину Рудников.";
};


func int dia_lee_rescuegorn_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_proof) && (KAPITEL < 3) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_lee_rescuegorn_info()
{
	AI_Output(other,self,"DIA_Lee_RescueGorn_15_00");	//Я собираюсь отправиться в Долину Рудников.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_01");	//Я и не надеялся, что ты долго задержишься на этой ферме.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_02");	//Если ты возвращаешься в колонию, поищи там Горна. Паладины держат его там за решеткой.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_03");	//Горн хороший человек, и он бы очень пригодился мне здесь, так что если у тебя появится шанс освободить парня, не упускай его.
	KNOWSABOUTGORN = TRUE;
};


instance DIA_LEE_SUCCESS(C_INFO)
{
	npc = sld_800_lee;
	nr = 2;
	condition = dia_lee_success_condition;
	information = dia_lee_success_info;
	permanent = FALSE;
	description = "Я освободил Горна.";
};


func int dia_lee_success_condition()
{
	if((MIS_RESCUEGORN == LOG_SUCCESS) && (KAPITEL >= 3) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_lee_success_info()
{
	AI_Output(other,self,"DIA_Lee_Success_15_00");	//Я освободил Горна.
	AI_Output(self,other,"DIA_Lee_Success_04_01");	//Да, он уже рассказал мне об этом. Отлично сработано.
	AI_Output(self,other,"DIA_Lee_Success_04_02");	//Он стоит больше, чем Сильвио и все его парни вместе взятые.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LEE_ABOUTGORN(C_INFO)
{
	npc = sld_800_lee;
	nr = 5;
	condition = dia_lee_aboutgorn_condition;
	information = dia_lee_aboutgorn_info;
	permanent = FALSE;
	description = "Горн сказал тебе обо мне? Что произошло с ним?";
};


func int dia_lee_aboutgorn_condition()
{
	if((KAPITEL < 3) && (Npc_KnowsInfo(other,dia_lee_rescuegorn) == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_aboutgorn_info()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_15_00");	//Горн сказал тебе обо мне? Что произошло с ним?
	AI_Output(self,other,"DIA_Lee_AboutGorn_04_01");	//Ты ведь помнишь его, да?
	Info_ClearChoices(dia_lee_aboutgorn);
	Info_AddChoice(dia_lee_aboutgorn,"Дай попытаюсь вспомнить...",dia_lee_aboutgorn_who);
	Info_AddChoice(dia_lee_aboutgorn,"Конечно.",dia_lee_aboutgorn_yes);
};

func void dia_lee_aboutgorn_yes()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_Yes_15_00");	//Конечно.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_01");	//Его поймали паладины и отправили назад, в Долину Рудников с конвоем каторжников.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_02");	//Если бы дорога в Долину Рудников не кишела паладинами и орками, я бы уже отправил пару своих парней, чтобы освободить его.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_03");	//Но сейчас это абсолютно неосуществимо. Бедняга.
	Info_ClearChoices(dia_lee_aboutgorn);
};

func void dia_lee_aboutgorn_who()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_Who_15_00");	//Дай попытаюсь вспомнить...
	AI_Output(self,other,"DIA_Lee_AboutGorn_Who_04_01");	//Большой, черноволосый, плохой парень с большим топором, он отбил нашу шахту с твоей помощью. Это было в колонии.
};


instance DIA_LEE_WEGENBULLCO(C_INFO)
{
	npc = sld_800_lee;
	nr = 6;
	condition = dia_lee_wegenbullco_condition;
	information = dia_lee_wegenbullco_info;
	permanent = FALSE;
	description = "У Онара теперь на несколько овец меньше благодаря Булко...";
};


func int dia_lee_wegenbullco_condition()
{
	if((KAPITEL < 4) && (MIS_PEPE_KILLWOLVES == LOG_SUCCESS) && (ONAR_WEGENPEPE == TRUE))
	{
		return TRUE;
	};
};

func void dia_lee_wegenbullco_info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_00");	//У Онара теперь на несколько овец меньше благодаря Булко...
	AI_Output(self,other,"DIA_Lee_Add_04_01");	//Ох, не приставай ко мне с такой чепухой! У меня и без этого проблем хватает.
	if((BULLCO_SCHARF == TRUE) && !Npc_IsDead(bullco))
	{
		AI_Output(other,self,"DIA_Lee_Add_15_02");	//У меня тоже. Булко, похоже, видит проблему во мне. Он хочет, чтобы я покинул ферму...
		AI_Output(self,other,"DIA_Lee_Add_04_03");	//Да, и что? Постой за себя.
		AI_Output(self,other,"DIA_Lee_Add_04_04");	//Ты можешь сказать ему, что он должен вести себя сдержаннее, или я вычту пропавших овец из его жалования...
	};
};


instance DIA_LEE_REPORT(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_report_condition;
	information = dia_lee_report_info;
	permanent = TRUE;
	description = "Я пришел из Долины Рудников...";
};


func int dia_lee_report_condition()
{
	if((ENTEROW_KAPITEL2 == TRUE) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_lee_report_info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_18");	//Я пришел из Долины Рудников. Замок, находящийся там, был атакован драконами!
	AI_Output(self,other,"DIA_Lee_Add_04_19");	//Так это правда! Ларес говорил, что в городе циркулируют слухи о драконах... Я не поверил в это...
	AI_Output(self,other,"DIA_Lee_Add_04_20");	//А что насчет паладинов?
	AI_Output(other,self,"DIA_Lee_Add_15_21");	//Они понесли большие потери.
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Lee_Add_04_22");	//Хорошо! Может теперь лорд Хаген более взвешенно подумает о моем предложении...
		AI_Output(self,other,"DIA_Lee_Add_04_23");	//А если нет... (жестко) Тогда мы найдем другой способ вырваться отсюда...
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_Add_04_24");	//Хорошо! Может, это заставит лорда Хагена отправиться со своими людьми в Долину Рудников...
		AI_Output(self,other,"DIA_Lee_Add_04_25");	//Чем меньше паладинов останется здесь, тем лучше.
	};
};


var int lee_give_sld_m;

instance DIA_LEE_ARMORM(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_armorm_condition;
	information = dia_lee_armorm_info;
	permanent = TRUE;
	description = "А как насчет доспехов получше?";
};


func int dia_lee_armorm_condition()
{
	if((KAPITEL == 2) && (other.guild == GIL_SLD) && (LEE_GIVE_SLD_M == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_armorm_info()
{
	AI_Output(other,self,"DIA_Lee_ArmorM_15_00");	//А как насчет доспехов получше?
	if((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS) && (MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Lee_ArmorM_04_01");	//Ты выполнил задание.
		AI_Output(self,other,"DIA_Lee_ArmorM_04_02");	//У меня есть достойные доспехи для тебя. Конечно, если ты кредитоспособен.
		LEE_GIVE_SLD_M = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_ArmorM_04_03");	//Торлоф получил задание от Онара, которое должно было быть выполнено уже давным-давно.
		AI_Output(self,other,"DIA_Lee_ArmorM_04_04");	//Сначала реши этот вопрос, а затем мы поговорим о достойных доспехах!
	};
};


var int lee_sldmgiven;

instance DIA_LEE_BUYARMORM(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_buyarmorm_condition;
	information = dia_lee_buyarmorm_info;
	permanent = TRUE;
	description = "Купить средние доспехи наемника. Защита: оружие 45, стрелы 45. Цена: 500 золота";
};


func int dia_lee_buyarmorm_condition()
{
	if((LEE_GIVE_SLD_M == TRUE) && (LEE_SLDMGIVEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_buyarmorm_info()
{
	AI_Output(other,self,"DIA_Lee_BuyArmorM_15_00");	//Дай мне эти доспехи.
	if(b_giveinvitems(other,self,itmi_gold,500))
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorM_04_01");	//Держи. Это очень хорошие доспехи.
		CreateInvItems(other,itar_sld_m,1);
		AI_EquipArmor(other,itar_sld_m);
		LEE_SLDMGIVEN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorM_04_02");	//Но это не подарок! Сначала я хочу увидеть золото!
	};
};


instance DIA_LEE_KAP3_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_kap3_exit_condition;
	information = dia_lee_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lee_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEE_TELEPORT(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_teleport_condition;
	information = dia_lee_teleport_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lee_teleport_condition()
{
	if((KAPITEL >= 3) && Npc_IsInState(self,zs_talk) && (LEE_TELEPORT == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_teleport_info()
{
	b_lee_teleport();
};


instance DIA_LEE_ARMORH(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_armorh_condition;
	information = dia_lee_armorh_info;
	permanent = FALSE;
	description = "У тебя есть доспехи получше для меня?";
};


func int dia_lee_armorh_condition()
{
	if((KAPITEL == 3) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_lee_armorh_info()
{
	AI_Output(other,self,"DIA_Lee_ArmorH_15_00");	//У тебя есть доспехи получше для меня?
	AI_Output(self,other,"DIA_Lee_ArmorH_04_01");	//Конечно.
};


var int lee_sldhgiven;

instance DIA_LEE_BUYARMORH(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_buyarmorh_condition;
	information = dia_lee_buyarmorh_info;
	permanent = TRUE;
	description = "Купить тяжелые доспехи наемника. Защита: оружие 60, стрелы 60. Цена: 1000 золота";
};


func int dia_lee_buyarmorh_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_armorh) && (LEE_SLDHGIVEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_buyarmorh_info()
{
	AI_Output(other,self,"DIA_Lee_BuyArmorH_15_00");	//Дай мне тяжелые доспехи.
	if(b_giveinvitems(other,self,itmi_gold,1000))
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorH_04_01");	//Держи. Это очень хорошие доспехи. Я сам такие ношу.
		CreateInvItems(other,itar_sld_h,1);
		AI_EquipArmor(other,itar_sld_h);
		LEE_SLDHGIVEN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorH_04_02");	//Ты знаешь правила. Сначала золото!
	};
};


instance DIA_LEE_RICHTER(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_richter_condition;
	information = dia_lee_richter_info;
	permanent = FALSE;
	description = "У тебя нет еще для меня работы?";
};


func int dia_lee_richter_condition()
{
	if((KAPITEL >= 3) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (Npc_IsDead(richter) == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_richter_info()
{
	AI_Output(other,self,"DIA_Lee_Richter_15_00");	//У тебя нет еще для меня работы?
	AI_Output(self,other,"DIA_Lee_Richter_04_01");	//Тебе все мало, да? По-моему, у тебя и без того проблем хватает. Чего же еще тебе нужно?
	AI_Output(other,self,"DIA_Lee_Richter_15_02");	//Еще задание. Я же наемник, помнишь?
	AI_Output(self,other,"DIA_Lee_Richter_04_03");	//Хорошо. У меня есть кое-что. Как раз для тебя.
	AI_Output(self,other,"DIA_Lee_Richter_04_04");	//Я должен поквитаться с судьей в городе. Я бы, конечно, предпочел сделать это сам.
	AI_Output(self,other,"DIA_Lee_Richter_04_05");	//Но паладины и на пушечный выстрел не подпустят меня к его дому.
	AI_Output(self,other,"DIA_Lee_Richter_04_06");	//Это дело очень деликатное. Так что слушай внимательно. Ты пойдешь к судье и предложишь ему свои услуги.
	AI_Output(self,other,"DIA_Lee_Richter_04_07");	//Ты должен попытаться завоевать его доверие и выполнять всякую грязную работу, пока не найдешь что-нибудь, дискредитирующее его.
	AI_Output(self,other,"DIA_Lee_Richter_04_08");	//Эта свинья провернула столько грязных делишек, что от него смердит за версту.
	AI_Output(self,other,"DIA_Lee_Richter_04_09");	//Дай мне что-нибудь, что я смогу использовать, чтобы запятнать его имя перед лицом ополчения. Я хочу, чтобы он провел остаток своих дней за решеткой.
	AI_Output(self,other,"DIA_Lee_Richter_04_10");	//Но я не хочу, чтобы ты убивал его. Это для него слишком мало. Я хочу, чтобы он страдал, понимаешь?
	AI_Output(self,other,"DIA_Lee_Richter_04_11");	//Как ты думаешь, справишься?
	Log_CreateTopic(TOPIC_RICHTERLAKAI,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RICHTERLAKAI,LOG_RUNNING);
	b_logentry(TOPIC_RICHTERLAKAI,"Ли хочет, чтобы я нашел доказательства, обвиняющие судью Хориниса. Для этого, я должен предложить свои услуги судье и должен держать ушки на макушке.");
	MIS_LEE_JUDGERICHTER = LOG_RUNNING;
	Info_ClearChoices(dia_lee_richter);
	Info_AddChoice(dia_lee_richter,"Я не буду заниматься этим.",dia_lee_richter_nein);
	Info_AddChoice(dia_lee_richter,"Нет проблем. Сколько?",dia_lee_richter_wieviel);
};

func void dia_lee_richter_wieviel()
{
	AI_Output(other,self,"DIA_Lee_Richter_wieviel_15_00");	//Нет проблем. Сколько?
	AI_Output(self,other,"DIA_Lee_Richter_wieviel_04_01");	//Твоя награда зависит от того, что ты сообщишь мне. Так что постарайся.
	Info_ClearChoices(dia_lee_richter);
};

func void dia_lee_richter_nein()
{
	AI_Output(other,self,"DIA_Lee_Richter_nein_15_00");	//Я не буду заниматься этим. Я не хочу прислуживать этой свинье.
	AI_Output(self,other,"DIA_Lee_Richter_nein_04_01");	//Не нервничай так. Помни о том, что именно он засадил тебя за решетку и засунул за Барьер. Или ты забыл это?
	AI_Output(self,other,"DIA_Lee_Richter_nein_04_02");	//Поступай, как знаешь, но я надеюсь, ты примешь правильное решение.
	Info_ClearChoices(dia_lee_richter);
};


instance DIA_LEE_RICHTERBEWEISE(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_richterbeweise_condition;
	information = dia_lee_richterbeweise_info;
	description = "Я нашел кое-что, дискредитирующее судью.";
};


func int dia_lee_richterbeweise_condition()
{
	if((KAPITEL >= 3) && (MIS_LEE_JUDGERICHTER == LOG_RUNNING) && Npc_HasItems(other,itwr_richterkomprobrief_mis) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_lee_richterbeweise_info()
{
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_00");	//Я нашел кое-что, дискредитирующее судью.
	AI_Output(self,other,"DIA_Lee_RichterBeweise_04_01");	//Правда? И что же?
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_02");	//Он нанял головорезов, чтобы те ограбили губернатора Хориниса.
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_03");	//Вскоре после этого он арестовал их и забрал себе все золото.
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_04");	//Я принес тебе в качестве доказательства письменный приказ судьи этим головорезам.
	AI_Output(self,other,"DIA_Lee_RichterBeweise_04_05");	//Покажи.
	b_giveinvitems(other,self,itwr_richterkomprobrief_mis,1);
	b_usefakescroll();
	if(Npc_IsDead(richter) == FALSE)
	{
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_06");	//Наконец-то. Этого должно быть достаточно, чтобы заставить его страдать. Я восхищен.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_07");	//Я готов хорошо заплатить за это. Держи свою награду.
		CreateInvItems(self,itmi_gold,500);
		b_giveinvitems(self,other,itmi_gold,500);
		MIS_LEE_JUDGERICHTER = LOG_SUCCESS;
		b_giveplayerxp(XP_JUDGERICHTER);
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_08");	//И не говори об этом никому, хорошо?
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_09");	//Это потрясающе. Но вопрос решился сам собой. Судья мертв.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_10");	//Какой-то идиот прикончил его. Ох, да. Меня это тоже, в общем-то, устраивает.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_11");	//Вот несколько монет. Эта бумажка сейчас большего не стоит.
		CreateInvItems(self,itmi_gold,50);
		b_giveinvitems(self,other,itmi_gold,50);
		MIS_LEE_JUDGERICHTER = LOG_FAILED;
		b_giveplayerxp(XP_AMBIENT);
	};
};


instance DIA_LEE_TALKABOUTBENNET(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_talkaboutbennet_condition;
	information = dia_lee_talkaboutbennet_info;
	permanent = FALSE;
	description = "Что насчет Беннета?";
};


func int dia_lee_talkaboutbennet_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_lee_talkaboutbennet_info()
{
	AI_Output(other,self,"DIA_Lee_TalkAboutBennet_15_00");	//Что насчет Беннета?
	AI_Output(self,other,"DIA_Lee_TalkAboutBennet_04_01");	//Так ты уже знаешь. Эти ублюдки посадили его за решетку. Вот и все.
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_TalkAboutBennet_04_02");	//Как будто мне не хватает проблем с моими людьми - теперь я должен заботиться еще и о паладинах.
	};
};


instance DIA_LEE_DOABOUTBENNET(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_doaboutbennet_condition;
	information = dia_lee_doaboutbennet_info;
	permanent = FALSE;
	description = "Что ты собираешься сделать для Беннета?";
};


func int dia_lee_doaboutbennet_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_lee_talkaboutbennet))
	{
		return TRUE;
	};
};

func void dia_lee_doaboutbennet_info()
{
	AI_Output(other,self,"DIA_Lee_DoAboutBennet_15_00");	//Что ты собираешься сделать для Беннета?
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_01");	//Я пока не знаю. Часть парней готовы хоть сейчас ворваться в город и вбить зубы лорду Хагену по самые гланды.
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_02");	//К счастью, у нас недостаточно людей для такой операции, и, кроме того, это не в моем стиле.
	AI_Output(other,self,"DIA_Lee_DoAboutBennet_15_03");	//То есть ты собираешься сидеть сложа руки?
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_04");	//Конечно нет.
	b_logentry(TOPIC_RESCUEBENNET,"Если я не смогу доказать невиновность Беннета достаточно быстро, Ли ничего не может гарантировать. Его люди могут не выдержать и напасть на город в любой момент, чтобы освободить Беннета.");
	if(!Npc_IsDead(lares))
	{
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_05");	//Ларес все еще в городе и пытается выяснить, как можно вытащить Беннета.
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_06");	//А пока я попытаюсь успокоить моих парней. Остается надеяться, что Ларесу не понадобится слишком много времени на это.
	};
	if(!Npc_IsDead(buster) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_07");	//Ох, да. Чуть не забыл... Бастер хочет поболтать с тобой. Он не говорит мне, о чем. Может, тебе стоит найти его?
	};
};


instance DIA_LEE_CANHELPYOU(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_canhelpyou_condition;
	information = dia_lee_canhelpyou_info;
	permanent = FALSE;
	description = "Могу я как-нибудь помочь с Беннетом?";
};


func int dia_lee_canhelpyou_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_lee_doaboutbennet))
	{
		return TRUE;
	};
};

func void dia_lee_canhelpyou_info()
{
	AI_Output(other,self,"DIA_Lee_CanHelpYou_15_00");	//Могу я как-нибудь помочь с Беннетом?
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_01");	//Конечно, но помни, что в таком деле нужен трезвый ум и холодный расчет.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_02");	//Иннос свидетель, горячих идиотов здесь и так хватает.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_03");	//Иди в город, может, тебе удастся найти способ вытащить Беннета оттуда.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_04");	//Но не затягивай сильно с этим делом, я не знаю, как долго мне удастся удерживать парней под контролем.
};


var int dia_lee_anynews_onetime;

instance DIA_LEE_ANYNEWS(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_anynews_condition;
	information = dia_lee_anynews_info;
	permanent = TRUE;
	description = "Есть новости о Беннете?";
};


func int dia_lee_anynews_condition()
{
	if((MIS_RESCUEBENNET != FALSE) && Npc_KnowsInfo(other,dia_lee_doaboutbennet) && (DIA_LEE_ANYNEWS_ONETIME == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_anynews_info()
{
	AI_Output(other,self,"DIA_Lee_AnyNews_15_00");	//Есть новости о Беннете?
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lee_AnyNews_04_01");	//Ну, по крайней мере, тюрьма, похоже, не сильно сказалась на его здоровье.
		AI_Output(self,other,"DIA_Lee_AnyNews_04_02");	//Отличная работа.
		if(DIA_LEE_ANYNEWS_ONETIME == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			DIA_LEE_ANYNEWS_ONETIME = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_AnyNews_04_03");	//Нет, мы все еще знаем недостаточно.
	};
};


instance DIA_LEE_SYLVIO(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_sylvio_condition;
	information = dia_lee_sylvio_info;
	description = "Что произошло за последнее время?";
};


func int dia_lee_sylvio_condition()
{
	if(MIS_READYFORCHAPTER4 == TRUE)
	{
		return TRUE;
	};
};

func void dia_lee_sylvio_info()
{
	AI_Output(other,self,"DIA_Lee_SYLVIO_15_00");	//Что произошло за последнее время?
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_01");	//Сильвио, ублюдок, прослышал о драконах в Долине Рудников и свел с ума всех здесь на ферме баснями о них.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_02");	//Он пытался уговорить парней пойти с ним в Долину Рудников. Он обещал им славу, почет, золото и еще кучу всяческих благ.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_03");	//Большинство не особенно воодушевилось идеей быть убитым ради Сильвио, но все же нашлось несколько идиотов, которые клюнули на его наживку.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_04");	//Все закончилось тем, что они вооружились у Беннета, а затем свалили.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_05");	//(облегченно) Ах. Откровенно говоря, я даже рад, что Сильвио наконец ушел с фермы.
};


instance DIA_LEE_KAP4_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_kap4_exit_condition;
	information = dia_lee_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lee_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEE_CANTEACH(C_INFO)
{
	npc = sld_800_lee;
	nr = 10;
	condition = dia_lee_canteach_condition;
	information = dia_lee_canteach_info;
	permanent = TRUE;
	description = "Ты можешь обучить меня?";
};


func int dia_lee_canteach_condition()
{
	if((KAPITEL >= 4) && (LEE_TEACHPLAYER == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_canteach_info()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_15_00");	//Ты можешь обучить меня?
	AI_Output(self,other,"DIA_Lee_CanTeach_04_01");	//Я могу показать тебе, как сражаться двуручным оружием.
	if(other.hitchance[NPC_TALENT_2H] < 60)
	{
		AI_Output(self,other,"DIA_Lee_CanTeach_04_02");	//Но у меня нет времени на то, чтобы учить тебя основам.
		AI_Output(self,other,"DIA_Lee_CanTeach_04_03");	//Как только ты достигнешь определенного уровня, я в твоем распоряжении. А пока поищи другого учителя.
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_CanTeach_04_04");	//Я слышал, что ты очень хорош. Но готов поспорить, что я все же могу научить тебя парочке-другой приемов.
		AI_Output(self,other,"DIA_Lee_CanTeach_04_05");	//Так что, если хочешь, я могу потренировать тебя. Впрочем, не бесплатно.
		AI_Output(other,self,"DIA_Lee_CanTeach_15_06");	//Сколько?
		AI_Output(self,other,"DIA_Lee_CanTeach_04_07");	//1000 монет - и считай, что мы договорились.
		Info_ClearChoices(dia_lee_canteach);
		Info_AddChoice(dia_lee_canteach,"Это слишком дорого для меня.",dia_lee_canteach_no);
		if(Npc_HasItems(other,itmi_gold) >= 1000)
		{
			Info_AddChoice(dia_lee_canteach,"Договорились. Вот золото.",dia_lee_canteach_yes);
		};
	};
};

func void dia_lee_canteach_no()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_No_15_00");	//Это слишком дорого для меня.
	AI_Output(self,other,"DIA_Lee_CanTeach_No_04_01");	//Подумай на досуге. Учителя моего калибра встречаются нечасто.
	Info_ClearChoices(dia_lee_canteach);
};

func void dia_lee_canteach_yes()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_Yes_15_00");	//Договорились. Вот золото.
	AI_Output(self,other,"DIA_Lee_CanTeach_Yes_04_01");	//Хорошо, поверь мне: я стою этих денег.
	b_giveinvitems(other,self,itmi_gold,1000);
	LEE_TEACHPLAYER = TRUE;
	Info_ClearChoices(dia_lee_canteach);
	Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTEACHER,"Ли может обучить меня искусству обращения с двуручным оружием.");
};


instance DIA_LEE_TEACH(C_INFO)
{
	npc = sld_800_lee;
	nr = 10;
	condition = dia_lee_teach_condition;
	information = dia_lee_teach_info;
	permanent = TRUE;
	description = "Начнем обучение.";
};


func int dia_lee_teach_condition()
{
	if(LEE_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_lee_teach_info()
{
	AI_Output(other,self,"DIA_Lee_Teach_15_00");	//Начнем обучение.
	Info_ClearChoices(dia_lee_teach);
	Info_AddChoice(dia_lee_teach,DIALOG_BACK,dia_lee_teach_back);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_lee_teach_2h_1);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_lee_teach_2h_5);
};

func void dia_lee_teach_back()
{
	Info_ClearChoices(dia_lee_teach);
};

func void dia_lee_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,100);
	if(other.hitchance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_00");	//Теперь ты настоящий мастер боя двуручным оружием.
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_01");	//Ты больше не нуждаешься в учителях.
	};
	Info_ClearChoices(dia_lee_teach);
	Info_AddChoice(dia_lee_teach,DIALOG_BACK,dia_lee_teach_back);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_lee_teach_2h_1);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_lee_teach_2h_5);
};

func void dia_lee_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,100);
	if(other.hitchance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_00");	//Теперь ты настоящий мастер боя двуручным оружием.
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_01");	//Ты больше не нуждаешься в учителях.
	};
	Info_ClearChoices(dia_lee_teach);
	Info_AddChoice(dia_lee_teach,DIALOG_BACK,dia_lee_teach_back);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_lee_teach_2h_1);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_lee_teach_2h_5);
};


instance DIA_LEE_DRACHENEI(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_drachenei_condition;
	information = dia_lee_drachenei_info;
	description = "Люди-ящеры раскладывают драконьи яйца по всему острову.";
};


func int dia_lee_drachenei_condition()
{
	if(Npc_HasItems(other,itat_dragonegg_mis))
	{
		return TRUE;
	};
};

func void dia_lee_drachenei_info()
{
	AI_Output(other,self,"DIA_Lee_DRACHENEI_15_00");	//Люди-ящеры раскладывают драконьи яйца по всему острову.
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(self,other,"DIA_Lee_DRACHENEI_04_01");	//Я мог понять это раньше. Пришло время убираться отсюда.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Lee_DRACHENEI_15_02");	//А что мне делать с ними?
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_03");	//Разбей их. Что еще?
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_04");	//Может быть, из скорлупы можно будет сделать доспехи или еще что-нибудь.
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_05");	//Похоже, они очень крепкие. Поговори об этом с Беннетом.
		b_logentry(TOPIC_DRACHENEIER,"Ли не знает, что делать с драконьим яйцом. Он отправил меня к кузнецу Беннету.");
	};
};


instance DIA_LEE_KAP4_PERM(C_INFO)
{
	npc = sld_800_lee;
	nr = 49;
	condition = dia_lee_kap4_perm_condition;
	information = dia_lee_kap4_perm_info;
	permanent = TRUE;
	description = "Как идут дела на ферме?";
};


func int dia_lee_kap4_perm_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lee_kap4_perm_info()
{
	AI_Output(other,self,"DIA_Lee_KAP4_Perm_15_00");	//Как идут дела на ферме?
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_01");	//Ну, с тех пор как Сильвио свалил, здесь стало довольно спокойно.
	AI_Output(other,self,"DIA_Lee_KAP4_Perm_15_02");	//По-моему, это тоже неплохо.
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_03");	//Но, к сожалению, у нас не стало меньше работы. Парни все чаще и чаще выражают недовольство, им теперь приходится работать еще и за людей Сильвио.
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_04");	//Но это мои проблемы. Я справлюсь.
};


instance DIA_LEE_KAP5_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_kap5_exit_condition;
	information = dia_lee_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lee_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEE_GETSHIP(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_getship_condition;
	information = dia_lee_getship_info;
	description = "Ты не знаешь, как мне захватить корабль паладинов?";
};


func int dia_lee_getship_condition()
{
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_lee_getship_info()
{
	AI_Output(other,self,"DIA_Lee_GetShip_15_00");	//Ты не знаешь, как мне захватить корабль паладинов?
	AI_Output(self,other,"DIA_Lee_GetShip_04_01");	//Ты думаешь, я все еще сидел бы здесь, если б знал? Этот корабль охраняют сильнее, чем транспорты с рудой в старой колонии.
	AI_Output(other,self,"DIA_Lee_GetShip_15_02");	//Должен же быть способ попасть на корабль.
	AI_Output(self,other,"DIA_Lee_GetShip_04_03");	//Конечно. Попасть на борт просто.
	Log_CreateTopic(TOPIC_SHIP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SHIP,LOG_RUNNING);
	if((MIS_LEE_JUDGERICHTER == LOG_SUCCESS) && (Npc_IsDead(richter) == FALSE))
	{
		AI_Output(self,other,"DIA_Lee_GetShip_04_04");	//Ты же знаешь, у нас судья под каблуком. Ты должен пойти к нему и вытянуть из него официальное письмо, которое позволит нам попасть на корабль.
		MIS_RICHTERSPERMISSIONFORSHIP = LOG_RUNNING;
		b_logentry(TOPIC_SHIP,"Ли полагает, что лучший способ попасть на корабль паладинов - получить письмо о соответствующих полномочиях от судьи. Но ряд ли он даст такое письмо по своей доброй воле.");
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lee_GetShip_04_05");	//У меня есть поддельное письмо о предоставлении полномочий. Увидев его, корабельная стража позволит тебе пройти.
		b_logentry(TOPIC_SHIP,"Ох, старина Ли! Он раздобыл поддельное письмо, которое позволит мне попасть на корабль паладинов.");
	};
	AI_Output(self,other,"DIA_Lee_GetShip_04_06");	//Но это не все. Чтобы управлять кораблем, тебе понадобится капитан, команда и много чего еще.
	AI_Output(self,other,"DIA_Lee_GetShip_04_07");	//Нужно проделать очень большую работу.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	Info_ClearChoices(dia_lee_getship);
	Info_AddChoice(dia_lee_getship,DIALOG_BACK,dia_lee_getship_back);
	Info_AddChoice(dia_lee_getship,"А кого мне взять в команду?",dia_lee_getship_crew);
	if(Npc_IsDead(torlof) == FALSE)
	{
		Info_AddChoice(dia_lee_getship,"Ты знаешь кого-нибудь, кто мог бы управлять кораблем?",dia_lee_getship_torlof);
	};
};

func void dia_lee_getship_torlof()
{
	AI_Output(other,self,"DIA_Lee_GetShip_torlof_15_00");	//Ты знаешь кого-нибудь, кто мог бы управлять кораблем?
	AI_Output(self,other,"DIA_Lee_GetShip_torlof_04_01");	//Насколько я знаю, Торлоф ходил в море. Он разбирается в морском деле.
	b_logentry(TOPIC_CAPTAIN,"Торлоф - старый морской волк. Возможно, он захочет стать моим капитаном.");
};

func void dia_lee_getship_crew()
{
	AI_Output(other,self,"DIA_Lee_GetShip_crew_15_00");	//А кого мне взять в команду?
	AI_Output(self,other,"DIA_Lee_GetShip_crew_04_01");	//Это ты должен решить сам. Но я бы взял только людей, которым доверяю. Ты много знаешь людей, которым можно доверять?
	AI_Output(self,other,"DIA_Lee_GetShip_crew_04_02");	//Если тебе нужен кузнец в команде, попробуй уговорить Беннета. Лучше него ты вряд ли найдешь.
	b_logentry(TOPIC_CREW,"Что касается моей команды, здесь Ли мало чем может помочь мне. Но все же он дал совет - набирать только людей, которым я могу доверять. Я, пожалуй, спрошу Беннета, может быть, ему это будет интересно.");
};

func void dia_lee_getship_back()
{
	Info_ClearChoices(dia_lee_getship);
};


instance DIA_LEE_GOTRICHTERSPERMISSIONFORSHIP(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_gotrichterspermissionforship_condition;
	information = dia_lee_gotrichterspermissionforship_info;
	description = "Письмо сработало.";
};


func int dia_lee_gotrichterspermissionforship_condition()
{
	if(MIS_RICHTERSPERMISSIONFORSHIP == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_lee_gotrichterspermissionforship_info()
{
	AI_Output(other,self,"DIA_Lee_GotRichtersPermissionForShip_15_00");	//Письмо сработало. Корабль теперь мой. Судья оказался очень кстати.
	AI_Output(self,other,"DIA_Lee_GotRichtersPermissionForShip_04_01");	//Хорошо. Значит, все твои унижения перед этим ублюдком были не напрасными.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LEE_STEALSHIP(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_stealship_condition;
	information = dia_lee_stealship_info;
	permanent = FALSE;
	description = "Я хочу украсть корабль.";
};


func int dia_lee_stealship_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_getship) && (hero.guild == GIL_DJG) && (MIS_RICHTERSPERMISSIONFORSHIP == 0))
	{
		return TRUE;
	};
};

func void dia_lee_stealship_info()
{
	AI_Output(other,self,"DIA_Lee_StealShip_15_00");	//Я хочу украсть корабль.
	AI_Output(self,other,"DIA_Lee_StealShip_04_01");	//И как ты собираешься сделать это?
	AI_Output(other,self,"DIA_Lee_StealShip_15_02");	//Легче легкого - я пойду туда, покажу им твои бумаги - и корабль мой!
	AI_Output(self,other,"DIA_Lee_StealShip_04_03");	//Ну-ну. Держи, надеюсь, ты знаешь, что делаешь.
	CreateInvItems(self,itwr_forgedshipletter_mis,1);
	b_giveinvitems(self,other,itwr_forgedshipletter_mis,1);
};


instance DIA_LEE_KNOWWHEREENEMY(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_knowwhereenemy_condition;
	information = dia_lee_knowwhereenemy_info;
	permanent = TRUE;
	description = "Ты пойдешь со мной на корабле?";
};


func int dia_lee_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (LEE_ISONBOARD == FALSE) && Npc_KnowsInfo(other,dia_lee_getship))
	{
		return TRUE;
	};
};

func void dia_lee_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_15_00");	//Ты пойдешь со мной на корабле?
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_04_01");	//Ты шутишь? Конечно. Мне не терпится поквитаться кое с кем на материке.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_04_02");	//Кроме того, я могу обучить тебя искусству владения одноручным и двуручным оружием. Это может оказаться очень полезным.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Ли не терпится увидеть материк вновь. Он предложил мне свою поддержку. Мне будет сложно найти такого учителя боевых искусств где либо еще.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_15_03");	//Все места на корабле сейчас заняты, но я вернусь, если появится какая-нибудь вакансия.
	}
	else
	{
		Info_ClearChoices(dia_lee_knowwhereenemy);
		Info_AddChoice(dia_lee_knowwhereenemy,"Я дам тебе знать, если ты мне понадобишься.",dia_lee_knowwhereenemy_no);
		Info_AddChoice(dia_lee_knowwhereenemy,"Пакуй свои вещи!",dia_lee_knowwhereenemy_yes);
	};
};

func void dia_lee_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_Yes_15_00");	//Пакуй свои вещи!
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_Yes_04_01");	//Что? Прямо сейчас?
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_Yes_15_02");	//Да, я скоро отправляюсь в путь, и если ты плывешь со мной, приходи в гавань. Встретимся на корабле.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_Yes_04_03");	//Я так долго ждал этого момента. Я буду там.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	LEE_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_lee_knowwhereenemy);
};

func void dia_lee_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_No_15_00");	//Я дам тебе знать, если ты мне понадобишься.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_No_04_01");	//Надеюсь, ты знаешь, что делаешь. Но помни, что хороших бойцов никогда не бывает слишком много.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_No_04_02");	//(ухмыляется) Если это только не полные кретины вроде Сильвио.
	LEE_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_lee_knowwhereenemy);
};


instance DIA_LEE_LEAVEMYSHIP(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_leavemyship_condition;
	information = dia_lee_leavemyship_info;
	permanent = TRUE;
	description = "Я все-таки не могу взять тебя с собой!";
};


func int dia_lee_leavemyship_condition()
{
	if((LEE_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_leavemyship_info()
{
	AI_Output(other,self,"DIA_Lee_LeaveMyShip_15_00");	//Я все-таки не могу взять тебя с собой!
	AI_Output(self,other,"DIA_Lee_LeaveMyShip_04_01");	//Как скажешь. Ты знаешь, где меня найти, если что!
	LEE_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_LEE_STILLNEEDYOU(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_stillneedyou_condition;
	information = dia_lee_stillneedyou_info;
	permanent = TRUE;
	description = "Ты мне все-таки нужен!";
};


func int dia_lee_stillneedyou_condition()
{
	if(((LEE_ISONBOARD == LOG_OBSOLETE) || (LEE_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_lee_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Lee_StillNeedYou_15_00");	//Ты мне все-таки нужен!
	if(LEE_ISONBOARD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_01");	//Я знал, что понадоблюсь тебе! Увидимся на корабле.
		LEE_ISONBOARD = LOG_SUCCESS;
		CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
		if(MIS_READYFORCHAPTER6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_02");	//Знаешь, а не пошел бы ты! Сначала ты сказал, чтобы я пришел, затем отправил меня назад!
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_03");	//Найди себе другого идиота!
		AI_StopProcessInfos(self);
	};
};


instance DIA_LEE_KAP6_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_kap6_exit_condition;
	information = dia_lee_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_lee_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

