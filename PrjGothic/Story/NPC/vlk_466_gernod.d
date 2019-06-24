
instance VLK_466_GERNOD(NPC_DEFAULT)
{
	name[0] = NAME_BUERGER;
	guild = GIL_VLK;
	id = 466;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_WEAK_ULBERT,BODYTEX_N,itar_vlk_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,40);
	daily_routine = rtn_start_466;
};


func void rtn_start_466()
{
	ta_sit_bench(6,5,15,0,"NW_CITY_HABOUR_POOR_AREA_HUT_03_B");
	ta_stand_drinking(15,0,18,0,"NW_CITY_HABOUR_POOR_AREA_HUT_03_B");
	ta_sit_bench(18,0,21,0,"NW_CITY_HABOUR_POOR_AREA_HUT_03_B");
	ta_stand_drinking(21,0,1,10,"NW_CITY_HABOUR_POOR_AREA_HUT_03_B");
	ta_sleep(1,10,6,5,"NW_CITY_HABOUR_POOR_AREA_HUT_05_BED_01");
};

