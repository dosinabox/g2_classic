
instance VLK_435_NADJA(NPC_DEFAULT)
{
	name[0] = "Надя";
	guild = GIL_VLK;
	id = 435;
	voice = 16;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe8",FACEBABE_N_HURE,BODYTEX_N,itar_vlkbabe_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_435;
};


func void rtn_start_435()
{
	ta_stand_drinking(5,0,17,0,"NW_PUFF_DANCE");
	ta_dance(17,0,21,0,"NW_PUFF_DANCE");
	ta_stand_drinking(21,0,21,30,"NW_PUFF_DANCE");
	ta_dance(21,30,5,0,"NW_PUFF_DANCE");
};

func void rtn_dance_435()
{
	ta_stand_armscrossed(8,0,22,0,"NW_CITY_HABOUR_PUFF_NADJA");
	ta_stand_armscrossed(22,0,8,0,"NW_CITY_HABOUR_PUFF_NADJA");
};

func void rtn_smoke_435()
{
	ta_smoke_joint(5,0,17,0,"NW_PUFF_DANCE");
	ta_dance(17,0,21,0,"NW_PUFF_DANCE");
	ta_smoke_joint(21,0,21,30,"NW_PUFF_DANCE");
	ta_dance(21,30,5,0,"NW_PUFF_DANCE");
};

func void rtn_tot_435()
{
	ta_stand_guarding(0,0,12,0,"TOT");
	ta_stand_guarding(12,0,0,0,"TOT");
};

