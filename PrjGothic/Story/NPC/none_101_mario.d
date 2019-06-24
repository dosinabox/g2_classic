
instance NONE_101_MARIO(NPC_DEFAULT)
{
	name[0] = "Марио";
	guild = GIL_NONE;
	id = 101;
	voice = 7;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_2h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_B_NORMAL_KIRGO,BODYTEX_B,itar_mil_m);
	Mdl_SetModelFatness(self,1.2);
	Mdl_ApplyOverlayMds(self,"Humans_MILITIA.mds");
	b_givenpctalents(self);
	b_setfightskills(self,85);
	daily_routine = rtn_start_101;
};


func void rtn_start_101()
{
	ta_stand_drinking(8,0,21,0,"NW_CITY_HABOUR_TAVERN01_STAND_01");
	ta_stand_drinking(21,0,8,0,"NW_CITY_HABOUR_TAVERN01_STAND_01");
};

func void rtn_waitforship_101()
{
	ta_stand_drinking(8,0,19,0,"NW_WAITFOR_SHIP_01");
	ta_stand_drinking(19,0,8,0,"NW_WAITFOR_SHIP_01");
};

func void rtn_shipoff_101()
{
	ta_stand_drinking(8,0,21,0,"NW_CITY_HABOUR_TAVERN01_STAND_01");
	ta_stand_drinking(21,0,8,0,"NW_CITY_HABOUR_TAVERN01_STAND_01");
};

func void rtn_ship_101()
{
	ta_sit_bench(8,0,23,0,"SHIP_DECK_25");
	ta_sit_bench(23,0,8,0,"SHIP_DECK_25");
};

