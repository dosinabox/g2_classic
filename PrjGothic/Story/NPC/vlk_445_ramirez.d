
instance VLK_445_RAMIREZ(NPC_DEFAULT)
{
	name[0] = "Рамирез";
	guild = GIL_OUT;
	id = 445;
	voice = 14;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_DROPDEADANDKILL] = TRUE;
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_meisterdegen);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_N_TOUGH_OKYL,BODYTEX_N,itar_vlk_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_445;
};


func void rtn_start_445()
{
	ta_stand_armscrossed(7,0,23,0,"NW_CITY_KANAL_ROOM_04_01");
	ta_sit_throne(23,0,7,0,"NW_CITY_KANAL_ROOM_05_02");
};

