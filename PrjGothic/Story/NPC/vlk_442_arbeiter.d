
instance VLK_442_ARBEITER(NPC_DEFAULT)
{
	name[0] = "Работник";
	guild = GIL_VLK;
	id = 442;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART_SENYAN,BODYTEX_N,itar_bau_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_442;
};


func void rtn_start_442()
{
	ta_repair_hut(5,0,19,0,"NW_CITY_HABOUR_WERFT_ENTRY");
	ta_smalltalk(19,0,5,0,"NW_CITY_PATH_HABOUR_01");
};

