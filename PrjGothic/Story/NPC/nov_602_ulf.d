
instance NOV_602_ULF(NPC_DEFAULT)
{
	name[0] = "”Î¸Ù";
	guild = GIL_NOV;
	id = 602;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nov_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_WEAK05,BODYTEX_N,itar_nov_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_602;
};


func void rtn_start_602()
{
	ta_stand_drinking(8,0,20,0,"NW_CITY_BEER_04");
	ta_stand_drinking(20,0,8,0,"NW_CITY_BEER_04");
};

func void rtn_suche_602()
{
	ta_stand_guarding(8,0,20,0,"NW_TROLLAREA_PATH_42");
	ta_stand_guarding(20,0,8,0,"NW_TROLLAREA_PATH_42");
};

func void rtn_wait_602()
{
	ta_stand_guarding(8,0,20,0,"NW_TROLLAREA_PATH_22");
	ta_stand_guarding(20,0,8,0,"NW_TROLLAREA_PATH_22");
};

func void rtn_follow_602()
{
	ta_follow_player(8,0,20,0,"NW_TROLLAREA_PATH_13");
	ta_follow_player(20,0,8,0,"NW_TROLLAREA_PATH_13");
};

