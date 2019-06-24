
instance VLK_453_BUERGER(NPC_DEFAULT)
{
	name[0] = "Работник";
	guild = GIL_VLK;
	id = 453;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMALBART22,BODYTEX_N,itar_bau_l);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_453;
};


func void rtn_start_453()
{
	ta_saw(5,10,6,10,"NW_CITY_POOR_SAW");
	ta_smith_sharp(6,10,7,10,"NW_CITY_POOR_SMITH_SHARP");
	ta_saw(7,10,8,10,"NW_CITY_POOR_SAW");
	ta_smith_sharp(8,10,9,10,"NW_CITY_POOR_SMITH_SHARP");
	ta_saw(9,10,10,10,"NW_CITY_POOR_SAW");
	ta_smith_sharp(10,10,11,10,"NW_CITY_POOR_SMITH_SHARP");
	ta_saw(11,10,12,10,"NW_CITY_POOR_SAW");
	ta_smith_sharp(12,10,13,10,"NW_CITY_POOR_SMITH_SHARP");
	ta_saw(13,10,14,10,"NW_CITY_POOR_SAW");
	ta_smith_sharp(14,10,15,10,"NW_CITY_POOR_SMITH_SHARP");
	ta_saw(15,10,16,10,"NW_CITY_POOR_SAW");
	ta_smith_sharp(16,10,17,10,"NW_CITY_POOR_SMITH_SHARP");
	ta_saw(17,10,18,10,"NW_CITY_POOR_SAW");
	ta_smith_sharp(18,10,19,10,"NW_CITY_POOR_SMITH_SHARP");
	ta_saw(19,10,20,5,"NW_CITY_POOR_SAW");
	ta_smalltalk(20,5,22,5,"NW_CITY_HABOUR_POOR_AREA_PATH_07");
	ta_stand_eating(22,5,0,55,"NW_CITY_HABOUR_POOR_AREA_HUT_03");
	ta_sleep(0,55,5,10,"NW_CITY_HABOUR_POOR_AREA_HUT_04_BED_02");
};

