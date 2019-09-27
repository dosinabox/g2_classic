
instance VLK_4201_WIRT(NPC_DEFAULT)
{
	name[0] = "Трактирщик";
	guild = GIL_VLK;
	id = 4201;
	voice = 14;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_OLDBALD_JEREMIAH,BODYTEX_N,itar_barkeeper);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_4201;
};


func void rtn_start_4201()
{
	ta_stand_guarding(4,35,21,0,"NW_CITY_BEER_02");
	ta_pee(21,0,21,5,"NW_CITY_KASERN_PLACE_01");
	ta_stand_drinking(21,5,4,30,"NW_CITY_BEER_02");
	ta_pee(4,30,4,35,"NW_CITY_KASERN_PLACE_01");
};

