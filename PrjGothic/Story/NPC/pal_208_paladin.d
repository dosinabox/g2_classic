
instance PAL_208_PALADIN(NPC_DEFAULT)
{
	name[0] = NAME_RITTER;
	guild = GIL_PAL;
	id = 208;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_pal_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_DRAX,BODYTEX_N,itar_pal_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,55);
	daily_routine = rtn_start_208;
};


func void rtn_start_208()
{
	ta_smalltalk(8,0,19,2,"NW_CITY_UPTOWN_PATH_05_B");
	ta_smalltalk(19,2,23,0,"NW_CITY_UPTOWN_HUT_03_04");
	ta_sleep(23,0,7,0,"NW_CITY_LEOMAR_BED_06");
};

