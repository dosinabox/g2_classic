
instance VLK_457_BRIAN(NPC_DEFAULT)
{
	name[0] = "ֱנאיאם";
	guild = GIL_VLK;
	id = 457;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_axe);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_B_NORMAL_KIRGO,BODYTEX_B,itar_smith);
	Mdl_SetModelFatness(self,0.5);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_457;
};


func void rtn_start_457()
{
	ta_smith_sharp(7,5,20,35,"NW_CITY_SMITH_SHARP");
	ta_smalltalk(20,35,0,25,"NW_CITY_MERCHANT_PATH_14");
	ta_sleep(0,25,7,5,"NW_CITY_BED_BRIAN");
};

func void rtn_lighthouse_457()
{
	ta_stand_guarding(8,0,20,0,"NW_LIGHTHOUSE_IN_01");
	ta_sit_throne(20,0,8,0,"NW_LIGHTHOUSE_IN_03");
};

