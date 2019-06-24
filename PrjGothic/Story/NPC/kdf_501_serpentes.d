
instance KDF_501_SERPENTES(NPC_DEFAULT)
{
	name[0] = "Серпентес";
	guild = GIL_KDF;
	id = 501;
	voice = 10;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	aivar[AIV_IGNORE_MURDER] = TRUE;
	aivar[AIV_IGNORE_THEFT] = TRUE;
	aivar[AIV_IGNORE_SHEEPKILLER] = TRUE;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_PSIONIC",FACE_N_IMPORTANTGREY,BODYTEX_N,itar_kdf_h);
	Mdl_SetModelFatness(self,-2);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_501;
};


func void rtn_start_501()
{
	ta_sit_throne(8,0,23,0,"NW_MONASTERY_THRONE_02");
	ta_sit_throne(23,0,8,0,"NW_MONASTERY_THRONE_02");
};

