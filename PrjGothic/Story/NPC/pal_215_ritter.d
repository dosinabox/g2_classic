
instance PAL_215_RITTER(NPC_DEFAULT)
{
	name[0] = NAME_RITTER;
	guild = GIL_PAL;
	id = 215;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_2h_pal_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_L_TOUGH02,BODYTEX_L,itar_pal_m);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,55);
	daily_routine = rtn_start_215;
};


func void rtn_start_215()
{
	ta_practice_sword(7,8,19,1,"NW_CITY_TRAIN_01");
	ta_smalltalk(19,1,23,7,"NW_CITY_UPTOWN_HUT_03_01");
	ta_sleep(23,7,7,8,"NW_CITY_LEOMAR_BED_03");
};

