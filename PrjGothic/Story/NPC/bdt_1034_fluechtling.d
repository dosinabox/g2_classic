
instance BDT_1034_FLUECHTLING(NPC_DEFAULT)
{
	name[0] = NAME_FLUECHTLING;
	guild = GIL_OUT;
	id = 1034;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Psionic",FACE_N_WEAK05,BODYTEX_N,itar_leather_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_1034;
};


func void rtn_start_1034()
{
	ta_stand_eating(8,0,23,0,"NW_TAVERNE_IN_06");
	ta_stand_eating(23,0,8,0,"NW_TAVERNE_IN_06");
};

