
instance KDF_502_ULTHAR(NPC_DEFAULT)
{
	name[0] = "Ультар";
	guild = GIL_KDF;
	id = 502;
	voice = 5;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	aivar[AIV_IGNORE_MURDER] = TRUE;
	aivar[AIV_IGNORE_THEFT] = TRUE;
	aivar[AIV_IGNORE_SHEEPKILLER] = TRUE;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_L_NORMALBART01,BODYTEX_L,itar_kdf_h);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_502;
};


func void rtn_start_502()
{
	ta_sit_throne(8,0,23,0,"NW_MONASTERY_THRONE_03");
	ta_sit_throne(23,0,8,0,"NW_MONASTERY_THRONE_03");
};

