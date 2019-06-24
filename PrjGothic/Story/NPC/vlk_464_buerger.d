
instance VLK_464_BUERGER(NPC_DEFAULT)
{
	name[0] = NAME_BUERGER;
	guild = GIL_VLK;
	id = 464;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART_HUNO,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_464;
};


func void rtn_start_464()
{
	ta_smalltalk(8,0,23,0,"NW_CITY_PATH_HABOUR_BACK_ALLEY_02");
	ta_smalltalk(23,0,8,0,"NW_CITY_PATH_HABOUR_BACK_ALLEY_02");
};

