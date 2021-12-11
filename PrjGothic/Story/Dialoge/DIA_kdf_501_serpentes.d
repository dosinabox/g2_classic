
instance DIA_SERPENTES_KAP1_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap1_exit_condition;
	information = dia_serpentes_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_NOTALK(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_notalk_condition;
	information = dia_serpentes_notalk_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_serpentes_notalk_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KNOWS_FIRE_CONTEST == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_notalk_info()
{
	AI_Output(self,other,"DIA_Serpentes_NOTALK_10_00");	//(сварливо) Ты осмеливаешься обращаться ко мне, послушник? Возвращайся к своей работе.
	Info_ClearChoices(dia_serpentes_notalk);
	Info_AddChoice(dia_serpentes_notalk,"Мне нужно идти (КОНЕЦ)",dia_serpentes_notalk_exit);
	Info_AddChoice(dia_serpentes_notalk,"У меня есть еще один вопрос...",dia_serpentes_notalk_question);
};

func void dia_serpentes_notalk_question()
{
	AI_Output(other,self,"DIA_Serpentes_NOTALK_QUESTION_15_00");	//У меня есть еще один вопрос...
	AI_Output(self,other,"DIA_Serpentes_NOTALK_QUESTION_10_01");	//(в ярости) Похоже, ты не понимаешь. Я решаю, когда говорить с тобой, а когда нет. Что ты о себе вообразил?
	AI_Output(self,other,"DIA_Serpentes_NOTALK_QUESTION_10_02");	//А теперь возвращайся к работе!
	AI_StopProcessInfos(self);
};

func void dia_serpentes_notalk_exit()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_GOAWAY(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_goaway_condition;
	information = dia_serpentes_goaway_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_serpentes_goaway_condition()
{
	if(Npc_KnowsInfo(hero,dia_serpentes_notalk) && Npc_IsInState(self,zs_talk) && !Npc_KnowsInfo(hero,dia_pyrokar_fire) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_goaway_info()
{
	AI_Output(self,other,"DIA_Serpentes_GOAWAY_10_00");	//Твое присутствие здесь говорит не только о недостатке уважения, но также о твоей тупости, послушник!
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_YOURSTORY(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 24;
	condition = dia_serpentes_yourstory_condition;
	information = dia_serpentes_yourstory_info;
	permanent = FALSE;
	description = "Я слышал, что ты прошел Испытание Огнем.";
};


func int dia_serpentes_yourstory_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulthar_test) && (other.guild == GIL_NOV) && (Npc_KnowsInfo(hero,dia_pyrokar_magican) == FALSE) && (MIS_GOLEM != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_serpentes_yourstory_info()
{
	AI_Output(other,self,"DIA_Serpentes_YOURSTORY_15_00");	//Я слышал, что ты прошел Испытание Огнем.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_01");	//Со всей присущей мне скромностью я расскажу тебе об этом. Все остальные, кто пытались пройти это испытание, мертвы.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_02");	//(снисходительно) Тебе не стоит пытаться пройти это испытание. Твой дух слаб. Лучше служи в монастыре, и, возможно, через несколько лет ты будешь выбран.
	AI_Output(other,self,"DIA_Serpentes_YOURSTORY_15_03");	//Я хочу пройти это испытание.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_04");	//Если такова воля Инноса, то пройдешь. Но если нет - то ты умрешь.
};


instance DIA_SERPENTES_TEST(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_test_condition;
	information = dia_serpentes_test_info;
	permanent = FALSE;
	description = "Я готов пройти твое испытание, мастер.";
};


func int dia_serpentes_test_condition()
{
	if(Npc_KnowsInfo(hero,dia_pyrokar_fire) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_test_info()
{
	AI_Output(other,self,"DIA_Serpentes_TEST_15_00");	//Я готов пройти твое испытание, мастер.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_01");	//Итак, ты хочешь подвергнуться этому испытанию. Только самые мужественные послушники требуют этого. Но мужество - это не все, что тебе понадобится.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_02");	//Достаточно ли ты умен, чтобы пройти это испытание? А сил у тебя хватит встретить все опасности, что поджидают тебя?
	AI_Output(self,other,"DIA_Serpentes_TEST_10_03");	//Если нет, ты заплатишь за это своей жизнью.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_04");	//А теперь слушай: В Месте Камней, найди того, кто никогда не был рожден - найди того, кто когда-то был вызван.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_05");	//Одолей того, кого нельзя одолеть - померься силами с живой скалой, сразись с бессмертным камнем - и уничтожь его.
	MIS_GOLEM = LOG_RUNNING;
	Log_CreateTopic(TOPIC_GOLEM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GOLEM,LOG_RUNNING);
	b_logentry(TOPIC_GOLEM,"Серпентес дал мне испытание. Он хочет, чтобы я 'нашел ему того, кто когда-то был вызван', живую скалу, и победил его.");
};


instance DIA_SERPENTES_NOIDEA(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_noidea_condition;
	information = dia_serpentes_noidea_info;
	permanent = FALSE;
	description = "С живой скалой? Что за создание это должно быть?";
};


func int dia_serpentes_noidea_condition()
{
	if((MIS_GOLEM == LOG_RUNNING) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_noidea_info()
{
	AI_Output(other,self,"DIA_Serpentes_NOIDEA_15_00");	//С живой скалой? Что за создание это должно быть?
	AI_Output(self,other,"DIA_Serpentes_NOIDEA_10_01");	//Я сказал тебе все. (с издевкой) Или это испытание кажется тебе слишком сложным?
	AI_Output(self,other,"DIA_Serpentes_NOIDEA_10_02");	//Теперь ты узнаешь, что означает пройти Испытание Огнем - я больше не буду отвечать на твои вопросы.
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_NOHELP(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_nohelp_condition;
	information = dia_serpentes_nohelp_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_serpentes_nohelp_condition()
{
	if(Npc_KnowsInfo(hero,dia_serpentes_noidea) && (Npc_IsDead(magic_golem) == FALSE) && (MIS_GOLEM == LOG_RUNNING) && Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV) && ((Npc_KnowsInfo(other,dia_ulthar_test) == FALSE) || Npc_KnowsInfo(other,dia_serpentes_yourstory)))
	{
		return TRUE;
	};
};

func void dia_serpentes_nohelp_info()
{
	AI_Output(self,other,"DIA_Serpentes_NOHELP_10_00");	//(с презрением) Иди и выполняй свою задачу, послушник!
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_SUCCESS(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 3;
	condition = dia_serpentes_success_condition;
	information = dia_serpentes_success_info;
	permanent = FALSE;
	description = "Я победил голема.";
};


func int dia_serpentes_success_condition()
{
	if(Npc_IsDead(magicgolem) && (MIS_GOLEM == LOG_RUNNING) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_success_info()
{
	var C_NPC garwig;
	garwig = Hlp_GetNpc(nov_608_garwig);
	AI_Output(other,self,"DIA_Serpentes_SUCCESS_15_00");	//Я победил голема.
	AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_01");	//Что? Ты действительно сделал это? Но без Молота Инноса ты никогда бы не смог уничтожить этого голема.
	if(Npc_IsDead(garwig))
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_02");	//(с триумфом) Но ты выдал себя! Это ты убил Гарвига!
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_03");	//ТЫ ПОНЕСЕШЬ НАКАЗАНИЕ ЗА УБИЙСТВО СЛУГИ ИННОСА!!!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_KILL,0);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_04");	//(с сожалением) Тем не менее, я должен признать, что ты выполнил задание, которое я дал тебе.
	};
	if(Npc_HasItems(other,holy_hammer_mis) >= 1)
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_05");	//И будет лучше, если я заберу этот молот.
		Npc_RemoveInvItems(other,holy_hammer_mis,1);
		Wld_InsertItem(holy_hammer_mis,"FP_HAMMER");
	};
	MIS_GOLEM = LOG_SUCCESS;
	b_giveplayerxp(XP_GOLEM);
};


instance DIA_SERPENTES_PERM(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 99;
	condition = dia_serpentes_perm_condition;
	information = dia_serpentes_perm_info;
	permanent = TRUE;
	description = "Ты хочешь что-то еще сказать мне?";
};


func int dia_serpentes_perm_condition()
{
	if((KAPITEL >= 3) || Npc_KnowsInfo(other,dia_serpentes_success))
	{
		return TRUE;
	};
};

func void dia_serpentes_perm_info()
{
	AI_Output(other,self,"DIA_Serpentes_PERM_15_00");	//Ты хочешь что-то еще сказать мне?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Serpentes_PERM_10_01");	//Нет. Пока нет, брат.
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_PERM_10_02");	//Свободен. Ты знаешь, что тебе нужно делать.
	};
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_KAP2_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap2_exit_condition;
	information = dia_serpentes_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_KAP3_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap3_exit_condition;
	information = dia_serpentes_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_MINENANTEILE(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 30;
	condition = dia_serpentes_minenanteile_condition;
	information = dia_serpentes_minenanteile_info;
	important = TRUE;
};


func int dia_serpentes_minenanteile_condition()
{
	if((PEDRO_TRAITOR == TRUE) && ((hero.guild == GIL_KDF) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_serpentes_minenanteile_info()
{
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_00");	//Не так быстро. У меня есть еще одно задание для тебя.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteile_15_01");	//(вздыхает) Что еще?
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_02");	//Теперь, когда ты принадлежишь к Братству Огня, ты также должен выполнять обязанности, сопутствующие твоему положению.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_03");	//Церковь занимается не только вопросами магии - она также, как ты знаешь, является последней инстанцией в вопросе осуществления правосудия.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_04");	//Последний случай, с которым нам пришлось иметь дело, открывает бездонную пропасть, и с этим нужно разобраться раз и навсегда.
		Info_ClearChoices(dia_serpentes_minenanteile);
		Info_AddChoice(dia_serpentes_minenanteile,"У меня и так уже много заданий. Найди кого-нибудь еще.",dia_serpentes_minenanteile_nein);
		Info_AddChoice(dia_serpentes_minenanteile,"Что ты там придумал?",dia_serpentes_minenanteile_was);
		Info_AddChoice(dia_serpentes_minenanteile,"Разве это не работа ополчения?",dia_serpentes_minenanteile_miliz);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_05");	//Наемник вроде тебя мог бы очень помочь нам в этом вопросе.
		Info_ClearChoices(dia_serpentes_minenanteile);
		Info_AddChoice(dia_serpentes_minenanteile,"У меня и так уже много заданий. Найди кого-нибудь еще.",dia_serpentes_minenanteile_nein);
		Info_AddChoice(dia_serpentes_minenanteile,"Кого я должен убить?",dia_serpentes_minenanteile_killsld);
	};
};

func void dia_serpentes_minenanteile_miliz()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_miliz_15_00");	//Разве это не работа ополчения?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_miliz_10_01");	//Ополчение отвечает только за город. Это дело может иметь далеко идущие последствия.
};

func void dia_serpentes_minenanteile_nein()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_nein_15_00");	//У меня и так уже много заданий. Найди кого-нибудь еще.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_nein_10_01");	//(сердито) Это возмутительно. Тебе никогда не достичь высших кругов магии, если ты не желаешь выполнять работу для Братства.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_nein_10_02");	//Я объявляю тебе выговор. Надеюсь, больше этого не повторится - иначе ты плохо кончишь.
	AI_StopProcessInfos(self);
};

func void dia_serpentes_minenanteile_was()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_15_00");	//Ну что там еще?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_01");	//Кто-то в городе продает фальшивые акции шахт бывшей исправительной колонии.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_02");	//Эти бумаги абсолютно бесполезны и не имеют особого значения. Но все же, они могут посеять волнения и недовольства среди людей, что мы не можем позволить себе в текущей ситуации.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_03");	//Этот мошенник предположительно имеет связи со всеми наиболее влиятельными торговцами в городе и сельской местности, и ему уже удалось продать свои поддельные акции некоторым из них.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_04");	//Найди этого мошенника и приведи его сюда. В такие тяжелые времена мы не потерпим жуликов и грабителей.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_05");	//Это дело должно стать показательным, чтобы другим было неповадно.
	Info_AddChoice(dia_serpentes_minenanteile,"Я попробую прояснить этот вопрос.",dia_serpentes_minenanteile_was_ja);
};

func void dia_serpentes_minenanteile_was_ja()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_ja_15_00");	//Я попробую прояснить этот вопрос.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_01");	//Еще одно. Когда ты будешь разговаривать с этими торговцами, важно, чтобы они не поняли, что ты ищешь именно эти акции.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_02");	//Я думаю, они захотят продать их, но наверняка откажутся иметь с тобой дело, если поймут, что ты действуешь по поручению Церкви, понимаешь?
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_ja_15_03");	//Да.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_04");	//Тогда за работу. Я желаю тебе успеха, брат.
	Info_ClearChoices(dia_serpentes_minenanteile);
	MIS_SERPENTES_MINENANTEIL_KDF = LOG_RUNNING;
	if(Npc_IsDead(salandril) == FALSE)
	{
		CreateInvItems(salandril,itwr_minenanteil_mis,2);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 2;
	};
	if(Npc_IsDead(vlk_416_matteo) == FALSE)
	{
		CreateInvItems(vlk_416_matteo,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(vlk_413_bosper) == FALSE)
	{
		CreateInvItems(vlk_413_bosper,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(vlk_409_zuris) == FALSE)
	{
		CreateInvItems(vlk_409_zuris,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(bau_911_elena) == FALSE)
	{
		CreateInvItems(bau_911_elena,itwr_minenanteil_mis,2);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 2;
	};
	if(Npc_IsDead(bau_970_orlan) == FALSE)
	{
		CreateInvItems(bau_970_orlan,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(vlk_407_hakon) == FALSE)
	{
		CreateInvItems(vlk_407_hakon,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(bau_936_rosi) == FALSE)
	{
		CreateInvItems(bau_936_rosi,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(vlk_468_canthar) == FALSE)
	{
		CreateInvItems(vlk_468_canthar,itwr_minenanteil_mis,3);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 3;
	};
	SALANDRILVERTEILTEMINENANTEIL = SALANDRILMINENANTEIL_MAINCOUNTER;
	Log_CreateTopic(TOPIC_MINENANTEILE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MINENANTEILE,LOG_RUNNING);
	b_logentry(TOPIC_MINENANTEILE,"Кто-то продает фальшивые акции шахты и обогащается таким незаконным способом. Я должен найти того, кто продает эти акции торговцам. Серпентес хочет заполучить все эти поддельные документы.");
};

func void dia_serpentes_minenanteile_killsld()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_Kill_15_00");	//Кого я должен убить?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_01");	//О, Иннос. Никого, конечно же. Это дело требует изящности, ты, грубый мужлан.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_02");	//Саландрил, алхимик из верхнего квартала, виновен в серьезном преступлении и его нужно наказать за это.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_03");	//Однако он отказывается прибыть в монастырь для суда. Приведи его сюда.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_04");	//Как ты сделаешь это, меня не волнует. Но ты, конечно же, будешь вознагражден.
	Info_AddChoice(dia_serpentes_minenanteile,"Разве это не работа ополчения?",dia_serpentes_minenanteile_miliz);
	Info_AddChoice(dia_serpentes_minenanteile,"Нет проблем. Я сделаю это.",dia_serpentes_minenanteile_was_jasld);
};


var int mis_serpentes_bringsalandril_sld;

func void dia_serpentes_minenanteile_was_jasld()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_jaSLD_15_00");	//Нет проблем. Я сделаю это.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_jaSLD_10_01");	//Хорошо. Мы ожидаем услышать от тебя новости через несколько дней.
	MIS_SERPENTES_BRINGSALANDRIL_SLD = LOG_RUNNING;
	Info_ClearChoices(dia_serpentes_minenanteile);
	Log_CreateTopic(TOPIC_MINENANTEILE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MINENANTEILE,LOG_RUNNING);
	b_logentry(TOPIC_MINENANTEILE,"Я должен доставить Саландрила, алхимика из верхней части Хориниса, в монастырь для суда. Мне не особенно интересует, что он там натворил, пока мне хорошо платят за это.");
};


instance DIA_SERPENTES_MINENANTEILEBRINGEN(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 2;
	condition = dia_serpentes_minenanteilebringen_condition;
	information = dia_serpentes_minenanteilebringen_info;
	permanent = TRUE;
	description = "Насчет поддельных акций...";
};


func int dia_serpentes_minenanteilebringen_condition()
{
	if((MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_HasItems(other,itwr_minenanteil_mis) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int serpentesminenanteilcounter;

func void dia_serpentes_minenanteilebringen_info()
{
	var int serpentesminenanteilcount;
	var int xp_bringserpentesminenanteils;
	var int serpentesminenanteiloffer;
	var int serpentesminenanteilgeld;
	var string minenanteiltext;
	var string minenanteilleft;
	serpentesminenanteilcount = Npc_HasItems(other,itwr_minenanteil_mis);
	serpentesminenanteiloffer = 200;
	if(serpentesminenanteilcount == 1)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_00");	//Я смог найти акции шахт.
		b_giveplayerxp(XP_BRINGSERPENTESMINENANTEIL);
		b_giveinvitems(other,self,itwr_minenanteil_mis,1);
		SERPENTESMINENANTEILCOUNTER = SERPENTESMINENANTEILCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_01");	//Я смог найти несколько акций шахт.
		b_giveinvitems(other,self,itwr_minenanteil_mis,serpentesminenanteilcount);
		xp_bringserpentesminenanteils = serpentesminenanteilcount * XP_BRINGSERPENTESMINENANTEIL;
		SERPENTESMINENANTEILCOUNTER = SERPENTESMINENANTEILCOUNTER + serpentesminenanteilcount;
		b_giveplayerxp(xp_bringserpentesminenanteils);
	};
	SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER - serpentesminenanteilcount;
	minenanteilleft = IntToString(SALANDRILMINENANTEIL_MAINCOUNTER);
	minenanteiltext = ConcatStrings(minenanteilleft,PRINT_NUMBERLEFT);
	AI_PrintScreen(minenanteiltext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,4);
	if(SERPENTESMINENANTEILCOUNTER < SALANDRILVERTEILTEMINENANTEIL)
	{
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_02");	//Очень хорошо. Ты должен изъять из обращения все акции. Это отрава для наших людей. Принеси их все мне.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_03");	//Вот. Это компенсирует твои расходы.
	}
	else if(SERPENTESMINENANTEILCOUNTER == SALANDRILVERTEILTEMINENANTEIL)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_04");	//Это все акции, как мне кажется.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_05");	//Отлично. Ты заслужил награду.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_06");	//Возьми этот защитный амулет. Он поможет тебе пройти по пути, который еще только ожидает тебя.
		CreateInvItems(self,itam_prot_mage_01,1);
		b_giveinvitems(self,other,itam_prot_mage_01,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_07");	//Это действительно последняя акция, да?
	};
	serpentesminenanteilgeld = serpentesminenanteilcount * serpentesminenanteiloffer;
	CreateInvItems(self,itmi_gold,serpentesminenanteilgeld);
	b_giveinvitems(self,other,itmi_gold,serpentesminenanteilgeld);
};


instance DIA_SERPENTES_GOTSALANDRIL(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 32;
	condition = dia_serpentes_gotsalandril_condition;
	information = dia_serpentes_gotsalandril_info;
	description = "Я знаю, кто ввел эти акции в обращение.";
};


func int dia_serpentes_gotsalandril_condition()
{
	if((SC_KNOWSPROSPEKTORSALANDRIL == TRUE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_serpentes_gotsalandril_info()
{
	AI_Output(other,self,"DIA_Serpentes_GOTSalandril_15_00");	//Я знаю, кто ввел эти акции в обращение. Это Саландрил, алхимик из верхнего квартала города.
	AI_Output(self,other,"DIA_Serpentes_GOTSalandril_10_01");	//Тогда приведи его сюда. Нам есть, что обсудить с ним.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_SERPENTES_SALANDRILHERE(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 33;
	condition = dia_serpentes_salandrilhere_condition;
	information = dia_serpentes_salandrilhere_info;
	description = "Саландрил здесь, в монастыре.";
};


func int dia_serpentes_salandrilhere_condition()
{
	if(Npc_GetDistToWP(salandril,"ALTAR") < 10000)
	{
		if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			return TRUE;
		}
		else if(Npc_KnowsInfo(other,dia_serpentes_gotsalandril) && (hero.guild == GIL_KDF))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func void dia_serpentes_salandrilhere_info()
{
	AI_Output(other,self,"DIA_Serpentes_SalandrilHERE_15_00");	//Саландрил здесь, в монастыре.
	AI_Output(self,other,"DIA_Serpentes_SalandrilHERE_10_01");	//Отлично. Мы разберемся с ним позже.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Serpentes_SalandrilHERE_10_02");	//Вот твоя награда. И никому ни слова об этом, понятно?
		CreateInvItems(self,itmi_gold,400);
		b_giveinvitems(self,other,itmi_gold,400);
	};
	TOPIC_END_MINENANTEILE = TRUE;
	b_giveplayerxp(XP_SALANDRILINKLOSTER);
};


instance DIA_SERPENTES_SALANDRILDEAD(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 33;
	condition = dia_serpentes_salandrildead_condition;
	information = dia_serpentes_salandrildead_info;
	description = "Саландрил мертв.";
};


func int dia_serpentes_salandrildead_condition()
{
	if((Npc_KnowsInfo(other,dia_serpentes_gotsalandril) || (((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (MIS_SERPENTES_BRINGSALANDRIL_SLD == LOG_RUNNING))) && Npc_IsDead(salandril))
	{
		return TRUE;
	};
};

func void dia_serpentes_salandrildead_info()
{
	AI_Output(other,self,"DIA_Serpentes_SalandrilDEAD_15_00");	//Саландрил мертв.
	AI_Output(self,other,"DIA_Serpentes_SalandrilDEAD_10_01");	//Что ж, значит, его дела не остались безнаказанными. Да сжалится Иннос над его бедной душой.
	TOPIC_END_MINENANTEILE = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_SERPENTES_KAP4_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap4_exit_condition;
	information = dia_serpentes_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_KAP5_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap5_exit_condition;
	information = dia_serpentes_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_PICKPOCKET(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 900;
	condition = dia_serpentes_pickpocket_condition;
	information = dia_serpentes_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_serpentes_pickpocket_condition()
{
	return c_beklauen(86,380);
};

func void dia_serpentes_pickpocket_info()
{
	Info_ClearChoices(dia_serpentes_pickpocket);
	Info_AddChoice(dia_serpentes_pickpocket,DIALOG_BACK,dia_serpentes_pickpocket_back);
	Info_AddChoice(dia_serpentes_pickpocket,DIALOG_PICKPOCKET,dia_serpentes_pickpocket_doit);
};

func void dia_serpentes_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_serpentes_pickpocket);
};

func void dia_serpentes_pickpocket_back()
{
	Info_ClearChoices(dia_serpentes_pickpocket);
};

