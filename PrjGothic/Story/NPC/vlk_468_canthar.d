
instance VLK_468_CANTHAR(NPC_DEFAULT)
{
	name[0] = "Кантар";
	guild = GIL_NONE;
	id = 468;
	voice = 9;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	aivar[AIV_IGNORE_MURDER] = TRUE;
	aivar[AIV_IGNORE_THEFT] = TRUE;
	aivar[AIV_IGNORE_SHEEPKILLER] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_vlk_sword);
	CreateInvItems(self,itmi_gold,50);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_WEAK_ORRY,BODYTEX_N,itar_vlk_m);
	Mdl_SetModelFatness(self,1.8);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_prestart_468;
};


func void rtn_prestart_468()
{
	ta_sit_bench(8,0,23,0,"NW_FARM1_PATH_CITY_SHEEP_05");
	ta_sit_bench(23,0,8,0,"NW_FARM1_PATH_CITY_SHEEP_05");
};

func void rtn_start_468()
{
	ta_sit_bench(7,45,19,45,"NW_CITY_MERCHANT_PATH_30");
	ta_smoke_waterpipe(19,45,0,45,"NW_CITY_RAUCH_05");
	ta_sleep(0,45,7,45,"NW_CITY_HOTEL_BED_01");
};

func void rtn_marktstand_468()
{
	ta_stand_armscrossed(7,45,19,45,"NW_CITY_SARAH");
	ta_smoke_waterpipe(19,45,0,45,"NW_CITY_RAUCH_05");
	ta_sleep(0,45,7,45,"NW_CITY_HOTEL_BED_01");
};

func void rtn_knast_468()
{
	ta_sit_bench(8,0,23,0,"NW_CITY_HABOUR_KASERN_RENGARU");
	ta_sit_bench(23,0,8,0,"NW_CITY_HABOUR_KASERN_RENGARU");
};

