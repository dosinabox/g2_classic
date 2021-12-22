
instance DIA_KEROLOTH_EXIT(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 999;
	condition = dia_keroloth_exit_condition;
	information = dia_keroloth_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_keroloth_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_keroloth_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KEROLOTH_HELLO(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 2;
	condition = dia_keroloth_hello_condition;
	information = dia_keroloth_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_keroloth_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_keroloth_hello_info()
{
	AI_Output(other,self,"DIA_Keroloth_HELLO_15_00");	//Ты тренируешь людей?
	AI_Output(self,other,"DIA_Keroloth_HELLO_07_01");	//Да. Когда эти орки или, что еще хуже, драконы, нападут опять, нам понадобится каждый меч.
};


instance DIA_KEROLOTH_WANTTEACH(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 3;
	condition = dia_keroloth_wantteach_condition;
	information = dia_keroloth_wantteach_info;
	permanent = FALSE;
	description = "Ты можешь обучить и меня?";
};


func int dia_keroloth_wantteach_condition()
{
	if(KEROLOTHS_BEUTELLEER == FALSE)
	{
		return TRUE;
	};
};

func void dia_keroloth_wantteach_info()
{
	AI_Output(other,self,"DIA_Keroloth_WantTeach_15_00");	//Ты можешь обучить и меня?
	AI_Output(self,other,"DIA_Keroloth_WantTeach_07_01");	//Конечно. Я тренирую всех.
	AI_Output(self,other,"DIA_Keroloth_WantTeach_07_02");	//Но кроме таланта тебе понадобится хорошее оружие, если ты хочешь выжить здесь.
	AI_Output(self,other,"DIA_Keroloth_WantTeach_07_03");	//Обратись к рыцарю Тандору. Он снарядит тебя.
	KEROLOTH_TEACHPLAYER = TRUE;
	Log_CreateTopic(TOPIC_TEACHER_OC,LOG_NOTE);
	b_logentry(TOPIC_TEACHER_OC,"Керолот тренирует мечников в замке.");
	Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
	b_logentry(TOPIC_TRADER_OC,"Тандор продает оружие в замке.");
};


var int dia_keroloth_teach_permanent_1h;
var int dia_keroloth_teach_permanent;

instance DIA_KEROLOTH_TEACHER(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 100;
	condition = dia_keroloth_teacher_condition;
	information = dia_keroloth_teacher_info;
	permanent = TRUE;
	description = "(изучить бой одноручным оружием)";
};


func int dia_keroloth_teacher_condition()
{
	if((KEROLOTH_TEACHPLAYER == TRUE) && (KEROLOTHS_BEUTELLEER == FALSE) && (DIA_KEROLOTH_TEACH_PERMANENT_1H == FALSE))
	{
		return TRUE;
	};
};

func void dia_keroloth_teacher_info()
{
	AI_Output(other,self,"DIA_Keroloth_Teacher_15_00");	//Я хочу тренироваться!
	Info_ClearChoices(dia_keroloth_teacher);
	Info_AddChoice(dia_keroloth_teacher,DIALOG_BACK,dia_keroloth_teacher_back);
	Info_AddChoice(dia_keroloth_teacher,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_keroloth_teacher_1h_1);
	Info_AddChoice(dia_keroloth_teacher,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_keroloth_teacher_1h_5);
};

func void dia_keroloth_teacher_back()
{
	Info_ClearChoices(dia_keroloth_teacher);
};

func void b_keroloth_teachnomore1()
{
	AI_Output(self,other,"B_Keroloth_TeachNoMore1_07_00");	//Ты очень хорош. Мне больше нечему учить тебя.
};

func void b_keroloth_teachnomore2()
{
	AI_Output(self,other,"B_Keroloth_TeachNoMore2_07_00");	//Только очень опытный мечник сможет помочь тебе теперь.
};

func void dia_keroloth_teacher_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,60);
	if(other.hitchance[NPC_TALENT_1H] >= 60)
	{
		b_keroloth_teachnomore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_1H) == 2)
		{
			b_keroloth_teachnomore2();
		};
		DIA_KEROLOTH_TEACH_PERMANENT = TRUE;
	};
	Info_AddChoice(dia_keroloth_teacher,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_keroloth_teacher_1h_1);
};

func void dia_keroloth_teacher_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,60);
	if(other.hitchance[NPC_TALENT_1H] >= 60)
	{
		b_keroloth_teachnomore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_1H) == 2)
		{
			b_keroloth_teachnomore2();
		};
		DIA_KEROLOTH_TEACH_PERMANENT_1H = TRUE;
	};
	Info_AddChoice(dia_keroloth_teacher,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_keroloth_teacher_1h_5);
};


instance DIA_KEROLOTH_TEACH(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 101;
	condition = dia_keroloth_teach_condition;
	information = dia_keroloth_teach_info;
	permanent = TRUE;
	description = "(изучить бой двуручным оружием)";
};


func int dia_keroloth_teach_condition()
{
	if((KEROLOTH_TEACHPLAYER == TRUE) && (KEROLOTHS_BEUTELLEER == FALSE) && (DIA_KEROLOTH_TEACH_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_keroloth_teach_info()
{
	AI_Output(other,self,"DIA_Keroloth_Teach_15_00");	//Начнем.
	Info_ClearChoices(dia_keroloth_teach);
	Info_AddChoice(dia_keroloth_teach,DIALOG_BACK,dia_keroloth_teach_back);
	Info_AddChoice(dia_keroloth_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_keroloth_teach_2h_1);
	Info_AddChoice(dia_keroloth_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_keroloth_teach_2h_5);
};

func void dia_keroloth_teach_back()
{
	Info_ClearChoices(dia_keroloth_teach);
};

func void dia_keroloth_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,60);
	if(other.hitchance[NPC_TALENT_2H] >= 60)
	{
		b_keroloth_teachnomore1();
		DIA_KEROLOTH_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_keroloth_teach);
	Info_AddChoice(dia_keroloth_teach,DIALOG_BACK,dia_keroloth_teach_back);
	Info_AddChoice(dia_keroloth_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_keroloth_teach_2h_1);
	Info_AddChoice(dia_keroloth_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_keroloth_teach_2h_5);
};

func void dia_keroloth_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,60);
	if(other.hitchance[NPC_TALENT_2H] >= 60)
	{
		b_keroloth_teachnomore1();
		DIA_KEROLOTH_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_keroloth_teach);
	Info_AddChoice(dia_keroloth_teach,DIALOG_BACK,dia_keroloth_teach_back);
	Info_AddChoice(dia_keroloth_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_keroloth_teach_2h_1);
	Info_AddChoice(dia_keroloth_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_keroloth_teach_2h_5);
};


instance DIA_KEROLOTH_UDAR(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 4;
	condition = dia_keroloth_udar_condition;
	information = dia_keroloth_udar_info;
	permanent = FALSE;
	description = "Что насчет дальнего боя?";
};


func int dia_keroloth_udar_condition()
{
	if((KEROLOTH_TEACHPLAYER == TRUE) && (KEROLOTHS_BEUTELLEER == FALSE))
	{
		return TRUE;
	};
};

func void dia_keroloth_udar_info()
{
	AI_Output(other,self,"DIA_Keroloth_Udar_15_00");	//Что насчет дальнего боя?
	AI_Output(self,other,"DIA_Keroloth_Udar_07_01");	//Что насчет него?
	AI_Output(other,self,"DIA_Keroloth_Udar_15_02");	//Ты можешь обучить меня ему?
	AI_Output(self,other,"DIA_Keroloth_Udar_07_03");	//Нет, но ты можешь попросить Удара. Он хороший - нет, он ЛУЧШИЙ арбалетчик, насколько я знаю.
	Log_CreateTopic(TOPIC_TEACHER_OC,LOG_NOTE);
	b_logentry(TOPIC_TEACHER_OC,"Удар, из замка Долины рудников, знает все об арбалетах.");
};


instance DIA_KEROLOTH_KAP3_EXIT(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 999;
	condition = dia_keroloth_kap3_exit_condition;
	information = dia_keroloth_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_keroloth_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_keroloth_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KEROLOTH_KAP4_EXIT(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 999;
	condition = dia_keroloth_kap4_exit_condition;
	information = dia_keroloth_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_keroloth_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_keroloth_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KEROLOTH_KAP4_HELLO(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 40;
	condition = dia_keroloth_kap4_hello_condition;
	information = dia_keroloth_kap4_hello_info;
	description = "У тебя такой расстроенный вид.";
};


func int dia_keroloth_kap4_hello_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_keroloth_kap4_hello_info()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_15_00");	//У тебя такой расстроенный вид.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_07_01");	//(возбужденно) Будь они прокляты. Мой тебе совет: глаз не спускай со своих вещей.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_07_02");	//Чуть отвернешься, и все - вещички уже увели. Вот подонки!
	Info_AddChoice(dia_keroloth_kap4_hello,DIALOG_BACK,dia_keroloth_kap4_hello_ende);
	Info_AddChoice(dia_keroloth_kap4_hello,"Паладин не должен так просто выходить из себя.",dia_keroloth_kap4_hello_ruhig);
	Info_AddChoice(dia_keroloth_kap4_hello,"У тебя что-то украли?",dia_keroloth_kap4_hello_bestohlen);
	Info_AddChoice(dia_keroloth_kap4_hello,"Что за подонки?",dia_keroloth_kap4_hello_pack);
};

func void dia_keroloth_kap4_hello_ende()
{
	Info_ClearChoices(dia_keroloth_kap4_hello);
};

func void dia_keroloth_kap4_hello_bestohlen()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_bestohlen_15_00");	//У тебя что-то украли?
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_07_01");	//Нет. Они положили 20 золотых в мой карман. Конечно же, меня обокрали, ты, идиот!
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_07_02");	//Ничего, когда я доберусь до этой сволочи...
	Info_AddChoice(dia_keroloth_kap4_hello,"Так что у тебя пропало?",dia_keroloth_kap4_hello_bestohlen_wasfehlt);
};

func void dia_keroloth_kap4_hello_bestohlen_wasfehlt()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_15_00");	//Так что у тебя пропало?
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_01");	//Мой кошелек, со всеми моими сбережениями.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_02");	//Его украли!
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_15_03");	//Он где-нибудь всплывет.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_04");	//Когда я доберусь до него...
	Log_CreateTopic(TOPIC_KEROLOTHSGELDBEUTEL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KEROLOTHSGELDBEUTEL,LOG_RUNNING);
	b_logentry(TOPIC_KEROLOTHSGELDBEUTEL,"Паладин Керолот потерял свой кошелек. Он утверждает, что его украли охотники на драконов.");
	Info_ClearChoices(dia_keroloth_kap4_hello);
};

func void dia_keroloth_kap4_hello_pack()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_pack_15_00");	//Что за подонки?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_pack_07_01");	//Вы, оборванцы, охотники на драконов, конечно. Кто еще?
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_pack_07_02");	//Этот сброд, называющий себя охотниками на драконов, конечно. А кого еще, как ты думаешь, я могу иметь в виду?
	};
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_pack_07_03");	//(себе под нос) Нужно быть бдительным, это я тебе говорю.
};

func void dia_keroloth_kap4_hello_ruhig()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_ruhig_15_00");	//Успокойся! Паладин не должен так просто выходить из себя.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_ruhig_07_01");	//Но я не хочу успокаиваться. Это были все мои сбережения, черт!
};


instance DIA_KEROLOTH_KAP4_GELDGEFUNDEN(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 42;
	condition = dia_keroloth_kap4_geldgefunden_condition;
	information = dia_keroloth_kap4_geldgefunden_info;
	description = "Я думаю, я нашел твой кошелек.";
};


func int dia_keroloth_kap4_geldgefunden_condition()
{
	if(Npc_KnowsInfo(other,dia_keroloth_kap4_hello) && (Npc_HasItems(other,itmi_kerolothsgeldbeutel_mis) || Npc_HasItems(other,itmi_kerolothsgeldbeutelleer_mis)))
	{
		return TRUE;
	};
};

func void dia_keroloth_kap4_geldgefunden_info()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_15_00");	//Я думаю, я нашел твой кошелек.
	TOPIC_END_KEROLOTHSGELDBEUTEL = TRUE;
	b_giveplayerxp(XP_KEROLOTHSGELDBEUTEL);
	if(b_giveinvitems(other,self,itmi_kerolothsgeldbeutelleer_mis,1))
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_07_01");	//Кошелек пуст. Какая свинья сделала это?
		KEROLOTHS_BEUTELLEER = TRUE;
	};
	if(b_giveinvitems(other,self,itmi_kerolothsgeldbeutel_mis,1))
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_07_02");	//Что? Где? Какой ублюдок сделал это?
	};
	if(hero.guild == GIL_DJG)
	{
		Info_AddChoice(dia_keroloth_kap4_geldgefunden,"Минутку. А как насчет награды?",dia_keroloth_kap4_geldgefunden_lohn);
	};
	Info_AddChoice(dia_keroloth_kap4_geldgefunden,"Он был вон там, у кузницы.",dia_keroloth_kap4_geldgefunden_schmiede);
	Info_AddChoice(dia_keroloth_kap4_geldgefunden,"Я подозреваю одного охотника на драконов.",dia_keroloth_kap4_geldgefunden_djg);
	Info_AddChoice(dia_keroloth_kap4_geldgefunden,"Откуда мне знать?",dia_keroloth_kap4_geldgefunden_keineahnung);
};

func void dia_keroloth_kap4_geldgefunden_keineahnung()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_15_00");	//Откуда мне знать?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_07_01");	//Ты пытаешься надуть меня? Это ведь был ты, признайся.
		Info_ClearChoices(dia_keroloth_kap4_geldgefunden);
		Info_AddChoice(dia_keroloth_kap4_geldgefunden,"Я подозреваю одного охотника на драконов.",dia_keroloth_kap4_geldgefunden_djg);
		Info_AddChoice(dia_keroloth_kap4_geldgefunden,"Поцелуй мою задницу.",dia_keroloth_kap4_geldgefunden_keineahnung_kannstmich);
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_07_02");	//Я еще это выясню.
		AI_StopProcessInfos(self);
	};
};

func void dia_keroloth_kap4_geldgefunden_keineahnung_kannstmich()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_kannstmich_15_00");	//Поцелуй мою задницу.
	AI_Output(self,other,"DIA_Keroloth_KAP4_kannstmich_07_01");	//Я покажу тебе, как воровать честных людей!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_keroloth_kap4_geldgefunden_djg()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_15_00");	//Я подозреваю одного охотника на драконов.
	AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_01");	//(зло) Я знал это.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_02");	//(рычит) Их вообще не стоило пускать в замок.
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_03");	//Ну, подожди, я покажу этой свинье...
	};
	AI_StopProcessInfos(self);
	if((Npc_IsDead(ferros) == FALSE) && (Npc_GetDistToNpc(self,ferros) <= 2000))
	{
		b_attack(self,ferros,AR_NONE,1);
	}
	else if((Npc_IsDead(jan) == FALSE) && (Npc_GetDistToNpc(self,jan) <= 2000))
	{
		b_attack(self,jan,AR_NONE,1);
	}
	else if((Npc_IsDead(rethon) == FALSE) && (Npc_GetDistToNpc(self,rethon) <= 2000))
	{
		b_attack(self,rethon,AR_NONE,1);
	};
};

func void dia_keroloth_kap4_geldgefunden_schmiede()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede_15_00");	//Эээ. Он был вон там, у кузницы.
	AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede_07_01");	//Где? У кузницы? Он, должно быть, выпал там из кармана какого-нибудь охотника на драконов. Только не говори мне, что это не так.
};

func void dia_keroloth_kap4_geldgefunden_lohn()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_15_00");	//Минутку. А как насчет награды?
	if(KEROLOTHS_BEUTELLEER == TRUE)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_07_01");	//Это была последняя капля. Ты, похоже, давно не получал по морде, а?
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_07_02");	//А-аа. Хорошо. Вот несколько монет. А теперь скажи мне, кто сделал это?
		CreateInvItems(self,itmi_gold,50);
		b_giveinvitems(self,other,itmi_gold,50);
		KEROLOTH_HASPAYED = TRUE;
	};
};


instance DIA_KEROLOTH_KAP4_BELOHNUNG(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 43;
	condition = dia_keroloth_kap4_belohnung_condition;
	information = dia_keroloth_kap4_belohnung_info;
	permanent = TRUE;
	description = "Я хочу получить честные комиссионные за эту находку.";
};


func int dia_keroloth_kap4_belohnung_condition()
{
	if(Npc_KnowsInfo(other,dia_keroloth_kap4_geldgefunden) && (KEROLOTH_HASPAYED == FALSE) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_keroloth_kap4_belohnung_info()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_BELOHNUNG_15_00");	//Я хочу получить честные комиссионные за эту находку.
	if((KEROLOTHS_BEUTELLEER == TRUE) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_BELOHNUNG_07_01");	//Да, а рискуешь получить удар в челюсть!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_BELOHNUNG_07_02");	//Это все, что тебе нужно? Вот пара монет. А теперь проваливай.
		CreateInvItems(self,itmi_gold,50);
		b_giveinvitems(self,other,itmi_gold,50);
		KEROLOTH_HASPAYED = TRUE;
	};
};


instance DIA_KEROLOTH_KAP4_ENTSPANNDICH(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 44;
	condition = dia_keroloth_kap4_entspanndich_condition;
	information = dia_keroloth_kap4_entspanndich_info;
	permanent = TRUE;
	description = "Расслабься.";
};


func int dia_keroloth_kap4_entspanndich_condition()
{
	if((Npc_KnowsInfo(other,dia_keroloth_kap4_geldgefunden) && (KAPITEL >= 4)) || (MIS_OCGATEOPEN == TRUE))
	{
		return TRUE;
	};
};

func void dia_keroloth_kap4_entspanndich_info()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_ENTSPANNDICH_15_00");	//Расслабься.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_ENTSPANNDICH_07_01");	//Да, мастер. Я попытаюсь.
	}
	else if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_ENTSPANNDICH_07_02");	//Я не могу доказать это, но мне кажется, что ты предатель, который открыл ворота.
		AI_Output(self,other,"DIA_Keroloth_KAP4_ENTSPANNDICH_07_03");	//Ты заплатишь за это!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(other,self,"DIA_Keroloth_KAP4_ENTSPANNDICH_15_04");	//Ты ведь получил свой кошелек назад, разве нет?
		AI_Output(self,other,"DIA_Keroloth_KAP4_ENTSPANNDICH_07_05");	//Не провоцируй меня! Проваливай!
		AI_StopProcessInfos(self);
	};
};


instance DIA_KEROLOTH_KAP5_EXIT(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 999;
	condition = dia_keroloth_kap5_exit_condition;
	information = dia_keroloth_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_keroloth_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_keroloth_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KEROLOTH_KAP6_EXIT(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 999;
	condition = dia_keroloth_kap6_exit_condition;
	information = dia_keroloth_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_keroloth_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_keroloth_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KEROLOTH_PICKPOCKET(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 900;
	condition = dia_keroloth_pickpocket_condition;
	information = dia_keroloth_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_keroloth_pickpocket_condition()
{
	return c_beklauen(25,45);
};

func void dia_keroloth_pickpocket_info()
{
	Info_ClearChoices(dia_keroloth_pickpocket);
	Info_AddChoice(dia_keroloth_pickpocket,DIALOG_BACK,dia_keroloth_pickpocket_back);
	Info_AddChoice(dia_keroloth_pickpocket,DIALOG_PICKPOCKET,dia_keroloth_pickpocket_doit);
};

func void dia_keroloth_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_keroloth_pickpocket);
};

func void dia_keroloth_pickpocket_back()
{
	Info_ClearChoices(dia_keroloth_pickpocket);
};

