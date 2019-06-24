
instance KDF_507_TALAMON(NPC_DEFAULT)
{
	name[0] = "Таламон";
	guild = GIL_KDF;
	id = 507;
	voice = 4;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_B_SATURAS,BODYTEX_B,itar_kdf_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_507;
};


func void rtn_start_507()
{
	ta_guard_passage(8,0,23,0,"NW_MONASTERY_CELLAR_15");
	ta_guard_passage(23,0,8,0,"NW_MONASTERY_CELLAR_15");
};

