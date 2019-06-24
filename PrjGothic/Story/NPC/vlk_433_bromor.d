
instance VLK_433_BROMOR(NPC_DEFAULT)
{
	name[0] = "Бромор";
	guild = GIL_VLK;
	id = 433;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_vlk_dagger);
	b_createambientinv(self);
	CreateInvItems(self,itke_bromor,1);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_FINGERS,BODYTEX_N,itar_vlk_h);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,45);
	daily_routine = rtn_start_433;
};


func void rtn_start_433()
{
	ta_stand_armscrossed(8,0,20,0,"NW_CITY_PUFF_COUNTER");
	ta_stand_armscrossed(20,0,8,0,"NW_CITY_PUFF_COUNTER");
};

