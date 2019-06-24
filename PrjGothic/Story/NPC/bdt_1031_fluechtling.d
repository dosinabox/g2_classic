
instance BDT_1031_FLUECHTLING(NPC_DEFAULT)
{
	name[0] = NAME_FLUECHTLING;
	guild = GIL_BDT;
	id = 1031;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	CreateInvItems(self,itwr_morgahardtip,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_B_NORMAL01,BODYTEX_B,itar_leather_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_1031;
};


func void rtn_start_1031()
{
	ta_sit_chair(8,0,23,0,"NW_XARDAS_BANDITS_LEFT");
	ta_sit_chair(23,0,8,0,"NW_XARDAS_BANDITS_LEFT");
};

