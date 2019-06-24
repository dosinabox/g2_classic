
instance BAU_936_ROSI(NPC_DEFAULT)
{
	name[0] = "Рози";
	guild = GIL_BAU;
	id = 936;
	voice = 17;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe8",FACEBABE_N_HURE,BODYTEXBABE_N,itar_baubabe_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,15);
	daily_routine = rtn_start_936;
};


func void rtn_start_936()
{
	ta_cook_stove(8,0,22,0,"NW_FARM4_ROSI");
	ta_cook_stove(22,0,8,0,"NW_FARM4_ROSI");
};

func void rtn_fleedmt_936()
{
	ta_stand_armscrossed(8,0,22,0,"NW_FLEEDMT_KAP3");
	ta_stand_armscrossed(22,0,8,0,"NW_FLEEDMT_KAP3");
};

func void rtn_fleefromsekob_936()
{
	ta_stand_armscrossed(8,0,22,0,"NW_TAVERNE_TROLLAREA_14");
	ta_stand_armscrossed(22,0,8,0,"NW_TAVERNE_TROLLAREA_14");
};

func void rtn_followcity_936()
{
	ta_follow_player(8,0,22,0,"CITY2");
	ta_follow_player(22,0,8,0,"CITY2");
};

func void rtn_followbigfarm_936()
{
	ta_follow_player(8,0,22,0,"NW_BIGFARM_KITCHEN_02");
	ta_follow_player(22,0,8,0,"NW_BIGFARM_KITCHEN_02");
};

func void rtn_followkloster_936()
{
	ta_follow_player(8,0,22,0,"KLOSTER");
	ta_follow_player(22,0,8,0,"KLOSTER");
};

func void rtn_city_936()
{
	ta_sit_bench(8,0,22,0,"NW_CITY_MERCHANT_PATH_25");
	ta_sit_bench(22,0,8,0,"NW_CITY_MERCHANT_PATH_25");
};

func void rtn_bigfarm_936()
{
	ta_sit_chair(8,0,22,0,"NW_BIGFARM_KITCHEN_02");
	ta_sit_chair(22,0,8,0,"NW_BIGFARM_KITCHEN_02");
};

func void rtn_kloster_936()
{
	ta_stand_armscrossed(8,0,22,0,"NW_MONASTERY_SHEEP_01");
	ta_stand_armscrossed(22,0,8,0,"NW_MONASTERY_SHEEP_01");
};

