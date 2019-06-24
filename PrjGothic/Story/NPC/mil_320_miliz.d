
instance MIL_320_MILIZ(NPC_DEFAULT)
{
	name[0] = NAME_MILIZ;
	guild = GIL_MIL;
	id = 320;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_DRAX,BODYTEX_N,itar_mil_l);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_320;
};


func void rtn_start_320()
{
	ta_stand_guarding(5,0,20,15,"NW_CITY_MERCHANT_PATH_27");
	ta_stand_guarding(20,15,22,15,"NW_CITY_MERCHANT_PATH_36");
	ta_stand_guarding(22,15,0,15,"NW_CITY_MERCHANT_PATH_27");
	ta_stand_guarding(0,15,2,15,"NW_CITY_MERCHANT_PATH_36");
	ta_stand_guarding(2,15,4,15,"NW_CITY_MERCHANT_PATH_27");
	ta_stand_guarding(4,15,5,0,"NW_CITY_MERCHANT_PATH_36");
};

