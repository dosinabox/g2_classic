
instance VLK_449_LARES(NPC_DEFAULT)
{
	name[0] = "Ларес";
	guild = GIL_NONE;
	id = 449;
	voice = 9;
	flags = 0;
	npctype = NPCTYPE_FRIEND;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	CreateInvItems(self,itmi_gold,100);
	CreateInvItems(self,itmi_oldcoin,1);
	CreateInvItems(self,itpo_health_02,5);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_N_LARES,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,35);
	daily_routine = rtn_prestart_449;
};


func void rtn_prestart_449()
{
	ta_stand_guarding(8,0,20,0,"NW_CITY_HABOUR_02_B");
	ta_stand_guarding(20,0,8,0,"NW_CITY_HABOUR_02_B");
};

func void rtn_start_449()
{
	ta_stand_guarding(4,35,20,5,"NW_CITY_HABOUR_02_B");
	ta_sit_chair(20,5,4,35,"NW_CITY_HABOUR_TAVERN01_08");
};

func void rtn_guide_449()
{
	ta_guide_player(8,0,20,0,"NW_TAVERNE_04");
	ta_guide_player(20,0,8,0,"NW_TAVERNE_04");
};

func void rtn_waitforship_449()
{
	ta_smalltalk(8,0,20,0,"NW_WAITFOR_SHIP_05");
	ta_smalltalk(20,0,8,0,"NW_WAITFOR_SHIP_05");
};

func void rtn_shipoff_449()
{
	ta_stand_guarding(4,35,20,5,"NW_CITY_HABOUR_02_B");
	ta_sit_chair(20,5,4,35,"NW_CITY_HABOUR_TAVERN01_08");
};

func void rtn_ship_449()
{
	ta_smalltalk(8,0,23,0,"SHIP_CREW_05");
	ta_smalltalk(23,0,8,0,"SHIP_CREW_05");
};

