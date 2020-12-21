
instance DMT_1299_OBERDEMENTOR_DI(NPC_DEFAULT)
{
	name[0] = "Черный маг";
	guild = GIL_DMT;
	id = 1299;
	voice = 9;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	aivar[AIV_MAGICUSER] = MAGIC_ALWAYS;
	bodystateinterruptableoverride = TRUE;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	b_createambientinv(self);
	CreateInvItems(self,itwr_lastdoortoundeaddrgdi_mis,1);
	CreateInvItems(self,itke_chestmasterdementor_mis,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_MADPSI,BODYTEX_TATTOO_N,itar_blackmage);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,90);
	daily_routine = rtn_start_1299;
};


func void rtn_start_1299()
{
	ta_stand_dementor(8,0,23,0,"DI_SCHWARZMAGIER");
	ta_stand_dementor(23,0,8,0,"DI_SCHWARZMAGIER");
};

