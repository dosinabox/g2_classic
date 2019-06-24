
instance VLK_494_ATTILA(NPC_DEFAULT)
{
	name[0] = "Аттил";
	guild = GIL_VLK;
	id = 494;
	voice = 9;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	aivar[AIV_DROPDEADANDKILL] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_axe);
	EquipItem(self,itrw_mil_crossbow);
	CreateInvItem(self,itke_thiefguildkey_mis);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_L_TOUGH_SANTINO,BODYTEX_L,itar_leather_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_494;
};


func void rtn_start_494()
{
	ta_stand_guarding(4,0,22,0,"NW_CITY_HABOUR_POOR_AREA_BACK_ALLEY_02");
	ta_stand_guarding(22,0,4,0,"NW_CITY_HABOUR_POOR_AREA_BACK_ALLEY_02");
};

func void rtn_after_494()
{
	ta_stand_guarding(4,0,22,0,"NW_CITY_HABOUR_POOR_AREA_CAULDRON");
	ta_stand_guarding(22,0,4,0,"NW_CITY_HABOUR_POOR_AREA_CAULDRON");
};

