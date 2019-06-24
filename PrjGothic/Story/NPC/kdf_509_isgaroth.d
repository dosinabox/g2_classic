
instance KDF_509_ISGAROTH(NPC_DEFAULT)
{
	name[0] = "ָסדאנמע";
	guild = GIL_KDF;
	id = 509;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_TOUGH_OKYL,BODYTEX_N,itar_kdf_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,90);
	daily_routine = rtn_start_509;
};


func void rtn_start_509()
{
	ta_pray_innos_fp(6,0,21,0,"NW_MONASTERY_SHRINE_04");
	ta_sit_bench(21,0,6,0,"NW_MONASTERY_SHRINE_05");
};

