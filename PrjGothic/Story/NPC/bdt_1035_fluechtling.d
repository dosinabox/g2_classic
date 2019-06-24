
instance BDT_1035_FLUECHTLING(NPC_DEFAULT)
{
	name[0] = NAME_FLUECHTLING;
	guild = GIL_OUT;
	id = 1035;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_B_NORMAL_ORIK,BODYTEX_B,itar_leather_l);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_1035;
};


func void rtn_start_1035()
{
	ta_smalltalk(8,0,23,0,"NW_BIGFARM_HOUSE_OUT_05");
	ta_smalltalk(23,0,8,0,"NW_BIGFARM_HOUSE_OUT_05");
};

