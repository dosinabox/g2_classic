
instance KDF_508_GORAX(NPC_DEFAULT)
{
	name[0] = "Горакс";
	guild = GIL_KDF;
	id = 508;
	voice = 14;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_COWARD;
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_OLDBALD_JEREMIAH,BODYTEX_N,itar_kdf_l);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_508;
};


func void rtn_start_508()
{
	ta_stand_guarding(8,0,23,0,"NW_MONASTERY_WINEMAKER_01");
	ta_sleep(23,0,8,0,"NW_MONASTERY_MAGE02_BED_01");
};

