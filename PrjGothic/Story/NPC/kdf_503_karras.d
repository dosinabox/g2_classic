
instance KDF_503_KARRAS(NPC_DEFAULT)
{
	name[0] = "Каррас";
	guild = GIL_KDF;
	id = 503;
	voice = 10;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_L_NORMALBART02,BODYTEX_L,itar_kdf_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_503;
};


func void rtn_start_503()
{
	ta_read_bookstand(8,0,23,0,"NW_MONASTERY_RUNEMAKER_02");
	ta_read_bookstand(8,0,23,0,"NW_MONASTERY_RUNEMAKER_02");
};

