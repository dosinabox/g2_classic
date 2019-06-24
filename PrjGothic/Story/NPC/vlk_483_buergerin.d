
instance VLK_483_BUERGERIN(NPC_DEFAULT)
{
	name[0] = NAME_BUERGERIN;
	guild = GIL_VLK;
	id = 483;
	voice = 16;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	EquipItem(self,itmw_1h_vlk_dagger);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe4",FACEBABE_N_VLKBLONDE,BODYTEX_N,itar_vlkbabe_m);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,15);
	daily_routine = rtn_start_483;
};


func void rtn_start_483()
{
	ta_smalltalk(8,0,18,0,"NW_CITY_HABOUR_09");
	ta_sleep(18,0,8,0,"NW_CITY_HABOUR_HUT_06_BED_01");
};

