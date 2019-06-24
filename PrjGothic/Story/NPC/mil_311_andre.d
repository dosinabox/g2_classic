
instance MIL_311_ANDRE(NPC_DEFAULT)
{
	name[0] = "Андре";
	guild = GIL_MIL;
	id = 311;
	voice = 8;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	aivar[AIV_IGNORE_MURDER] = TRUE;
	aivar[AIV_IGNORE_THEFT] = TRUE;
	aivar[AIV_IGNORE_SHEEPKILLER] = TRUE;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_WEAK12,BODYTEX_N,itar_pal_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_prestart_311;
};


func void rtn_prestart_311()
{
	ta_stand_guarding(0,0,12,0,"NW_CITY_HABOUR_KASERN_MAIN_ENTRY");
	ta_stand_guarding(12,0,0,0,"NW_CITY_HABOUR_KASERN_MAIN_ENTRY");
};

func void rtn_start_311()
{
	ta_read_bookstand(8,0,0,10,"NW_CITY_ANDRE");
	ta_smalltalk(0,10,5,0,"NW_CITY_ANDRE_SMALLTALK");
	ta_read_bookstand(5,0,8,0,"NW_CITY_ANDRE");
};

