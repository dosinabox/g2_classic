
instance VLK_452_BUERGER(NPC_DEFAULT)
{
	name[0] = NAME_BUERGER;
	guild = GIL_VLK;
	id = 452;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_WEAK_ASGHAN,BODYTEX_N,itar_vlk_h);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_452;
};


func void rtn_start_452()
{
	ta_smalltalk(6,5,20,15,"NW_CITY_MERCHANT_SHOP01_FRONT_03_C");
	ta_sleep(20,15,6,5,"NW_CITY_LEOMAR_BED_07");
};

