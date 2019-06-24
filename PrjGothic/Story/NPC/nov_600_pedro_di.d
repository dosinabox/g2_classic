
instance NOV_600_PEDRO_DI(NPC_DEFAULT)
{
	name[0] = "Педро";
	guild = GIL_NONE;
	id = 6000;
	voice = 9;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_PSIONIC",FACE_L_NORMAL_GORNABAR,BODYTEX_L,itar_nov_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	daily_routine = rtn_start_6000;
};


func void rtn_start_6000()
{
	ta_sit_bench(8,0,23,0,"DI_ORKAREA_PEDRO");
	ta_sit_bench(23,0,8,0,"DI_ORKAREA_PEDRO");
};

func void rtn_ship_6000()
{
	ta_sit_bench(8,0,23,0,"SHIP_DECK_05");
	ta_sit_bench(23,0,8,0,"SHIP_DECK_05");
};

func void rtn_followship_6000()
{
	ta_follow_player(8,0,23,0,"SHIP");
	ta_follow_player(23,0,8,0,"SHIP");
};

func void rtn_sleepship_6000()
{
	ta_sleep(8,0,23,0,"SHIP_IN_06");
	ta_sleep(23,0,8,0,"SHIP_IN_06");
};

