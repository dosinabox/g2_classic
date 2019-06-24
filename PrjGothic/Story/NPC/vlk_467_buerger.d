
instance VLK_467_BUERGER(NPC_DEFAULT)
{
	name[0] = NAME_BUERGER;
	guild = GIL_VLK;
	id = 467;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_L_NORMAL_GORNABAR,BODYTEX_L,itar_vlk_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,40);
	daily_routine = rtn_start_467;
};


func void rtn_start_467()
{
	ta_stand_armscrossed(11,0,19,0,"NW_CITY_WATCH_FIGHT_02");
	ta_smalltalk(19,0,3,0,"NW_CITY_HABOUR_03");
	ta_sit_throne(3,0,5,0,"NW_CITY_PUFF_THRONE");
	ta_smalltalk(5,0,11,0,"NW_CITY_WAY_TO_SHIP_01");
};

