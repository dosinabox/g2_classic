
instance DIA_JESPER_EXIT(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 999;
	condition = dia_jesper_exit_condition;
	information = dia_jesper_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jesper_exit_condition()
{
	return TRUE;
};

func void dia_jesper_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JESPER_PICKPOCKET(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 900;
	condition = dia_jesper_pickpocket_condition;
	information = dia_jesper_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_jesper_pickpocket_condition()
{
	return c_beklauen(80,180);
};

func void dia_jesper_pickpocket_info()
{
	Info_ClearChoices(dia_jesper_pickpocket);
	Info_AddChoice(dia_jesper_pickpocket,DIALOG_BACK,dia_jesper_pickpocket_back);
	Info_AddChoice(dia_jesper_pickpocket,DIALOG_PICKPOCKET,dia_jesper_pickpocket_doit);
};

func void dia_jesper_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jesper_pickpocket);
};

func void dia_jesper_pickpocket_back()
{
	Info_ClearChoices(dia_jesper_pickpocket);
};


instance DIA_JESPER_HALLO(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 1;
	condition = dia_jesper_hallo_condition;
	information = dia_jesper_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jesper_hallo_condition()
{
	return TRUE;
};

func void dia_jesper_hallo_info()
{
	AI_Output(self,other,"DIA_Jesper_Hallo_09_00");	//Эй, Что ты тут делаешь? Тебе тут не место!
	AI_Output(self,other,"DIA_Jesper_Hallo_09_01");	//Так что выкладывай, что ты делаешь здесь?
	Info_ClearChoices(dia_jesper_hallo);
	Info_AddChoice(dia_jesper_hallo,"Я пришел убить тебя.",dia_jesper_hallo_kill);
	Info_AddChoice(dia_jesper_hallo,"Я просто прогуливаюсь здесь.",dia_jesper_hallo_nurso);
	if(ATTILA_KEY == TRUE)
	{
		Info_AddChoice(dia_jesper_hallo,"Аттила дал мне ключ...",dia_jesper_hallo_willkommen);
	}
	else
	{
		Info_AddChoice(dia_jesper_hallo,"Я прикончил Аттилу...",dia_jesper_hallo_umgelegt);
	};
	DG_GEFUNDEN = TRUE;
};

func void dia_jesper_hallo_kill()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Kill_15_00");	//Я пришел убить тебя.
	AI_Output(self,other,"DIA_Jesper_Hallo_Kill_09_01");	//Чудесная идея. Ты что думаешь, я здесь один? Ах, ладно. Сейчас мы решим этот вопрос.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	b_attack(self,other,AR_NONE,1);
};

func void dia_jesper_hallo_nurso()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_NurSo_15_00");	//Я просто прогуливаюсь здесь.
	AI_Output(self,other,"DIA_Jesper_Hallo_NurSo_09_01");	//Здесь не стоит гулять. Это слишком опасно, понятно?
	AI_Output(self,other,"DIA_Jesper_Hallo_NurSo_09_02");	//Так что оставь свое оружие на месте и скажи мне, зачем ты здесь?
};

func void dia_jesper_hallo_willkommen()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Willkommen_15_00");	//Аттила дал мне ключ. Вот почему я здесь. Так что вам нужно от меня?
	AI_Output(self,other,"DIA_Jesper_Hallo_Willkommen_09_01");	//Разве ты не хочешь узнать это? Не горячись.
	AI_Output(self,other,"DIA_Jesper_Hallo_Willkommen_09_02");	//Иди к Кассии. Тебя ждут.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void dia_jesper_hallo_umgelegt()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Umgelegt_15_00");	//Я прикончил Аттилу. При нем был ключ от канализации.
	AI_Output(self,other,"DIA_Jesper_Hallo_Umgelegt_09_01");	//(с недоверием) ТЫ убил Аттилу?! (презрительно) А, ладно, он все равно был никчемным псом.
	AI_Output(self,other,"DIA_Jesper_Hallo_Umgelegt_09_02");	//Но я хочу предупредить тебя. Если ты нападешь на МЕНЯ, я тебя убью.
	Info_ClearChoices(dia_jesper_hallo);
	Info_AddChoice(dia_jesper_hallo,"Что ты делаешь в этой темной вонючей дыре?",dia_jesper_hallo_was);
	Info_AddChoice(dia_jesper_hallo,"Отведи меня к вашему главарю.",dia_jesper_hallo_anfuehrer);
};

func void dia_jesper_hallo_was()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Was_15_00");	//Что ты делаешь в этой темной вонючей дыре?
	AI_Output(self,other,"DIA_Jesper_Hallo_Was_09_01");	//(рычит) Я живу здесь. Еще один глупый вопрос, и в твоей шкуре появятся дырки.
};

func void dia_jesper_hallo_anfuehrer()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Anfuehrer_15_00");	//Отведи меня к вашему главарю.
	AI_Output(self,other,"DIA_Jesper_Hallo_Anfuehrer_09_01");	//(грязный смех) ХА - к главарю? Я уверен, Кассия захочет поговорить с тобой.
	AI_Output(self,other,"DIA_Jesper_Hallo_Anfuehrer_09_02");	//Иди вперед - и не пытайся провести меня.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_JESPER_BEZAHLEN(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 1;
	condition = dia_jesper_bezahlen_condition;
	information = dia_jesper_bezahlen_info;
	permanent = TRUE;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int dia_jesper_bezahlen_condition()
{
	if((JOIN_THIEFS == TRUE) && (JESPER_TEACHSNEAK == FALSE) && Npc_KnowsInfo(other,dia_cassia_lernen) && (Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE))
	{
		return TRUE;
	};
};

func void dia_jesper_bezahlen_info()
{
	AI_Output(other,self,"DIA_Jesper_Bezahlen_15_00");	//Ты можешь научить меня чему-нибудь?
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		AI_Output(self,other,"DIA_Jesper_Bezahlen_09_01");	//Конечно, я покажу, как нужно красться - для тебя бесплатно.
		JESPER_TEACHSNEAK = TRUE;
		Info_ClearChoices(dia_jesper_bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_Bezahlen_09_02");	//Ты хочешь узнать, как двигаться, не издавая ни единого звука? Это обойдется тебе в 100 золотых монет.
		b_say_gold(self,other,JESPER_COST);
		Info_ClearChoices(dia_jesper_bezahlen);
		Info_AddChoice(dia_jesper_bezahlen,"Может быть, позже ...(НАЗАД)",dia_jesper_bezahlen_spaeter);
		Info_AddChoice(dia_jesper_bezahlen,"Хорошо, я хочу научиться красться (заплатить 100 золотых).",dia_jesper_bezahlen_okay);
	};
};

func void dia_jesper_bezahlen_spaeter()
{
	Info_ClearChoices(dia_jesper_bezahlen);
};

func void dia_jesper_bezahlen_okay()
{
	AI_Output(other,self,"DIA_Jesper_Bezahlen_Okay_15_00");	//Хорошо, я хочу научиться красться.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(other,self,"DIA_Jesper_Bezahlen_Okay_15_01");	//Вот золото.
		AI_Output(self,other,"DIA_Jesper_Bezahlen_Okay_09_02");	//Скажешь, когда будешь готов.
		JESPER_TEACHSNEAK = TRUE;
		Info_ClearChoices(dia_jesper_bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_Bezahlen_Okay_09_03");	//Без золота ты не сможешь ничему научиться.
		Info_ClearChoices(dia_jesper_bezahlen);
	};
};


instance DIA_JESPER_SCHLEICHEN(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 10;
	condition = dia_jesper_schleichen_condition;
	information = dia_jesper_schleichen_info;
	permanent = TRUE;
	description = "Научи меня красться.";
};


var int dia_jesper_schleichen_permanent;

func int dia_jesper_schleichen_condition()
{
	if((JESPER_TEACHSNEAK == TRUE) && (DIA_JESPER_SCHLEICHEN_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_jesper_schleichen_info()
{
	AI_Output(other,self,"DIA_Jesper_Schleichen_15_00");	//Научи меня красться.
	if(b_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_01");	//Умение красться очень важно для любого вора. Особенно, если ты ходишь по чужому дому.
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_02");	//Там нельзя топать, как ты это делаешь сейчас. Большинство людей спит очень чутким сном.
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_03");	//Только когда ты крадешься, никто не услышит тебя, и ты сможешь работать беспрепятственно.
		DIA_JESPER_SCHLEICHEN_PERMANENT = TRUE;
	};
};


instance DIA_JESPER_KILLER(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 2;
	condition = dia_jesper_killer_condition;
	information = dia_jesper_killer_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jesper_killer_condition()
{
	if(Npc_IsDead(cassia) || Npc_IsDead(ramirez))
	{
		return TRUE;
	};
};

func void dia_jesper_killer_info()
{
	if(Npc_IsDead(cassia) && Npc_IsDead(ramirez))
	{
		AI_Output(self,other,"DIA_Jesper_Killer_09_00");	//Ты убил моих друзей. Зачем ты сделал это, убийца?
		AI_Output(self,other,"DIA_Jesper_Killer_09_01");	//Я отправлю тебя в царство Белиара.
	}
	else if(Npc_IsDead(cassia))
	{
		AI_Output(self,other,"DIA_Jesper_Killer_09_02");	//Убийца! Ты убил Кассию! Но от меня тебе не уйти!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else if(Npc_IsDead(ramirez))
	{
		AI_Output(self,other,"DIA_Jesper_Killer_09_03");	//Я давно работаю с Рамирезом и добыл для него больше золота, чем ты можешь себе представить.
		AI_Output(self,other,"DIA_Jesper_Killer_09_04");	//А ты взял и убил его, грязный пес! Но сейчас пришло время расплаты!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	};
};


instance DIA_JESPER_BOGEN(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 10;
	condition = dia_jesper_bogen_condition;
	information = dia_jesper_bogen_info;
	permanent = FALSE;
	description = "Скажи, ты ничего не знаешь о луке Боспера?";
};


func int dia_jesper_bogen_condition()
{
	if((Npc_HasItems(other,itrw_bow_l_03_mis) < 1) && (MIS_BOSPER_BOGEN == LOG_RUNNING) && (JOIN_THIEFS == TRUE))
	{
		return TRUE;
	};
};

func void dia_jesper_bogen_info()
{
	AI_Output(other,self,"DIA_Jesper_Bogen_15_00");	//Скажи, ты ничего не знаешь о луке Боспера?
	AI_Output(self,other,"DIA_Jesper_Bogen_09_01");	//Ты имеешь в виду лук этого ремесленника? Да, я упаковал его в один из сундуков.
	AI_Output(self,other,"DIA_Jesper_Bogen_09_02");	//Но там полно крыс вокруг. Ты можешь забрать его, если не боишься этих тварей.
	AI_Output(self,other,"DIA_Jesper_Bogen_09_03");	//Ох, да, конечно же, этот сундук заперт. Тебе придется взломать замок. (ухмыляется) Надеюсь, у тебя есть отмычки.
	Wld_InsertNpc(giant_rat,"NW_CITY_KANAL_ROOM_01_01");
	Wld_InsertNpc(giant_rat,"NW_CITY_KANAL_ROOM_01_02");
	Wld_InsertNpc(giant_rat,"NW_CITY_KANAL_ROOM_01_03");
};


instance DIA_JESPER_TUER(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 10;
	condition = dia_jesper_tuer_condition;
	information = dia_jesper_tuer_info;
	permanent = FALSE;
	description = "А что за этой закрытой дверью?";
};


func int dia_jesper_tuer_condition()
{
	if((MIS_CASSIARING == LOG_SUCCESS) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_jesper_tuer_info()
{
	AI_Output(other,self,"DIA_Jesper_Tuer_15_00");	//А что за этой закрытой дверью?
	AI_Output(self,other,"DIA_Jesper_Tuer_09_01");	//(ухмыляется) За ней находится сундук - сундук мастера-медвежатника Фингера.
	AI_Output(self,other,"DIA_Jesper_Tuer_09_02");	//Он поставил такой невероятно сложный замок на него, что до сих пор никому не удалось открыть его.
	AI_Output(self,other,"DIA_Jesper_Tuer_09_03");	//К сожалению, он как-то попался - и его засунули за Барьер, где он, вероятно, и умер.
	AI_Output(self,other,"DIA_Jesper_Tuer_09_04");	//Но если ты хочешь попытаться открыть его сундук, вот ключ от этой комнаты.
	b_giveinvitems(self,other,itke_fingers,1);
};


instance DIA_JESPER_TRUHE(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 10;
	condition = dia_jesper_truhe_condition;
	information = dia_jesper_truhe_info;
	permanent = FALSE;
	description = "Мне удалось открыть сундук.";
};


func int dia_jesper_truhe_condition()
{
	if((Mob_HasItems("MOB_FINGERS",itmi_gold) < 300) || (Mob_HasItems("MOB_FINGERS",itmi_silvercup) < 5) || (Mob_HasItems("MOB_FINGERS",itmi_goldcup) < 1) || (Mob_HasItems("MOB_FINGERS",itam_strg_01) < 1) || (Mob_HasItems("MOB_FINGERS",itpo_perm_dex) < 1))
	{
		return TRUE;
	};
};

func void dia_jesper_truhe_info()
{
	AI_Output(other,self,"DIA_Jesper_Truhe_15_00");	//Мне удалось открыть сундук.
	AI_Output(self,other,"DIA_Jesper_Truhe_09_01");	//Это невозможно! Похоже, у нас появился новый мастер-медвежатник.
	AI_Output(self,other,"DIA_Jesper_Truhe_09_02");	//Поздравляю!
	b_giveplayerxp(XP_JESPERTRUHE);
};

