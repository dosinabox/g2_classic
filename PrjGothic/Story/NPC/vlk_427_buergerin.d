
instance VLK_427_BUERGERIN(NPC_DEFAULT)
{
	name[0] = NAME_BUERGERIN;
	guild = GIL_VLK;
	id = 427;
	voice = 16;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	EquipItem(self,itmw_1h_vlk_dagger);
	b_setnpcvisual(self,FEMALE,"Hum_Head_BabeHair",FACEBABE_N_HAIRANDCLOTH,BODYTEX_N,itar_baubabe_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_427;
};


func void rtn_start_427()
{
	ta_cook_stove(4,30,12,0,"NW_CITY_MERCHANT_SHOP01_IN_03_B");
	ta_stand_sweeping(12,0,13,2,"NW_CITY_MERCHANT_SHOP01_FRONT_02_B");
	ta_smalltalk(13,2,14,5,"NW_CITY_MERCHANT_SHOP01_FRONT_03_E");
	ta_cook_stove(14,5,16,0,"NW_CITY_MERCHANT_SHOP01_IN_03_B");
	ta_stand_sweeping(16,0,17,2,"NW_CITY_MERCHANT_SHOP01_FRONT_02_B");
	ta_smalltalk(17,2,18,5,"NW_CITY_MERCHANT_SHOP01_FRONT_03_E");
	ta_cook_stove(18,5,20,0,"NW_CITY_MERCHANT_SHOP01_IN_03_B");
	ta_sit_chair(20,0,23,30,"NW_CITY_MERCHANT_SHOP01_IN_01");
	ta_sleep(23,30,4,30,"NW_CITY_MERCHANT_SHOP01_IN_01");
};

