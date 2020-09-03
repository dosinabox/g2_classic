
instance VLK_446_JESPER(NPC_DEFAULT)
{
	name[0] = "Джеспер";
	guild = GIL_OUT;
	id = 446;
	voice = 9;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_DROPDEADANDKILL] = TRUE;
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	CreateInvItems(self,itke_fingers,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_N_NORMAL07,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,40);
	daily_routine = rtn_prestart_446;
};


func void rtn_prestart_446()
{
	ta_stand_armscrossed(7,0,23,0,"NW_CITY_KANAL_22");
	ta_stand_armscrossed(23,0,7,0,"NW_CITY_KANAL_22");
};

func void rtn_start_446()
{
	ta_cook_stove(7,0,14,0,"NW_CITY_KANAL_ROOM_05_03_COOK");
	ta_sit_throne(14,0,18,0,"NW_CITY_KANAL_ROOM_05_02");
	ta_cook_stove(18,0,21,0,"NW_CITY_KANAL_ROOM_05_03_COOK");
	ta_sit_throne(21,0,23,0,"NW_CITY_KANAL_ROOM_05_02");
	ta_sleep(23,0,7,0,"NW_CITY_KANAL_ROOM_05_BED_02");
};

