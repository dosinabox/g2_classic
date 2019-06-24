
instance VLK_454_BUERGER(NPC_DEFAULT)
{
	name[0] = NAME_BUERGER;
	guild = GIL_VLK;
	id = 454;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_P_OLDMAN_GRAVO,BODYTEX_P,itar_vlk_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_454;
};


func void rtn_start_454()
{
	ta_stand_armscrossed(5,15,20,15,"NW_CITY_MERCHANT_PATH_14_C");
	ta_smoke_waterpipe(20,15,1,15,"NW_CITY_RAUCH_03");
	ta_sit_chair(1,15,5,15,"NW_CITY_TAVERN_IN_01");
};

func void rtn_vatrasaway_454()
{
	ta_sit_bench(5,15,20,15,"NW_CITY_MERCHANT_PATH_15");
	ta_smoke_waterpipe(20,15,1,15,"NW_CITY_RAUCH_03");
	ta_sit_chair(1,15,5,15,"NW_CITY_TAVERN_IN_01");
};

