
instance VLK_424_ALWIN(NPC_DEFAULT)
{
	name[0] = "Алвин";
	guild = GIL_VLK;
	id = 424;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_vlk_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_P_NORMALBART_RIORDIAN,BODYTEX_P,itar_barkeeper);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_424;
};


func void rtn_start_424()
{
	ta_sit_bench(8,0,22,0,"NW_CITY_PATH_HABOUR_18");
	ta_sleep(22,0,8,0,"NW_CITY_HABOUR_HUT_07_BED_01");
};

