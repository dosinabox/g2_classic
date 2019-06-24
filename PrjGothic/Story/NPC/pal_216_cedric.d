
instance PAL_216_CEDRIC(NPC_DEFAULT)
{
	name[0] = "Седрик";
	guild = GIL_PAL;
	id = 216;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_pal_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_NORMALBART10,BODYTEX_N,itar_pal_m);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,55);
	daily_routine = rtn_start_216;
};


func void rtn_start_216()
{
	ta_practice_sword(7,0,19,0,"NW_CITY_TRAIN_01");
	ta_sleep(19,0,7,0,"NW_CITY_LEOMAR_BED_03");
};

