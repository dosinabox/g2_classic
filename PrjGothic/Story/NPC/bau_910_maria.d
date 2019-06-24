
instance BAU_910_MARIA(NPC_DEFAULT)
{
	name[0] = "Мария";
	guild = GIL_BAU;
	id = 910;
	voice = 17;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe8",FACEBABE_N_MIDBAUBLONDE,BODYTEXBABE_N,itar_baubabe_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,10);
	daily_routine = rtn_start_910;
};


func void rtn_start_910()
{
	ta_sit_throne(8,0,22,0,"NW_BIGFARM_HOUSE_UP1_SESSEL");
	ta_sleep(22,0,8,0,"NW_BIGFARM_HOUSE_UP1_04");
};

