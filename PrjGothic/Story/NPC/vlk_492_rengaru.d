
instance VLK_492_RENGARU(NPC_DEFAULT)
{
	name[0] = "Ренгару";
	guild = GIL_VLK;
	id = 492;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_sword);
	CreateInvItems(self,itmi_gold,50);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_TOUGHBART01,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_492;
};


func void rtn_start_492()
{
	ta_stand_armscrossed(5,15,20,15,"NW_CITY_MERCHANT_PATH_36");
	ta_stand_drinking(20,15,5,15,"NW_CITY_MERCHANT_PATH_33_B");
};

func void rtn_runaway_492()
{
	ta_fleetowp(8,0,23,0,"NW_CITY_HABOUR_KASERN_05_01");
	ta_fleetowp(23,0,8,0,"NW_CITY_HABOUR_KASERN_05_01");
};

func void rtn_prison_492()
{
	ta_stand_armscrossed(8,0,23,0,"NW_CITY_HABOUR_KASERN_RENGARU");
	ta_stand_armscrossed(23,0,8,0,"NW_CITY_HABOUR_KASERN_RENGARU");
};

