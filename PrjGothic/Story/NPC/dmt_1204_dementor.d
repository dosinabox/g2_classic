
instance DMT_1204_DEMENTOR(NPC_DEFAULT)
{
	name[0] = NAME_DEMENTOR;
	guild = GIL_DMT;
	id = 1204;
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
	daily_routine = rtn_start_1204;
};


func void rtn_start_1204()
{
	ta_circle(8,0,23,0,"NW_TROLLAREA_RITUAL_04");
	ta_circle(23,0,8,0,"NW_TROLLAREA_RITUAL_04");
};

func void rtn_afterritual_1204()
{
	ta_stand_dementor(6,0,7,0,"NW_BIGFARM_ALLEE_07");
	ta_stand_dementor(7,0,8,0,"NW_BIGMILL_PATH_05");
	ta_stand_dementor(8,0,9,0,"NW_BIGFARM_ALLEE_07");
	ta_stand_dementor(9,0,10,0,"NW_BIGMILL_PATH_05");
	ta_stand_dementor(10,0,11,0,"NW_BIGFARM_ALLEE_07");
	ta_stand_dementor(11,0,12,0,"NW_BIGMILL_PATH_05");
	ta_stand_dementor(12,0,13,0,"NW_BIGFARM_ALLEE_07");
	ta_stand_dementor(13,0,14,0,"NW_BIGMILL_PATH_05");
	ta_stand_dementor(14,0,15,0,"NW_BIGFARM_ALLEE_07");
	ta_stand_dementor(15,0,16,0,"NW_BIGMILL_PATH_05");
	ta_stand_dementor(16,0,17,0,"NW_BIGFARM_ALLEE_07");
	ta_stand_dementor(17,0,18,0,"NW_BIGMILL_PATH_05");
	ta_stand_dementor(18,0,19,0,"NW_BIGFARM_ALLEE_07");
	ta_stand_dementor(19,0,20,0,"NW_BIGMILL_PATH_05");
	ta_stand_dementor(20,0,21,0,"NW_BIGFARM_ALLEE_07");
	ta_stand_dementor(21,0,22,0,"NW_BIGMILL_PATH_05");
	ta_stand_dementor(22,0,23,0,"NW_BIGFARM_ALLEE_07");
	ta_stand_dementor(23,0,0,0,"NW_BIGMILL_PATH_05");
	ta_stand_dementor(0,0,1,0,"NW_BIGFARM_ALLEE_07");
	ta_stand_dementor(1,0,2,0,"NW_BIGMILL_PATH_05");
	ta_stand_dementor(2,0,3,0,"NW_BIGFARM_ALLEE_07");
	ta_stand_dementor(3,0,4,0,"NW_BIGMILL_PATH_05");
	ta_stand_dementor(4,0,5,0,"NW_BIGFARM_ALLEE_07");
	ta_stand_dementor(5,0,6,0,"NW_BIGMILL_PATH_05");
};

