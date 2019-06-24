
instance VLK_434_BORKA(NPC_DEFAULT)
{
	name[0] = "Борка";
	guild = GIL_VLK;
	id = 434;
	voice = 11;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_bau_mace);
	CreateInvItems(self,itmi_joint,20);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_L_IAN,BODYTEX_L,itar_vlk_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_434;
};


func void rtn_start_434()
{
	ta_stand_armscrossed(8,0,22,0,"NW_CITY_HABOUR_PUFF_ENTRANCE");
	ta_stand_armscrossed(22,0,8,0,"NW_CITY_HABOUR_PUFF_ENTRANCE");
};

func void rtn_prison_434()
{
	ta_sit_campfire(8,0,22,0,"NW_CITY_HABOUR_KASERN_BORKA");
	ta_sit_campfire(22,0,8,0,"NW_CITY_HABOUR_KASERN_BORKA");
};

