
instance VLK_401_CORNELIUS(NPC_DEFAULT)
{
	name[0] = "Корнелиус";
	guild = GIL_NONE;
	id = 401;
	voice = 13;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_P_WEAK_ULF_WOHLERS,BODYTEX_P,itar_governor);
	Mdl_SetModelFatness(self,0.9);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_401;
};


func void rtn_start_401()
{
	ta_read_bookstand(8,0,23,0,"NW_CITY_CORNELIUS");
	ta_read_bookstand(23,0,8,0,"NW_CITY_CORNELIUS");
};

func void rtn_flee_401()
{
	ta_fleetowp(8,0,23,0,"NW_XARDAS_BANDITS_LEFT");
	ta_fleetowp(23,0,8,0,"NW_XARDAS_BANDITS_LEFT");
};

func void rtn_prison_401()
{
	ta_stand_guarding(8,0,23,0,"NW_CITY_HABOUR_KASERN_BORKA");
	ta_stand_guarding(23,0,8,0,"NW_CITY_HABOUR_KASERN_BORKA");
};

