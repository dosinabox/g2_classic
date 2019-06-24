
instance VLK_443_ARBEITER(NPC_DEFAULT)
{
	name[0] = "Работник";
	guild = GIL_VLK;
	id = 443;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_mace_l_04);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_WEAK04,BODYTEX_N,itar_bau_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_443;
};


func void rtn_start_443()
{
	ta_saw(4,55,19,5,"NW_CITY_HABOUR_08");
	ta_smalltalk(19,5,4,55,"NW_CITY_HABOUR_02");
};

