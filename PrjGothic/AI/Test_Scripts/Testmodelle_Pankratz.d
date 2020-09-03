
instance J1(C_ITEM)
{
	name = "MIS_ReadyForChapter3 ";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usejoly_storyhelpletter;
	scemename = "MAP";
	description = "JOLY_Storyhelpletter";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void usejoly_storyhelpletter()
{
	IntroduceChapter(KAPWECHSEL_1,KAPWECHSEL_1_TEXT,"Hum_head_144_C0.tga","nosound.wav",6000);
	Wld_InsertItem(itmi_innoseye_broken_mis,"FP_TROLLAREA_RITUAL_ITEM");
};


instance J3(C_ITEM)
{
	name = "chapter1";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usej3;
	scemename = "MAP";
	description = "chapter2";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void usej3()
{
	PrintScreen("CreateInvItems (self, Holyhammer_mis, 1);",-1,10,FONT_SCREENSMALL,20);
	IntroduceChapter(KAPWECHSEL_1,KAPWECHSEL_1_TEXT,"chapter6.tga","chapter_01.wav",6000);
};


instance DJG_INSERTEN(C_ITEM)
{
	name = "JOLY_Storyhelpletter";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usedjg_inserten;
	scemename = "MAP";
	description = "JOLY_Storyhelpletter";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void usedjg_inserten()
{
	b_kapitelwechsel(4,OLDWORLD_ZEN);
	b_initnpcglobals();
	PLAYER_TALENT_ALCHEMY[CHARGE_INNOSEYE] = TRUE;
	CreateInvItems(hero,itmi_innoseye_mis,1);
	CreateInvItems(hero,itmi_gold,1000);
	Wld_InsertNpc(djg_701_bullco,"OC1");
	Wld_InsertNpc(djg_702_rod,"OC1");
	Wld_InsertNpc(djg_703_cipher,"OC1");
	Wld_InsertNpc(pc_fighter_djg,"OC1");
};


instance J2(C_ITEM)
{
	name = "TEXT_Innoseye_Setting_Repaired";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usej2oly_storyhelpletter;
	scemename = "MAP";
	description = "J2OLY_Storyhelpletter";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void usej2oly_storyhelpletter()
{
	Wld_InsertItem(itmi_innoseye_broken_mis,"FP_TROLLAREA_RITUAL_ITEM");
};


instance J4(C_ITEM)
{
	name = "B_Kapitelwechsel(5, OLDWORLD_ZEN )";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usej4oly_storyhelpletter;
	scemename = "MAP";
	description = name;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void usej4oly_storyhelpletter()
{
	b_kapitelwechsel(3,NEWWORLD_ZEN);
	Npc_ExchangeRoutine(vatras,"RitualInnosEye");
	b_startotherroutine(xardas,"RitualInnosEye");
	b_startotherroutine(pyrokar,"RitualInnosEye");
	Npc_SetRefuseTalk(vatras,60);
	RITUALINNOSEYERUNS = LOG_RUNNING;
};


instance SH_OLDWORLD(NPC_DEFAULT)
{
	name[0] = "Помощник по сюжету в Долине Рудников";
	guild = GIL_NONE;
	id = 9998;
	voice = 15;
	flags = 0;
	npctype = NPCTYPE_FRIEND;
	b_setattributestochapter(self,1);
	b_givenpctalents(self);
	fight_tactic = FAI_HUMAN_MASTER;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_N_PLAYER,BODYTEX_PLAYER,-1);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	daily_routine = rtn_start_9998;
};


func void rtn_start_9998()
{
	ta_stand_armscrossed(8,0,23,0,"XXX");
	ta_stand_armscrossed(23,0,8,0,"XXX");
};


instance SH_OLDWORLD_EXIT(C_INFO)
{
	npc = sh_oldworld;
	nr = 999;
	condition = sh_oldworld_exit_condition;
	information = sh_oldworld_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int sh_oldworld_exit_condition()
{
	return TRUE;
};

func void sh_oldworld_exit_info()
{
	AI_StopProcessInfos(self);
};


instance SH_OLDWORLD_INFO1(C_INFO)
{
	npc = sh_oldworld;
	condition = sh_oldworld_info1_condition;
	information = sh_oldworld_info1_info;
	important = FALSE;
	permanent = TRUE;
	description = KAPWECHSEL_1;
};


func int sh_oldworld_info1_condition()
{
	return TRUE;
};

func void sh_oldworld_info1_info()
{
	Info_ClearChoices(sh_oldworld_info1);
	Info_AddChoice(sh_oldworld_info1,DIALOG_BACK,sh_oldworld_back1);
	Info_AddChoice(sh_oldworld_info1,KAPITELANFANG,sh_oldworld_kapitel1anfang);
};

func void sh_oldworld_back1()
{
	Info_ClearChoices(sh_oldworld_info1);
};

func void sh_oldworld_kapitel1anfang()
{
	b_kapitelwechsel(1,OLDWORLD_ZEN);
	AI_StopProcessInfos(self);
};


instance SH_OLDWORLD_INFO2(C_INFO)
{
	npc = sh_oldworld;
	condition = sh_oldworld_info2_condition;
	information = sh_oldworld_info2_info;
	important = FALSE;
	permanent = TRUE;
	description = KAPWECHSEL_2;
};


func int sh_oldworld_info2_condition()
{
	return TRUE;
};

func void sh_oldworld_info2_info()
{
	Info_ClearChoices(sh_oldworld_info2);
	Info_AddChoice(sh_oldworld_info2,DIALOG_BACK,sh_oldworld_back2);
	Info_AddChoice(sh_oldworld_info2,KAPITELANFANG,sh_oldworld_kapitel2anfang);
};

func void sh_oldworld_back2()
{
	Info_ClearChoices(sh_oldworld_info2);
};

func void sh_oldworld_kapitel2anfang()
{
	MIS_OLDWORLD = LOG_RUNNING;
	b_kapitelwechsel(2,OLDWORLD_ZEN);
	AI_StopProcessInfos(self);
};


instance SH_OLDWORLD_INFO3(C_INFO)
{
	npc = sh_oldworld;
	condition = sh_oldworld_info3_condition;
	information = sh_oldworld_info3_info;
	important = FALSE;
	permanent = TRUE;
	description = KAPWECHSEL_3;
};


func int sh_oldworld_info3_condition()
{
	return TRUE;
};

func void sh_oldworld_info3_info()
{
	Info_ClearChoices(sh_oldworld_info3);
	Info_AddChoice(sh_oldworld_info3,DIALOG_BACK,sh_oldworld_back3);
	Info_AddChoice(sh_oldworld_info3,KAPITELANFANG,sh_oldworld_kapitel3anfang);
};

func void sh_oldworld_back3()
{
	Info_ClearChoices(sh_oldworld_info3);
};

func void sh_oldworld_kapitel3anfang()
{
	MIS_OLDWORLD = LOG_RUNNING;
	CreateInvItems(hero,itwr_paladinletter_mis,1);
	KNOWSPALADINS_ORE = TRUE;
	MIS_SCOUTMINE = LOG_SUCCESS;
	MIS_READYFORCHAPTER3 = TRUE;
	b_npc_isalivecheck(OLDWORLD_ZEN);
	b_kapitelwechsel(3,OLDWORLD_ZEN);
	Info_ClearChoices(sh_oldworld_info3);
	AI_StopProcessInfos(self);
};


instance SH_OLDWORLD_INFO4(C_INFO)
{
	npc = sh_oldworld;
	condition = sh_oldworld_info4_condition;
	information = sh_oldworld_info4_info;
	important = FALSE;
	permanent = TRUE;
	description = KAPWECHSEL_4;
};


func int sh_oldworld_info4_condition()
{
	return TRUE;
};

func void sh_oldworld_info4_info()
{
	Info_ClearChoices(sh_oldworld_info4);
	Info_AddChoice(sh_oldworld_info4,DIALOG_BACK,sh_oldworld_back4);
	Info_AddChoice(sh_oldworld_info4,KAPITELANFANG,sh_oldworld_kapitel4anfang);
};

func void sh_oldworld_back4()
{
	Info_ClearChoices(sh_oldworld_info4);
};

func void sh_oldworld_kapitel4anfang()
{
	MIS_OLDWORLD = LOG_RUNNING;
	CreateInvItems(hero,itwr_paladinletter_mis,1);
	KNOWSPALADINS_ORE = TRUE;
	MIS_SCOUTMINE = LOG_SUCCESS;
	MIS_READYFORCHAPTER3 = TRUE;
	b_npc_isalivecheck(OLDWORLD_ZEN);
	b_kapitelwechsel(3,OLDWORLD_ZEN);
	PLAYER_TALENT_ALCHEMY[CHARGE_INNOSEYE] = TRUE;
	PrintScreen(PRINT_LEARNALCHEMYINNOSEYE,-1,-1,FONT_SCREEN,2);
	CreateInvItems(hero,itmi_innoseye_mis,1);
	MIS_READYFORCHAPTER4 = TRUE;
	b_npc_isalivecheck(OLDWORLD_ZEN);
	b_kapitelwechsel(4,OLDWORLD_ZEN);
	Info_ClearChoices(sh_oldworld_info4);
	AI_StopProcessInfos(self);
};


instance SH_OLDWORLD_INFO5(C_INFO)
{
	npc = sh_oldworld;
	condition = sh_oldworld_info5_condition;
	information = sh_oldworld_info5_info;
	important = FALSE;
	permanent = TRUE;
	description = KAPWECHSEL_5;
};


func int sh_oldworld_info5_condition()
{
	return TRUE;
};

func void sh_oldworld_info5_info()
{
	Info_ClearChoices(sh_oldworld_info5);
	Info_AddChoice(sh_oldworld_info5,DIALOG_BACK,sh_oldworld_back5);
	Info_AddChoice(sh_oldworld_info5,KAPITELANFANG,sh_oldworld_kapitel5anfang);
};

func void sh_oldworld_back5()
{
	Info_ClearChoices(sh_oldworld_info5);
};

func void sh_oldworld_kapitel5anfang()
{
	MIS_OLDWORLD = LOG_RUNNING;
	CreateInvItems(hero,itwr_paladinletter_mis,1);
	KNOWSPALADINS_ORE = TRUE;
	MIS_SCOUTMINE = LOG_SUCCESS;
	MIS_READYFORCHAPTER3 = TRUE;
	b_npc_isalivecheck(OLDWORLD_ZEN);
	b_kapitelwechsel(3,OLDWORLD_ZEN);
	PLAYER_TALENT_ALCHEMY[CHARGE_INNOSEYE] = TRUE;
	PrintScreen(PRINT_LEARNALCHEMYINNOSEYE,-1,-1,FONT_SCREEN,2);
	CreateInvItems(hero,itmi_innoseye_mis,1);
	MIS_READYFORCHAPTER4 = TRUE;
	b_npc_isalivecheck(OLDWORLD_ZEN);
	b_kapitelwechsel(4,OLDWORLD_ZEN);
	CreateInvItems(hero,itat_icedragonheart,1);
	MIS_ALLDRAGONSDEAD = TRUE;
	ENTERNW_KAPITEL5 = TRUE;
	b_kapitelwechsel(5,OLDWORLD_ZEN);
	Info_ClearChoices(sh_oldworld_info5);
	AI_StopProcessInfos(self);
};


instance SH_OLDWORLD_INFO6(C_INFO)
{
	npc = sh_oldworld;
	condition = sh_oldworld_info6_condition;
	information = sh_oldworld_info6_info;
	important = FALSE;
	permanent = TRUE;
	description = KAPWECHSEL_6;
};


func int sh_oldworld_info6_condition()
{
	return TRUE;
};

func void sh_oldworld_info6_info()
{
	Info_ClearChoices(sh_oldworld_info6);
	Info_AddChoice(sh_oldworld_info6,DIALOG_BACK,sh_oldworld_back6);
	Info_AddChoice(sh_oldworld_info6,KAPITELANFANG,sh_oldworld_kapitel6anfang);
};

func void sh_oldworld_back6()
{
	Info_ClearChoices(sh_oldworld_info6);
};

func void sh_oldworld_kapitel6anfang()
{
	b_kapitelwechsel(6,OLDWORLD_ZEN);
	Info_ClearChoices(sh_oldworld_info6);
	AI_StopProcessInfos(self);
};


/*instance DRAGON_TESTMODELL(MST_DEFAULT_DRAGON_FIRE)
{
	b_setvisuals_dragon_fire();
	Npc_SetToFistMode(self);
};

instance DIA_DRAGON_TESTMODELL_EXIT(C_INFO)
{
	npc = dragon_testmodell;
	nr = 999;
	condition = dia_dragon_testmodell_exit_condition;
	information = dia_dragon_testmodell_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_testmodell_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_testmodell_exit_info()
{
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
};


instance DIA_DRAGON_TESTMODELL_HELLO(C_INFO)
{
	npc = dragon_testmodell;
	nr = 1;
	condition = dia_dragon_testmodell_hello_condition;
	information = dia_dragon_testmodell_hello_info;
	permanent = TRUE;
	description = "Quatsch mich voll";
};


func int dia_dragon_testmodell_hello_condition()
{
	return TRUE;
};

func void dia_dragon_testmodell_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Testmodell_Hello_20_00");	//Du bist weit gekommen, kleiner Mensch, aber diese Halle wirst du nicht mehr lebend verlassen.
	AI_Output(self,other,"DIA_Dragon_Testmodell_Hello_20_00");	//Du bist weit gekommen, kleiner Mensch, aber diese Halle wirst du nicht mehr lebend verlassen.
	AI_Output(other,self,"DIA_Dragon_Testmodell_Hello_15_00");	//Mach nicht so einen Wind. Lass uns zur Sache kommen.
	AI_Output(self,other,"DIA_Dragon_Testmodell_Hello_20_00");	//Du bist weit gekommen, kleiner Mensch, aber diese Halle wirst du nicht mehr lebend verlassen.
	AI_Output(self,other,"DIA_Dragon_Testmodell_Hello_20_00");	//Du bist weit gekommen, kleiner Mensch, aber diese Halle wirst du nicht mehr lebend verlassen.
	AI_Output(self,other,"DIA_Dragon_Testmodell_Hello_20_00");	//Du bist weit gekommen, kleiner Mensch, aber diese Halle wirst du nicht mehr lebend verlassen.
	AI_Output(other,self,"DIA_Dragon_Testmodell_Hello_15_00");	//Mach nicht so einen Wind. Lass uns zur Sache kommen.
	AI_Output(other,self,"DIA_Dragon_Testmodell_Hello_15_00");	//Mach nicht so einen Wind. Lass uns zur Sache kommen.
	AI_Output(other,self,"DIA_Dragon_Testmodell_Hello_15_00");	//Mach nicht so einen Wind. Lass uns zur Sache kommen.
	AI_Output(self,other,"DIA_Dragon_Testmodell_Hello_20_00");	//Du bist weit gekommen, kleiner Mensch, aber diese Halle wirst du nicht mehr lebend verlassen.
	AI_Output(self,other,"DIA_Dragon_Testmodell_Hello_20_00");	//Du bist weit gekommen, kleiner Mensch, aber diese Halle wirst du nicht mehr lebend verlassen.
	AI_Output(other,self,"DIA_Dragon_Testmodell_Hello_15_00");	//Mach nicht so einen Wind. Lass uns zur Sache kommen.
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
};*/

