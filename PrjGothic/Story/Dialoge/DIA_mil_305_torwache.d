
instance DIA_MIL_305_TORWACHE_EXIT(C_INFO)
{
	npc = mil_305_torwache;
	nr = 999;
	condition = dia_mil_305_torwache_exit_condition;
	information = dia_mil_305_torwache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_305_torwache_exit_condition()
{
	return TRUE;
};

func void dia_mil_305_torwache_exit_info()
{
	AI_StopProcessInfos(self);
};


const string MIL_305_CHECKPOINT = "NW_CITY_UPTOWN_PATH_02";

instance DIA_MIL_305_TORWACHE_FIRSTWARN(C_INFO)
{
	npc = mil_305_torwache;
	nr = 1;
	condition = dia_mil_305_torwache_firstwarn_condition;
	information = dia_mil_305_torwache_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_305_torwache_firstwarn_condition()
{
	if(Npc_GetDistToWP(other,MIL_305_CHECKPOINT) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((b_getgreatestpetzcrime(self) >= CRIME_ATTACK) && (MIL_305_SCHONMALREINGELASSEN == TRUE))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(MIL_305_SCHONMALREINGELASSEN == TRUE)
	{
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_firstwarn_info()
{
	AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_00");	//СТОЙ!
	if(b_getgreatestpetzcrime(self) >= CRIME_ATTACK)
	{
		if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_01");	//Тебя подозревают в убийстве в городе! Пока обвинения не сняты, я не могу пропустить тебя в верхний квартал.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_02");	//Пока ты обвиняешься в воровстве, ты не можешь войти в верхний квартал города!
		};
		if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_03");	//Я не могу пропустить в верхний квартал города нарушителя спокойствия вроде тебя.
		};
		AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_04");	//Иди к лорду Андрэ и урегулируй эту проблему!
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_05");	//Только граждане города и служащие королевских войск могут входить в верхний квартал города!
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,MIL_305_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
};


instance DIA_MIL_305_TORWACHE_SECONDWARN(C_INFO)
{
	npc = mil_305_torwache;
	nr = 2;
	condition = dia_mil_305_torwache_secondwarn_condition;
	information = dia_mil_305_torwache_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_305_torwache_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,MIL_305_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_secondwarn_info()
{
	AI_Output(self,other,"DIA_Mil_305_Torwache_SecondWarn_03_00");	//Я последний раз предупреждаю тебя. Еще один шаг - и ты познакомишься с моим мечом.
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,MIL_305_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_MIL_305_TORWACHE_ATTACK(C_INFO)
{
	npc = mil_305_torwache;
	nr = 3;
	condition = dia_mil_305_torwache_attack_condition;
	information = dia_mil_305_torwache_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_305_torwache_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,MIL_305_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_Output(self,other,"DIA_Mil_305_Torwache_Attack_03_00");	//Ты сам напросился...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,0);
};


instance DIA_MIL_305_TORWACHE_MESSAGE(C_INFO)
{
	npc = mil_305_torwache;
	nr = 1;
	condition = dia_mil_305_torwache_message_condition;
	information = dia_mil_305_torwache_message_info;
	permanent = FALSE;
	description = "У меня важное сообщение для лорда Хагена.";
};


func int dia_mil_305_torwache_message_condition()
{
	if((PLAYER_KNOWSLORDHAGEN == TRUE) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_message_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_MESSAGE_15_00");	//У меня важное сообщение для лорда Хагена.
	AI_Output(self,other,"DIA_Mil_305_Torwache_MESSAGE_03_01");	//Половина города хочет поговорить с лордом Хагеном по важному вопросу.
	AI_Output(self,other,"DIA_Mil_305_Torwache_MESSAGE_03_02");	//Если я буду пропускать каждого просителя, он только и будет что заниматься мелкими проблемами горожан.
};


instance DIA_MIL_305_TORWACHE_AUSNAHME(C_INFO)
{
	npc = mil_305_torwache;
	nr = 2;
	condition = dia_mil_305_torwache_ausnahme_condition;
	information = dia_mil_305_torwache_ausnahme_info;
	permanent = TRUE;
	description = "А может сделать для меня исключение?";
};


func int dia_mil_305_torwache_ausnahme_condition()
{
	if(MIL_305_SCHONMALREINGELASSEN == FALSE)
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_ausnahme_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_Ausnahme_15_00");	//А может сделать для меня исключение?
	AI_Output(self,other,"DIA_Mil_305_Torwache_Ausnahme_03_01");	//Что?! Правила есть правила! Правила применимы ко всем без исключения!
	AI_Output(self,other,"DIA_Mil_305_Torwache_Ausnahme_03_02");	//Если я позволю тебе нарушить эти правила, это будет нечестно по отношению к тем, кто выполняет их.
};


instance DIA_MIL_305_TORWACHE_PASSASCITIZEN(C_INFO)
{
	npc = mil_305_torwache;
	nr = 2;
	condition = dia_mil_305_torwache_passascitizen_condition;
	information = dia_mil_305_torwache_passascitizen_info;
	permanent = TRUE;
	description = "Я уважаемый гражданин Хориниса! Позволь мне пройти!";
};


func int dia_mil_305_torwache_passascitizen_condition()
{
	if((MIL_305_SCHONMALREINGELASSEN == FALSE) && (KAPITEL <= 1))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_passascitizen_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsCitizen_15_00");	//Я уважаемый гражданин Хориниса! Позволь мне пройти!
	if(PLAYER_ISAPPRENTICE > APP_NONE)
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_01");	//Я не знаю, что заставило мастеров Хориниса принять тебя в ученики - и не хочу знать.
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_02");	//Ты можешь войти! Но веди себя как положено! Если не хочешь нарваться на серьезные неприятности!
		self.aivar[AIV_PASSGATE] = TRUE;
		MIL_305_SCHONMALREINGELASSEN = TRUE;
		b_checklog();
		AI_StopProcessInfos(self);
	}
	else if((MIS_MATTEO_GOLD == LOG_SUCCESS) || (MIS_THORBEN_GETBLESSINGS == LOG_SUCCESS) || (MIS_BOSPER_BOGEN == LOG_SUCCESS) || (MIS_BOSPER_WOLFFURS == LOG_SUCCESS) || (MIS_HARAD_ORC == LOG_SUCCESS) || (MIS_HAKONBANDITS == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_03");	//Возможно, тебе удалось договориться с некоторыми мастерами в нижней части города, но если бы ты был гражданином, я бы знал об этом!
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_04");	//Не пытайся обмануть меня! Я предупреждаю тебя!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_05");	//Ты не стоишь грязи под моими ногтями! Прочь с глаз моих!
		AI_StopProcessInfos(self);
	};
};


instance DIA_MIL_305_TORWACHE_PASSASMIL(C_INFO)
{
	npc = mil_305_torwache;
	nr = 3;
	condition = dia_mil_305_torwache_passasmil_condition;
	information = dia_mil_305_torwache_passasmil_info;
	permanent = TRUE;
	description = "Я состою в ополчении - дай мне пройти!";
};


func int dia_mil_305_torwache_passasmil_condition()
{
	if((other.guild == GIL_MIL) && (MIL_305_SCHONMALREINGELASSEN == FALSE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_passasmil_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsMil_15_00");	//Я состою в ополчении - дай мне пройти!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsMil_03_01");	//Так Андрэ принял тебя? Возможно, ты не такой уж плохой парень, как кажешься!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsMil_03_02");	//Теперь ты один из защитников города! Так что постарайся быть вежливым и дружелюбным с горожанами!
	self.aivar[AIV_PASSGATE] = TRUE;
	MIL_305_SCHONMALREINGELASSEN = TRUE;
	b_checklog();
	AI_StopProcessInfos(self);
};


instance DIA_MIL_305_TORWACHE_PASSASMAGE(C_INFO)
{
	npc = mil_305_torwache;
	nr = 3;
	condition = dia_mil_305_torwache_passasmage_condition;
	information = dia_mil_305_torwache_passasmage_info;
	permanent = TRUE;
	description = "Ты смеешь стоять на пути представителя Инноса?";
};


func int dia_mil_305_torwache_passasmage_condition()
{
	if((other.guild == GIL_KDF) && (MIL_305_SCHONMALREINGELASSEN == FALSE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_passasmage_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsMage_15_00");	//Ты смеешь стоять на пути представителя Инноса?
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsMage_03_01");	//Ээээ... нет! Конечно, нет! Для избранных Инноса вход открыт!
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsMage_15_02");	//Молись, чтобы Иннос простил тебе это кощунство!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsMage_03_03");	//Да, о, избранный!
	self.aivar[AIV_PASSGATE] = TRUE;
	MIL_305_SCHONMALREINGELASSEN = TRUE;
	b_checklog();
	AI_StopProcessInfos(self);
};


instance DIA_MIL_305_TORWACHE_PASSASSLD(C_INFO)
{
	npc = mil_305_torwache;
	nr = 3;
	condition = dia_mil_305_torwache_passassld_condition;
	information = dia_mil_305_torwache_passassld_info;
	permanent = TRUE;
	description = "У меня важное сообщение для лорда Хагена!";
};


func int dia_mil_305_torwache_passassld_condition()
{
	if((other.guild == GIL_SLD) && (MIL_305_SCHONMALREINGELASSEN == FALSE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_passassld_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsSld_15_00");	//У меня важное сообщение для лорда Хагена!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsSld_03_01");	//Ты один из этих подонков наемников! Что тебе нужно от лорда Хагена?
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsSld_15_02");	//Я пришел с предложением мира.
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsSld_03_03");	//Ах! Значит, наконец, до вас, подлецов, дошел голос разума. Тогда проходи к лорду Хагену, но постарайся быть милым и вежливым, или я так отделаю тебя, что мало не покажется!
	self.aivar[AIV_PASSGATE] = TRUE;
	MIL_305_SCHONMALREINGELASSEN = TRUE;
	b_checklog();
	AI_StopProcessInfos(self);
};


instance DIA_MIL_305_TORWACHE_PERM(C_INFO)
{
	npc = mil_305_torwache;
	nr = 1;
	condition = dia_mil_305_torwache_perm_condition;
	information = dia_mil_305_torwache_perm_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int dia_mil_305_torwache_perm_condition()
{
	if((MIL_305_SCHONMALREINGELASSEN == TRUE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_perm_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PERM_15_00");	//Как дела?
	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_01");	//Все хорошо, друг!
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_02");	//Мы просто выполняем свою работу. Спасибо, что обратил на меня свое внимание, о, избранный!
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_03");	//Возможно, мне придется пропустить тебя, но я не хочу разговаривать с тобой!
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_04");	//Что тебе нужно?
	};
	AI_StopProcessInfos(self);
};

