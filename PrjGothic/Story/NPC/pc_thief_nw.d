
instance PC_THIEF_NW(NPC_DEFAULT)
{
	name[0] = "Диего";
	guild = GIL_NONE;
	id = 21;
	voice = 11;
	flags = 0;
	npctype = NPCTYPE_FRIEND;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_L_DIEGO,BODYTEX_L,itar_vlk_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_21;
};


func void rtn_start_21()
{
	ta_stand_wp(8,0,23,0,"NW_CITY_MERCHANT_TRADE_02");
	ta_stand_wp(23,0,8,0,"NW_CITY_MERCHANT_TRADE_02");
};

func void rtn_gerbrandt_21()
{
	ta_stand_wp(8,0,23,0,"NW_CITY_UPTOWN_PATH_23");
	ta_stand_wp(23,0,8,0,"NW_CITY_UPTOWN_PATH_23");
};

func void rtn_waitforship_21()
{
	ta_smalltalk(8,0,23,0,"NW_WAITFOR_SHIP_05");
	ta_smalltalk(23,0,8,0,"NW_WAITFOR_SHIP_05");
};

func void rtn_ship_21()
{
	ta_smalltalk(8,0,23,0,"SHIP_CREW_05");
	ta_smalltalk(23,0,8,0,"SHIP_CREW_05");
};

