
instance MIL_325_MILIZ(NPC_DEFAULT)
{
	name[0] = NAME_MILIZ;
	guild = GIL_MIL;
	id = 325;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_NEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_B_TOUGH_SILAS,BODYTEX_B,itar_mil_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_325;
};


func void rtn_start_325()
{
	ta_guard_passage(8,0,23,0,"NW_CITY_MERCHANT_PATH_02");
	ta_guard_passage(23,0,8,0,"NW_CITY_MERCHANT_PATH_02");
};

