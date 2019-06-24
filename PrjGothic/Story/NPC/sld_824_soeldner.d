
instance SLD_824_SOELDNER(NPC_DEFAULT)
{
	name[0] = NAME_SOELDNER;
	guild = GIL_SLD;
	id = 824;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_B_TOUGHBALD,BODYTEX_B,itar_sld_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_824;
};


func void rtn_start_824()
{
	ta_stand_armscrossed(8,0,22,0,"NW_BIGFARM_HOUSE_OUT_02");
	ta_stand_armscrossed(22,0,8,0,"NW_BIGFARM_HOUSE_OUT_02");
};

