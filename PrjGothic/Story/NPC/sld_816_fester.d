
instance SLD_816_FESTER(NPC_DEFAULT)
{
	name[0] = "Фестер";
	guild = GIL_SLD;
	id = 816;
	voice = 8;
	flags = 0;
	npctype = NPCTYPE_FRIEND;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_sld_axe);
	EquipItem(self,itrw_sld_bow);
	CreateInvItems(self,itrw_arrow,10);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMALBART05,BODYTEX_N,itar_sld_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	b_addfightskill(self,NPC_TALENT_BOW,30);
	daily_routine = rtn_start_816;
};


func void rtn_start_816()
{
	ta_practice_sword(5,0,6,0,"NW_BIGFARM_ALLEE_04");
	ta_practice_sword(6,0,7,0,"NW_BIGFARM_ALLEE_02");
	ta_practice_sword(7,0,8,0,"NW_BIGFARM_ALLEE_04");
	ta_practice_sword(8,0,9,0,"NW_BIGFARM_ALLEE_02");
	ta_practice_sword(9,0,10,0,"NW_BIGFARM_ALLEE_04");
	ta_practice_sword(10,0,11,0,"NW_BIGFARM_ALLEE_02");
	ta_practice_sword(11,0,12,0,"NW_BIGFARM_ALLEE_04");
	ta_practice_sword(12,0,13,0,"NW_BIGFARM_ALLEE_02");
	ta_practice_sword(13,0,14,0,"NW_BIGFARM_ALLEE_04");
	ta_practice_sword(14,0,15,0,"NW_BIGFARM_ALLEE_02");
	ta_practice_sword(15,0,16,0,"NW_BIGFARM_ALLEE_04");
	ta_practice_sword(16,0,17,0,"NW_BIGFARM_ALLEE_02");
	ta_practice_sword(17,0,18,0,"NW_BIGFARM_ALLEE_04");
	ta_practice_sword(18,0,19,0,"NW_BIGFARM_ALLEE_02");
	ta_practice_sword(19,0,20,0,"NW_BIGFARM_ALLEE_04");
	ta_sit_campfire(20,0,5,0,"NW_BIGFARM_VORPOSTEN1_01");
};

func void rtn_guide_816()
{
	ta_guide_player(8,0,20,0,"NW_BIGFARM_FELDREUBER4");
	ta_guide_player(20,0,8,0,"NW_BIGFARM_FELDREUBER4");
};

