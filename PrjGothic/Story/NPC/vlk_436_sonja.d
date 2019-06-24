
instance VLK_436_SONJA(NPC_DEFAULT)
{
	name[0] = "Соня";
	guild = GIL_VLK;
	id = 436;
	voice = 16;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe6",FACEBABE_L_CHARLOTTE2,BODYTEXBABE_L,itar_vlkbabe_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_436;
};


func void rtn_start_436()
{
	ta_sit_throne(8,0,23,0,"NW_CITY_PUFF_THRONE");
	ta_sit_throne(23,0,8,0,"NW_CITY_PUFF_THRONE");
};

