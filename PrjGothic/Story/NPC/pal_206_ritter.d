
instance PAL_206_RITTER(NPC_DEFAULT)
{
	name[0] = NAME_RITTER;
	guild = GIL_PAL;
	id = 206;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_2h_pal_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_B_NORMAL_KHARIM,BODYTEX_B,itar_pal_m);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,55);
	daily_routine = rtn_start_206;
};


func void rtn_start_206()
{
	ta_stand_armscrossed(7,14,19,0,"NW_CITY_UPTOWN_PATH_06_B");
	ta_smalltalk(19,0,23,1,"NW_CITY_UPTOWN_HUT_03_05");
	ta_sleep(23,1,7,14,"NW_CITY_LEOMAR_BED_01");
};

