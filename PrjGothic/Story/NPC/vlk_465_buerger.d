
instance VLK_465_BUERGER(NPC_DEFAULT)
{
	name[0] = NAME_BUERGER;
	guild = GIL_VLK;
	id = 465;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Psionic",FACE_N_NORMAL_ERPRESSER,BODYTEX_N,itar_vlk_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,40);
	daily_routine = rtn_start_465;
};


func void rtn_start_465()
{
	ta_stand_eating(8,0,22,0,"NW_CITY_HABOUR_FIREPLACE_01");
	ta_sleep(22,0,8,0,"NW_CITY_HABOUR_POOR_AREA_HUT_05_BED_01");
};

