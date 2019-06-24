
instance VLK_420_CORAGON(NPC_DEFAULT)
{
	name[0] = "Корагон";
	guild = GIL_VLK;
	id = 420;
	voice = 5;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setfightskills(self,40);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_bau_mace);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald.",FACE_N_NORMAL_BLADE,BODYTEX_N,itar_smith);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_setattributestochapter(self,3);
	b_givenpctalents(self);
	daily_routine = rtn_start_420;
};


func void rtn_start_420()
{
	ta_stand_armscrossed(8,0,22,0,"NW_CITY_TAVERN_IN_03");
	ta_stand_armscrossed(22,0,8,0,"NW_CITY_TAVERN_IN_03");
};

