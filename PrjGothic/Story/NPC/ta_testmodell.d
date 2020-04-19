
instance TA_TESTMODELL(NPC_DEFAULT)
{
	name[0] = "TA_Testmodell";
	guild = GIL_NONE;
	id = 1500;
	voice = 1;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_OLDBALD_JEREMIAH,BODYTEX_N,0);
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_1500;
};


func void rtn_start_1500()
{
	ta_cook_cauldron(0,0,0,15,"WP_COOK_CAULDRON");
	ta_pee(0,15,0,30,"WP_WASH");
	ta_cook_pan(0,30,0,45,"WP_COOK_PAN");
	ta_pick_fp(0,45,1,0,"WP_PICK");
	ta_pick_ore(1,0,1,15,"WP_PICK_ORE");
	ta_practice_magic(1,15,1,30,"WP_STAND");
	ta_potion_alchemy(1,30,1,45,"WP_POTION_ALCHEMY");
	ta_pray_innos_fp(1,45,2,0,"WP_PRAY");
	ta_pray_innos(2,0,2,15,"WP_PRAY_INNOS_STATUE");
	ta_practice_sword(2,15,2,30,"WP_MOBSIS_ALLE");
	ta_play_lute(2,30,2,45,"WP_STAND");
	ta_read_bookstand(2,45,3,0,"WP_READ_BOOKSTAND");
	ta_repair_hut(3,0,3,15,"WP_REPAIR_HUT");
	ta_roast_scavenger(3,15,3,30,"WP_ROAST_SCAVENGER");
	ta_sit_campfire(3,30,3,45,"WP_STAND");
	ta_sit_bench(3,45,4,0,"WP_SIT_BENCH");
	ta_smoke_joint(4,0,4,15,"WP_STAND");
	ta_sit_chair(4,15,4,30,"WP_SIT_CHAIR");
	ta_sit_throne(4,30,4,45,"WP_SIT_THRONE");
	ta_smalltalk(4,45,5,0,"WP_SMALLTALK");
	ta_smith_fire(5,0,5,15,"WP_SMITH_FIRE");
	ta_smith_anvil(5,15,5,30,"WP_SMITH_ANVIL");
	ta_smith_cool(5,30,5,45,"WP_SMITH_COOL");
	ta_smith_sharp(5,45,6,0,"WP_SMITH_SHARP");
	ta_sleep(6,0,6,15,"WP_SLEEP");
	ta_stand_armscrossed(6,15,6,30,"WP_STAND");
	ta_smoke_waterpipe(6,30,6,45,"WP_SMOKE_WATERPIPE");
	ta_stand_guarding(6,45,7,0,"WP_STAND");
	ta_stand_eating(7,0,7,15,"WP_STAND");
	ta_spit_fire(7,15,7,30,"WP_STAND");
	ta_stand_drinking(7,30,7,45,"WP_STAND");
	ta_stand_sweeping(7,45,8,0,"WP_STAND");
	ta_rake_fp(8,0,8,15,"WP_PICK");
	ta_cook_stove(8,15,8,30,"WP_COOK_STOVE");
	ta_saw(8,30,8,45,"WP_SAW");
	ta_pray_innos(8,45,9,0,"WP_PRAY_INNOS_STATUE");
	ta_pray_innos_fp(9,0,9,15,"WP_PRAY");
	ta_wash_fp(9,15,9,30,"WP_WASH");
	ta_stomp_herb(9,30,9,45,"WP_STOMP_HERB");
	ta_pick_fp(9,45,10,15,"WP_PICK");
	ta_pick_fp(10,15,24,0,"WP_PRAY");
};

func void rtn_guide_1500()
{
	ta_guide_player(6,0,18,0,"WP_GUIDE_PLAYER");
	ta_guide_player(18,0,6,0,"WP_GUIDE_PLAYER");
};

func void rtn_follow_1500()
{
	ta_follow_player(6,0,18,0,"WP_FOLLOW_PLAYER");
	ta_follow_player(18,0,6,0,"WP_FOLLOW_PLAYER");
};


instance DIA_TA_TESTMODELL_EXIT(C_INFO)
{
	npc = ta_testmodell;
	nr = 999;
	condition = dia_ta_testmodell_exit_condition;
	information = dia_ta_testmodell_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ta_testmodell_exit_condition()
{
	return TRUE;
};

func void dia_ta_testmodell_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_TA_TESTMODELL_GUIDESTART(C_INFO)
{
	npc = ta_testmodell;
	nr = 997;
	condition = dia_ta_testmodell_guidestart_condition;
	information = dia_ta_testmodell_guidestart_info;
	permanent = TRUE;
	description = "Zeig mir den Guide_Player!";
};


func int dia_ta_testmodell_guidestart_condition()
{
	var C_NPC testmodell;
	testmodell = Hlp_GetNpc(ta_testmodell);
	if(!Npc_IsInRoutine(self,zs_guide_player))
	{
		return 1;
	};
};

func void dia_ta_testmodell_guidestart_info()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Guide");
};


instance INFO_TA_TESTMODELL_GUIDEEND(C_INFO)
{
	npc = ta_testmodell;
	nr = 998;
	condition = dia_ta_testmodell_guideend_condition;
	information = dia_ta_testmodell_guideend_info;
	permanent = TRUE;
	description = "Beende den Guide_Player!";
};


func int dia_ta_testmodell_guideend_condition()
{
	var C_NPC testmodell;
	testmodell = Hlp_GetNpc(ta_testmodell);
	if(Npc_IsInRoutine(self,zs_guide_player))
	{
		return 1;
	};
};

func void dia_ta_testmodell_guideend_info()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance INFO_TA_TESTMODELL_FOLLOWSTART(C_INFO)
{
	npc = ta_testmodell;
	nr = 995;
	condition = dia_ta_testmodell_followstart_condition;
	information = dia_ta_testmodell_followstart_info;
	permanent = TRUE;
	description = "Folge mir!";
};


func int dia_ta_testmodell_followstart_condition()
{
	var C_NPC testmodell;
	testmodell = Hlp_GetNpc(ta_testmodell);
	if(!Npc_IsInRoutine(self,zs_follow_player))
	{
		return 1;
	};
};

func void dia_ta_testmodell_followstart_info()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance INFO_TA_TESTMODELL_FOLLOWEND(C_INFO)
{
	npc = ta_testmodell;
	nr = 998;
	condition = dia_ta_testmodell_followend_condition;
	information = dia_ta_testmodell_followend_info;
	permanent = TRUE;
	description = "Hör auf mir zu folgen!";
};


func int dia_ta_testmodell_followend_condition()
{
	var C_NPC testmodell;
	testmodell = Hlp_GetNpc(ta_testmodell);
	if(Npc_IsInRoutine(self,zs_follow_player))
	{
		return 1;
	};
};

func void dia_ta_testmodell_followend_info()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance TA_SMALLTALKPARTNER(NPC_DEFAULT)
{
	name[0] = "Smalltalkpartner";
	guild = GIL_NONE;
	id = 1501;
	voice = 1;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_OLDBALD_JEREMIAH,BODYTEX_N,0);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_1501;
};


func void rtn_start_1501()
{
	ta_smalltalk(11,0,23,0,"WP_SMALLTALK");
	ta_smalltalk(23,0,11,0,"WP_SMALLTALK");
};

func void startup_ta_testlevel()
{
	Wld_InsertNpc(ta_testmodell,"WP_SMALLTALK");
	Wld_InsertNpc(ta_smalltalkpartner,"WP_SMALLTALK");
};


instance GOLD(C_ITEM)
{
	name = "Ein Beutel voll Gold!";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = usegold;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void usegold()
{
	CreateInvItems(self,itmi_gold,1000);
	PrintScreen("1000 Gold erhalten.",-1,45,FONT_SCREEN,3);
	Snd_Play("Geldbeutel");
	PrintScreen("Cheater Malus: -100 EXP",-1,55,FONT_SCREEN,3);
	if(hero.exp >= 100)
	{
		hero.exp = hero.exp - 100;
	}
	else
	{
		hero.exp = 0;
	};
};


instance HOSH1(C_ITEM)
{
	name = "Unsterblich";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usehosh1;
	scemename = "MAP";
	description = "Setzt das Immortal Flag";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void usehosh1()
{
	self.flags = NPC_FLAG_IMMORTAL;
};


instance HOSH2(C_ITEM)
{
	name = "Sterblich";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usehosh2;
	scemename = "MAP";
	description = "Klaut das Immortal flag";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void usehosh2()
{
	self.flags = 0;
};


/*instance HOSH3(C_ITEM)
{
	name = "Sumpfdrache immortal klauen";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usehosh3;
	scemename = "MAP";
	description = "Novizenchade SUCCESS";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void usehosh3()
{
	SWAMPDRAGON = Hlp_GetNpc(dragon_rock);
	swampdragon.senses_range = dragon_rock;
};*/


instance HOSH4(C_ITEM)
{
	name = "Sumpfdrache immortal machen";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Tagebuch";
	text[0] = "Das Tagebuch von Hoshi";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usehoshitagebuch;
};


func void usehoshitagebuch()
{
	SWAMPDRAGON = Hlp_GetNpc(dragon_swamp);
	swampdragon.flags = NPC_FLAG_IMMORTAL;
};

