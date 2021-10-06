
instance DIA_PECK_EXIT(C_INFO)
{
	npc = mil_324_peck;
	nr = 999;
	condition = dia_peck_exit_condition;
	information = dia_peck_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_peck_exit_condition()
{
	return TRUE;
};

func void dia_peck_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PECK_PICKPOCKET(C_INFO)
{
	npc = mil_324_peck;
	nr = 900;
	condition = dia_peck_pickpocket_condition;
	information = dia_peck_pickpocket_info;
	permanent = TRUE;
	description = "(воровать этот ключ рискованно)";
};


func int dia_peck_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_city_tower_05) >= 1) && (other.attribute[ATR_DEXTERITY] >= (60 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_peck_pickpocket_info()
{
	Info_ClearChoices(dia_peck_pickpocket);
	Info_AddChoice(dia_peck_pickpocket,DIALOG_BACK,dia_peck_pickpocket_back);
	Info_AddChoice(dia_peck_pickpocket,DIALOG_PICKPOCKET,dia_peck_pickpocket_doit);
};

func void dia_peck_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 60)
	{
		b_giveinvitems(self,other,itke_city_tower_05,1);
		b_givethiefxp();
		Info_ClearChoices(dia_peck_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_peck_pickpocket_back()
{
	Info_ClearChoices(dia_peck_pickpocket);
};


instance DIA_PECK_HEY(C_INFO)
{
	npc = mil_324_peck;
	nr = 2;
	condition = dia_peck_hey_condition;
	information = dia_peck_hey_info;
	permanent = TRUE;
	description = "Эй, ты что делаешь тут?";
};


func int dia_peck_hey_condition()
{
	if((MIS_ANDRE_PECK != LOG_RUNNING) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_PECK") <= 500))
	{
		return TRUE;
	};
};

func void dia_peck_hey_info()
{
	AI_Output(other,self,"DIA_Peck_HEY_15_00");	//Эй, ты что делаешь тут?
	AI_Output(self,other,"DIA_Peck_HEY_12_01");	//Послушай, я занят. Оставь меня в покое.
	AI_StopProcessInfos(self);
};


instance DIA_PECK_FOUND_PECK(C_INFO)
{
	npc = mil_324_peck;
	nr = 2;
	condition = dia_peck_found_peck_condition;
	information = dia_peck_found_peck_info;
	permanent = FALSE;
	description = "Эй, тебе пора возвращаться назад.";
};


func int dia_peck_found_peck_condition()
{
	if((MIS_ANDRE_PECK == LOG_RUNNING) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_PECK") <= 500))
	{
		return TRUE;
	};
};

func void dia_peck_found_peck_info()
{
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_00");	//Эй, тебе пора возвращаться назад.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_01");	//Что тебе нужно? Ты разве не видишь, я занят?
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_02");	//Мне нужно оружие, так что возвращайся в казармы.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_03");	//Черт, твое оружие может подождать.
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_04");	//Пошли, Андрэ уже тоже ищет тебя.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_05");	//Хммм... черт. Ладно, я уже иду - но когда будешь докладывать Андрэ, не говори ему, что я был здесь.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"STORAGE");
	Npc_ExchangeRoutine(vanja,"ALONE");
};


instance DIA_PECK_WEAPON(C_INFO)
{
	npc = mil_324_peck;
	nr = 2;
	condition = dia_peck_weapon_condition;
	information = dia_peck_weapon_info;
	permanent = TRUE;
	description = "Я пришел за оружием.";
};


var int dia_peck_weapon_perm;

func int dia_peck_weapon_condition()
{
	if(Npc_KnowsInfo(other,dia_andre_found_peck) && (Npc_GetDistToWP(self,"NW_CITY_ARMORY_PECK") <= 1000) && (KAPITEL < 3) && (DIA_PECK_WEAPON_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_peck_weapon_info()
{
	AI_Output(other,self,"DIA_Peck_WEAPON_15_00");	//Я пришел за оружием.
	if(MIS_ANDRE_PECK == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Peck_WEAPON_12_01");	//Сначала сходи к Андрэ и доложи ему.
	}
	else
	{
		if(MIS_ANDRE_PECK == LOG_OBSOLETE)
		{
			AI_Output(self,other,"DIA_Peck_WEAPON_12_02");	//Посмотрите, кто пришел. Наш новый друг. И ему нужен меч.
			AI_Output(self,other,"DIA_Peck_WEAPON_12_03");	//Ты не сказал Андрэ, что я был в Красном Фонаре. Похоже, ты нормальный парень. Вот, держи твой меч.
			AI_Output(self,other,"DIA_Peck_Add_12_00");	//Это лучшее, что у меня есть.
			b_giveinvitems(self,hero,itmw_schwert1,1);
		}
		else if(MIS_ANDRE_PECK == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Peck_WEAPON_12_04");	//Я не забуду тебе этого. Кто сказал Андрэ, что я был в Красном Фонаре, а?
			AI_Output(self,other,"DIA_Peck_WEAPON_12_05");	//И теперь ты хочешь получить от меня меч... хорошо, ты получишь меч. Вот. А теперь пошел к черту!
			b_giveinvitems(self,hero,itmw_1h_misc_sword,1);
		};
		DIA_PECK_WEAPON_PERM = TRUE;
		AI_Output(self,other,"DIA_Peck_WEAPON_12_06");	//Если тебе нужно оружие получше, иди к торговцам на рынке.
	};
	AI_StopProcessInfos(self);
};

func void b_peck_leckmich()
{
	AI_Output(self,other,"DIA_Peck_Add_12_07");	//Поцелуй мою задницу!
};


instance DIA_PECK_WEAPON2(C_INFO)
{
	npc = mil_324_peck;
	nr = 2;
	condition = dia_peck_weapon2_condition;
	information = dia_peck_weapon2_info;
	permanent = TRUE;
	description = "У тебя нет оружия получше для меня?";
};


var int dia_peck_weapon2_perm;

func int dia_peck_weapon2_condition()
{
	if((other.guild == GIL_MIL) && (Npc_GetDistToWP(self,"NW_CITY_ARMORY_PECK") <= 1000) && (ENTEROW_KAPITEL2 == TRUE) && (DIA_PECK_WEAPON_PERM == TRUE) && (DIA_PECK_WEAPON2_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_peck_weapon2_info()
{
	AI_Output(other,self,"DIA_Peck_Add_15_01");	//У тебя нет оружия получше для меня?
	if(MIS_ANDRE_PECK == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Peck_Add_12_06");	//Я не забыл, что ты донес на меня лорду Андрэ.
		b_peck_leckmich();
	}
	else if(KAPITEL < 3)
	{
		AI_Output(self,other,"DIA_Peck_Add_12_02");	//Пока нет...
	}
	else
	{
		AI_Output(self,other,"DIA_Peck_Add_12_03");	//Хорошо, что ты спросил. Нам досталось несколько очень хороших клинков от наемников Онара.
		AI_Output(self,other,"DIA_Peck_Add_12_04");	//Они им больше не понадобятся. (грязный смех)
		AI_Output(self,other,"DIA_Peck_Add_12_05");	//Вот, возьми.
		b_giveinvitems(self,other,itmw_rubinklinge,1);
		DIA_PECK_WEAPON2_PERM = TRUE;
	};
};


instance DIA_PECK_PERM(C_INFO)
{
	npc = mil_324_peck;
	nr = 998;
	condition = dia_peck_perm_condition;
	information = dia_peck_perm_info;
	permanent = TRUE;
	description = "С тобой все в порядке?";
};


func int dia_peck_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_peck_weapon) || ((other.guild != GIL_MIL) && (Npc_GetDistToWP(self,"NW_CITY_ARMORY_PECK") <= 1000)))
	{
		return TRUE;
	};
};

func void dia_peck_perm_info()
{
	AI_Output(other,self,"DIA_Peck_PERM_15_00");	//С тобой все в порядке?
	if(MIS_ANDRE_PECK == LOG_SUCCESS)
	{
		b_peck_leckmich();
	}
	else if(KAPITEL != 3)
	{
		AI_Output(self,other,"DIA_Peck_PERM_12_01");	//Да, а с тобой?
	}
	else if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET != LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			{
				AI_Output(self,other,"DIA_Peck_PERM_12_02");	//Не совсем. Меня волнуют эти наемники. Я хочу сказать, они могут попытаться освободить своего дружка из тюрьмы силой.
				AI_Output(self,other,"DIA_Peck_PERM_12_03");	//Мне что-то не очень хочется выступать против банды опытных бойцов.
			}
			else if(hero.guild == GIL_KDF)
			{
				AI_Output(self,other,"DIA_Peck_PERM_12_04");	//Конечно! Мы готовы ко всему. Маги могут быть уверены, что этому заключенному не удастся сбежать.
			}
			else
			{
				AI_Output(self,other,"DIA_Peck_PERM_12_05");	//Я знаю, что ты задумал, но у тебя не получится уйти вместе с этим заключенным.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Peck_PERM_12_06");	//Я очень рад, что это дело об убийстве теперь закрыто.
			AI_Output(other,self,"DIA_Peck_PERM_15_07");	//Почему?
			AI_Output(self,other,"DIA_Peck_PERM_12_08");	//Наемники просто так не отступили бы. Они бы не стали сидеть сложа руки и спокойно наблюдать за тем, как мы повесим одного из них.
			AI_Output(self,other,"DIA_Peck_PERM_12_09");	//Они даже могли напасть на город. Я даже думать не хочу от том, к чему это могло привести.
		};
	};
};

