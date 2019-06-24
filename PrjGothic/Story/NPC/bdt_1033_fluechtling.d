
instance BDT_1033_FLUECHTLING(NPC_DEFAULT)
{
	name[0] = NAME_FLUECHTLING;
	guild = GIL_OUT;
	id = 1033;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	CreateInvItems(self,itwr_morgahardtip,1);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART_GRAHAM,BODYTEX_N,itar_leather_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_1033;
};


func void rtn_start_1033()
{
	ta_stand_armscrossed(8,0,23,0,"NW_TAVERNE_IN_06");
	ta_stand_armscrossed(23,0,8,0,"NW_TAVERNE_IN_06");
};

