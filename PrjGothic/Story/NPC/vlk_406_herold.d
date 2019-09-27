
instance VLK_406_HEROLD(NPC_DEFAULT)
{
	name[0] = "Глашатай";
	guild = GIL_VLK;
	id = 406;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_dagger);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL_SLY,BODYTEX_N,itar_governor);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_406;
};


func void rtn_start_406()
{
	ta_announce_herold(8,0,20,0,"NW_CITY_HEROLD_UP");
	ta_announce_herold(20,0,8,0,"NW_CITY_HEROLD_UP");
};

