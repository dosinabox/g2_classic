
instance VLK_438_ALRIK(NPC_DEFAULT)
{
	name[0] = "Альрик";
	guild = GIL_NONE;
	id = 438;
	voice = 9;
	flags = 0;
	npctype = NPCTYPE_FRIEND;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	aivar[AIV_MM_FOLLOWTIME] = 1000;
	aivar[AIV_FIGHTDISTCANCEL] = 600;
	aivar[AIV_MAXDISTTOWP] = 300;
	aivar[AIV_ORIGINALFIGHTTACTIC] = FAI_HUMAN_NORMAL;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_bau_mace);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_BLOODWYN,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,20);
	daily_routine = rtn_start_438;
};


func void rtn_start_438()
{
	ta_stand_guarding(10,55,19,15,"NW_CITY_PATH_HABOUR_16_01");
	ta_stand_drinking(19,15,3,30,"NW_CITY_HABOUR_TAVERN01_01");
	ta_sit_bench(3,30,10,55,"NW_CITY_PATH_HABOUR_16_01");
};

