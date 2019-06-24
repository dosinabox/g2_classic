
instance BAU_911_ELENA(NPC_DEFAULT)
{
	name[0] = "Елена";
	guild = GIL_BAU;
	id = 911;
	voice = 16;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe",FACEBABE_N_GREYCLOTH,BODYTEXBABE_N,itar_baubabe_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,25);
	daily_routine = rtn_start_911;
};


func void rtn_start_911()
{
	ta_stand_armscrossed(7,30,20,30,"NW_BIGFARM_STABLE_OUT_04");
	ta_sit_throne(20,30,7,30,"NW_BIGFARM_HOUSE_UP1_SESSEL");
};

