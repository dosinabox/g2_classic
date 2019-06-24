
instance VLK_482_BUERGERIN(NPC_DEFAULT)
{
	name[0] = NAME_BUERGERIN;
	guild = GIL_VLK;
	id = 482;
	voice = 16;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	EquipItem(self,itmw_1h_vlk_dagger);
	b_setnpcvisual(self,FEMALE,"Hum_Head_BabeHair",FACEBABE_N_HAIRANDCLOTH,BODYTEX_N,itar_vlkbabe_l);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,15);
	daily_routine = rtn_start_482;
};


func void rtn_start_482()
{
	ta_smalltalk(12,0,16,0,"NW_CITY_HABOUR_STOMPER_01");
	ta_stomp_herb(16,0,20,0,"NW_CITY_HABOUR_STOMPER_01");
	ta_smalltalk(20,0,0,0,"NW_CITY_HABOUR_SMALLTALK_02");
	ta_sleep(0,0,5,0,"NW_CITY_HABOUR_HUT_06_BED_01");
};

