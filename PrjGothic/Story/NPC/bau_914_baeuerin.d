
instance BAU_914_BAEUERIN(NPC_DEFAULT)
{
	name[0] = NAME_MAGD;
	guild = GIL_BAU;
	id = 914;
	voice = 16;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe",FACEBABE_N_BLACKHAIR,BODYTEXBABE_N,itar_baubabe_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,20);
	daily_routine = rtn_start_914;
};


func void rtn_start_914()
{
	ta_cook_stove(7,0,20,0,"NW_BIGFARM_HOUSE_UP1_COOK");
	ta_stand_eating(20,0,7,0,"NW_BIGFARM_STABLE_05");
};

