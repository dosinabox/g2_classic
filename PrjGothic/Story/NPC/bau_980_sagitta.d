
instance BAU_980_SAGITTA(NPC_DEFAULT)
{
	name[0] = "Сагитта";
	guild = GIL_NONE;
	id = 980;
	voice = 17;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe",FACEBABE_N_PINKHAIR,BODYTEXBABE_N,itar_baubabe_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,40);
	daily_routine = rtn_start_980;
};


func void rtn_start_980()
{
	ta_sit_throne(8,0,23,0,"NW_SAGITTA_CAVE_IN_02");
	ta_potion_alchemy(23,0,8,0,"NW_SAGITTA_CAVE_IN_03");
};

