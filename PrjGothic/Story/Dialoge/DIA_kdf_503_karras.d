
instance DIA_KARRAS_KAP1_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap1_exit_condition;
	information = dia_karras_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_karras_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_HELLO(C_INFO)
{
	npc = kdf_503_karras;
	nr = 1;
	condition = dia_karras_hello_condition;
	information = dia_karras_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_karras_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_NOVIZENCHASE != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_karras_hello_info()
{
	if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_00");	//Что я могу сделать для тебя, послушник?
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_01");	//Что я могу сделать для тебя, брат?
	}
	else if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_02");	//Благородные воины Инноса редко останавливаются здесь.
		AI_Output(self,other,"DIA_Karras_Hello_10_03");	//Что я могу сделать для тебя?
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_04");	//(недоверчиво) Что ты делаешь здесь?
	};
};


instance DIA_KARRAS_MISSION(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_mission_condition;
	information = dia_karras_mission_info;
	permanent = FALSE;
	description = "Я пришел почитать писания.";
};


func int dia_karras_mission_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_karras_mission_info()
{
	AI_Output(other,self,"DIA_Karras_Mission_15_00");	//Я пришел почитать писания.
	AI_Output(self,other,"DIA_Karras_Mission_10_01");	//Понимаю. Если тебе удастся выкроить время при изучении писаний, обратись ко мне.
	AI_Output(self,other,"DIA_Karras_Mission_10_02");	//Есть один вопрос, в котором мне не помешала бы помощь здравомыслящего послушника.
};


instance DIA_KARRAS_AUFGABE(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_aufgabe_condition;
	information = dia_karras_aufgabe_info;
	permanent = FALSE;
	description = "У тебя есть поручение для меня?";
};


func int dia_karras_aufgabe_condition()
{
	if(Npc_KnowsInfo(other,dia_karras_mission))
	{
		return TRUE;
	};
};

func void dia_karras_aufgabe_info()
{
	AI_Output(other,self,"DIA_Karras_Aufgabe_15_00");	//У тебя есть поручение для меня?
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_01");	//Да. Это касается безумного Игнаца. Он живет в Хоринисе и экспериментирует с различными зельями и лечебными настойками. Но также он занимается магическими заклинаниями.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_02");	//И это очень беспокоит меня. Я задаю себе вопрос - а угодна ли эта магия Инносу?
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_03");	//Чтобы проверить это, мне хотелось бы заполучить некоторые из его свитков.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_04");	//Я хочу, чтобы ты отправился в город и купил у него три свитка для меня.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_05");	//Но никому ни слова - понятно?
	AI_Output(other,self,"DIA_Karras_Aufgabe_15_06");	//Конечно.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_07");	//Вот 150 золотых монет. Это должно компенсировать твои затраты.
	MIS_KARRASVERGESSEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_KARRASCHARM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KARRASCHARM,LOG_RUNNING);
	b_logentry(TOPIC_KARRASCHARM,"Мастер Каррас отправил меня в город. Он хочет, чтобы я принес ему три свитка с заклинаниями, которые изготавливает и продает Игнац.");
	b_giveinvitems(self,other,itmi_gold,150);
};


instance DIA_KARRAS_SUCCESS(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_success_condition;
	information = dia_karras_success_info;
	permanent = FALSE;
	description = "Вот свитки, которые ты хотел получить.";
};


func int dia_karras_success_condition()
{
	if((MIS_KARRASVERGESSEN == LOG_RUNNING) && (Npc_HasItems(other,itsc_charm) >= 3))
	{
		return TRUE;
	};
};

func void dia_karras_success_info()
{
	AI_Output(other,self,"DIA_Karras_Success_15_00");	//Вот свитки, которые ты хотел получить.
	AI_Output(self,other,"DIA_Karras_Success_10_01");	//Отлично, мой юный друг.
	AI_Output(self,other,"DIA_Karras_Success_10_02");	//Теперь ты можешь полностью посвятить себя обучению в библиотеке.
	AI_Output(self,other,"DIA_Karras_Success_10_03");	//И возьми этот свиток в качестве награды.
	MIS_KARRASVERGESSEN = LOG_SUCCESS;
	b_giveplayerxp(XP_KARRASCHARM);
	b_giveinvitems(other,self,itsc_charm,3);
	b_giveinvitems(self,other,itsc_sumwolf,1);
};


instance DIA_KARRAS_TRADE(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_trade_condition;
	information = dia_karras_trade_info;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
	trade = TRUE;
};


func int dia_karras_trade_condition()
{
	if(hero.guild != GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_karras_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Karras_Trade_15_00");	//Покажи мне свои товары.
};


instance DIA_KARRAS_JOB(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_job_condition;
	information = dia_karras_job_info;
	permanent = FALSE;
	description = "А чем именно ты занимаешься?";
};


func int dia_karras_job_condition()
{
	return TRUE;
};

func void dia_karras_job_info()
{
	AI_Output(other,self,"DIA_Karras_JOB_15_00");	//А чем именно ты занимаешься?
	AI_Output(self,other,"DIA_Karras_JOB_10_01");	//Я отвечаю за обучение магов искусству сферического проявления.
	AI_Output(other,self,"DIA_Karras_JOB_15_02");	//Что это означает?
	AI_Output(self,other,"DIA_Karras_JOB_10_03");	//Ну, я обучаю их вызову существ из других измерений или сфер.
	AI_Output(self,other,"DIA_Karras_JOB_10_04");	//Это обычно называется просто вызовом, хотя это определение недостаточно полно отражает суть искусства вызова слуг.
	AI_Output(self,other,"DIA_Karras_JOB_10_05");	//Кроме того, у меня есть очень интересные свитки, которых нет даже у Горакса.
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Karras_JOB_10_06");	//Но я могу продать их только членам нашего Ордена.
	};
	Log_CreateTopic(TOPIC_KLOSTERTRADER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTRADER,"Мастер Каррас из монастыря может продать мне свитки с заклинаниями. Но для этого я должен быть магом огня.");
};


instance DIA_KARRAS_TEACH(C_INFO)
{
	npc = kdf_503_karras;
	nr = 10;
	condition = dia_karras_teach_condition;
	information = dia_karras_teach_info;
	permanent = TRUE;
	description = "Обучи меня (созданию рун).";
};


func int dia_karras_teach_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_karras_teach_info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Karras_TEACH_15_00");	//Обучи меня.
	Info_ClearChoices(dia_karras_teach);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_SUMMONGOBLINSKELETON] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONGOBLINSKELETON,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_karras_teach_sumgobl);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_SUMMONWOLF] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONWOLF,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_karras_teachsummonwolf);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_SUMMONSKELETON] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONSKELETON,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_karras_teach_summonskeleton);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_SUMMONGOLEM] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONGOLEM,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_karras_teach_summongolem);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_SUMMONDEMON] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONDEMON,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_karras_teach_summondemon);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6) && (PLAYER_TALENT_RUNES[SPL_ARMYOFDARKNESS] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_ARMYOFDARKNESS,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_karras_teach_armyofdarkness);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Karras_TEACH_10_01");	//В настоящий момент мне нечему учить тебя.
	}
	else
	{
		Info_AddChoice(dia_karras_teach,DIALOG_BACK,dia_karras_teach_back);
	};
};

func void dia_karras_teach_back()
{
	Info_ClearChoices(dia_karras_teach);
};

func void dia_karras_teach_sumgobl()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONGOBLINSKELETON);
};

func void dia_karras_teachsummonwolf()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONWOLF);
};

func void dia_karras_teach_summonskeleton()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONSKELETON);
};

func void dia_karras_teach_summongolem()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONGOLEM);
};

func void dia_karras_teach_summondemon()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONDEMON);
};

func void dia_karras_teach_armyofdarkness()
{
	b_teachplayertalentrunes(self,other,SPL_ARMYOFDARKNESS);
};


instance DIA_KARRAS_CIRCLE4(C_INFO)
{
	npc = kdf_503_karras;
	nr = 3;
	condition = dia_karras_circle4_condition;
	information = dia_karras_circle4_info;
	permanent = TRUE;
	description = "Я хочу изучить четвертый Круг Магии.";
};


func int dia_karras_circle4_condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3)
	{
		return TRUE;
	};
};

func void dia_karras_circle4_info()
{
	AI_Output(other,self,"DIA_Karras_CIRCLE4_15_00");	//Я хочу изучить четвертый Круг Магии.
	if(MIS_READYFORCHAPTER4 == TRUE)
	{
		if(b_teachmagiccircle(self,other,4))
		{
			AI_Output(self,other,"DIA_Karras_CIRCLE4_10_01");	//Хорошо. Для этого ты располагаешь всем необходимым. Войди же в четвертый круг, да пребудет с тобой сила этой новой магии.
			AI_Output(self,other,"DIA_Karras_CIRCLE4_10_02");	//Ты через многое прошел, и Иннос будет продолжать освещать твой путь.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_CIRCLE4_10_03");	//Он еще далеко не закончен.
	};
};


instance DIA_KARRAS_CIRCLE5(C_INFO)
{
	npc = kdf_503_karras;
	nr = 3;
	condition = dia_karras_circle5_condition;
	information = dia_karras_circle5_info;
	permanent = TRUE;
	description = "Я хочу изучить пятый Круг Магии.";
};


func int dia_karras_circle5_condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
	{
		return TRUE;
	};
};

func void dia_karras_circle5_info()
{
	AI_Output(other,self,"DIA_Karras_CIRCLE5_15_00");	//Я хочу изучить пятый Круг Магии.
	if(KAPITEL >= 5)
	{
		if(b_teachmagiccircle(self,other,5))
		{
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_01");	//Войди же в пятый круг магии. Тебе станет подвластна могущественная магия, несравнимая с тем, чем ты владел ранее.
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_02");	//Используй эту силу во благо, брат - тьма еще сильна, и сильны твои враги.
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_03");	//Я не могу сопроводить тебя по пути к шестому и наивысшему Кругу Магии. Сам Пирокар введет тебя в него, когда придет время.
			b_logentry(TOPIC_KLOSTERTEACHER,"Мастер Пирокар посвятит меня в 6-й круг магии.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_CIRCLE4_10_04");	//Время еще не пришло.
	};
};


instance DIA_KARRAS_KAP2_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap2_exit_condition;
	information = dia_karras_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_karras_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_KAP3_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap3_exit_condition;
	information = dia_karras_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_karras_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_CHASEPEDRO(C_INFO)
{
	npc = kdf_503_karras;
	nr = 31;
	condition = dia_karras_chasepedro_condition;
	information = dia_karras_chasepedro_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_karras_chasepedro_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KAPITEL == 3) && (MIS_NOVIZENCHASE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_karras_chasepedro_info()
{
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_00");	//Брат, тебе нельзя терять времени. Ты должен найти Педро и вернуть Глаз Инноса монастырю.
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_01");	//Если Глаз не вернуть, мы все обречены.
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_02");	//Что ты делаешь здесь? Разве ты не должен сейчас искать коварного предателя Педро?
		Info_ClearChoices(dia_karras_chasepedro);
		Info_AddChoice(dia_karras_chasepedro,"Это подождет. Есть другие, более важные дела.",dia_karras_chasepedro_later);
		Info_AddChoice(dia_karras_chasepedro,"Ему все равно далеко не уйти.",dia_karras_chasepedro_wontescape);
	};
};

func void dia_karras_chasepedro_later()
{
	AI_Output(other,self,"DIA_Karras_ChasePedro_Later_15_00");	//Это подождет. Есть другие, более важные дела.
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_01");	//Да ты представляешь, что эта потеря означает для монастыря? Глаз Инноса - грозное оружие.
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_02");	//Никто не в состоянии предугадать, что враг намеревается сделать с этим амулетом, но он что-то задумал, и мы должны предотвратить эту беду.
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_03");	//Так отправляйся же немедленно на поиски и найди этого вора!
	AI_StopProcessInfos(self);
};

func void dia_karras_chasepedro_wontescape()
{
	AI_Output(other,self,"DIA_Karras_ChasePedro_WontEscape_15_00");	//Ему все равно далеко не уйти.
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_01");	//Я очень надеюсь на это, ради твоего же блага. Если же ему удастся уйти из-за того, что ты болтаешься здесь, я лично позабочусь о том, чтобы ты предстал перед трибуналом.
	AI_Output(other,self,"DIA_Karras_ChasePedro_WontEscape_15_02");	//А в чем меня можно обвинить?
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_03");	//В заговоре с врагом. Не нужно большого воображения, чтобы представить себе наказание за такое преступление.
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_04");	//А теперь не теряй времени попусту. В противном случае, боюсь, при следующей нашей встрече ты будешь гореть на костре.
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_NEEDINFO(C_INFO)
{
	npc = kdf_503_karras;
	nr = 31;
	condition = dia_karras_needinfo_condition;
	information = dia_karras_needinfo_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_karras_needinfo_condition()
{
	if(Npc_KnowsInfo(other,dia_karras_chasepedro) && (KAPITEL == 3) && (hero.guild != GIL_KDF) && (MIS_NOVIZENCHASE == LOG_RUNNING) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_karras_needinfo_info()
{
	AI_Output(self,other,"DIA_Karras_NeedInfo_10_00");	//Ты знаешь, что тебе нужно делать. Так иди же!
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_INNOSEYERETRIEVED(C_INFO)
{
	npc = kdf_503_karras;
	nr = 1;
	condition = dia_karras_innoseyeretrieved_condition;
	information = dia_karras_innoseyeretrieved_info;
	permanent = FALSE;
	description = "Я принес назад Глаз Инноса.";
};


func int dia_karras_innoseyeretrieved_condition()
{
	if((KAPITEL == 3) && (MIS_NOVIZENCHASE == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_karras_innoseyeretrieved_info()
{
	AI_Output(other,self,"DIA_Karras_InnosEyeRetrieved_15_00");	//Я принес назад Глаз Инноса.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_01");	//Я так рад, что тебе удалось вырвать Глаз из лап врага.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_02");	//Но опасность все еще нависает над нами. Враг разрабатывает новые планы и претворяет их в жизнь с необычайной агрессивностью.
	AI_Output(other,self,"DIA_Karras_InnosEyeRetrieved_15_03");	//Я уже почувствовал это на своей шкуре.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_04");	//Сейчас не время для шуток. Ситуация серьезна. Очень серьезна. Теперь мы даже не знаем, кому можно доверять, а кому нет.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_05");	//Враг уже преуспел в искушении послушника Педро. Он может преуспеть в этом и со многими другими.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_KARRAS_KAP3_PERM(C_INFO)
{
	npc = kdf_503_karras;
	nr = 5;
	condition = dia_karras_kap3_perm_condition;
	information = dia_karras_kap3_perm_info;
	permanent = TRUE;
	description = "Как продвигаются твои исследования?";
};


func int dia_karras_kap3_perm_condition()
{
	if((KAPITEL >= 3) && Npc_KnowsInfo(other,dia_karras_job))
	{
		return TRUE;
	};
};

func void dia_karras_kap3_perm_info()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_00");	//Как продвигаются твои исследования?
	if((MIS_KARRASRESEARCHDMT == FALSE) && (PYROKARTOLDKARRASTORESEARCHDMT == TRUE) && (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_01");	//Я смог выяснить кое-что об Ищущих.
		AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_02");	//И что это такое?
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_03");	//Они имеют очевидное демоническое происхождение. Ну, по крайней мере, они находятся или находились под влиянием демонов.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_04");	//Будь осторожен при встрече с ними.
		AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_05");	//Надо же! Какая свежая концепция!
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_06");	//Я приношу свои извинения, но у меня недостаточно материала, чтобы сделать более детальные утверждения.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_07");	//Но ты мог бы принести мне что-нибудь, принадлежащее им, для изучения...
		MIS_KARRASRESEARCHDMT = LOG_RUNNING;
		b_logentry(TOPIC_DEMENTOREN,"Чтобы продолжать свои исследования, Каррасу нужно что-нибудь, что было в прямом контакте с Ищущими.");
		Info_ClearChoices(dia_karras_kap3_perm);
		Info_AddChoice(dia_karras_kap3_perm,DIALOG_BACK,dia_karras_kap3_perm_back);
		Info_AddChoice(dia_karras_kap3_perm,"Я попробую что-нибудь сделать.",dia_karras_kap3_perm_willsee);
		Info_AddChoice(dia_karras_kap3_perm,"Может иметь к этому отношение Спящий?",dia_karras_kap3_perm_sleeper);
		Info_AddChoice(dia_karras_kap3_perm,"Что именно тебе нужно?",dia_karras_kap3_perm_material);
	}
	else if(MIS_KARRASRESEARCHDMT == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_08");	//Я все еще работаю над интерпретацией данных об Ищущих.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_09");	//Как только я что-нибудь выясню, я, конечно же, немедленно информирую тебя.
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_10");	//У врага много обликов. Какой из них представляет наибольшую опасность для монастыря - чрезвычайно трудно определить.
	};
};

func void dia_karras_kap3_perm_back()
{
	Info_ClearChoices(dia_karras_kap3_perm);
};

func void dia_karras_kap3_perm_sleeper()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Sleeper_15_00");	//Может иметь к этому отношение Спящий?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Sleeper_10_01");	//Я слышал о Спящем. Но, исходя из имеющейся у меня информации, я ничего не могу сказать об этом.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Sleeper_10_02");	//К нему могут иметь отношение бесчисленное количество демонов, и любой из них может быть причастен.
};

func void dia_karras_kap3_perm_corpse()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Corpse_15_00");	//Ты хочешь, чтобы я принес тебе труп, что ли?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_01");	//Нет! Ты с ума сошел?! Опасность, представляемая нахождением демонической сущности в стенах монастыря, слишком велика.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_02");	//Будет достаточно, если ты найдешь какие-нибудь предметы, типичные для этих созданий.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_03");	//Остатки демонической ауры, прилипшие к ним, должны дать достаточно информации для изучения.
};

func void dia_karras_kap3_perm_material()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Material_15_00");	//Что именно тебе нужно?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Material_10_01");	//Откуда я знаю? Любой предмет, который принадлежит только этим созданиям.
	Info_AddChoice(dia_karras_kap3_perm,"Ты хочешь, чтобы я принес тебе труп?",dia_karras_kap3_perm_corpse);
};

func void dia_karras_kap3_perm_willsee()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_WillSee_15_00");	//Я попробую что-нибудь сделать.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_WillSee_10_01");	//Это было бы очень полезным. А пока я займусь своими обычными исследованиями.
	Info_ClearChoices(dia_karras_kap3_perm);
};


instance DIA_KARRAS_HAVEBOOK(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_havebook_condition;
	information = dia_karras_havebook_info;
	permanent = FALSE;
	description = "Я принес Альманах Одержимых.";
};


func int dia_karras_havebook_condition()
{
	if((MIS_KARRASRESEARCHDMT == LOG_RUNNING) && (Npc_HasItems(hero,itwr_dementorobsessionbook_mis) >= 1) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int karrasgotresearchdmtbook_day;

func void dia_karras_havebook_info()
{
	AI_Output(other,self,"DIA_Karras_HaveBook_15_00");	//Я принес Альманах Одержимых. Может быть, он чем-нибудь тебе поможет.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_01");	//Покажи.
	Npc_RemoveInvItems(other,itwr_dementorobsessionbook_mis,1);
	AI_PrintScreen("Альманах отдано",-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	AI_Output(self,other,"DIA_Karras_HaveBook_10_02");	//Да, это может подойти. Я должен изучить эту книгу.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_03");	//Но я уже уверен в одном.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_04");	//По моему мнению, Ищущие - это крайне извращенная жизненная форма, созданная Белиаром.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_05");	//Эти создания имеют частично демоническую и частично человеческую природу.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_06");	//Однако я пока не могу сказать, имеем ли мы дело с типичной спиритуальной одержимостью или с чистой физической мутацией.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_07");	//Заходи попозже. Тогда я определенно смогу сказать больше.
	MIS_KARRASRESEARCHDMT = LOG_SUCCESS;
	b_logentry(TOPIC_DEMENTOREN,"Каррас смог использовать Альманах одержимых для продолжения своих исследований. Я должен вернуться к нему позже.");
	KARRASGOTRESEARCHDMTBOOK_DAY = Wld_GetDay();
	b_giveplayerxp(XP_KARRASRESEARCHDMT);
};


instance DIA_KARRAS_RESEARCHDMTEND(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_researchdmtend_condition;
	information = dia_karras_researchdmtend_info;
	permanent = TRUE;
	description = "Выяснил что-нибудь новое об Ищущих?";
};


func int dia_karras_researchdmtend_condition()
{
	if((MIS_KARRASRESEARCHDMT == LOG_SUCCESS) && (hero.guild == GIL_KDF) && (SC_KNOWSMADPSI == FALSE))
	{
		return TRUE;
	};
};

func void dia_karras_researchdmtend_info()
{
	AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_00");	//Выяснил что-нибудь новое об Ищущих?
	if(KARRASGOTRESEARCHDMTBOOK_DAY <= (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_01");	//Да. Теперь я знаю, кем или чем эти Ищущие являются в действительности.
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_02");	//Выкладывай!
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_03");	//Когда-то они были людьми, как ты или я. Они сделали трагическую ошибку, посвятив себя нечистой магии очень сильного архидемона.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_04");	//Под влиянием этого архидемона, а также очень сильных наркотиков, единственной целью их существования стало служение ему, и со временем от их былой сущности осталась лишь тень.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_05");	//Сегодня же, они не более чем орудие зла, не обладающее собственной волей, и они никогда не перестанут охотиться на последователей Инноса.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_06");	//Мы должны проявлять осторожность. Похоже, они боятся этих священных чертогов Инноса.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_07");	//Однако, если их сила продолжит расти, я не смогу поручиться, что мы будем здесь в безопасности.
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_08");	//Спасибо. Это все было очень поучительно.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_09");	//Правда? Мне кажется, что это поднимает только еще больше вопросов. Например, кем они были раньше, и какой архидемон сделал их тем, что они есть сейчас?
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_10");	//У меня есть догадка. Это все похоже на Братство Спящего. Я знаю этих парней.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_11");	//Надеюсь, ты понимаешь, с чем имеешь дело. Будь осторожен, брат.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_12");	//Да, конечно же! Вот твой альманах. Мне он больше не нужен.
		CreateInvItems(other,itwr_dementorobsessionbook_mis,1);
		AI_PrintScreen("Альманах получено",-1,YPOS_ITEMTAKEN,FONT_SCREENSMALL,2);
		SC_KNOWSMADPSI = TRUE;
		b_logentry(TOPIC_DEMENTOREN,"Исследования Карраса завершились успехом. Похоже, есть связь между Ищущими и Братством Спящих.");
		b_giveplayerxp(XP_SC_KNOWSMADPSI);
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_13");	//Я работаю над этим. Заходи позже.
	};
};


instance DIA_KARRAS_PROT_BLACKEYE(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_prot_blackeye_condition;
	information = dia_karras_prot_blackeye_info;
	permanent = TRUE;
	description = "Есть ли способ защититься от ментальных атак Ищущих?";
};


func int dia_karras_prot_blackeye_condition()
{
	if((hero.guild == GIL_KDF) && (PYROKAR_ASKKARRASABOUTDMTAMULETT == TRUE) && (MIS_KARRAS_FINDBLESSEDSTONE == FALSE) && Npc_KnowsInfo(other,dia_karras_job))
	{
		return TRUE;
	};
};

func void dia_karras_prot_blackeye_info()
{
	AI_Output(other,self,"DIA_Karras_Prot_BlackEye_15_00");	//Есть ли способ защититься от ментальных атак Ищущих?
	if(SC_KNOWSMADPSI == TRUE)
	{
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_01");	//Конечно. Амулет, изготовленный из камня с благословенной земли, мог бы оказать защитное действие.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_02");	//К сожалению, у меня не осталось таких камней.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_03");	//Некоторые из алтарей, возведенных нами, сложены из таких камней.
		AI_Output(other,self,"DIA_Karras_Prot_BlackEye_15_04");	//Хорошо. Я попробую раздобыть такой камень.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_05");	//Да, сделай это. Но даже не думай, чтобы повредить какой-нибудь алтарь, ты слышишь меня?
		b_logentry(TOPIC_DEMENTOREN,"Каррас может дать мне некоторую защиту от ментальных атак Ищущих. Для этого ему нужен камень из благословенной земли. Некоторые алтари сделаны из таких камней.");
		MIS_KARRAS_FINDBLESSEDSTONE = LOG_RUNNING;
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_06");	//Понятия не имею. Я пока знаю слишком мало, чтобы дать ответ на твой вопрос. Задай мне его еще раз попозже.
	};
};


instance DIA_KARRAS_KARRASBLESSEDSTONE(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_karrasblessedstone_condition;
	information = dia_karras_karrasblessedstone_info;
	description = "Я принес несколько камней с благословенной земли.";
};


func int dia_karras_karrasblessedstone_condition()
{
	if((hero.guild == GIL_KDF) && Npc_HasItems(other,itmi_karrasblessedstone_mis) && (MIS_KARRAS_FINDBLESSEDSTONE == LOG_RUNNING))
	{
		return TRUE;
	};
};


var int karrasmakesblessedstone_day;

func void dia_karras_karrasblessedstone_info()
{
	AI_Output(other,self,"DIA_Karras_KarrasBlessedStone_15_00");	//Я принес несколько камней с благословенной земли.
	b_giveinvitems(other,self,itmi_karrasblessedstone_mis,1);
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_01");	//Это хорошо. Надеюсь, все алтари по-прежнему стоят на своих местах.
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_02");	//Хорошо. Я сделаю для тебя амулет, защищающий от черного взгляда Ищущих.
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_03");	//Дай мне немного времени. Над этим нужно поработать.
	KARRASMAKESBLESSEDSTONE_DAY = Wld_GetDay();
	MIS_KARRAS_FINDBLESSEDSTONE = LOG_SUCCESS;
	b_logentry(TOPIC_DEMENTOREN,"Каррас дал мне амулет, который будет защищать меня от ментальных атак Ищущих. Это должно сильно облегчить мне жизнь.");
	b_giveplayerxp(XP_KARRAS_FOUNDBLESSEDSTONE);
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_ITAM_PROT_BLACKEYE_MIS(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_itam_prot_blackeye_mis_condition;
	information = dia_karras_itam_prot_blackeye_mis_info;
	permanent = TRUE;
	description = "Так как насчет защитного амулета, что ты обещал мне?";
};


var int dia_karras_itam_prot_blackeye_mis_noperm;

func int dia_karras_itam_prot_blackeye_mis_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_KARRAS_FINDBLESSEDSTONE == LOG_SUCCESS) && (DIA_KARRAS_ITAM_PROT_BLACKEYE_MIS_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_karras_itam_prot_blackeye_mis_info()
{
	AI_Output(other,self,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_00");	//Так как насчет защитного амулета, что ты обещал мне?
	if(KARRASMAKESBLESSEDSTONE_DAY <= (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_01");	//Я закончил. Вот, взгляни. Он получился очень изящным.
		CreateInvItems(self,itam_prot_blackeye_mis,1);
		b_giveinvitems(self,other,itam_prot_blackeye_mis,1);
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_02");	//Носи его, не снимая, и Ищущие не смогут затянуть тебя в свою ментальную пропасть.
		AI_Output(other,self,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_03");	//Спасибо.
		b_logentry(TOPIC_DEMENTOREN,"Каррас дал мне амулет, который будет защищать меня от черного взгляда Ищущих.");
		DIA_KARRAS_ITAM_PROT_BLACKEYE_MIS_NOPERM = TRUE;
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_04");	//Спокойствие. Я все еще работаю над ним.
	};
};


instance DIA_KARRAS_KAP4_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap4_exit_condition;
	information = dia_karras_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_karras_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_KAP5_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap5_exit_condition;
	information = dia_karras_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_karras_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_PICKPOCKET(C_INFO)
{
	npc = kdf_503_karras;
	nr = 900;
	condition = dia_karras_pickpocket_condition;
	information = dia_karras_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_karras_pickpocket_condition()
{
	return c_beklauen(49,35);
};

func void dia_karras_pickpocket_info()
{
	Info_ClearChoices(dia_karras_pickpocket);
	Info_AddChoice(dia_karras_pickpocket,DIALOG_BACK,dia_karras_pickpocket_back);
	Info_AddChoice(dia_karras_pickpocket,DIALOG_PICKPOCKET,dia_karras_pickpocket_doit);
};

func void dia_karras_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_karras_pickpocket);
};

func void dia_karras_pickpocket_back()
{
	Info_ClearChoices(dia_karras_pickpocket);
};

