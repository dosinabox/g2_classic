
instance VLK_489_BUERGER(NPC_DEFAULT)
{
	name[0] = NAME_BUERGER;
	guild = GIL_VLK;
	id = 489;
	voice = 8;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL14,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_489;
};


func void rtn_start_489()
{
	ta_smoke_joint(11,20,19,15,"NW_CITY_WATCH_FIGHT_02");
	ta_stand_drinking(19,15,2,30,"NW_CITY_HABOUR_03");
	ta_pee(21,0,21,5,"NW_CITY_HABOUR_PUFF_02_01");
	ta_stand_drinking(21,5,2,30,"NW_CITY_HABOUR_03");
	ta_stand_drinking(2,30,5,20,"NW_CITY_HABOUR_PUFF_IN_07");
	ta_smoke_joint(5,20,11,20,"NW_CITY_PATH_HABOUR_01");
};

