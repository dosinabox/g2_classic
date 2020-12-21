
instance BAU_900_ONAR(NPC_DEFAULT)
{
	name[0] = "Онар";
	guild = GIL_BAU;
	id = 900;
	voice = 14;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_OLDBALD_JEREMIAH,BODYTEX_N,itar_onar);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_900;
};


func void rtn_start_900()
{
	ta_sit_throne(9,0,21,0,"NW_BIGFARM_HOUSE_ONAR_SIT");
	ta_sleep(21,0,9,0,"NW_BIGFARM_HOUSE_UP1_04");
};

