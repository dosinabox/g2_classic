
instance DIA_HAUPTTORWACHE_EXIT(C_INFO)
{
	npc = vlk_4143_haupttorwache;
	nr = 999;
	condition = dia_haupttorwache_exit_condition;
	information = dia_haupttorwache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_haupttorwache_exit_condition()
{
	return TRUE;
};

func void dia_haupttorwache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HAUPTTORWACHE_AUFGABE(C_INFO)
{
	npc = vlk_4143_haupttorwache;
	nr = 4;
	condition = dia_haupttorwache_aufgabe_condition;
	information = dia_haupttorwache_aufgabe_info;
	permanent = TRUE;
	description = "Чем ты занимаешься здесь?";
};


func int dia_haupttorwache_aufgabe_condition()
{
	return TRUE;
};

func void dia_haupttorwache_aufgabe_info()
{
	AI_Output(other,self,"DIA_Haupttorwache_AUFGABE_15_00");	//Чем ты занимаешься здесь?
	AI_Output(self,other,"DIA_Haupttorwache_AUFGABE_13_01");	//Моя задача проста. Я должен следить, чтобы орки не приближались ближе, чем на 30 футов к воротам.
	AI_Output(self,other,"DIA_Haupttorwache_AUFGABE_13_02");	//Если ты попытаешься поднять решетку, я подниму тревогу. Вот и все.
};


instance DIA_HAUPTTORWACHE_TOROEFFNEN(C_INFO)
{
	npc = vlk_4143_haupttorwache;
	nr = 5;
	condition = dia_haupttorwache_toroeffnen_condition;
	information = dia_haupttorwache_toroeffnen_info;
	permanent = TRUE;
	description = "Что нужно сделать, чтобы открыть главные ворота?";
};


func int dia_haupttorwache_toroeffnen_condition()
{
	if(KAPITEL >= 5)
	{
		return TRUE;
	};
};

func void dia_haupttorwache_toroeffnen_info()
{
	AI_Output(other,self,"DIA_Haupttorwache_TOROEFFNEN_15_00");	//Что нужно сделать, чтобы открыть главные ворота?
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_13_01");	//Ради всего святого! Зачем тебе знать это?
	self.flags = 0;
	Info_ClearChoices(dia_haupttorwache_toroeffnen);
	Info_AddChoice(dia_haupttorwache_toroeffnen,"Я беспокоюсь о безопасности замка.",dia_haupttorwache_toroeffnen_sicherheit);
	Info_AddChoice(dia_haupttorwache_toroeffnen,"Да я просто так спросил.",dia_haupttorwache_toroeffnen_frage);
};

func void dia_haupttorwache_toroeffnen_sicherheit()
{
	AI_Output(other,self,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_15_00");	//Я беспокоюсь о безопасности замка.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_01");	//Я тоже, поверь мне.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_02");	//Я очень добросовестный стражник, и Гаронд даже доверил мне ключ от привратницкой.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_03");	//(гордо) Это большая ответственность. Я буду бережно хранить его. Я поклялся в этом Гаронду.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_04");	//Да. Только представь, что кто-нибудь придет и поднимет рычаг, чтобы открыть ворота, а эту ржавую старую решетку вдруг заклинит.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_05");	//Никто тогда не сможет закрыть эти ворота. Мне даже думать не хочется, что произойдет дальше. Хорошо, что никто не знает, что у меня есть ключ.
	AI_StopProcessInfos(self);
};

func void dia_haupttorwache_toroeffnen_frage()
{
	AI_Output(other,self,"DIA_Haupttorwache_TOROEFFNEN_frage_15_00");	//Да я просто так спросил.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_frage_13_01");	//В следующий раз думай, что спрашиваешь. У тебя могут быть большие проблемы из-за этого. Сам знаешь, какие сейчас времена. А теперь уходи. Я занят.
	AI_StopProcessInfos(self);
};


instance DIA_HAUPTTORWACHE_PICKPOCKET(C_INFO)
{
	npc = vlk_4143_haupttorwache;
	nr = 900;
	condition = dia_haupttorwache_pickpocket_condition;
	information = dia_haupttorwache_pickpocket_info;
	permanent = TRUE;
	description = "(украсть этот ключ легче легкого)";
};


func int dia_haupttorwache_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_oc_maingate_mis) >= 1) && (KAPITEL >= 5) && (other.attribute[ATR_DEXTERITY] >= (20 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_haupttorwache_pickpocket_info()
{
	Info_ClearChoices(dia_haupttorwache_pickpocket);
	Info_AddChoice(dia_haupttorwache_pickpocket,DIALOG_BACK,dia_haupttorwache_pickpocket_back);
	Info_AddChoice(dia_haupttorwache_pickpocket,DIALOG_PICKPOCKET,dia_haupttorwache_pickpocket_doit);
};

func void dia_haupttorwache_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 20)
	{
		b_giveinvitems(self,other,itke_oc_maingate_mis,1);
		b_givethiefxp();
		Info_ClearChoices(dia_haupttorwache_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_haupttorwache_pickpocket_back()
{
	Info_ClearChoices(dia_haupttorwache_pickpocket);
};

