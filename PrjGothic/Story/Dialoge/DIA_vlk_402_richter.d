
instance DIA_RICHTER_EXIT(C_INFO)
{
	npc = vlk_402_richter;
	nr = 999;
	condition = dia_richter_exit_condition;
	information = dia_richter_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_richter_exit_condition()
{
	return TRUE;
};

func void dia_richter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_HELLO(C_INFO)
{
	npc = vlk_402_richter;
	nr = 4;
	condition = dia_richter_hello_condition;
	information = dia_richter_hello_info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int dia_richter_hello_condition()
{
	if(MIS_LEE_JUDGERICHTER == 0)
	{
		return TRUE;
	};
};

func void dia_richter_hello_info()
{
	AI_Output(other,self,"DIA_Richter_Hello_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Richter_Hello_10_01");	//Что тебе от меня нужно? Кто ты вообще такой?
	AI_Output(other,self,"DIA_Richter_Hello_15_02");	//Я, э-э...
	AI_Output(self,other,"DIA_Richter_Hello_10_03");	//Скажи, мы раньше нигде не встречались?
	Info_ClearChoices(dia_richter_hello);
	Info_AddChoice(dia_richter_hello,"Я такого не помню.",dia_richter_hello_dontthinkso);
	Info_AddChoice(dia_richter_hello,"Может и так.",dia_richter_hello_maybe);
};

func void dia_richter_hello_dontthinkso()
{
	AI_Output(other,self,"DIA_Richter_Hello_DontThinkSo_15_00");	//Я такого не помню.
	AI_Output(self,other,"DIA_Richter_Hello_DontThinkSo_10_01");	//Забавно. Готов поклясться, что где-то видел тебя раньше.
	AI_Output(self,other,"DIA_Richter_Hello_DontThinkSo_10_02");	//Ладно, все вы, отбросы общества, похожи друг на друга.
};

func void dia_richter_hello_maybe()
{
	AI_Output(other,self,"DIA_Richter_Hello_MayBe_15_00");	//Может и так.
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_01");	//Ты совсем обнаглел?! Ты хоть знаешь, с кем ты разговариваешь?
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_02");	//По крайней мере, ты мог бы обращаться ко мне более почтительно.
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_03");	//А теперь убирайся с глаз моих!
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_PERM(C_INFO)
{
	npc = vlk_402_richter;
	nr = 800;
	condition = dia_richter_perm_condition;
	information = dia_richter_perm_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int dia_richter_perm_condition()
{
	if((Npc_KnowsInfo(other,dia_richter_hello) || (MIS_LEE_JUDGERICHTER == LOG_RUNNING)) && (SCISTRICHTERSLAKAI == FALSE))
	{
		return TRUE;
	};
};

func void dia_richter_perm_info()
{
	AI_Output(other,self,"DIA_Richter_Perm_15_00");	//Как дела?
	if((MIS_LEE_JUDGERICHTER == LOG_RUNNING) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Richter_Perm_10_01");	//Тебе лучше убраться отсюда, грязный наемник, пока я не позвал стражу.
		AI_Output(other,self,"DIA_Richter_Perm_15_02");	//Расслабься. Я здесь не для того, чтобы обокрасть тебя. Я ищу работу.
		AI_Output(self,other,"DIA_Richter_Perm_10_03");	//Ах. Так ты хочешь работать на меня. Хмм. Это, конечно, меняет дело.
		AI_Output(self,other,"DIA_Richter_Perm_10_04");	//Да, у меня есть небольшая проблема. Но я не знаю, могу ли я доверять тебе. Сначала ты должен доказать, что на тебя можно положиться.
		SCISTRICHTERSLAKAI = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Richter_Perm_10_05");	//Разве я уже не сказал, что не хочу иметь с тобой никаких дел?
		AI_Output(other,self,"DIA_Richter_Perm_15_06");	//Нет, по крайней мере, не так подробно.
		AI_Output(self,other,"DIA_Richter_Perm_10_07");	//Но теперь, я надеюсь, до тебя, наконец, это дошло.
	};
};


instance DIA_RICHTER_RICHTERSLAKAI(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_richterslakai_condition;
	information = dia_richter_richterslakai_info;
	description = "Испытай меня.";
};


func int dia_richter_richterslakai_condition()
{
	if((Npc_KnowsInfo(other,dia_richter_hello) || (MIS_LEE_JUDGERICHTER != 0)) && (SCISTRICHTERSLAKAI == TRUE))
	{
		return TRUE;
	};
};

func void dia_richter_richterslakai_info()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_15_00");	//Испытай меня.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_10_01");	//М-м-м. Хорошо. Слушай. Принеси мне священный молот Магов Огня. Они хранят его где-то в подвалах монастыря.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_10_02");	//Если тебе удастся это, я подумаю насчет того, чтобы принять тебя в телохранители.
	Info_ClearChoices(dia_richter_richterslakai);
	Info_AddChoice(dia_richter_richterslakai,"Я должен украсть у магов? Да у тебя крыша поехала.",dia_richter_richterslakai_nein);
	Info_AddChoice(dia_richter_richterslakai,"Хорошо.",dia_richter_richterslakai_ja);
	b_logentry(TOPIC_RICHTERLAKAI,"Судья не доверяет мне. Я должен доказать свою верность ему. Я должен украсть священный молот из подвала монастыря магов огня и принести молот ему.");
	MIS_RICHTER_BRINGHOLYHAMMER = LOG_RUNNING;
};

func void dia_richter_richterslakai_nein()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_nein_15_00");	//Я должен украсть у магов? Да у тебя крыша поехала.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_nein_10_01");	//Тогда проваливай к черту. Хватит тратить мое время попусту.
	AI_StopProcessInfos(self);
};

func void dia_richter_richterslakai_ja()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_ja_15_00");	//Хорошо.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_ja_10_01");	//Отлично. Но помни - если тебя поймают, я никогда не слышал о тебе.
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_KILLMORGAHARD(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_killmorgahard_condition;
	information = dia_richter_killmorgahard_info;
	description = "Вот священный молот магов.";
};


func int dia_richter_killmorgahard_condition()
{
	if(Npc_HasItems(other,holy_hammer_mis) && (MIS_RICHTER_BRINGHOLYHAMMER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_richter_killmorgahard_info()
{
	AI_Output(other,self,"DIA_Richter_KillMorgahard_15_00");	//Вот священный молот магов.
	b_giveinvitems(other,self,holy_hammer_mis,1);
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_01");	//Я поражен. Похоже, у тебя действительно серьезные намерения. Вот твое вознаграждение.
	CreateInvItems(self,itmi_gold,300);
	b_giveinvitems(self,other,itmi_gold,300);
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_02");	//Отлично. Так как все прошло хорошо, у меня есть для тебя еще одно задание.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_03");	//Несколько дней назад, из местной тюрьмы сбежали несколько заключенных.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_04");	//Эти сукины дети отправились в горы. Скорее всего, по направлению к новой башне Ксардаса.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_05");	//Их главаря зовут Моргахард. Я хочу, чтобы ты убил его.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_06");	//Поторопись, пока они не исчезли куда-нибудь еще.
	Wld_InsertNpc(bdt_1030_morgahard,"REICH");
	Wld_InsertNpc(bdt_1031_fluechtling,"REICH");
	Wld_InsertNpc(bdt_1032_fluechtling,"REICH");
	Wld_InsertNpc(bdt_1033_fluechtling,"REICH");
	Wld_InsertNpc(bdt_1034_fluechtling,"REICH");
	Wld_InsertNpc(bdt_1035_fluechtling,"REICH");
	b_initnpcglobals();
	b_giveplayerxp(XP_BRINGHOLYHAMMER);
	MIS_RICHTER_BRINGHOLYHAMMER = LOG_SUCCESS;
	b_logentry(TOPIC_RICHTERLAKAI,"Несколько заключенных сбежали от судьи. Я должен найти их и прикончить, а также прикончить их главаря - МОРГАХАРДА. Они, предположительно, скрываются в горах, где-то по направлению к новой башне Ксардаса.");
	MIS_RICHTER_KILLMORGAHARD = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_KILLEDMORGAHARD(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_killedmorgahard_condition;
	information = dia_richter_killedmorgahard_info;
	description = "Моргахард мертв.";
};


func int dia_richter_killedmorgahard_condition()
{
	if(Npc_IsDead(morgahard) && (MIS_RICHTER_KILLMORGAHARD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_richter_killedmorgahard_info()
{
	AI_Output(other,self,"DIA_Richter_KilledMorgahard_15_00");	//Моргахард мертв.
	AI_Output(self,other,"DIA_Richter_KilledMorgahard_10_01");	//Ах! Ты отличный парень. Вот твоя награда.
	CreateInvItems(self,itmi_gold,400);
	b_giveinvitems(self,other,itmi_gold,400);
	b_giveplayerxp(XP_KILLMORGAHARD);
	b_logentry(TOPIC_RICHTERLAKAI,"Судью, похоже, огорчила новость о смерти Моргахарда. А, ладно, мне до этого нет дела. Моя основная цель - выполнение задания Ли.");
	MIS_RICHTER_KILLMORGAHARD = LOG_SUCCESS;
};


instance DIA_RICHTER_KILLEDMORGAHARDPERM(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_killedmorgahardperm_condition;
	information = dia_richter_killedmorgahardperm_info;
	permanent = TRUE;
	description = "Могу я еще что-нибудь сделать для тебя?";
};


func int dia_richter_killedmorgahardperm_condition()
{
	if((MIS_RICHTER_KILLMORGAHARD == LOG_SUCCESS) && (MIS_RICHTERSPERMISSIONFORSHIP == 0))
	{
		return TRUE;
	};
};

func void dia_richter_killedmorgahardperm_info()
{
	AI_Output(other,self,"DIA_Richter_KilledMorgahardPERM_15_00");	//Могу я еще что-нибудь сделать для тебя?
	AI_Output(self,other,"DIA_Richter_KilledMorgahardPERM_10_01");	//Пока нет. Возможно, позже.
};


instance DIA_RICHTER_PERMISSIONFORSHIP(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_permissionforship_condition;
	information = dia_richter_permissionforship_info;
	description = "Дай мне письменное подтверждение полномочий распоряжаться кораблем паладинов.";
};


func int dia_richter_permissionforship_condition()
{
	if(MIS_RICHTERSPERMISSIONFORSHIP == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_richter_permissionforship_info()
{
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_00");	//Дай мне письменное подтверждение полномочий распоряжаться кораблем паладинов.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_01");	//(смеется) Ты, должно быть, тронулся рассудком. Что ты хочешь, чтобы я сделал?
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_02");	//Ты уже слышал. Либо ты дашь мне эту бумагу, либо я сдам тебя ополчению.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_03");	//(рычит) Никто не смеет меня шантажировать! Тем более ты! Я скормлю тебя волкам, презренный кусок дерьма!
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_04");	//Моргахард убил губернатора по твоему приказу. У меня есть документ, подтверждающий это.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_05");	//(Рычит) Ах-х.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_06");	//Ты пожалеешь об этом. Этот шантаж не сойдет тебе с рук просто так.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_07");	//Вот твоя бумага. А теперь проваливай. Я разберусь с тобой позже.
	CreateInvItems(self,itwr_forgedshipletter_mis,1);
	b_giveinvitems(self,other,itwr_forgedshipletter_mis,1);
	b_logentry(TOPIC_SHIP,"Письмо о подтверждении полномочий должно позволить без проблем завладеть кораблем. Интересно, что скажет на это Ли.");
	MIS_RICHTERSPERMISSIONFORSHIP = LOG_SUCCESS;
	b_giveplayerxp(XP_RICHTERSPERMISSIONFORSHIP);
};


instance DIA_RICHTER_PERM2(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_perm2_condition;
	information = dia_richter_perm2_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_richter_perm2_condition()
{
	if((MIS_RICHTERSPERMISSIONFORSHIP == LOG_SUCCESS) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_richter_perm2_info()
{
	AI_Output(self,other,"DIA_Richter_perm2_10_00");	//Убирайся с глаз моих.
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_PICKPOCKET(C_INFO)
{
	npc = vlk_402_richter;
	nr = 900;
	condition = dia_richter_pickpocket_condition;
	information = dia_richter_pickpocket_info;
	permanent = TRUE;
	description = "(украсть этот ключ будет легко)";
};


func int dia_richter_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_richter) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_richter_pickpocket_info()
{
	Info_ClearChoices(dia_richter_pickpocket);
	Info_AddChoice(dia_richter_pickpocket,DIALOG_BACK,dia_richter_pickpocket_back);
	Info_AddChoice(dia_richter_pickpocket,DIALOG_PICKPOCKET,dia_richter_pickpocket_doit);
};

func void dia_richter_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		b_giveinvitems(self,other,itke_richter,1);
		b_givethiefxp();
		Info_ClearChoices(dia_richter_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_richter_pickpocket_back()
{
	Info_ClearChoices(dia_richter_pickpocket);
};

