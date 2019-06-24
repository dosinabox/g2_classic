
instance STRF_1115_GEPPERT(NPC_DEFAULT)
{
	name[0] = "Гепперт";
	guild = GIL_STRF;
	id = 1115;
	voice = 10;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_2h_axe_l_01);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_WEAK_HEREK,BODYTEX_N,itar_prisoner);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,15);
	daily_routine = rtn_start_1115;
};


func void rtn_start_1115()
{
	ta_roast_scavenger(8,0,23,0,"OW_DJG_VORPOSTEN_01");
	ta_roast_scavenger(23,0,8,0,"OW_DJG_VORPOSTEN_01");
};

func void rtn_tot_1115()
{
	ta_sleep(8,0,23,0,"TOT");
	ta_sleep(23,0,8,0,"TOT");
};

