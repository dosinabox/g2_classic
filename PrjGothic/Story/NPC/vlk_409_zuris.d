
instance VLK_409_ZURIS(NPC_DEFAULT)
{
	name[0] = "«урис";
	guild = GIL_VLK;
	id = 409;
	voice = 14;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_dagger);
	b_setnpcvisual(self,MALE,"Hum_Head_Psionic",FACE_N_IMPORTANTGREY,BODYTEX_N,itar_vlk_m);
	Mdl_SetModelFatness(self,0.9);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_409;
};


func void rtn_start_409()
{
	ta_stand_armscrossed(5,30,6,25,"NW_CITY_BALTRAM");
	ta_stand_guarding(6,25,6,30,"NW_CITY_ZURIS_REGAL");
	ta_stand_armscrossed(6,30,8,30,"NW_CITY_BALTRAM");
	ta_stand_armscrossed(8,30,11,30,"NW_CITY_BALTRAM");
	ta_stand_armscrossed(11,30,14,30,"NW_CITY_BALTRAM");
	ta_stand_armscrossed(14,30,20,0,"NW_CITY_BALTRAM");
	ta_sit_throne(20,0,0,30,"NW_CITY_CHAIR_ZURIS");
	ta_sleep(0,30,5,30,"NW_CITY_BED_ZURIS");
};

