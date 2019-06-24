
instance PAL_214_RITTER(NPC_DEFAULT)
{
	name[0] = NAME_RITTER;
	guild = GIL_PAL;
	id = 214;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_2h_pal_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_L_TOUGH01,BODYTEX_L,itar_pal_m);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,55);
	daily_routine = rtn_start_214;
};


func void rtn_start_214()
{
	ta_smalltalk(7,5,19,5,"NW_CITY_UPTOWN_PATH_05");
	ta_read_bookstand(19,5,23,0,"NW_CITY_UPTOWN_HUT_03_03");
	ta_sleep(23,0,7,5,"NW_CITY_LEOMAR_BED_05");
};

