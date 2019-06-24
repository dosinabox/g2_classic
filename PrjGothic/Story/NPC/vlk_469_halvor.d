
instance VLK_469_HALVOR(NPC_DEFAULT)
{
	name[0] = "Халвор";
	guild = GIL_VLK;
	id = 469;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_mace_l_03);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART11,BODYTEX_N,itar_vlk_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,40);
	daily_routine = rtn_start_469;
};


func void rtn_start_469()
{
	ta_stand_armscrossed(5,0,20,0,"NW_CITY_HABOUR_POOR_AREA_PATH_01");
	ta_stand_drinking(20,0,1,0,"NW_CITY_HABOUR_PUFF_IN_07");
	ta_sleep(1,0,5,0,"NW_CITY_BED_HALVOR");
};

func void rtn_prison_469()
{
	ta_sit_campfire(8,0,22,0,"NW_CITY_HABOUR_KASERN_HALVOR");
	ta_sit_campfire(22,0,8,0,"NW_CITY_HABOUR_KASERN_HALVOR");
};

