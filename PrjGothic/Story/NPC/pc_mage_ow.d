
instance PC_MAGE_OW(NPC_DEFAULT)
{
	name[0] = "Милтен";
	guild = GIL_KDF;
	id = 2;
	voice = 3;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_FRIEND;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_MILTEN,BODYTEX_N,itar_kdf_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_2;
};


func void rtn_start_2()
{
	ta_potion_alchemy(8,0,23,0,"OC_MAGE_LAB_ALCHEMY");
	ta_read_bookstand(23,0,8,0,"OC_MAGE_LIBRARY_BOOK_01");
};

func void rtn_gornfree_2()
{
	ta_smalltalk(8,0,23,0,"OC_MAGE_LIBRARY_IN");
	ta_smalltalk(23,0,8,0,"OC_MAGE_LIBRARY_IN");
};

func void rtn_tot_2()
{
	ta_sleep(8,0,23,0,"TOT");
	ta_sleep(23,0,8,0,"TOT");
};

