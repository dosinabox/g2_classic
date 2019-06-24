
instance DIA_TALBIN_NW_EXIT(C_INFO)
{
	npc = vlk_4132_talbin_nw;
	nr = 999;
	condition = dia_talbin_exit_condition;
	information = dia_talbin_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_nw_exit_condition()
{
	return TRUE;
};

func void dia_talbin_nw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_NW(C_INFO)
{
	npc = vlk_4132_talbin_nw;
	nr = 15;
	condition = dia_talbin_nw_condition;
	information = dia_talbin_nw_info;
	description = "Этот Проход был не таким уж и страшным, правда?";
};


func int dia_talbin_nw_condition()
{
	return TRUE;
};

func void dia_talbin_nw_info()
{
	AI_Output(other,self,"DIA_Talbin_NW_15_00");	//Этот Проход был не таким уж и страшным, правда?
	AI_Output(self,other,"DIA_Talbin_NW_07_01");	//Спасибо, что спас меня.
	AI_Output(self,other,"DIA_Talbin_NW_07_02");	//Вот. Я нашел этот камень в Проходе. Я думаю, он пригодится тебе.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Talbin_NW_07_03");	//Мне кажется, это рунный камень.
		CreateInvItems(self,itmi_runeblank,1);
		b_giveinvitems(self,other,itmi_runeblank,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Talbin_NW_07_04");	//Мне кажется, это кусок руды.
		CreateInvItems(self,itmi_nugget,1);
		b_giveinvitems(self,other,itmi_nugget,1);
	};
	AI_Output(self,other,"DIA_Talbin_NW_07_05");	//Да защитит тебя Иннос.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Farm");
	TOPIC_END_TALBIN_RUNS = TRUE;
	b_giveplayerxp(XP_SAVEDTALBIN);
};


instance DIA_TALBIN_NW_PERM(C_INFO)
{
	npc = vlk_4132_talbin_nw;
	nr = 15;
	condition = dia_talbin_nw_perm_condition;
	information = dia_talbin_nw_perm_info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int dia_talbin_nw_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_nw))
	{
		return TRUE;
	};
};

func void dia_talbin_nw_perm_info()
{
	AI_Output(other,self,"DIA_Talbin_NW_PERM_15_00");	//Все в порядке?
	AI_Output(self,other,"DIA_Talbin_NW_PERM_07_01");	//Да, спасибо тебе. А теперь иди. Со мной будет все в порядке.
	AI_StopProcessInfos(self);
};

