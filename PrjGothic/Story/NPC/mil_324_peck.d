
instance MIL_324_PECK(NPC_DEFAULT)
{
	name[0] = "Пек";
	guild = GIL_MIL;
	id = 324;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	CreateInvItems(self,itke_city_tower_05,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_B_NORMAL_ORIK,BODYTEX_B,itar_mil_l);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,40);
	daily_routine = rtn_start_324;
};


func void rtn_start_324()
{
	ta_smalltalk(8,0,23,0,"NW_CITY_HABOUR_PUFF_PECK");
	ta_smalltalk(23,0,8,0,"NW_CITY_HABOUR_PUFF_PECK");
};

func void rtn_storage_324()
{
	ta_stand_armscrossed(8,0,22,0,"NW_CITY_ARMORY_PECK");
	ta_sleep(22,0,8,0,"NW_CITY_BARRACK02_BED_PECK");
};

