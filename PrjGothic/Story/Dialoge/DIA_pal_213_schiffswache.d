
instance DIA_PAL_213_SCHIFFSWACHE_EXIT(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 999;
	condition = dia_pal_213_schiffswache_exit_condition;
	information = dia_pal_213_schiffswache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_213_schiffswache_exit_condition()
{
	return TRUE;
};

func void dia_pal_213_schiffswache_exit_info()
{
	AI_StopProcessInfos(self);
};


const string PAL_213_CHECKPOINT = "SHIP_DECK_09";

instance DIA_PAL_213_SCHIFFSWACHE_FIRSTWARN(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 1;
	condition = dia_pal_213_schiffswache_firstwarn_condition;
	information = dia_pal_213_schiffswache_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_213_schiffswache_firstwarn_condition()
{
	if((MIS_SHIPISFREE == FALSE) && (self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_firstwarn_info()
{
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_FirstWarn_01_00");	//Стой! Куда это ты идешь?
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_FirstWarn_15_01");	//Я хотел...
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_FirstWarn_01_02");	//Извини. Но тебе сюда нельзя.
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_FirstWarn_01_03");	//Здесь не на что смотреть. Иди своей дорогой.
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PAL_213_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
};


instance DIA_PAL_213_SCHIFFSWACHE_SECONDWARN(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 2;
	condition = dia_pal_213_schiffswache_secondwarn_condition;
	information = dia_pal_213_schiffswache_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_213_schiffswache_secondwarn_condition()
{
	if((MIS_SHIPISFREE == FALSE) && (self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PAL_213_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_secondwarn_info()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_SecondWarn_01_00");	//Ни шагу дальше. Исключений нет ни для кого.
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_SecondWarn_01_01");	//Ты же не хочешь ЗАСТАВИТЬ меня ударить тебя, правда?
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PAL_213_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_213_SCHIFFSWACHE_ATTACK(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 3;
	condition = dia_pal_213_schiffswache_attack_condition;
	information = dia_pal_213_schiffswache_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_213_schiffswache_attack_condition()
{
	if((MIS_SHIPISFREE == FALSE) && (self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PAL_213_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,1);
};


instance DIA_PAL_213_SCHIFFSWACHE_GOONBOARD(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 5;
	condition = dia_pal_213_schiffswache_goonboard_condition;
	information = dia_pal_213_schiffswache_goonboard_info;
	permanent = FALSE;
	description = "Я хочу попасть на борт корабля.";
};


func int dia_pal_213_schiffswache_goonboard_condition()
{
	return TRUE;
};

func void dia_pal_213_schiffswache_goonboard_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_GoOnBoard_15_00");	//Я хочу попасть на борт корабля.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_01");	//Никому не позволено входить на корабль! У меня есть приказ!
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_02");	//Я должен убить всякого, кто войдет на корабль без соответствующего разрешения.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_03");	//Во имя Инноса, я буду защищать этот корабль даже ценой своей жизни.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf_condition;
	information = dia_pal_213_schiffswache_iamkdf_info;
	permanent = FALSE;
	description = "Ты сомневаешься в намерениях Мага Огня?";
};


func int dia_pal_213_schiffswache_iamkdf_condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_goonboard))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdf_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF_15_00");	//Ты сомневаешься в намерениях Мага Огня?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_01");	//(нервно) Нет, конечно же, нет. Да простит меня Иннос.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_02");	//(нервно) Маги Огня - стражи мудрости Инноса...
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_03");	//(нервно) ...тот, кто сомневается в них, сомневается в Инносе и не заслуживает пощады.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF2(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf2_condition;
	information = dia_pal_213_schiffswache_iamkdf2_info;
	permanent = FALSE;
	description = "Что будет, если я взойду на борт?";
};


func int dia_pal_213_schiffswache_iamkdf2_condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdf))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdf2_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF2_15_00");	//Что будет, если я взойду на борт?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF2_01_01");	//(нервно) Я должен убить... я хочу сказать, остановить тебя.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF3(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf3_condition;
	information = dia_pal_213_schiffswache_iamkdf3_info;
	permanent = FALSE;
	description = "Ты осмелишься атаковать Мага Огня?";
};


func int dia_pal_213_schiffswache_iamkdf3_condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdf2))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdf3_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF3_15_00");	//Ты осмелишься атаковать Мага Огня?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF3_01_01");	//(нервно) Я никогда не подниму руку на мага.
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF3_15_02");	//Так что ты все-таки будешь делать, если я взойду на борт?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF3_01_03");	//(робко) Ничего, господин.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF4(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf4_condition;
	information = dia_pal_213_schiffswache_iamkdf4_info;
	permanent = FALSE;
	description = "Тогда я сейчас взойду на борт.";
};


func int dia_pal_213_schiffswache_iamkdf4_condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdf3))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdf4_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF4_15_00");	//Тогда я сейчас взойду на борт.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF4_01_01");	//(нервно) Ты не должен делать этого, приказы лорда Хагена были вполне конкретными.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF5(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf5_condition;
	information = dia_pal_213_schiffswache_iamkdf5_info;
	permanent = FALSE;
	description = "Приказы лорда Хагена касаются и меня тоже?";
};


func int dia_pal_213_schiffswache_iamkdf5_condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdf4))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdf5_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF5_15_00");	//Приказы лорда Хагена касаются и меня тоже?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF5_01_01");	//(нервно) Я не знаю.
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF5_15_02");	//Сам подумай - разве лорд Хаген осмелился бы подозревать мага в воровстве?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF5_01_03");	//Я в это не верю.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF6(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf6_condition;
	information = dia_pal_213_schiffswache_iamkdf6_info;
	permanent = FALSE;
	description = "В последний раз: позволь мне взойти на корабль!";
};


func int dia_pal_213_schiffswache_iamkdf6_condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdf5))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdf6_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF6_15_00");	//В последний раз: позволь мне взойти на корабль!
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF6_01_01");	//(нервно) Понятно. Ты можешь взойти на корабль.
	MIS_SHIPISFREE = TRUE;
	b_startotherroutine(girion,"WaitForShip");
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMPAL(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iampal_condition;
	information = dia_pal_213_schiffswache_iampal_info;
	permanent = FALSE;
	description = "Ты не доверяешь мне, рыцарь?";
};


func int dia_pal_213_schiffswache_iampal_condition()
{
	if((hero.guild == GIL_PAL) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_goonboard))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iampal_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmPAL_15_00");	//Ты не доверяешь мне, рыцарь?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmPAL_01_01");	//Никак нет, я просто выполняю приказ.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMPAL2(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iampal2_condition;
	information = dia_pal_213_schiffswache_iampal2_info;
	permanent = FALSE;
	description = "Тогда ты должен знать, кто из нас выше званием.";
};


func int dia_pal_213_schiffswache_iampal2_condition()
{
	if((hero.guild == GIL_PAL) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iampal))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iampal2_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmPAL2_15_00");	//Тогда ты должен знать, кто из нас выше званием.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmPAL2_01_01");	//Так точно!
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMPAL3(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iampal3_condition;
	information = dia_pal_213_schiffswache_iampal3_info;
	permanent = FALSE;
	description = "Я приказываю тебе пропустить меня на этот корабль.";
};


func int dia_pal_213_schiffswache_iampal3_condition()
{
	if((hero.guild == GIL_PAL) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iampal2))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iampal3_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmPAL3_15_00");	//И я приказываю тебе пропустить меня на этот корабль.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmPAL3_01_01");	//Есть, сэр, вы можете взойти на корабль.
	MIS_SHIPISFREE = TRUE;
	b_startotherroutine(girion,"WaitForShip");
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMDJG(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamdjg_condition;
	information = dia_pal_213_schiffswache_iamdjg_info;
	permanent = FALSE;
	description = "А этот вопрос нельзя как-нибудь решить?";
};


func int dia_pal_213_schiffswache_iamdjg_condition()
{
	if((hero.guild == GIL_DJG) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_goonboard))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamdjg_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmDJG_15_00");	//А этот вопрос нельзя как-нибудь решить?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG_01_01");	//Я не понимаю.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMDJG2(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamdjg2_condition;
	information = dia_pal_213_schiffswache_iamdjg2_info;
	permanent = FALSE;
	description = "Я могу дать тебе денег.";
};


func int dia_pal_213_schiffswache_iamdjg2_condition()
{
	if((hero.guild == GIL_DJG) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamdjg))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamdjg2_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmDJG2_15_00");	//Я могу дать тебе денег. За то, что ты будешь смотреть в другую сторону.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG2_01_01");	//Меня нельзя подкупить, и если ты сейчас не исчезнешь, я сочту это оскорблением.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMDJG3(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamdjg3_condition;
	information = dia_pal_213_schiffswache_iamdjg3_info;
	permanent = FALSE;
	description = "У меня письменное разрешение.";
};


func int dia_pal_213_schiffswache_iamdjg3_condition()
{
	if((hero.guild == GIL_DJG) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamdjg) && (Npc_HasItems(other,itwr_forgedshipletter_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamdjg3_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmDJG3_15_00");	//У меня письменное разрешение. Я уполномочен взойти на этот корабль.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG3_01_01");	//Дай я взгляну.
	b_giveinvitems(other,self,itwr_forgedshipletter_mis,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG3_01_02");	//Все правильно, ты можешь пройти.
	MIS_SHIPISFREE = TRUE;
	b_startotherroutine(girion,"WaitForShip");
};

