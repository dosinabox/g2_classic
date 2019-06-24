
instance VLK_491_VANJA(NPC_DEFAULT)
{
	name[0] = "Ваня";
	guild = GIL_VLK;
	id = 491;
	voice = 17;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe",FACEBABE_B_REDLOCKS,BODYTEXBABE_B,itar_vlkbabe_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,20);
	daily_routine = rtn_start_491;
};


func void rtn_start_491()
{
	ta_smalltalk(8,0,23,0,"NW_CITY_HABOUR_PUFF_VANJA");
	ta_smalltalk(23,0,8,0,"NW_CITY_HABOUR_PUFF_VANJA");
};

func void rtn_alone_491()
{
	ta_sweep_fp(8,0,23,0,"NW_CITY_HABOUR_PUFF_VANJA");
	ta_sweep_fp(23,0,8,0,"NW_CITY_HABOUR_PUFF_VANJA");
};

