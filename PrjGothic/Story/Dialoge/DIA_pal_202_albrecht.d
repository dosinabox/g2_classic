
instance DIA_ALBRECHT_EXIT(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 999;
	condition = dia_albrecht_exit_condition;
	information = dia_albrecht_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_albrecht_exit_condition()
{
	return TRUE;
};

func void dia_albrecht_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ALBRECHT_HAGEN(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 1;
	condition = dia_albrecht_hagen_condition;
	information = dia_albrecht_hagen_info;
	permanent = FALSE;
	description = "Мне нужно поговорить с лордом Хагеном!";
};


func int dia_albrecht_hagen_condition()
{
	if(lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_albrecht_hagen_info()
{
	AI_Output(other,self,"DIA_Albrecht_Hagen_15_00");	//Мне нужно поговорить с лордом Хагеном!
	AI_Output(self,other,"DIA_Albrecht_Hagen_03_01");	//Он в главном зале, иди прямо, не ошибешься.
	AI_Output(self,other,"DIA_Albrecht_Hagen_03_02");	//Не знаю, что тебе нужно от него, но будь краток - он занятой человек!
};


instance DIA_ALBRECHT_HALLO(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 2;
	condition = dia_albrecht_hallo_condition;
	information = dia_albrecht_hallo_info;
	permanent = FALSE;
	description = "Каково это, быть паладином?";
};


func int dia_albrecht_hallo_condition()
{
	return TRUE;
};

func void dia_albrecht_hallo_info()
{
	AI_Output(other,self,"DIA_Albrecht_Hallo_15_00");	//Каково это, быть паладином?
	AI_Output(self,other,"DIA_Albrecht_Hallo_03_01");	//Паладины - воины Инноса. Они живут ради того, чтобы служить ему, и сражаются в его честь.
	AI_Output(self,other,"DIA_Albrecht_Hallo_03_02");	//Взамен все мы наделены даром магии. Магии рун, которые даруются в знак признания наших заслуг.
};


instance DIA_ALBRECHT_CANTEACH(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 99;
	condition = dia_albrecht_canteach_condition;
	information = dia_albrecht_canteach_info;
	permanent = TRUE;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int dia_albrecht_canteach_condition()
{
	if(ALBRECHT_TEACHMANA == FALSE)
	{
		return TRUE;
	};
};

func void dia_albrecht_canteach_info()
{
	AI_Output(other,self,"DIA_Albrecht_CanTeach_15_00");	//Ты можешь научить меня чему-нибудь?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Albrecht_CanTeach_03_01");	//Если ты докажешь, что достоин этого, я награжу тебя магическими рунами паладинов.
		AI_Output(self,other,"DIA_Albrecht_CanTeach_03_02");	//Кроме того, я могу научить тебя, как повысить свои магические способности.
		ALBRECHT_TEACHMANA = TRUE;
		b_logentry(TOPIC_CITYTEACHER,"Паладин Альбрехт может помочь мне повысить мои магические способности.");
	}
	else
	{
		AI_Output(self,other,"DIA_Albrecht_CanTeach_03_03");	//Я обучаю только паладинов.
	};
};


instance DIA_ALBRECHT_TEACHPALRUNES(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 100;
	condition = dia_albrecht_teachpalrunes_condition;
	information = dia_albrecht_teachpalrunes_info;
	permanent = TRUE;
	description = "Я достоин получить руну?";
};


func int dia_albrecht_teachpalrunes_condition()
{
	if(ALBRECHT_TEACHMANA == TRUE)
	{
		return TRUE;
	};
};

func void dia_albrecht_teachpalrunes_info()
{
	AI_Output(other,self,"DIA_Albrecht_TEACHPalRunes_15_00");	//Я достоин получить руну?
	if(PLAYER_TALENT_RUNES[SPL_PALLIGHT] == FALSE)
	{
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_01");	//В знак признания твоего ранга я награждаю тебя Руной Света. Это символ истины и правосудия.
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_02");	//Освещай путь тем, кто следует пути Инноса.
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_03");	//Остальные руны ты должен заслужить. Приходи, когда сочтешь, что достоин их.
		PLAYER_TALENT_RUNES[SPL_PALLIGHT] = TRUE;
		CreateInvItems(self,itru_pallight,1);
		b_giveinvitems(self,other,itru_pallight,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_04");	//Какой путь ты выбираешь?
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_05");	//Путь исцеления или путь битвы?
		Info_ClearChoices(dia_albrecht_teachpalrunes);
		Info_AddChoice(dia_albrecht_teachpalrunes,DIALOG_BACK,dia_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_albrecht_teachpalrunes,"Я выбираю путь исцеления.",dia_albrecht_teachpalrunes_heal);
		Info_AddChoice(dia_albrecht_teachpalrunes,"Я выбираю путь битвы.",dia_albrecht_teachpalrunes_combat);
	};
};

func void dia_albrecht_teachpalrunes_back()
{
	Info_ClearChoices(dia_albrecht_teachpalrunes);
};

func void b_albrecht_youarenotworthy()
{
	AI_Output(self,other,"B_Albrecht_YouAreNotWorthy_03_00");	//Ты пока недостоин получить следующее заклинание этого пути.
};

func void dia_albrecht_teachpalrunes_heal()
{
	AI_Output(other,self,"DIA_Albrecht_TEACHPalRunes_Heal_15_00");	//Я выбираю путь исцеления.
	if((PLAYER_TALENT_RUNES[SPL_PALLIGHTHEAL] == FALSE) && (MIS_READYFORCHAPTER4 == TRUE))
	{
		Info_ClearChoices(dia_albrecht_teachpalrunes);
		Info_AddChoice(dia_albrecht_teachpalrunes,DIALOG_BACK,dia_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_albrecht_teachpalrunes,b_buildlearnstring("Лечение легких ранений",COSTFORPALSPELLS),dia_albrecht_teachpalrunes_pallightheal);
	}
	else if((PLAYER_TALENT_RUNES[SPL_PALMEDIUMHEAL] == FALSE) && (KAPITEL >= 5))
	{
		Info_ClearChoices(dia_albrecht_teachpalrunes);
		Info_AddChoice(dia_albrecht_teachpalrunes,DIALOG_BACK,dia_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_albrecht_teachpalrunes,b_buildlearnstring("Лечение средних ранений",COSTFORPALSPELLS),dia_albrecht_teachpalrunes_palmediumheal);
	}
	else
	{
		b_albrecht_youarenotworthy();
	};
};

func void dia_albrecht_teachpalrunes_combat()
{
	AI_Output(other,self,"DIA_Albrecht_TEACHPalRunes_Combat_15_00");	//Я выбираю путь битвы.
	if((PLAYER_TALENT_RUNES[SPL_PALHOLYBOLT] == FALSE) && (MIS_READYFORCHAPTER4 == TRUE))
	{
		Info_ClearChoices(dia_albrecht_teachpalrunes);
		Info_AddChoice(dia_albrecht_teachpalrunes,DIALOG_BACK,dia_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_albrecht_teachpalrunes,b_buildlearnstring("Святая стрела",COSTFORPALSPELLS),dia_albrecht_teachpalrunes_palholybolt);
	}
	else if((PLAYER_TALENT_RUNES[SPL_PALREPELEVIL] == FALSE) && (KAPITEL >= 5))
	{
		Info_ClearChoices(dia_albrecht_teachpalrunes);
		Info_AddChoice(dia_albrecht_teachpalrunes,DIALOG_BACK,dia_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_albrecht_teachpalrunes,b_buildlearnstring("Изгнание зла",COSTFORPALSPELLS),dia_albrecht_teachpalrunes_palrepelevil);
	}
	else
	{
		b_albrecht_youarenotworthy();
	};
};

func int dia_albrecht_teachpalrunes_pallightheal()
{
	if(other.lp < COSTFORPALSPELLS)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(self,other,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	PLAYER_TALENT_RUNES[SPL_PALLIGHTHEAL] = TRUE;
	CreateInvItems(self,itru_pallightheal,1);
	b_giveinvitems(self,other,itru_pallightheal,1);
	other.lp = other.lp - COSTFORPALSPELLS;
	Info_ClearChoices(dia_albrecht_teachpalrunes);
	return TRUE;
};

func int dia_albrecht_teachpalrunes_palmediumheal()
{
	if(other.lp < COSTFORPALSPELLS)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(self,other,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	PLAYER_TALENT_RUNES[SPL_PALMEDIUMHEAL] = TRUE;
	CreateInvItems(self,itru_palmediumheal,1);
	b_giveinvitems(self,other,itru_palmediumheal,1);
	other.lp = other.lp - COSTFORPALSPELLS;
	return TRUE;
};

func int dia_albrecht_teachpalrunes_palholybolt()
{
	if(other.lp < COSTFORPALSPELLS)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(self,other,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	PLAYER_TALENT_RUNES[SPL_PALHOLYBOLT] = TRUE;
	CreateInvItems(self,itru_palholybolt,1);
	b_giveinvitems(self,other,itru_palholybolt,1);
	other.lp = other.lp - COSTFORPALSPELLS;
	return TRUE;
};

func int dia_albrecht_teachpalrunes_palrepelevil()
{
	if(other.lp < COSTFORPALSPELLS)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(self,other,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	PLAYER_TALENT_RUNES[SPL_PALREPELEVIL] = TRUE;
	CreateInvItems(self,itru_palrepelevil,1);
	b_giveinvitems(self,other,itru_palrepelevil,1);
	other.lp = other.lp - COSTFORPALSPELLS;
	return TRUE;
};


instance DIA_ALBRECHT_TEACH(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 101;
	condition = dia_albrecht_teach_condition;
	information = dia_albrecht_teach_info;
	permanent = TRUE;
	description = "Я хочу повысить свои магические способности.";
};


func int dia_albrecht_teach_condition()
{
	if(ALBRECHT_TEACHMANA == TRUE)
	{
		return TRUE;
	};
};

func void dia_albrecht_teach_info()
{
	AI_Output(other,self,"DIA_Albrecht_Teach_15_00");	//Я хочу повысить свои магические способности.
	Info_ClearChoices(dia_albrecht_teach);
	Info_AddChoice(dia_albrecht_teach,DIALOG_BACK,dia_albrecht_teach_back);
	Info_AddChoice(dia_albrecht_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_albrecht_teach_1);
	Info_AddChoice(dia_albrecht_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_albrecht_teach_5);
};

func void dia_albrecht_teach_back()
{
	if(other.attribute[ATR_MANA_MAX] >= 100)
	{
		AI_Output(self,other,"DIA_Albrecht_Teach_03_00");	//Если ты хочешь повысить свои магические способности еще больше, тебе придется поискать другого учителя.
	};
	Info_ClearChoices(dia_albrecht_teach);
};

func void dia_albrecht_teach_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,100);
	Info_ClearChoices(dia_albrecht_teach);
	Info_AddChoice(dia_albrecht_teach,DIALOG_BACK,dia_albrecht_teach_back);
	Info_AddChoice(dia_albrecht_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_albrecht_teach_1);
	Info_AddChoice(dia_albrecht_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_albrecht_teach_5);
};

func void dia_albrecht_teach_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,100);
	Info_ClearChoices(dia_albrecht_teach);
	Info_AddChoice(dia_albrecht_teach,DIALOG_BACK,dia_albrecht_teach_back);
	Info_AddChoice(dia_albrecht_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_albrecht_teach_1);
	Info_AddChoice(dia_albrecht_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_albrecht_teach_5);
};


instance DIA_ALBRECHT_PICKPOCKET(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 900;
	condition = dia_albrecht_pickpocket_condition;
	information = dia_albrecht_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_albrecht_pickpocket_condition()
{
	return c_beklauen(41,160);
};

func void dia_albrecht_pickpocket_info()
{
	Info_ClearChoices(dia_albrecht_pickpocket);
	Info_AddChoice(dia_albrecht_pickpocket,DIALOG_BACK,dia_albrecht_pickpocket_back);
	Info_AddChoice(dia_albrecht_pickpocket,DIALOG_PICKPOCKET,dia_albrecht_pickpocket_doit);
};

func void dia_albrecht_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_albrecht_pickpocket);
};

func void dia_albrecht_pickpocket_back()
{
	Info_ClearChoices(dia_albrecht_pickpocket);
};

