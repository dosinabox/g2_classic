
instance BDT_1061_WACHE(NPC_DEFAULT)
{
	name[0] = NAME_WACHE;
	guild = GIL_BDT;
	id = 1061;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_shortsword2);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART17,BODYTEX_N,itar_leather_l);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_1061;
};


func void rtn_start_1061()
{
	ta_stand_guarding(0,0,12,0,"NW_CASTLEMINE_PATH_02");
	ta_stand_guarding(12,0,0,0,"NW_CASTLEMINE_PATH_02");
};

