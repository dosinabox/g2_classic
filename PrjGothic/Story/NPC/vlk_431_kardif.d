
instance VLK_431_KARDIF(NPC_DEFAULT)
{
	name[0] = "Кардиф";
	guild = GIL_VLK;
	id = 431;
	voice = 14;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_bau_mace);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMALBART04,BODYTEX_N,itar_smith);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_431;
};


func void rtn_start_431()
{
	ta_stand_sweeping(8,0,11,0,"NW_CITY_HABOUR_TAVERN01_SMALLTALK_01");
	ta_stand_armscrossed(11,0,13,0,"NW_CITY_KARDIF");
	ta_stand_sweeping(13,0,16,0,"NW_CITY_HABOUR_TAVERN01_SMALLTALK_01");
	ta_stand_armscrossed(16,0,8,0,"NW_CITY_KARDIF");
};

