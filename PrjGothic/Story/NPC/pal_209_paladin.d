
instance PAL_209_PALADIN(NPC_DEFAULT)
{
	name[0] = NAME_RITTER;
	guild = GIL_PAL;
	id = 209;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_pal_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_P_NORMAL_FLETCHER,BODYTEX_P,itar_pal_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,55);
	daily_routine = rtn_start_209;
};


func void rtn_start_209()
{
	ta_practice_sword(7,10,19,2,"NW_CITY_TRAIN_02");
	ta_smalltalk(19,2,23,6,"NW_CITY_UPTOWN_HUT_03_01_B");
	ta_sleep(23,6,7,10,"NW_CITY_LEOMAR_BED_04");
};

