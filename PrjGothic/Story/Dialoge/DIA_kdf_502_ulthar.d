
instance DIA_ULTHAR_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_exit_condition;
	information = dia_ulthar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_ulthar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_GREET(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 2;
	condition = dia_ulthar_greet_condition;
	information = dia_ulthar_greet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ulthar_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && !Npc_KnowsInfo(hero,dia_pyrokar_fire) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_ulthar_greet_info()
{
	AI_Output(self,other,"DIA_Ulthar_GREET_05_00");	//Послушай, новый послушник должен предстать перед Высшим Советом. Да пребудет с тобой Иннос, сын мой.
	AI_Output(other,self,"DIA_Ulthar_GREET_15_01");	//А каковы задачи Высшего Совета?
	AI_Output(self,other,"DIA_Ulthar_GREET_05_02");	//Это наш долг - провозглашать волю Инноса. Согласно его воле, мы называем избранных послушников, которые должны пройти Испытание Магией.
	AI_Output(self,other,"DIA_Ulthar_GREET_05_03");	//Хотя мы ведем уединенный образ жизни, мы следим за событиями в миру, так как церковь Инноса представляет собой высший закон на земле.
	AI_Output(other,self,"DIA_Ulthar_GREET_15_04");	//Ах, так вам интересно, что происходит в миру...
	AI_Output(other,self,"DIA_Ulthar_GREET_15_05");	//А что вы думаете об этих драконах, что опустошают Долину Рудников со своей армией, что растет день ото дня?
	AI_Output(self,other,"DIA_Ulthar_GREET_05_06");	//Я понимаю, что сердце твое горит гневом, но мы должны сначала взвесить твои слова, прежде чем предпринять какие-нибудь шаги.
	AI_Output(self,other,"DIA_Ulthar_GREET_05_07");	//Если мы позволим себе увлечься и начать действовать поспешно, мы ничего не добьемся. Поэтому выполняй свои задачи, а мы пока обсудим, что можно сделать.
};


instance DIA_ULTHAR_MAGETEST(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 2;
	condition = dia_ulthar_magetest_condition;
	information = dia_ulthar_magetest_info;
	description = "Расскажи мне об Испытании Магией.";
};


func int dia_ulthar_magetest_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulthar_greet))
	{
		return TRUE;
	};
};

func void dia_ulthar_magetest_info()
{
	AI_Output(other,self,"DIA_Ulthar_MAGETEST_15_00");	//Расскажи мне об Испытании Магией.
	AI_Output(self,other,"DIA_Ulthar_MAGETEST_05_01");	//Это шанс для избранного послушника вступить в гильдию магов. Но только один может пройти это испытание.
	AI_Output(self,other,"DIA_Ulthar_MAGETEST_05_02");	//И Иннос один выбирает послушников для него.
};


instance DIA_ULTHAR_WHEN(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 3;
	condition = dia_ulthar_when_condition;
	information = dia_ulthar_when_info;
	permanent = TRUE;
	description = "Когда пройдет это испытание?";
};


func int dia_ulthar_when_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulthar_magetest) && (KNOWS_FIRE_CONTEST == FALSE))
	{
		return TRUE;
	};
};

func void dia_ulthar_when_info()
{
	AI_Output(other,self,"DIA_Ulthar_WHEN_15_00");	//Когда пройдет это испытание?
	AI_Output(self,other,"DIA_Ulthar_WHEN_05_01");	//Как только мы услышим волю Инноса, мы сообщим об этом избранным послушникам и проведем испытание.
};


instance DIA_ULTHAR_TEST(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 10;
	condition = dia_ulthar_test_condition;
	information = dia_ulthar_test_info;
	permanent = FALSE;
	description = "Я готов пройти твое испытание, мастер.";
};


func int dia_ulthar_test_condition()
{
	if(Npc_KnowsInfo(hero,dia_pyrokar_fire))
	{
		return TRUE;
	};
};

func void dia_ulthar_test_info()
{
	AI_Output(other,self,"DIA_Ulthar_TEST_15_00");	//Я готов пройти твое испытание, мастер.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_01");	//Я не удивлен, что ты знаешь этот старый закон.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_02");	//Но я подозреваю, что ты не осознаешь, какому риску ты себя подвергаешь. Помни, что нетерпеливый дух не выдержит Испытание Огнем.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_03");	//Уже очень давно никто не подвергался этому испытанию. А пройти его и остаться в живых вообще удалось только одному человеку.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_04");	//Тогда это был молодой и амбициозный послушник, а теперь это давний и постоянный член Высшего Совета - я говорю о Серпентесе.
	AI_Output(other,self,"DIA_Ulthar_TEST_15_05");	//Недолго ему осталось быть единственным, кто пошел это испытание.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_06");	//Тогда я не буду больше испытывать твое терпение. Вот мое испытание для тебя:
	AI_Output(self,other,"DIA_Ulthar_TEST_05_07");	//Создай руну 'огненная стрела'. Это все - да поможет тебе Иннос.
	MIS_RUNE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_RUNE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RUNE,LOG_RUNNING);
	b_logentry(TOPIC_RUNE,"Ультар дал мне испытание. Я должен создать руну Огненная стрела.");
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_RUNNING(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 10;
	condition = dia_ulthar_running_condition;
	information = dia_ulthar_running_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_ulthar_running_condition()
{
	if((MIS_RUNE == LOG_RUNNING) && Npc_IsInState(self,zs_talk) && (Npc_HasItems(other,itru_firebolt) == 0))
	{
		return TRUE;
	};
};

func void dia_ulthar_running_info()
{
	AI_Output(self,other,"DIA_Ulthar_RUNNING_05_00");	//Ты знаешь свою задачу. Занимайся ей.
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_SUCCESS(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 2;
	condition = dia_ulthar_success_condition;
	information = dia_ulthar_success_info;
	permanent = FALSE;
	description = "Я создал руну!";
};


func int dia_ulthar_success_condition()
{
	if((MIS_RUNE == LOG_RUNNING) && (Npc_HasItems(hero,itru_firebolt) >= 1))
	{
		return TRUE;
	};
};

func void dia_ulthar_success_info()
{
	AI_Output(other,self,"DIA_Ulthar_SUCCESS_15_00");	//Я создал руну!
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_01");	//Отлично, послушник. Храни ее - свою первую руну.
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_02");	//Когда ты достигнешь первого Круга Огня, ты сможешь использовать ее.
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_03");	//Ты прошел это испытание к моему полному удовлетворению.
	if((MIS_GOLEM == LOG_RUNNING) && (Npc_IsDead(magic_golem) == FALSE))
	{
		AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_04");	//Но опасное испытание, что приготовил Серпентес, еще ожидает тебя!
	};
	MIS_RUNE = LOG_SUCCESS;
	b_giveplayerxp(XP_RUNE);
};


instance DIA_ULTHAR_KAP3_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_kap3_exit_condition;
	information = dia_ulthar_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_ulthar_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_PERMABKAP3(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 99;
	condition = dia_ulthar_permabkap3_condition;
	information = dia_ulthar_permabkap3_info;
	permanent = TRUE;
	description = "Есть новости?";
};


func int dia_ulthar_permabkap3_condition()
{
	if((KAPITEL >= 3) || Npc_KnowsInfo(other,dia_ulthar_success))
	{
		return TRUE;
	};
};

func void dia_ulthar_permabkap3_info()
{
	AI_Output(other,self,"DIA_Ulthar_PermAbKap3_15_00");	//Есть новости?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Ulthar_PermAbKap3_05_01");	//Пока нет. Иди и занимайся своими задачами. Тебе еще многое нужно сделать.
	}
	else
	{
		AI_Output(self,other,"DIA_Ulthar_PermAbKap3_05_02");	//Нет. Ничего такого, чего бы ты еще не знал, брат.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_SCHREINEVERGIFTET(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 30;
	condition = dia_ulthar_schreinevergiftet_condition;
	information = dia_ulthar_schreinevergiftet_info;
	important = TRUE;
};


func int dia_ulthar_schreinevergiftet_condition()
{
	if(PEDRO_TRAITOR == TRUE)
	{
		return TRUE;
	};
};

func void dia_ulthar_schreinevergiftet_info()
{
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_00");	//Еще одно. Некоторые придорожные алтари, посвященные Инносу, были осквернены врагом. Они потеряли свои магические свойства.
		AI_Output(other,self,"DIA_Ulthar_SCHREINEVERGIFTET_15_01");	//Понимаю, и что теперь?
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_02");	//Ты должен очистить эти алтари, чтобы ситуация не усугубилась.
		CreateInvItems(self,itmi_ultharsholywater_mis,1);
		b_giveinvitems(self,other,itmi_ultharsholywater_mis,1);
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_03");	//Возьми эту святую воду и окропи ей основания алтаря.
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_04");	//Со святыми словами очищения к алтарю вернется его былая сила.
		if(Npc_HasItems(other,itwr_map_shrine_mis) == FALSE)
		{
			if(Npc_HasItems(gorax,itwr_map_shrine_mis) && (Npc_IsDead(gorax) == FALSE))
			{
				AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_05");	//Горакс может продать тебе карту, на которой помечены наши алтари.
			}
			else
			{
				AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_06");	//Вот карта. На ней отмечены алтари, построенные нами.
				CreateInvItems(self,itwr_map_shrine_mis,1);
				b_giveinvitems(self,other,itwr_map_shrine_mis,1);
			};
		};
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_07");	//Теперь иди и выполняй свои поручения.
		MIS_ULTHAR_HEILESCHREINE_PAL = LOG_RUNNING;
		Log_CreateTopic(TOPIC_ULTHAR_HEILESCHREINE_PAL,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ULTHAR_HEILESCHREINE_PAL,LOG_RUNNING);
		b_logentry(TOPIC_ULTHAR_HEILESCHREINE_PAL,"Ультар дал мне задание очистить при помощи святой воды все алтари, оскверненные врагом.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_08");	//Еще одно. Держись подальше от придорожных алтарей. Мы слышали, что некоторые из них были осквернены.
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_09");	//Никто не знает, как теперь они действуют.
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_10");	//Тебя не должна волновать эта проблема. О ней позаботятся паладины.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ULTHAR_SCHREINEGEHEILT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 30;
	condition = dia_ulthar_schreinegeheilt_condition;
	information = dia_ulthar_schreinegeheilt_info;
	description = "Я очистил все алтари.";
};


func int dia_ulthar_schreinegeheilt_condition()
{
	if(MIS_ULTHAR_HEILESCHREINE_PAL == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_ulthar_schreinegeheilt_info()
{
	AI_Output(other,self,"DIA_Ulthar_SchreineGeheilt_15_00");	//Я очистил все алтари.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheilt_05_01");	//Превосходно, сын мой. Я горжусь тобой. Да не оставит тебя внимание Инноса.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheilt_05_02");	//Возьми этот Амулет силы, он может пригодиться тебе в твоих сражениях с врагом.
	CreateInvItems(self,itam_dex_strg_01,1);
	b_giveinvitems(self,other,itam_dex_strg_01,1);
	b_giveplayerxp(XP_ULTHAR_SCHREINEGEREINIGT);
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_KAP4_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_kap4_exit_condition;
	information = dia_ulthar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_ulthar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_SCHREINEGEHEILTNOPAL(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 30;
	condition = dia_ulthar_schreinegeheiltnopal_condition;
	information = dia_ulthar_schreinegeheiltnopal_info;
	important = TRUE;
};


func int dia_ulthar_schreinegeheiltnopal_condition()
{
	if(((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF)) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_ulthar_schreinegeheiltnopal_info()
{
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheiltNoPAL_05_00");	//Хорошие новости. Придорожные алтари очищены. Сила Инноса помогла паладинам снять эту проблему.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheiltNoPAL_05_01");	//Ты опять можешь приносить дары Инносу без каких либо оговорок или ограничений.
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_KAP5_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_kap5_exit_condition;
	information = dia_ulthar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_ulthar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_KAP6_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_kap6_exit_condition;
	information = dia_ulthar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_ulthar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_PICKPOCKET(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 900;
	condition = dia_ulthar_pickpocket_condition;
	information = dia_ulthar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_ulthar_pickpocket_condition()
{
	return c_beklauen(74,320);
};

func void dia_ulthar_pickpocket_info()
{
	Info_ClearChoices(dia_ulthar_pickpocket);
	Info_AddChoice(dia_ulthar_pickpocket,DIALOG_BACK,dia_ulthar_pickpocket_back);
	Info_AddChoice(dia_ulthar_pickpocket,DIALOG_PICKPOCKET,dia_ulthar_pickpocket_doit);
};

func void dia_ulthar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ulthar_pickpocket);
};

func void dia_ulthar_pickpocket_back()
{
	Info_ClearChoices(dia_ulthar_pickpocket);
};

