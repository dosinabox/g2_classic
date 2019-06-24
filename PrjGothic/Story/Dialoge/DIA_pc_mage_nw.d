
instance DIA_MILTENNW_EXIT(C_INFO)
{
	npc = pc_mage_nw;
	nr = 999;
	condition = dia_miltennw_exit_condition;
	information = dia_miltennw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltennw_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_KAP3_EXIT(C_INFO)
{
	npc = pc_mage_nw;
	nr = 999;
	condition = dia_miltennw_kap3_exit_condition;
	information = dia_miltennw_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltennw_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_KAP3_HELLO(C_INFO)
{
	npc = pc_mage_nw;
	nr = 31;
	condition = dia_miltennw_kap3_hello_condition;
	information = dia_miltennw_kap3_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_miltennw_kap3_hello_condition()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_hello_info()
{
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_00");	//(не веря) Я не могу поверить в это. Ты действительно стал паладином?
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_01");	//Похоже на то.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_02");	//(в эйфории) Если такие как ты становятся паладинами, то прихвостням Белиара нужно держать ухо востро.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_03");	//Какая-то горстка орков для тебя не проблема.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_04");	//Проблема не только в орках.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_05");	//Я знаю, но все равно хорошо, что ты на нашей стороне.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_06");	//Ну да.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_07");	//Что ты делаешь здесь, в монастыре? Дай я угадаю. Ты хочешь быть посвященным в искусство магии.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_08");	//Возможно.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_09");	//Я знал это - лучше всего тебе поговорить с Мардуком, он отвечает за вас, паладинов. Ты найдешь его перед часовней.
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_10");	//Я вижу, что слухи оказались правдой.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_11");	//Какие слухи?
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_12");	//Что ты присоединился к охотникам за драконами.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_13");	//Ну, ты никогда не был человеком церкви. Тем не менее, ты сражаешься за наше общее дело, и только это имеет значение.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_14");	//Это все?
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_15");	//Я рад, конечно, и судя по тому, как ты выглядишь, все орки должны бояться тебя.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_16");	//Дело не только в орках.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_17");	//Я знаю, но, тем не менее, они доставляют проблемы. А ты важная птица.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_18");	//Ты победил Спящего. Нам всем однажды может понадобиться твоя помощь.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_19");	//Ох, ладно.
	};
};


instance DIA_MILTENNW_MONASTERY(C_INFO)
{
	npc = pc_mage_nw;
	nr = 35;
	condition = dia_miltennw_monastery_condition;
	information = dia_miltennw_monastery_info;
	permanent = FALSE;
	description = "Как ты смог добраться до монастыря так быстро?";
};


func int dia_miltennw_monastery_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_monastery_info()
{
	AI_Output(other,self,"DIA_MiltenNW_Monastery_15_00");	//Как ты смог добраться до монастыря так быстро?
	AI_Output(self,other,"DIA_MiltenNW_Monastery_03_01");	//Откуда такой вопрос? Я проскользнул через Проход и направился прямо в монастырь.
	AI_Output(self,other,"DIA_MiltenNW_Monastery_03_02");	//Должен признать, что это было непросто - уйти от всех монстров, что поселились по эту сторону от долины, но проблем оказалось все же меньше, чем я ожидал.
};


instance DIA_MILTENNW_FOURFRIENDS(C_INFO)
{
	npc = pc_mage_nw;
	nr = 35;
	condition = dia_miltennw_fourfriends_condition;
	information = dia_miltennw_fourfriends_info;
	permanent = FALSE;
	description = "Ты знаешь, где остальные?";
};


func int dia_miltennw_fourfriends_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_fourfriends_info()
{
	AI_Output(other,self,"DIA_MiltenNW_FourFriends_15_00");	//Ты знаешь, где остальные?
	if(Npc_IsDead(pc_fighter_nw_vor_djg) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_01");	//Горн, похоже, ничуть не изменился после заключения в тюрьме Гаронда.
		if(MIS_RESCUEGORN != LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_MiltenNW_FourFriends_15_02");	//Как ему удалось выбраться?
			AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_03");	//Мне пришлось солгать Гаронду, так что он снял все обвинения.
			AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_04");	//Но это только между нами, понятно?
		};
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_05");	//В любом случае, он хотел отправиться к Ли и посмотреть, что происходит на ферме.
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_06");	//После голодания в темнице, он, вероятно, сейчас пытается восполнить потерю в весе и испытывает на прочность кладовку наемников.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_07");	//Горн не виноват.
	};
	if(Npc_IsDead(pc_thief_nw) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_08");	//Диего бормотал что-то о расплате. Но я понятия не имею, что он хотел сказать этим.
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_09");	//Но я подозреваю, что он сейчас в городе. Ты знаешь его - он всегда там, где можно поживиться.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_10");	//Диего выкупил Горна - похоже, что Барьер изменил и его.
	};
};


instance DIA_MILTENNW_KAP3_ENTRY(C_INFO)
{
	npc = pc_mage_nw;
	nr = 32;
	condition = dia_miltennw_kap3_entry_condition;
	information = dia_miltennw_kap3_entry_info;
	permanent = TRUE;
	description = "Мне нужно попасть в монастырь. Это срочно!";
};


func int dia_miltennw_kap3_entry_condition()
{
	if((KAPITEL == 3) && (hero.guild != GIL_KDF) && (MILTENNW_GIVESMONASTERYKEY == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_entry_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_15_00");	//Мне нужно попасть в монастырь. Это срочно!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_01");	//Да, конечно. Вот ключ.
		CreateInvItems(self,itke_innos_mis,1);
		b_giveinvitems(self,other,itke_innos_mis,1);
		MILTENNW_GIVESMONASTERYKEY = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_02");	//Я не могу пустить тебя в монастырь. У меня будут проблемы с Высшим Советом.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_03");	//Без разрешения верховных магов, я никого не могу пустить в монастырь.
		Info_ClearChoices(dia_miltennw_kap3_entry);
		Info_AddChoice(dia_miltennw_kap3_entry,DIALOG_BACK,dia_miltennw_kap3_entry_back);
		Info_AddChoice(dia_miltennw_kap3_entry,"Но это важно!",dia_miltennw_kap3_entry_important);
		if(Npc_HasItems(other,itwr_permissiontowearinnoseye_mis) >= 1)
		{
			Info_AddChoice(dia_miltennw_kap3_entry,"У меня есть письмо от лорда Хагена.",dia_miltennw_kap3_entry_permit);
		};
	};
};

func void dia_miltennw_kap3_entry_back()
{
	Info_ClearChoices(dia_miltennw_kap3_entry);
};

func void dia_miltennw_kap3_entry_important()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_Important_15_00");	//Но это важно!
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Important_03_01");	//Это не поможет. Пирокар оторвет мне голову за это.
	Info_ClearChoices(dia_miltennw_kap3_entry);
};

func void dia_miltennw_kap3_entry_permit()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_Permit_15_00");	//У меня есть письмо от лорда Хагена.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_01");	//Покажи.
	b_giveinvitems(other,self,itwr_permissiontowearinnoseye_mis,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_02");	//(колеблясь) Хорошо. Вот ключ от монастыря. Ты найдешь Пирокара в церкви.
	CreateInvItems(self,itke_innos_mis,1);
	b_giveinvitems(self,other,itke_innos_mis,1);
	b_giveinvitems(self,other,itwr_permissiontowearinnoseye_mis,1);
	MILTENNW_GIVESMONASTERYKEY = TRUE;
	Info_ClearChoices(dia_miltennw_kap3_entry);
};


instance DIA_MILTENNW_KAP3_NOVIZENCHASE(C_INFO)
{
	npc = pc_mage_nw;
	nr = 31;
	condition = dia_miltennw_kap3_novizenchase_condition;
	information = dia_miltennw_kap3_novizenchase_info;
	permanent = FALSE;
	description = "Ты знаешь, где Педро?";
};


func int dia_miltennw_kap3_novizenchase_condition()
{
	if((KAPITEL == 3) && (MIS_NOVIZENCHASE == LOG_RUNNING) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_novizenchase_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_NovizenChase_15_00");	//Ты знаешь, где Педро?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_01");	//Ты думаешь, я стоял бы здесь если бы я знал, где скрывается этот предатель?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_02");	//Он должен заплатить за то, что сделал. Я надеюсь, нам удастся вернуть Глаз.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_03");	//Ты должен помочь нам. Найди его и принеси назад Глаз Инноса.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_04");	//Я посмотрю, что можно сделать.
};


instance DIA_MILTENNW_KAP3_PERM(C_INFO)
{
	npc = pc_mage_nw;
	nr = 39;
	condition = dia_miltennw_kap3_perm_condition;
	information = dia_miltennw_kap3_perm_info;
	permanent = FALSE;
	description = "Ты знаешь, что-нибудь о людях в черных рясах?";
};


func int dia_miltennw_kap3_perm_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_perm_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Perm_15_00");	//Ты знаешь, что-нибудь о людях в черных рясах?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Perm_03_01");	//Нет, но у меня плохое предчувствие насчет них.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Perm_03_02");	//Будь осторожен, если наткнешься на них.
};


instance DIA_MILTENNW_KAP4_EXIT(C_INFO)
{
	npc = pc_mage_nw;
	nr = 999;
	condition = dia_miltennw_kap4_exit_condition;
	information = dia_miltennw_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltennw_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_KAP4_PERM(C_INFO)
{
	npc = pc_mage_nw;
	nr = 49;
	condition = dia_miltennw_kap4_perm_condition;
	information = dia_miltennw_kap4_perm_info;
	permanent = TRUE;
	description = "Есть новости?";
};


func int dia_miltennw_kap4_perm_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap4_perm_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP4_PERM_15_00");	//Есть новости?
	AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_01");	//Это я должен тебя спрашивать. Мы все здесь очень обеспокоены.
	AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_02");	//Высший Совет пытается предугадать следующий ход врага.
	AI_Output(other,self,"DIA_MiltenNW_KAP4_PERM_15_03");	//Что-нибудь еще?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_04");	//Последнее время все больше сообщений о нападении орков, даже за пределами Долины Рудников.
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_05");	//Мне это все не нравится - я не думаю, что у нас осталось много времени.
	}
	else if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_06");	//Фермер сообщил о появлении чешуйчатых существ у его фермы.
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_07");	//Я не знаю, что все это значит, но я думаю, что враг что-то задумал.
	}
	else if(MIS_FINDTHEOBESESSED == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_08");	//Мы получаем все больше сообщений об одержимых людях. Враг стал силен, значительно сильнее, чем я ожидал.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_09");	//Нет, ситуация все еще очень серьезная. Все, что нам остается, - это верить в Инноса.
	};
};


instance DIA_MILTENNW_KAP5_EXIT(C_INFO)
{
	npc = pc_mage_nw;
	nr = 999;
	condition = dia_miltennw_kap5_exit_condition;
	information = dia_miltennw_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltennw_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_ALLDRAGONSDEAD(C_INFO)
{
	npc = pc_mage_nw;
	nr = 900;
	condition = dia_miltennw_alldragonsdead_condition;
	information = dia_miltennw_alldragonsdead_info;
	permanent = FALSE;
	description = "Я убил всех драконов.";
};


func int dia_miltennw_alldragonsdead_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_miltennw_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_MiltenNW_AllDragonsDead_15_00");	//Я убил всех драконов.
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_01");	//Правда? Значит, есть еще проблеск надежды на горизонте. Теперь все, что нам остается, - это отрубить голову Злу.
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_02");	//Если ты действительно сделал это, мы обязательно победим в этой войне.
	AI_Output(other,self,"DIA_MiltenNW_AllDragonsDead_15_03");	//Кому, мне?
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_04");	//Тебе, конечно же. Кому же еще?
	if(MILTENNW_ISONBOARD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_05");	//Мы должны выступать как можно скорее, иначе может стать слишком поздно.
	};
};


instance DIA_MILTENNW_SCWASINLIB(C_INFO)
{
	npc = pc_mage_nw;
	nr = 3;
	condition = dia_miltennw_scwasinlib_condition;
	information = dia_miltennw_scwasinlib_info;
	important = TRUE;
};


func int dia_miltennw_scwasinlib_condition()
{
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_miltennw_scwasinlib_info()
{
	AI_Output(self,other,"DIA_MiltenNW_SCWasInLib_03_00");	//Эй, я слышал, ты провел много времени в монастырском подвале. Что ты нашел там?
};


instance DIA_MILTENNW_KNOWWHEREENEMY(C_INFO)
{
	npc = pc_mage_nw;
	nr = 55;
	condition = dia_miltennw_knowwhereenemy_condition;
	information = dia_miltennw_knowwhereenemy_info;
	permanent = TRUE;
	description = "Я знаю, где скрывается враг.";
};


func int dia_miltennw_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (MILTENNW_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};


var int sctoldmiltenheknowwhereenemy;

func void dia_miltennw_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_15_00");	//Я знаю, где скрывается враг. На небольшом острове, недалеко отсюда.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_01");	//Это наш шанс. Мы должны отправляться туда немедленно и уничтожить зло раз и навсегда.
	SCTOLDMILTENHEKNOWWHEREENEMY = TRUE;
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	if(Npc_IsDead(diegonw) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_02");	//Ты говорил с Диего? Я думаю, он согласится присоединиться к тебе.
		b_logentry(TOPIC_CREW,"Диего может оказаться полезным. Он никогда подолгу не задерживается на одном месте.");
	};
	if(Npc_IsDead(gornnw_nach_djg) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_03");	//А что насчет Горна? Поговори с ним. Я слышал, он вернулся из Долины Рудников.
		b_logentry(TOPIC_CREW,"Горн, определенно, может оказаться полезным. Никогда не помешает иметь на своей стороне такого закаленного бойца. Возможно, он сможет тренировать меня.");
	};
	if(Npc_IsDead(lester) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_04");	//И не забудь Лестера. Если ты не вытащишь его из долины, он сгниет там.
		b_logentry(TOPIC_CREW,"Если я не возьму Лестера с собой, ему никогда не выбраться из этой долины.");
	};
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_05");	//Я также вижу свою роль во всем этом. Я могу повысить твою ману и помочь в создании рун. Когда мы приступим?
	b_logentry(TOPIC_CREW,"Если Милтен отправится в путь со мной, он может научить меня создавать руны и повысить мою ману.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_15_06");	//Не так быстро, у меня уже достаточно людей.
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_07");	//Ты знаешь, я всегда готов пойти с тобой. Если передумаешь, только скажи.
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_08");	//Удачи, да не оставит тебя Иннос без своей защиты.
	}
	else
	{
		Info_ClearChoices(dia_miltennw_knowwhereenemy);
		Info_AddChoice(dia_miltennw_knowwhereenemy,"Сейчас я не могу найти тебе место.",dia_miltennw_knowwhereenemy_no);
		Info_AddChoice(dia_miltennw_knowwhereenemy,"Добро пожаловать на борт!",dia_miltennw_knowwhereenemy_yes);
	};
};

func void dia_miltennw_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_00");	//Добро пожаловать на борт!
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_01");	//Встретимся в гавани. Жди меня там.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_Yes_03_02");	//Хорошо. Я буду там, когда ты будешь готов.
	self.flags = NPC_FLAG_IMMORTAL;
	MILTENNW_ISONBOARD = LOG_SUCCESS;
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_miltennw_knowwhereenemy);
};

func void dia_miltennw_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_No_15_00");	//Сейчас я не могу найти тебе место.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_No_03_01");	//Ты знаешь, что я готов идти с тобой до конца. Если передумаешь, только скажи.
	MILTENNW_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_miltennw_knowwhereenemy);
};


instance DIA_MILTENNW_WHERECAPTAIN(C_INFO)
{
	npc = pc_mage_nw;
	nr = 3;
	condition = dia_miltennw_wherecaptain_condition;
	information = dia_miltennw_wherecaptain_info;
	description = "Где мне найти капитана?";
};


func int dia_miltennw_wherecaptain_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (SCTOLDMILTENHEKNOWWHEREENEMY == TRUE) && (SCGOTCAPTAIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_wherecaptain_info()
{
	AI_Output(other,self,"DIA_MiltenNW_WhereCaptain_15_00");	//Где мне найти капитана?
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_01");	//Спроси Йоргена. Он ведь моряк. Он, должно быть, все еще в монастыре.
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_02");	//Но если он не сможет помочь, попробуй поспрашивать на фермах или в городе, может быть, найдется человек, способный управлять твоим кораблем.
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_03");	//Лучше всего поговорить с Ли или поспрашивать в гавани Хориниса. Больше ничего сейчас мне в голову не приходит.
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	b_logentry(TOPIC_CAPTAIN,"Возможно, стоит взять с собой Йоргена в качестве капитана. Он все еще должен быть в монастыре. Хотя, кроме него есть и другие кандидаты на фермах и в городе. Возможно, мне стоит поговорить с Ли или поспрашивать в гавани.");
};


instance DIA_MILTENNW_LEAVEMYSHIP(C_INFO)
{
	npc = pc_mage_nw;
	nr = 55;
	condition = dia_miltennw_leavemyship_condition;
	information = dia_miltennw_leavemyship_info;
	permanent = TRUE;
	description = "Я не могу взять тебя с собой.";
};


func int dia_miltennw_leavemyship_condition()
{
	if((MILTENNW_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_leavemyship_info()
{
	AI_Output(other,self,"DIA_MiltenNW_LeaveMyShip_15_00");	//Я не могу взять тебя с собой.
	AI_Output(self,other,"DIA_MiltenNW_LeaveMyShip_03_01");	//Ты лучше знаешь, кто тебе нужен. Если передумаешь, я буду ждать тебя в монастыре.
	MILTENNW_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_MILTENNW_STILLNEEDYOU(C_INFO)
{
	npc = pc_mage_nw;
	nr = 55;
	condition = dia_miltennw_stillneedyou_condition;
	information = dia_miltennw_stillneedyou_info;
	permanent = TRUE;
	description = "Ты нужен мне.";
};


func int dia_miltennw_stillneedyou_condition()
{
	if(((MILTENNW_ISONBOARD == LOG_OBSOLETE) || (MILTENNW_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_miltennw_stillneedyou_info()
{
	AI_Output(other,self,"DIA_MiltenNW_StillNeedYou_15_00");	//Ты нужен мне.
	AI_Output(self,other,"DIA_MiltenNW_StillNeedYou_03_01");	//Твое решение делает мне честь. Вперед, мы не можем терять времени!
	AI_Output(self,other,"DIA_MiltenNW_StillNeedYou_03_02");	//Я отправляюсь в порт. Встретимся там.
	self.flags = NPC_FLAG_IMMORTAL;
	MILTENNW_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_TEACH(C_INFO)
{
	npc = pc_mage_nw;
	nr = 90;
	condition = dia_miltennw_teach_condition;
	information = dia_miltennw_teach_info;
	permanent = TRUE;
	description = "Я хочу изучить новые заклинания.";
};


func int dia_miltennw_teach_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_miltennw_teach_info()
{
	AI_Output(other,self,"DIA_MiltenNW_Teach_15_00");	//Я хочу изучить кое-какие заклинания.
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices(dia_miltennw_teach);
		Info_AddChoice(dia_miltennw_teach,DIALOG_BACK,dia_miltennw_teach_back);
		if(PLAYER_TALENT_RUNES[SPL_WINDFIST] == FALSE)
		{
			Info_AddChoice(dia_miltennw_teach,b_buildlearnstring(NAME_SPL_WINDFIST,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_miltennw_teach_windfist);
		};
		if(PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] == FALSE)
		{
			Info_AddChoice(dia_miltennw_teach,b_buildlearnstring(NAME_SPL_INSTANTFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_miltennw_teach_feuerball);
		};
		if(PLAYER_TALENT_RUNES[SPL_ICEBOLT] == FALSE)
		{
			Info_AddChoice(dia_miltennw_teach,b_buildlearnstring(NAME_SPL_ICEBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_miltennw_teach_eispfeil);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_Teach_03_01");	//Ты все еще не достиг второго круга магии. Я ничему не могу научить тебя.
	};
};

func void dia_miltennw_teach_back()
{
	Info_ClearChoices(dia_miltennw_teach);
};

func void dia_miltennw_teach_windfist()
{
	b_teachplayertalentrunes(self,other,SPL_WINDFIST);
};

func void dia_miltennw_teach_feuerball()
{
	b_teachplayertalentrunes(self,other,SPL_INSTANTFIREBALL);
};

func void dia_miltennw_teach_eispfeil()
{
	b_teachplayertalentrunes(self,other,SPL_ICEBOLT);
};


instance DIA_MILTENNW_MANA(C_INFO)
{
	npc = pc_mage_nw;
	nr = 100;
	condition = dia_miltennw_mana_condition;
	information = dia_miltennw_mana_info;
	permanent = TRUE;
	description = "Я хочу повысить мои магические способности.";
};


func int dia_miltennw_mana_condition()
{
	if((other.guild == GIL_KDF) && (other.attribute[ATR_MANA_MAX] < 100))
	{
		return TRUE;
	};
};

func void dia_miltennw_mana_info()
{
	AI_Output(other,self,"DIA_MiltenNW_Mana_15_00");	//Я хочу повысить свои магические способности.
	Info_ClearChoices(dia_miltennw_mana);
	Info_AddChoice(dia_miltennw_mana,DIALOG_BACK,dia_miltennw_mana_back);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltennw_mana_1);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltennw_mana_5);
};

func void dia_miltennw_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= 100)
	{
		AI_Output(self,other,"DIA_MiltenNW_Mana_03_00");	//Твоя магическая энергия велика. Слишком велика, чтобы я мог увеличить ее.
	};
	Info_ClearChoices(dia_miltennw_mana);
};

func void dia_miltennw_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,100);
	Info_ClearChoices(dia_miltennw_mana);
	Info_AddChoice(dia_miltennw_mana,DIALOG_BACK,dia_miltennw_mana_back);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltennw_mana_1);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltennw_mana_5);
};

func void dia_miltennw_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,100);
	Info_ClearChoices(dia_miltennw_mana);
	Info_AddChoice(dia_miltennw_mana,DIALOG_BACK,dia_miltennw_mana_back);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltennw_mana_1);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltennw_mana_5);
};


instance DIA_MAGE_NW_PICKPOCKET(C_INFO)
{
	npc = pc_mage_nw;
	nr = 900;
	condition = dia_mage_nw_pickpocket_condition;
	information = dia_mage_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_mage_nw_pickpocket_condition()
{
	return c_beklauen(56,75);
};

func void dia_mage_nw_pickpocket_info()
{
	Info_ClearChoices(dia_mage_nw_pickpocket);
	Info_AddChoice(dia_mage_nw_pickpocket,DIALOG_BACK,dia_mage_nw_pickpocket_back);
	Info_AddChoice(dia_mage_nw_pickpocket,DIALOG_PICKPOCKET,dia_mage_nw_pickpocket_doit);
};

func void dia_mage_nw_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_mage_nw_pickpocket);
};

func void dia_mage_nw_pickpocket_back()
{
	Info_ClearChoices(dia_mage_nw_pickpocket);
};

