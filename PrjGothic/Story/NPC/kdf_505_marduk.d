
instance KDF_505_MARDUK(NPC_DEFAULT)
{
	name[0] = "Мардук";
	guild = GIL_KDF;
	id = 505;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_P_OLDMAN_GRAVO,BODYTEX_P,itar_kdf_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_505;
};


func void rtn_start_505()
{
	ta_stand_guarding(8,0,23,0,"NW_MONASTERY_CORRIDOR_03");
	ta_sleep(23,0,8,0,"NW_MONASTERY_MAGE01_BED_01");
};

