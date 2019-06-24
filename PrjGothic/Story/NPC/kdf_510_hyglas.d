
instance KDF_510_HYGLAS(NPC_DEFAULT)
{
	name[0] = "Хиглас";
	guild = GIL_KDF;
	id = 510;
	voice = 14;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_N_NORMALBART09,BODYTEX_N,itar_kdf_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_510;
};


func void rtn_start_510()
{
	ta_read_bookstand(8,0,23,0,"NW_MONASTERY_RUNEMAKER_08");
	ta_read_bookstand(23,0,8,0,"NW_MONASTERY_RUNEMAKER_08");
};

