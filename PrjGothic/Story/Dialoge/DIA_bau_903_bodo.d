
instance DIA_BODO_EXIT(C_INFO)
{
	npc = bau_903_bodo;
	nr = 999;
	condition = dia_bodo_exit_condition;
	information = dia_bodo_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bodo_exit_condition()
{
	return TRUE;
};

func void dia_bodo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BODO_HALLO(C_INFO)
{
	npc = bau_903_bodo;
	nr = 1;
	condition = dia_bodo_hallo_condition;
	information = dia_bodo_hallo_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int dia_bodo_hallo_condition()
{
	return TRUE;
};

func void dia_bodo_hallo_info()
{
	AI_Output(other,self,"DIA_Bodo_Hallo_15_00");	//Как дела?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_01");	//Ополчение достаточно попило нашей крови. Теперь, когда на нашей стороне наемники, они не осмелятся даже показаться здесь.
		AI_Output(self,other,"DIA_Bodo_Hallo_12_02");	//Король, вероятно, думает, что может позволить себе все. Но мы больше не будем терпеть это!
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_03");	//Хорошо. Если увидишь ополчение, задай им хорошую трепку.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_04");	//Хорошо. Да пребудет с тобой Иннос.
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_05");	//Королевских солдат не любят на этой ферме.
		AI_Output(self,other,"DIA_Bodo_Hallo_12_06");	//Многие здесь, возможно не откажутся поговорить с тобой, но популярность себе ты вряд ли завоюешь.
	};
};


instance DIA_BODO_BAUERNAUFSTAND(C_INFO)
{
	npc = bau_903_bodo;
	nr = 2;
	condition = dia_bodo_bauernaufstand_condition;
	information = dia_bodo_bauernaufstand_info;
	permanent = FALSE;
	description = "В городе говорят о восстании фермеров!";
};


func int dia_bodo_bauernaufstand_condition()
{
	return TRUE;
};

func void dia_bodo_bauernaufstand_info()
{
	AI_Output(other,self,"DIA_Bodo_Bauernaufstand_15_00");	//В городе говорят о восстании фермеров!
	AI_Output(self,other,"DIA_Bodo_Bauernaufstand_12_01");	//Чушь. Мы не делаем ничего такого. Только защищаем то, что заработали тяжелым трудом.
	AI_Output(self,other,"DIA_Bodo_Bauernaufstand_12_02");	//Воистину правда, что войны выигрываются на спинах крестьян. Но Онар больше не собирается просто стоять и смотреть, как король пьет нашу кровь.
};


instance DIA_BODO_BETT(C_INFO)
{
	npc = bau_903_bodo;
	nr = 3;
	condition = dia_bodo_bett_condition;
	information = dia_bodo_bett_info;
	permanent = FALSE;
	description = "Могу я где-нибудь здесь отдохнуть?";
};


func int dia_bodo_bett_condition()
{
	return TRUE;
};

func void dia_bodo_bett_info()
{
	AI_Output(other,self,"DIA_Bodo_Bett_15_00");	//Могу я где-нибудь здесь отдохнуть?
	AI_Output(self,other,"DIA_Bodo_Bett_12_01");	//Если ты ищешь, где можно поспать, иди в сарай. Но только не приляг по ошибке на кровать наемника.
	AI_Output(self,other,"DIA_Bodo_Bett_12_02");	//Онар следит, чтобы они не трогали нас, фермеров, но это не касается чужаков, не работающих на ферме. С ними наемники могут делать все, что пожелают.
};


instance DIA_BODO_CIPHER(C_INFO)
{
	npc = bau_903_bodo;
	nr = 4;
	condition = dia_bodo_cipher_condition;
	information = dia_bodo_cipher_info;
	permanent = FALSE;
	description = "Сифер сказал мне, что кто-то украл у него тюк болотной травы...";
};


func int dia_bodo_cipher_condition()
{
	if((MIS_CIPHER_BRINGWEED == LOG_RUNNING) || (MIS_CIPHER_PAKET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_bodo_cipher_info()
{
	AI_Output(other,self,"DIA_Bodo_Cipher_15_00");	//Сифер сказал мне, что кто-то украл у него тюк болотной травы...
	AI_Output(self,other,"DIA_Bodo_Cipher_12_01");	//И?
	AI_Output(other,self,"DIA_Bodo_Cipher_15_02");	//Он думает, что это сделал ты.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_03");	//Ох, ВОТ почему этот парень все время так пялится на меня.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_04");	//Я стараюсь быть с ним максимально дружелюбным последнее время, потому что, похоже, ему вожжа попала под хвост.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_05");	//Но я ничего не могу поделать. Я стараюсь улыбаться ему, а ан в ответ смотрит так, как будто хочет убить меня.
};


instance DIA_BODO_WEEDORELSE(C_INFO)
{
	npc = bau_903_bodo;
	nr = 5;
	condition = dia_bodo_weedorelse_condition;
	information = dia_bodo_weedorelse_info;
	permanent = FALSE;
	description = "Отдай мне эту траву или...";
};


func int dia_bodo_weedorelse_condition()
{
	if((MIS_CIPHER_BRINGWEED == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bodo_cipher))
	{
		return TRUE;
	};
};

func void dia_bodo_weedorelse_info()
{
	AI_Output(other,self,"DIA_Bodo_WeedOrElse_15_00");	//Отдай мне эту траву или...
	AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_01");	//Послушай, все, что у меня есть - это один косяк из болотной травы. Возьми его и оставь меня в покое.
	b_giveinvitems(self,other,itmi_joint,1);
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_02");	//Ты знаешь, как наемники Онара защищают нас, а?
		AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_03");	//Так что даже не пытайся сделать какую-нибудь глупость!
	};
};


instance DIA_BODO_WEEDPERM(C_INFO)
{
	npc = bau_903_bodo;
	nr = 6;
	condition = dia_bodo_weedperm_condition;
	information = dia_bodo_weedperm_info;
	permanent = TRUE;
	description = "Я не верб ни одному твоему слову. Отдай мне эту траву!";
};


func int dia_bodo_weedperm_condition()
{
	if((MIS_CIPHER_BRINGWEED == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bodo_weedorelse))
	{
		return TRUE;
	};
};

func void dia_bodo_weedperm_info()
{
	AI_Output(other,self,"DIA_Bodo_WeedPERM_15_00");	//Я не верб ни одному твоему слову. Отдай мне эту траву!
	AI_Output(self,other,"DIA_Bodo_WeedPERM_12_01");	//У меня ее нет. Честно.
};


instance DIA_BODO_PICKPOCKET(C_INFO)
{
	npc = bau_903_bodo;
	nr = 900;
	condition = dia_bodo_pickpocket_condition;
	information = dia_bodo_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_bodo_pickpocket_condition()
{
	return c_beklauen(30,60);
};

func void dia_bodo_pickpocket_info()
{
	Info_ClearChoices(dia_bodo_pickpocket);
	Info_AddChoice(dia_bodo_pickpocket,DIALOG_BACK,dia_bodo_pickpocket_back);
	Info_AddChoice(dia_bodo_pickpocket,DIALOG_PICKPOCKET,dia_bodo_pickpocket_doit);
};

func void dia_bodo_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bodo_pickpocket);
};

func void dia_bodo_pickpocket_back()
{
	Info_ClearChoices(dia_bodo_pickpocket);
};

