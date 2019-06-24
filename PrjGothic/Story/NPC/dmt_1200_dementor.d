
instance DMT_1200_DEMENTOR(NPC_DEFAULT)
{
	name[0] = NAME_DEMENTOR;
	guild = GIL_DMT;
	id = 1200;
	voice = 19;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	aivar[AIV_MAGICUSER] = MAGIC_ALWAYS;
	bodystateinterruptableoverride = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_MADPSI,BODYTEX_N,itar_dementor);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_1200;
};


func void rtn_start_1200()
{
	ta_stand_dementor(8,0,23,0,"NW_TROLLAREA_PATH_47");
	ta_stand_dementor(23,0,8,0,"NW_TROLLAREA_PATH_47");
};

