
instance DIA_LEHMAR_EXIT(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 999;
	condition = dia_lehmar_exit_condition;
	information = dia_lehmar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lehmar_exit_condition()
{
	return TRUE;
};

func void dia_lehmar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEHMAR_ENTSCHULDIGUNG(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 2;
	condition = dia_lehmar_entschuldigung_condition;
	information = dia_lehmar_entschuldigung_info;
	permanent = FALSE;
	description = "Как дела?";
};


func int dia_lehmar_entschuldigung_condition()
{
	return TRUE;
};

func void dia_lehmar_entschuldigung_info()
{
	AI_Output(other,self,"DIA_Lehmar_ENTSCHULDIGUNG_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Lehmar_ENTSCHULDIGUNG_09_01");	//(скучая) Сколько ты хочешь?
	AI_Output(other,self,"DIA_Lehmar_ENTSCHULDIGUNG_15_02");	//Что значит 'сколько'?
	AI_Output(self,other,"DIA_Lehmar_ENTSCHULDIGUNG_09_03");	//Я ростовщик и ты пришел ко мне. Что тебе еще может быть нужно от меня? Деньги, конечно.
};


instance DIA_LEHMAR_GELDLEIHEN(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 3;
	condition = dia_lehmar_geldleihen_condition;
	information = dia_lehmar_geldleihen_info;
	permanent = TRUE;
	description = "Одолжи мне денег!";
};


var int dia_lehmar_geldleihen_noperm;

func int dia_lehmar_geldleihen_condition()
{
	if(Npc_KnowsInfo(other,dia_lehmar_entschuldigung) && (DIA_LEHMAR_GELDLEIHEN_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_lehmar_geldleihen_info()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_15_00");	//Одолжи мне денег!
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_09_01");	//Конечно! Сколько ты хочешь? Я беру 20 процентов!
	Info_ClearChoices(dia_lehmar_geldleihen);
	Info_AddChoice(dia_lehmar_geldleihen,"Я подумаю над этим.",dia_lehmar_geldleihen_back);
	Info_AddChoice(dia_lehmar_geldleihen,"1000 золотых.",dia_lehmar_geldleihen_1000);
	Info_AddChoice(dia_lehmar_geldleihen," 200 золотых.",dia_lehmar_geldleihen_200);
	Info_AddChoice(dia_lehmar_geldleihen,"  50 золотых.",dia_lehmar_geldleihen_50);
};

func void dia_lehmar_geldleihen_back()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_back_15_00");	//Я подумаю над этим.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_back_09_01");	//Думай же быстрее! Не трать мое время попусту!
	AI_StopProcessInfos(self);
};

func void dia_lehmar_geldleihen_50()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_50_15_00");	//50 золотых.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_50_09_01");	//Мелочь, да? Я хочу, чтобы ты вернул их завтра, понятно?
	CreateInvItems(self,itmi_gold,50);
	b_giveinvitems(self,other,itmi_gold,50);
	DIA_LEHMAR_GELDLEIHEN_NOPERM = TRUE;
	LEHMAR_GELDGELIEHEN_DAY = Wld_GetDay();
	LEHMAR_GELDGELIEHEN = 50;
	Info_ClearChoices(dia_lehmar_geldleihen);
};

func void dia_lehmar_geldleihen_200()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_200_15_00");	//200 золотых.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_200_09_01");	//Это большая сумма денег. Я хочу видеть тебя завтра, и деньги тоже, понятно?
	CreateInvItems(self,itmi_gold,200);
	b_giveinvitems(self,other,itmi_gold,200);
	DIA_LEHMAR_GELDLEIHEN_NOPERM = TRUE;
	LEHMAR_GELDGELIEHEN_DAY = Wld_GetDay();
	LEHMAR_GELDGELIEHEN = 200;
	Info_ClearChoices(dia_lehmar_geldleihen);
};

func void dia_lehmar_geldleihen_1000()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_1000_15_00");	//1000 золотых.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_1000_09_01");	//У тебя с головой все в порядке?
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_1000_09_02");	//Я дам тебе 100. И не забудь вернуть их завтра!
	CreateInvItems(self,itmi_gold,100);
	b_giveinvitems(self,other,itmi_gold,100);
	DIA_LEHMAR_GELDLEIHEN_NOPERM = TRUE;
	LEHMAR_GELDGELIEHEN_DAY = Wld_GetDay();
	LEHMAR_GELDGELIEHEN = 100;
	Info_ClearChoices(dia_lehmar_geldleihen);
};


instance DIA_LEHMAR_WARUMGELD(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 3;
	condition = dia_lehmar_warumgeld_condition;
	information = dia_lehmar_warumgeld_info;
	permanent = FALSE;
	description = "Ты всегда так легко раздаешь деньги?";
};


func int dia_lehmar_warumgeld_condition()
{
	if(LEHMAR_GELDGELIEHEN != 0)
	{
		return TRUE;
	};
};

func void dia_lehmar_warumgeld_info()
{
	AI_Output(other,self,"DIA_Lehmar_WARUMGELD_15_00");	//Ты всегда так легко раздаешь деньги?
	AI_Output(self,other,"DIA_Lehmar_WARUMGELD_09_01");	//Не волнуйся. Ты вернешься. Или я найду тебя и убью. Все просто.
	AI_Output(self,other,"DIA_Lehmar_WARUMGELD_09_02");	//У тебя такая запоминающаяся внешность, что мне не составит труда найти тебя.
	AI_Output(self,other,"DIA_Lehmar_WARUMGELD_09_03");	//Так что даже не думай обмануть меня.
};


instance DIA_LEHMAR_GELDEINTREIBEN(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 5;
	condition = dia_lehmar_geldeintreiben_condition;
	information = dia_lehmar_geldeintreiben_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lehmar_geldeintreiben_condition()
{
	if((LEHMAR_GELDGELIEHEN_DAY <= (Wld_GetDay() - 2)) && (LEHMAR_GELDGELIEHEN != 0))
	{
		return TRUE;
	};
};

func void dia_lehmar_geldeintreiben_info()
{
	AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_09_00");	//Ты не вернул долг, ублюдок! Верни мне мои деньги! А так как мне пришлось напоминать тебе об этом, процент возрастает.
	AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_09_01");	//Теперь это обойдется тебе в 30 процентов вместо обычных 20.
	Info_AddChoice(dia_lehmar_geldeintreiben,"Я верну свой долг.",dia_lehmar_geldeintreiben_schuldenzahlen);
	Info_AddChoice(dia_lehmar_geldeintreiben,"Я ничего тебе не дам.",dia_lehmar_geldeintreiben_kannstmich);
};

func void dia_lehmar_geldeintreiben_kannstmich()
{
	AI_Output(other,self,"DIA_Lehmar_GELDEINTREIBEN_kannstmich_15_00");	//Я ничего тебе не дам.
	AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_kannstmich_09_01");	//Ох, нет, дашь!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_lehmar_geldeintreiben_schuldenzahlen()
{
	AI_Output(other,self,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_15_00");	//Я верну свой долг.
	if(LEHMAR_GELDGELIEHEN == 50)
	{
		LEHMAR_GELDGELIEHEN_MITZINSEN = 65;
	};
	if(LEHMAR_GELDGELIEHEN == 200)
	{
		LEHMAR_GELDGELIEHEN_MITZINSEN = 260;
	};
	if(LEHMAR_GELDGELIEHEN == 100)
	{
		LEHMAR_GELDGELIEHEN_MITZINSEN = 130;
	};
	IntToFloat(LEHMAR_GELDGELIEHEN_MITZINSEN);
	if(Npc_HasItems(other,itmi_gold) >= LEHMAR_GELDGELIEHEN_MITZINSEN)
	{
		b_giveinvitems(other,self,itmi_gold,LEHMAR_GELDGELIEHEN_MITZINSEN);
		AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_01");	//Тебе повезло! А теперь проваливай!
		LEHMAR_GELDGELIEHEN = 0;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_02");	//У тебя с собой нет столько денег! Ладно. Похоже, мне придется преподать тебе урок.
		AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_03");	//Ничего личного - мне просто нужно поддерживать свою репутацию.
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	};
};


instance DIA_LEHMAR_GELDZURUECK(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 6;
	condition = dia_lehmar_geldzurueck_condition;
	information = dia_lehmar_geldzurueck_info;
	permanent = TRUE;
	description = "Вот твои деньги!";
};


func int dia_lehmar_geldzurueck_condition()
{
	if(!Npc_KnowsInfo(other,dia_lehmar_geldeintreiben) && (LEHMAR_GELDGELIEHEN != 0))
	{
		return TRUE;
	};
};

func void dia_lehmar_geldzurueck_info()
{
	AI_Output(other,self,"DIA_Lehmar_GELDZURUECK_15_00");	//Вот твои деньги!
	if(LEHMAR_GELDGELIEHEN == 50)
	{
		LEHMAR_GELDGELIEHEN_MITZINSEN = 60;
	};
	if(LEHMAR_GELDGELIEHEN == 200)
	{
		LEHMAR_GELDGELIEHEN_MITZINSEN = 240;
	};
	if(LEHMAR_GELDGELIEHEN == 100)
	{
		LEHMAR_GELDGELIEHEN_MITZINSEN = 120;
	};
	IntToFloat(LEHMAR_GELDGELIEHEN_MITZINSEN);
	if(Npc_HasItems(other,itmi_gold) >= LEHMAR_GELDGELIEHEN_MITZINSEN)
	{
		b_giveinvitems(other,self,itmi_gold,LEHMAR_GELDGELIEHEN_MITZINSEN);
		AI_Output(self,other,"DIA_Lehmar_GELDZURUECK_09_01");	//Превосходно! Приятно иметь с тобой дело.
		LEHMAR_GELDGELIEHEN = 0;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Lehmar_GELDZURUECK_09_02");	//Здесь недостаточно! Возвращайся, когда у тебя будет вся сумма. У тебя еще есть время. Помни, 20 процентов!
		AI_StopProcessInfos(self);
	};
};


instance DIA_LEHMAR_NOCHMALGELD(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 8;
	condition = dia_lehmar_nochmalgeld_condition;
	information = dia_lehmar_nochmalgeld_info;
	permanent = TRUE;
	description = "Могу я занять у тебя денег?";
};


func int dia_lehmar_nochmalgeld_condition()
{
	if((LEHMAR_GELDGELIEHEN == 0) && (LEHMAR_GELDGELIEHEN_MITZINSEN != 0))
	{
		return TRUE;
	};
};

func void dia_lehmar_nochmalgeld_info()
{
	AI_Output(other,self,"DIA_Lehmar_NOCHMALGELD_15_00");	//Могу я занять у тебя денег?
	if(Npc_KnowsInfo(other,dia_lehmar_geldeintreiben) || Npc_KnowsInfo(other,dia_lehmar_buchweg))
	{
		AI_Output(self,other,"DIA_Lehmar_NOCHMALGELD_09_01");	//Ты думаешь, я идиот? Проваливай!
	}
	else
	{
		AI_Output(self,other,"DIA_Lehmar_NOCHMALGELD_09_02");	//Больше не можешь! Я понес большие издержки и теперь у меня на счету каждый цент.
		AI_Output(self,other,"DIA_Lehmar_NOCHMALGELD_09_03");	//Заходи через несколько дней!
	};
};


instance DIA_LEHMAR_PICKPOCKET(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 900;
	condition = dia_lehmar_pickpocket_condition;
	information = dia_lehmar_pickpocket_info;
	permanent = TRUE;
	description = "(украсть его книгу будет легче легкого)";
};


func int dia_lehmar_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itwr_schuldenbuch) >= 1) && (other.attribute[ATR_DEXTERITY] >= (20 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_lehmar_pickpocket_info()
{
	Info_ClearChoices(dia_lehmar_pickpocket);
	Info_AddChoice(dia_lehmar_pickpocket,DIALOG_BACK,dia_lehmar_pickpocket_back);
	Info_AddChoice(dia_lehmar_pickpocket,DIALOG_PICKPOCKET,dia_lehmar_pickpocket_doit);
};

func void dia_lehmar_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 20)
	{
		b_giveinvitems(self,other,itwr_schuldenbuch,1);
		b_givethiefxp();
		Info_ClearChoices(dia_lehmar_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_lehmar_pickpocket_back()
{
	Info_ClearChoices(dia_canthar_pickpocket);
};


instance DIA_LEHMAR_BUCHWEG(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 1;
	condition = dia_lehmar_buchweg_condition;
	information = dia_lehmar_buchweg_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lehmar_buchweg_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == TRUE))
	{
		return TRUE;
	};
};

func void dia_lehmar_buchweg_info()
{
	AI_Output(self,other,"DIA_Lehmar_Add_09_00");	//(с сожалением) Какой-то гнусный вор украл мой гроссбух...
	AI_Output(self,other,"DIA_Lehmar_Add_09_01");	//Ты случайно не имеешь к этому отношения, нет?
	AI_Output(self,other,"DIA_Addon_Lehmar_Add_15_02");	//(ухмыляется) Я? Нет.
	AI_Output(self,other,"DIA_Lehmar_Add_09_03");	//Да-да, хорошо. Уходи отсюда...
	AI_StopProcessInfos(self);
};

