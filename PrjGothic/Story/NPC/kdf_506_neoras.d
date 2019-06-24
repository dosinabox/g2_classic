
instance KDF_506_NEORAS(NPC_DEFAULT)
{
	name[0] = "Неорас";
	guild = GIL_KDF;
	id = 506;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_P_NORMALBART_CRONOS,BODYTEX_P,itar_kdf_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_506;
};


func void rtn_start_506()
{
	ta_potion_alchemy(8,0,23,0,"NW_MONASTERY_ALCHEMY_01");
	ta_potion_alchemy(23,0,8,0,"NW_MONASTERY_ALCHEMY_01");
};

