
instance KDF_504_PARLAN(NPC_DEFAULT)
{
	name[0] = "Парлан";
	guild = GIL_KDF;
	id = 504;
	voice = 7;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	aivar[AIV_IGNORE_MURDER] = TRUE;
	aivar[AIV_IGNORE_THEFT] = TRUE;
	aivar[AIV_IGNORE_SHEEPKILLER] = TRUE;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_CORRISTO,BODYTEX_N,itar_kdf_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_504;
};


func void rtn_start_504()
{
	ta_stand_guarding(8,0,23,0,"NW_MONASTERY_PLACE_03");
	ta_stand_guarding(23,0,8,0,"NW_MONASTERY_PLACE_03");
};

