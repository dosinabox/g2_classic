
instance DIA_EHNIM_EXIT(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 999;
	condition = dia_ehnim_exit_condition;
	information = dia_ehnim_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ehnim_exit_condition()
{
	return TRUE;
};

func void dia_ehnim_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_HALLO(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 3;
	condition = dia_ehnim_hallo_condition;
	information = dia_ehnim_hallo_info;
	description = "Кто ты?";
};


func int dia_ehnim_hallo_condition()
{
	return TRUE;
};

func void dia_ehnim_hallo_info()
{
	AI_Output(other,self,"DIA_Ehnim_HALLO_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Ehnim_HALLO_12_01");	//Меня зовут Эним. Я работаю здесь.
	if(Hlp_IsValidNpc(egill) && !c_npcisdown(egill))
	{
		AI_Output(self,other,"DIA_Ehnim_HALLO_12_02");	//А коротышка вон там - мой брат Эгилл.
	};
	AI_Output(self,other,"DIA_Ehnim_HALLO_12_03");	//Мы работаем здесь, на ферме Акила, уже несколько лет.
};


instance DIA_EHNIM_FELDARBEIT(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 4;
	condition = dia_ehnim_feldarbeit_condition;
	information = dia_ehnim_feldarbeit_info;
	description = "Как идет работа в поле?";
};


func int dia_ehnim_feldarbeit_condition()
{
	if(Npc_KnowsInfo(other,dia_ehnim_hallo))
	{
		return TRUE;
	};
};

func void dia_ehnim_feldarbeit_info()
{
	AI_Output(other,self,"DIA_Ehnim_FELDARBEIT_15_00");	//Как идет работа?
	AI_Output(self,other,"DIA_Ehnim_FELDARBEIT_12_01");	//Ты хочешь помочь? Тут есть еще одна мотыга. Бери ее и выходи в поле.
	AI_Output(self,other,"DIA_Ehnim_FELDARBEIT_12_02");	//Нужно только быть осторожным, чтобы полевые хищники не подкрались к тебе незаметно. Они сожрут тебя, даже моргнуть не успеешь.
};


instance DIA_EHNIM_FELDRAEUBER(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 5;
	condition = dia_ehnim_feldraeuber_condition;
	information = dia_ehnim_feldraeuber_info;
	description = "Почему вы ничего не делаете с этими полевыми хищниками?";
};


func int dia_ehnim_feldraeuber_condition()
{
	if(Npc_KnowsInfo(other,dia_ehnim_feldarbeit))
	{
		return TRUE;
	};
};

func void dia_ehnim_feldraeuber_info()
{
	AI_Output(other,self,"DIA_Ehnim_FELDRAEUBER_15_00");	//Почему вы ничего не делаете с этими полевыми хищниками?
	AI_Output(self,other,"DIA_Ehnim_FELDRAEUBER_12_01");	//Я убил их столько, что уже сбился со счета. Но проблема в том, что на место убитых приходят новые.
};


instance DIA_EHNIM_STREIT1(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 6;
	condition = dia_ehnim_streit1_condition;
	information = dia_ehnim_streit1_info;
	description = "Твой брат сказал мне то же самое.";
};


func int dia_ehnim_streit1_condition()
{
	if(Npc_KnowsInfo(other,dia_egill_feldraeuber) && Npc_KnowsInfo(other,dia_ehnim_feldraeuber) && (Npc_KnowsInfo(other,dia_egill_streit2) == FALSE) && (Hlp_IsValidNpc(egill) && !c_npcisdown(egill)))
	{
		return TRUE;
	};
};

func void dia_ehnim_streit1_info()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT1_15_00");	//Твой брат сказал мне то же самое.
	AI_Output(self,other,"DIA_Ehnim_STREIT1_12_01");	//Что? Этот трус? Да он всегда исчезает, как только эти твари хотя бы приблизятся к нашей земле.
	AI_Output(self,other,"DIA_Ehnim_STREIT1_12_02");	//Ему не стоит нести такую чушь.
};


instance DIA_EHNIM_STREIT3(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 7;
	condition = dia_ehnim_streit3_condition;
	information = dia_ehnim_streit3_info;
	description = "Твой брат думает, что ты хвастун.";
};


func int dia_ehnim_streit3_condition()
{
	if(Npc_KnowsInfo(other,dia_egill_streit2) && (Hlp_IsValidNpc(egill) && !c_npcisdown(egill)))
	{
		return TRUE;
	};
};

func void dia_ehnim_streit3_info()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT3_15_00");	//Твой брат думает, что ты хвастун.
	AI_Output(self,other,"DIA_Ehnim_STREIT3_12_01");	//Что? У него действительно хватило мужества сказать это?
	AI_Output(self,other,"DIA_Ehnim_STREIT3_12_02");	//Ему лучше следить за своим языком, а то мне придется опять преподать ему урок.
	AI_Output(self,other,"DIA_Ehnim_STREIT3_12_03");	//Иди, и скажи ему это.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_STREIT5(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 8;
	condition = dia_ehnim_streit5_condition;
	information = dia_ehnim_streit5_info;
	permanent = TRUE;
	description = "Я думаю, вам двоим нужно просто остыть.";
};


var int dia_ehnim_streit5_noperm;

func int dia_ehnim_streit5_condition()
{
	if(Npc_KnowsInfo(other,dia_egill_streit4) && (Hlp_IsValidNpc(egill) && !c_npcisdown(egill)) && (DIA_EHNIM_STREIT5_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_ehnim_streit5_info()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT5_15_00");	//Я думаю, вам двоим нужно просто остыть.
	AI_Output(self,other,"DIA_Ehnim_STREIT5_12_01");	//Этот ублюдок не отказался от своих слов, я прав?
	AI_Output(self,other,"DIA_Ehnim_STREIT5_12_02");	//Я ему пасть порву. Сажи ему это.
	Info_ClearChoices(dia_ehnim_streit5);
	Info_AddChoice(dia_ehnim_streit5,"Делай, что хочешь. А я ухожу.",dia_ehnim_streit5_gehen);
	Info_AddChoice(dia_ehnim_streit5,"Почему ты не скажешь это ему сам?",dia_ehnim_streit5_attack);
};

func void dia_ehnim_streit5_attack()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT5_Attack_15_00");	//Почему ты не скажешь это ему сам?
	AI_Output(self,other,"DIA_Ehnim_STREIT5_Attack_12_01");	//Сейчас пойду и сделаю это .
	AI_StopProcessInfos(self);
	DIA_EHNIM_STREIT5_NOPERM = TRUE;
	b_attack(self,egill,AR_NONE,1);
	b_giveplayerxp(XP_EGILLEHNIMSTREIT);
};

func void dia_ehnim_streit5_gehen()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT5_gehen_15_00");	//Делай, что хочешь. А я ухожу.
	AI_Output(self,other,"DIA_Ehnim_STREIT5_gehen_12_01");	//Да, уходи отсюда.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_PERMKAP1(C_INFO)
{
	npc = bau_944_ehnim;
	condition = dia_ehnim_permkap1_condition;
	information = dia_ehnim_permkap1_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_ehnim_permkap1_condition()
{
	if((DIA_EHNIM_STREIT5_NOPERM == TRUE) && Npc_IsInState(self,zs_talk) && ((KAPITEL < 3) || (hero.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_ehnim_permkap1_info()
{
	AI_Output(self,other,"DIA_Ehnim_PERMKAP1_12_00");	//Тебе мало того, что ты натворил? Я думаю, тебе лучше уйти.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_MOLERATFETT(C_INFO)
{
	npc = bau_944_ehnim;
	condition = dia_ehnim_moleratfett_condition;
	information = dia_ehnim_moleratfett_info;
	important = TRUE;
};


func int dia_ehnim_moleratfett_condition()
{
	if((DIA_EHNIM_STREIT5_NOPERM == TRUE) && (KAPITEL >= 3) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_ehnim_moleratfett_info()
{
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_12_00");	//Ты ВСЕ ЕЩЕ здесь?
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_15_01");	//Ну да. Все еще ссоритесь?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_12_02");	//Не твое дело. Забудь об этом. Скажи, ты не был недавно на ферме Лобарта?
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_15_03");	//Может быть. А что?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_12_04");	//Ох, ничего такого. Я просто хотел поговорить с Вино о его винокурне.
	Info_ClearChoices(dia_ehnim_moleratfett);
	Info_AddChoice(dia_ehnim_moleratfett,"У меня сейчас нет времени на это.",dia_ehnim_moleratfett_nein);
	Info_AddChoice(dia_ehnim_moleratfett,"Винокурня? Какая винокурня?",dia_ehnim_moleratfett_was);
	if(Npc_IsDead(vino))
	{
		Info_AddChoice(dia_ehnim_moleratfett,"Вино мертв.",dia_ehnim_moleratfett_tot);
	};
};

func void dia_ehnim_moleratfett_tot()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_tot_15_00");	//Вино мертв.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_tot_12_01");	//О боже. Ужас-то какой.
};

func void dia_ehnim_moleratfett_was()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_15_00");	//Винокурня? Какая винокурня?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_01");	//Ох. Мне, наверное, не стоило говорить об этом. Вино всегда так трепетно относился к этому своему маленькому секрету.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_02");	//Ну ладно, все равно уже я проболтался. В лесу, неподалеку от фермы, Вино устроил секретную винокурню.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_03");	//Несколько дней назад, он попросил меня дать ему что-нибудь, чтобы смазать механизм решетки, установленной там.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_04");	//Последнее время шли дожди, и она заржавела. Лебедку заклинило, и он не может поднять решетку.
	Log_CreateTopic(TOPIC_FOUNDVINOSKELLEREI,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FOUNDVINOSKELLEREI,LOG_RUNNING);
	b_logentry(TOPIC_FOUNDVINOSKELLEREI,"Эним рассказал мне, что Вино содержит секретный винокуренный завод в лесу около фермы Акила. Но механизм, открывающий дверь, заклинило, и починить его можно только смазав шестеренки жиром крысокрота.");
	Info_AddChoice(dia_ehnim_moleratfett,"И? Ты достал смазку?",dia_ehnim_moleratfett_was_fett);
};

func void dia_ehnim_moleratfett_was_fett()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_15_00");	//И? Ты достал смазку?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_12_01");	//Да, конечно. Самую лучшую. Жир крысокрота. Потрясающая вещь, скажу я тебе. Ее используют даже для смазки корабельных пушек.
	Info_AddChoice(dia_ehnim_moleratfett,"Продай мне этого жира.",dia_ehnim_moleratfett_was_fett_habenwill);
};


var int ehnim_moleratfettoffer;

func void dia_ehnim_moleratfett_was_fett_habenwill()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_00");	//Продай мне этого жира.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_01");	//Это обойдется тебе недешево, приятель. Он очень редко встречается в этой части страны.
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_02");	//Сколько?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_03");	//Ммм. 100 золотых?
	EHNIM_MOLERATFETTOFFER = 100;
	Info_ClearChoices(dia_ehnim_moleratfett);
	Info_AddChoice(dia_ehnim_moleratfett,"Это слишком много.",dia_ehnim_moleratfett_was_fett_habenwill_zuviel);
	Info_AddChoice(dia_ehnim_moleratfett,"Договорились.",dia_ehnim_moleratfett_was_fett_habenwill_ja);
};

func void dia_ehnim_moleratfett_was_fett_habenwill_ja()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_15_00");	//Договорились.
	if(b_giveinvitems(other,self,itmi_gold,EHNIM_MOLERATFETTOFFER))
	{
		AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_01");	//Хорошо. Вот, держи.
		if(Npc_HasItems(self,itmi_moleratlubric_mis))
		{
			b_giveinvitems(self,other,itmi_moleratlubric_mis,1);
			if(Npc_IsDead(vino) == FALSE)
			{
				AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_02");	//(себе под нос) Ох. Вино убьет меня за это.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_03");	//Черт, и куда же она подевалась? Что за досада. Извини. Похоже, у меня ее не осталось. Вот, возьми свои деньги назад .
			b_giveinvitems(self,other,itmi_gold,EHNIM_MOLERATFETTOFFER);
			if(Npc_IsDead(egill) == FALSE)
			{
				AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_04");	//Готов поклясться, это проделки моего брата. Вот ублюдок.
				AI_StopProcessInfos(self);
				b_attack(self,egill,AR_NONE,1);
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_05");	//Так, вообще-то не поступают. Сначала ты договариваешься о сделке, а затем оказывается, что у тебя даже нет денег! Уходи, я не хочу тебя видеть!
	};
	AI_StopProcessInfos(self);
};

func void dia_ehnim_moleratfett_was_fett_habenwill_zuviel()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_15_00");	//Это слишком много.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_12_01");	//Хорошо, хорошо. 70 золотых. Но это мое последняя цена.
	EHNIM_MOLERATFETTOFFER = 70;
	Info_ClearChoices(dia_ehnim_moleratfett);
	Info_AddChoice(dia_ehnim_moleratfett,"Это все равно слишком много.",dia_ehnim_moleratfett_was_fett_habenwill_zuviel_immernoch);
	Info_AddChoice(dia_ehnim_moleratfett,"Договорились.",dia_ehnim_moleratfett_was_fett_habenwill_ja);
};

func void dia_ehnim_moleratfett_was_fett_habenwill_zuviel_immernoch()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_immernoch_15_00");	//Это все равно слишком много.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_immernoch_12_01");	//(сердито) Тогда забудь об этом. Прощай.
	AI_StopProcessInfos(self);
};

func void dia_ehnim_moleratfett_nein()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_nein_15_00");	//У меня сейчас нет времени на это.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_nein_12_01");	//Тогда ее буду отвлекать тебя, парень.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_PERMKAP3(C_INFO)
{
	npc = bau_944_ehnim;
	condition = dia_ehnim_permkap3_condition;
	information = dia_ehnim_permkap3_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_ehnim_permkap3_condition()
{
	if(Npc_KnowsInfo(other,dia_ehnim_moleratfett) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_ehnim_permkap3_info()
{
	AI_Output(self,other,"DIA_Ehnim_PERMKAP3_12_00");	//У меня нет времени на тебя.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_PICKPOCKET(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 900;
	condition = dia_ehnim_pickpocket_condition;
	information = dia_ehnim_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_ehnim_pickpocket_condition()
{
	return c_beklauen(76,35);
};

func void dia_ehnim_pickpocket_info()
{
	Info_ClearChoices(dia_ehnim_pickpocket);
	Info_AddChoice(dia_ehnim_pickpocket,DIALOG_BACK,dia_ehnim_pickpocket_back);
	Info_AddChoice(dia_ehnim_pickpocket,DIALOG_PICKPOCKET,dia_ehnim_pickpocket_doit);
};

func void dia_ehnim_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ehnim_pickpocket);
};

func void dia_ehnim_pickpocket_back()
{
	Info_ClearChoices(dia_ehnim_pickpocket);
};

