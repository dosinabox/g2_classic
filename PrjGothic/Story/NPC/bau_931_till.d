
instance BAU_931_TILL(NPC_DEFAULT)
{
	name[0] = "Тилл";
	guild = GIL_OUT;
	id = 931;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_P_WEAK_CUTTER,BODYTEX_P,itar_bau_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,25);
	daily_routine = rtn_prestart_931;
};


func void rtn_prestart_931()
{
	ta_stand_guarding(8,0,22,0,"NW_FARM4_TILL");
	ta_stand_guarding(22,0,8,0,"NW_FARM4_TILL");
};

func void rtn_start_931()
{
	ta_saw(8,0,22,0,"NW_FARM4_TILL");
	ta_sit_throne(22,0,8,0,"NW_FARM4_SEKOB");
};

func void rtn_fleedmt_931()
{
	ta_stand_guarding(8,0,22,0,"NW_FLEEDMT_KAP3");
	ta_stand_guarding(22,0,8,0,"NW_FLEEDMT_KAP3");
};

func void rtn_fleefromsekob_931()
{
	ta_stand_armscrossed(8,0,22,0,"NW_TAVERNE_TROLLAREA_14");
	ta_stand_armscrossed(22,0,8,0,"NW_TAVERNE_TROLLAREA_14");
};

func void rtn_followcity_931()
{
	ta_follow_player(8,0,22,0,"CITY2");
	ta_follow_player(22,0,8,0,"CITY2");
};

func void rtn_followbigfarm_931()
{
	ta_follow_player(8,0,22,0,"NW_BIGFARM_KITCHEN_02");
	ta_follow_player(22,0,8,0,"NW_BIGFARM_KITCHEN_02");
};

func void rtn_followkloster_931()
{
	ta_follow_player(8,0,22,0,"KLOSTER");
	ta_follow_player(22,0,8,0,"KLOSTER");
};

func void rtn_city_931()
{
	ta_stand_wp(8,0,22,0,"NW_CITY_MERCHANT_PATH_25");
	ta_stand_wp(22,0,8,0,"NW_CITY_MERCHANT_PATH_25");
};

func void rtn_bigfarm_931()
{
	ta_sit_chair(8,0,22,0,"NW_BIGFARM_KITCHEN_02");
	ta_sit_chair(22,0,8,0,"NW_BIGFARM_KITCHEN_02");
};

func void rtn_kloster_931()
{
	ta_pick_fp(8,0,22,0,"NW_MONASTERY_HERB_02");
	ta_pick_fp(22,0,8,0,"NW_MONASTERY_HERB_02");
};

