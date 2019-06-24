
instance DIA_PC_THIEF_DI_EXIT(C_INFO)
{
	npc = pc_thief_di;
	nr = 999;
	condition = dia_pc_thief_di_exit_condition;
	information = dia_pc_thief_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pc_thief_di_exit_condition()
{
	return TRUE;
};

func void dia_pc_thief_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PC_THIEF_DI_HALLO(C_INFO)
{
	npc = pc_thief_di;
	nr = 5;
	condition = dia_pc_thief_di_hallo_condition;
	information = dia_pc_thief_di_hallo_info;
	description = "Мы прибыли.";
};


func int dia_pc_thief_di_hallo_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_pc_thief_di_hallo_info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_Hallo_15_00");	//Мы прибыли.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_01");	//Этот остров, похоже, находится совсем недалеко от Хориниса.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_02");	//Я не знал об этом. Но теперь многие вещи стали для меня очевидными.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_03");	//Я все время задавал себе вопрос - как оркам так быстро удавалось доставлять провизию и подкрепление.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_04");	//Имея такой аванпост, это было для них легче легкого.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_05");	//На пути вглубь острова, ты, вероятно, наткнешься на ловушку-другую.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_06");	//Если тебе покажется, что ты не знаешь, что делать дальше, вернись ко мне. Возможно, мой опыт сможет помочь тебе.
};


instance DIA_PC_THIEF_DI_RAT(C_INFO)
{
	npc = pc_thief_di;
	nr = 5;
	condition = dia_pc_thief_di_rat_condition;
	information = dia_pc_thief_di_rat_info;
	permanent = TRUE;
	description = "Мне нужен твой совет.";
};


func int dia_pc_thief_di_rat_condition()
{
	if((Npc_IsDead(undeaddragon) == FALSE) && Npc_KnowsInfo(other,dia_pc_thief_di_hallo))
	{
		return TRUE;
	};
};


var int dia_pc_thief_di_rat_onetime;
var int dia_pc_thief_di_rat_onetime2;

func void dia_pc_thief_di_rat_info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_RAT_15_00");	//Мне нужен твой совет.
	if(Npc_IsDead(orkelite_antipaladinorkoberst_di) && (EVT_ORKOBERST_SWITCH_FOUND == FALSE))
	{
		AI_Output(other,self,"DIA_PC_Thief_DI_RAT_15_01");	//У полковника орков здесь есть штаб-квартира. Я не могу продвинуться вглубь острова дальше этой точки.
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_02");	//Орки хитрые создания. Зачастую их недооценивают. Я полагаю, у них там что-то вроде секретного прохода. Осмотри стены на предмет скрытых выключателей.
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_03");	//Помни, впрочем - эти выключатели обычно нужно нажимать в определенном порядке, чтобы механизм сработал.
	}
	else if(Npc_IsDead(firedragonisland) && (EVT_DIBRIDGE_OPENED == FALSE))
	{
		AI_Output(other,self,"DIA_PC_Thief_DI_RAT_15_04");	//Я сражался с драконом и теперь застрял перед пропастью с подъемным мостом. Этот мост поднят, и я не знаю, как опустить его.
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_05");	//Ммм. А ты не пробовал дальнобойное оружие? Может быть, механизм можно активировать при помощи выстрела.
	}
	else if(Npc_IsDead(skeleton_lord_archol) && (Npc_KnowsInfo(other,dia_schwarzmagier_hello) == FALSE))
	{
		AI_Output(other,self,"DIA_PC_Thief_DI_RAT_15_06");	//Я встречаю на своем пути полчища нежити и их изощренные ловушки.
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_07");	//Извини, но я никогда не имел дела с нежитью. Здесь тебе придется изобретать что-то самому.
	}
	else
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_08");	//Приходи ко мне, если у тебя возникнет проблема, которую мой опыт может помочь разрешить.
		if((ORKSTURMDI == TRUE) && (DIA_PC_THIEF_DI_RAT_ONETIME2 == FALSE))
		{
			AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_09");	//Еще одно. Я бы предпочел, чтобы ты не приводил всех этих тварей, что бродят здесь, к кораблю. Я надеюсь, этот рейд орков был последней атакой, которую нам пришлось отражать здесь!
			b_giveplayerxp(XP_AMBIENT);
			DIA_PC_THIEF_DI_RAT_ONETIME2 = TRUE;
		};
	};
};


instance DIA_DIEGO_DI_TRADE(C_INFO)
{
	npc = pc_thief_di;
	nr = 12;
	condition = dia_diego_di_trade_condition;
	information = dia_diego_di_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Мне нужна амуниция.";
};


func int dia_diego_di_trade_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_diego_di_trade_info()
{
	var int mcbolzenamount;
	var int mcarrowamount;
	AI_Output(other,self,"DIA_Diego_DI_TRADE_15_00");	//Мне нужна амуниция.
	b_givetradeinv(self);
	Npc_RemoveInvItems(self,itrw_bolt,Npc_HasItems(self,itrw_bolt));
	mcbolzenamount = KAPITEL * 50;
	CreateInvItems(self,itrw_bolt,mcbolzenamount);
	Npc_RemoveInvItems(self,itrw_arrow,Npc_HasItems(self,itrw_arrow));
	mcarrowamount = KAPITEL * 50;
	CreateInvItems(self,itrw_arrow,mcarrowamount);
	AI_Output(self,other,"DIA_Diego_DI_TRADE_11_01");	//Возможно, я смогу помочь тебе.
};


instance DIA_PC_THIEF_DI_TRAINING_TALENTE(C_INFO)
{
	npc = pc_thief_di;
	nr = 10;
	condition = dia_pc_thief_di_training_talente_condition;
	information = dia_pc_thief_di_training_talente_info;
	permanent = TRUE;
	description = "Обучи меня.";
};


func int dia_pc_thief_di_training_talente_condition()
{
	if((Npc_IsDead(undeaddragon) == FALSE) && Npc_KnowsInfo(other,dia_pc_thief_di_hallo))
	{
		return TRUE;
	};
};

func void dia_pc_thief_di_training_talente_info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_Training_15_00");	//Обучи меня.
	AI_Output(self,other,"DIA_PC_Thief_DI_Training_11_01");	//Что тебе нужно?
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"Использование отмычек",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW) * 5),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_dex_1()
{
	if(b_teachattributepoints(self,other,ATR_DEXTERITY,1,100))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_DEX_1_11_00");	//Тебе будет значительно легче, если ты будешь держаться подальше от линии огня.
	};
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"Использование отмычек",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW) * 5),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_dex_5()
{
	if(b_teachattributepoints(self,other,ATR_DEXTERITY,5,100))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_DEX_5_11_00");	//Когда ты двигаешься, всегда помни о том, как легко передвигаются коты. Остальное придет само собой.
	};
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"Использование отмычек",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW) * 5),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_combat_bow_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,100))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_Combat_BOW_1_11_00");	//Для достижения лучшего результата побольше тренируйся.
	};
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"Использование отмычек",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW) * 5),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_combat_bow_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,100))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_Combat_BOW_5_11_00");	//Чтобы твоя рука не дрожала, во время прицеливания старайся дышать пореже.
	};
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"Использование отмычек",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW) * 5),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_talente_picklock()
{
	if(b_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_PICKLOCK_11_00");	//Лучше поздно, чем никогда. Странно что ты не изучил эту способность раньше.
	};
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"Использование отмычек",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW) * 5),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_talente_back()
{
	Info_ClearChoices(dia_pc_thief_di_training_talente);
};


instance DIA_PC_THIEF_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = pc_thief_di;
	nr = 5;
	condition = dia_pc_thief_di_undeaddragondead_condition;
	information = dia_pc_thief_di_undeaddragondead_info;
	permanent = TRUE;
	description = "Все кончено. Теперь мы можем убираться отсюда.";
};


func int dia_pc_thief_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_pc_thief_di_undeaddragondead_onetime;

func void dia_pc_thief_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_UndeadDragonDead_15_00");	//Все кончено. Теперь мы можем убираться отсюда.
	if(Npc_GetDistToWP(self,"WP_UNDEAD_MIDDLE_01") < 4000)
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_01");	//Ты только посмотри на это. В жизни не видел такого сооружения.
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_02");	//Как тебе, черт возьми, удалось пройти там?
		AI_Output(other,self,"DIA_PC_Thief_DI_UndeadDragonDead_15_03");	//Мне просто повезло, я думаю.
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_04");	//(смеется) Ну, если ты так думаешь...
	}
	else
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_05");	//Отлично.
	};
	if(DIA_PC_THIEF_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		AI_Output(other,self,"DIA_PC_Thief_DI_UndeadDragonDead_15_06");	//Что ты собираешься делать дальше?
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_07");	//Хороший вопрос. Я думаю, сначала нужно вернуться в Хоринис.
		if((DIEBESGILDE_VERRATEN == TRUE) || (MIS_ANDRE_GUILDOFTHIEVES == LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_DiegoDI_Add_11_00");	//Там больше нет гильдии воров. Это открывает новые интересные возможности.
		};
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_09");	//Ммм. Ну, или, может быть, я просто продолжу бизнес Бромора. Это очень неплохие деньги. Честные деньги.
		DIA_PC_THIEF_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_10");	//Иди к капитану. Пусть он поднимает якорь.
	AI_StopProcessInfos(self);
	if(LARES_ISONBOARD != LOG_SUCCESS)
	{
		Npc_ExchangeRoutine(self,"SittingShipDI");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Start");
	};
};


instance DIA_THIEF_DI_PICKPOCKET(C_INFO)
{
	npc = pc_thief_di;
	nr = 900;
	condition = dia_thief_di_pickpocket_condition;
	information = dia_thief_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_thief_di_pickpocket_condition()
{
	return c_beklauen(120,600);
};

func void dia_thief_di_pickpocket_info()
{
	Info_ClearChoices(dia_thief_di_pickpocket);
	Info_AddChoice(dia_thief_di_pickpocket,DIALOG_BACK,dia_thief_di_pickpocket_back);
	Info_AddChoice(dia_thief_di_pickpocket,DIALOG_PICKPOCKET,dia_thief_di_pickpocket_doit);
};

func void dia_thief_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thief_di_pickpocket);
};

func void dia_thief_di_pickpocket_back()
{
	Info_ClearChoices(dia_thief_di_pickpocket);
};

