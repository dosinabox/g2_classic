
instance SH(NPC_DEFAULT)
{
	name[0] = "Помощник по сюжету";
	guild = GIL_NONE;
	id = 9999;
	voice = 15;
	flags = 0;
	npctype = NPCTYPE_FRIEND;
	b_setattributestochapter(self,1);
	b_givenpctalents(self);
	fight_tactic = FAI_HUMAN_MASTER;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_N_PLAYER,BODYTEX_PLAYER_G1,-1);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	daily_routine = rtn_start_9999;
};


func void rtn_start_9999()
{
	ta_stand_armscrossed(8,0,23,0,"XXX");
	ta_stand_armscrossed(23,0,8,0,"XXX");
};


instance STORYHELPER_EXIT(C_INFO)
{
	npc = sh;
	nr = 999;
	condition = storyhelper_exit_condition;
	information = storyhelper_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int storyhelper_exit_condition()
{
	return TRUE;
};

func void storyhelper_exit_info()
{
	AI_StopProcessInfos(self);
};


instance STORYHELPER_INFO1(C_INFO)
{
	npc = sh;
	condition = storyhelper_info1_condition;
	information = storyhelper_info1_info;
	important = FALSE;
	permanent = TRUE;
	description = KAPWECHSEL_1;
};


func int storyhelper_info1_condition()
{
	return TRUE;
};

func void storyhelper_info1_info()
{
	Info_ClearChoices(storyhelper_info1);
	Info_AddChoice(storyhelper_info1,DIALOG_BACK,storyhelper_back1);
	Info_AddChoice(storyhelper_info1,KAPITELANFANG,storyhelper_kapitel1anfang);
};

func void storyhelper_back1()
{
	Info_ClearChoices(storyhelper_info1);
};

func void storyhelper_kapitel1anfang()
{
	b_kapitelwechsel(1,NEWWORLD_ZEN);
	AI_StopProcessInfos(self);
};


instance STORYHELPER_INFO2(C_INFO)
{
	npc = sh;
	condition = storyhelper_info2_condition;
	information = storyhelper_info2_info;
	important = FALSE;
	permanent = TRUE;
	description = KAPWECHSEL_2;
};


func int storyhelper_info2_condition()
{
	return TRUE;
};

func void storyhelper_info2_info()
{
	Info_ClearChoices(storyhelper_info2);
	Info_AddChoice(storyhelper_info2,DIALOG_BACK,storyhelper_back2);
	Info_AddChoice(storyhelper_info2,KAPITELANFANG,storyhelper_kapitel2anfang);
};

func void storyhelper_back2()
{
	Info_ClearChoices(storyhelper_info2);
};

func void storyhelper_kapitel2anfang()
{
	MIS_OLDWORLD = LOG_RUNNING;
	b_kapitelwechsel(2,NEWWORLD_ZEN);
	AI_StopProcessInfos(self);
};


instance STORYHELPER_INFO3(C_INFO)
{
	npc = sh;
	condition = storyhelper_info3_condition;
	information = storyhelper_info3_info;
	important = FALSE;
	permanent = TRUE;
	description = KAPWECHSEL_3;
};


func int storyhelper_info3_condition()
{
	return TRUE;
};

func void storyhelper_info3_info()
{
	Info_ClearChoices(storyhelper_info3);
	Info_AddChoice(storyhelper_info3,DIALOG_BACK,storyhelper_back3);
	Info_AddChoice(storyhelper_info3,KAPITELANFANG,storyhelper_kapitel3anfang);
};

func void storyhelper_back3()
{
	Info_ClearChoices(storyhelper_info3);
};

func void storyhelper_kapitel3anfang()
{
	MIS_OLDWORLD = LOG_RUNNING;
	CreateInvItems(hero,itwr_paladinletter_mis,1);
	KNOWSPALADINS_ORE = TRUE;
	MIS_SCOUTMINE = LOG_SUCCESS;
	MIS_READYFORCHAPTER3 = TRUE;
	b_npc_isalivecheck(OLDWORLD_ZEN);
	b_kapitelwechsel(3,NEWWORLD_ZEN);
	Info_ClearChoices(storyhelper_info3);
	AI_StopProcessInfos(self);
};


instance STORYHELPER_INFO4(C_INFO)
{
	npc = sh;
	condition = storyhelper_info4_condition;
	information = storyhelper_info4_info;
	important = FALSE;
	permanent = TRUE;
	description = KAPWECHSEL_4;
};


func int storyhelper_info4_condition()
{
	return TRUE;
};

func void storyhelper_info4_info()
{
	Info_ClearChoices(storyhelper_info4);
	Info_AddChoice(storyhelper_info4,DIALOG_BACK,storyhelper_back4);
	Info_AddChoice(storyhelper_info4,KAPITELANFANG,storyhelper_kapitel4anfang);
};

func void storyhelper_back4()
{
	Info_ClearChoices(storyhelper_info4);
};

func void storyhelper_kapitel4anfang()
{
	MIS_OLDWORLD = LOG_RUNNING;
	CreateInvItems(hero,itwr_paladinletter_mis,1);
	KNOWSPALADINS_ORE = TRUE;
	MIS_SCOUTMINE = LOG_SUCCESS;
	MIS_READYFORCHAPTER3 = TRUE;
	b_npc_isalivecheck(OLDWORLD_ZEN);
	b_kapitelwechsel(3,NEWWORLD_ZEN);
	PLAYER_TALENT_ALCHEMY[CHARGE_INNOSEYE] = TRUE;
	PrintScreen(PRINT_LEARNALCHEMYINNOSEYE,-1,-1,FONT_SCREEN,2);
	CreateInvItems(hero,itmi_innoseye_mis,1);
	MIS_READYFORCHAPTER4 = TRUE;
	b_npc_isalivecheck(NEWWORLD_ZEN);
	b_kapitelwechsel(4,NEWWORLD_ZEN);
	Info_ClearChoices(storyhelper_info4);
	AI_StopProcessInfos(self);
};


instance STORYHELPER_INFO5(C_INFO)
{
	npc = sh;
	condition = storyhelper_info5_condition;
	information = storyhelper_info5_info;
	important = FALSE;
	permanent = TRUE;
	description = KAPWECHSEL_5;
};


func int storyhelper_info5_condition()
{
	return TRUE;
};

func void storyhelper_info5_info()
{
	Info_ClearChoices(storyhelper_info5);
	Info_AddChoice(storyhelper_info5,DIALOG_BACK,storyhelper_back5);
	Info_AddChoice(storyhelper_info5,KAPITELANFANG,storyhelper_kapitel5anfang);
};

func void storyhelper_back5()
{
	Info_ClearChoices(storyhelper_info5);
};

func void storyhelper_kapitel5anfang()
{
	MIS_OLDWORLD = LOG_RUNNING;
	CreateInvItems(hero,itwr_paladinletter_mis,1);
	KNOWSPALADINS_ORE = TRUE;
	MIS_SCOUTMINE = LOG_SUCCESS;
	MIS_READYFORCHAPTER3 = TRUE;
	b_npc_isalivecheck(OLDWORLD_ZEN);
	b_kapitelwechsel(3,NEWWORLD_ZEN);
	PLAYER_TALENT_ALCHEMY[CHARGE_INNOSEYE] = TRUE;
	PrintScreen(PRINT_LEARNALCHEMYINNOSEYE,-1,-1,FONT_SCREEN,2);
	CreateInvItems(hero,itmi_innoseye_mis,1);
	MIS_READYFORCHAPTER4 = TRUE;
	b_npc_isalivecheck(NEWWORLD_ZEN);
	b_kapitelwechsel(4,NEWWORLD_ZEN);
	CreateInvItems(hero,itat_icedragonheart,1);
	MIS_ALLDRAGONSDEAD = TRUE;
	b_kapitelwechsel(5,NEWWORLD_ZEN);
	Info_ClearChoices(storyhelper_info5);
	AI_StopProcessInfos(self);
};


instance STORYHELPER_INFO6(C_INFO)
{
	npc = sh;
	condition = storyhelper_info6_condition;
	information = storyhelper_info6_info;
	important = FALSE;
	permanent = TRUE;
	description = KAPWECHSEL_6;
};


func int storyhelper_info6_condition()
{
	return TRUE;
};

func void storyhelper_info6_info()
{
	Info_ClearChoices(storyhelper_info6);
	Info_AddChoice(storyhelper_info6,DIALOG_BACK,storyhelper_back6);
	Info_AddChoice(storyhelper_info6,KAPITELANFANG,storyhelper_kapitel6anfang);
};

func void storyhelper_back6()
{
	Info_ClearChoices(storyhelper_info6);
};

func void storyhelper_kapitel6anfang()
{
	b_kapitelwechsel(6,NEWWORLD_ZEN);
	Info_ClearChoices(storyhelper_info6);
	AI_StopProcessInfos(self);
};

