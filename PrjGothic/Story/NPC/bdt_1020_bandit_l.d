
instance BDT_1020_BANDIT_L(NPC_DEFAULT)
{
	name[0] = "Разбойник";
	guild = GIL_BDT;
	id = 1020;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	aivar[AIV_DROPDEADANDKILL] = TRUE;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fatbald",FACE_N_MUD,BODYTEX_N,itar_leather_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	ta_guard_passage(0,0,12,0,"NW_TROLLAREA_PATH_47");
	ta_guard_passage(12,0,0,0,"NW_TROLLAREA_PATH_47");
};

