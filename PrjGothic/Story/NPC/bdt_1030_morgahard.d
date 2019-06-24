
instance BDT_1030_MORGAHARD(NPC_DEFAULT)
{
	name[0] = "Моргахард";
	guild = GIL_OUT;
	id = 1030;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	CreateInvItems(self,itwr_richterkomprobrief_mis,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_BARTHOLO,BODYTEX_N,itar_bdt_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_1030;
};


func void rtn_start_1030()
{
	ta_smalltalk(8,0,23,0,"NW_BIGFARM_HOUSE_OUT_05");
	ta_smalltalk(23,0,8,0,"NW_BIGFARM_HOUSE_OUT_05");
};

