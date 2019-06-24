
instance VLK_448_JOE(NPC_DEFAULT)
{
	name[0] = "Äæî";
	guild = GIL_OUT;
	id = 448;
	voice = 10;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	aivar[AIV_IGNORE_MURDER] = TRUE;
	aivar[AIV_IGNORE_THEFT] = TRUE;
	aivar[AIV_IGNORE_SHEEPKILLER] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_P_TOUGHBALD,BODYTEX_P,itar_vlk_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,35);
	daily_routine = rtn_prestart_448;
};


func void rtn_prestart_448()
{
	ta_sit_campfire(8,0,23,0,"NW_CITY_MERCHANT_TOWER_01");
	ta_sit_campfire(23,0,8,0,"NW_CITY_MERCHANT_TOWER_01");
};

func void rtn_start_448()
{
	ta_stand_drinking(8,0,23,0,"NW_CITY_HABOUR_TAVERN01_08");
	ta_stand_drinking(23,0,8,0,"NW_CITY_HABOUR_TAVERN01_08");
};

