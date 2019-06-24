
instance VLK_471_EDDA(NPC_DEFAULT)
{
	name[0] = "Ýההא";
	guild = GIL_VLK;
	id = 471;
	voice = 17;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	EquipItem(self,itmw_1h_vlk_dagger);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe.",FACEBABE_B_REDLOCKS,BODYTEX_B,itar_vlkbabe_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_471;
};


func void rtn_start_471()
{
	ta_cook_cauldron(8,0,22,0,"NW_CITY_HABOUR_POOR_AREA_CAULDRON");
	ta_cook_cauldron(22,0,8,0,"NW_CITY_HABOUR_POOR_AREA_CAULDRON");
};

