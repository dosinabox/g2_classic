
instance VLK_493_NAGUR(NPC_DEFAULT)
{
	name[0] = "Нагур";
	guild = GIL_VLK;
	id = 493;
	voice = 10;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL17,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_493;
};


func void rtn_start_493()
{
	ta_sit_chair(8,0,23,0,"NW_CITY_HABOUR_TAVERN01_02");
	ta_sit_chair(23,0,8,0,"NW_CITY_HABOUR_TAVERN01_02");
};

func void rtn_prison_493()
{
	ta_stand_armscrossed(8,0,23,0,"NW_CITY_HABOUR_KASERN_NAGUR");
	ta_stand_armscrossed(23,0,8,0,"NW_CITY_HABOUR_KASERN_NAGUR");
};

