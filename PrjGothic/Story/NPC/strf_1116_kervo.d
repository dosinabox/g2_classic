
instance STRF_1116_KERVO(NPC_DEFAULT)
{
	name[0] = "Керво";
	guild = GIL_STRF;
	id = 1116;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_WEAK12,BODYTEX_N,itar_prisoner);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,5);
	daily_routine = rtn_start_1116;
};


func void rtn_start_1116()
{
	ta_sit_bench(8,0,23,0,"OW_DJG_VORPOSTEN_01");
	ta_sit_bench(23,0,8,0,"OW_DJG_VORPOSTEN_01");
};

func void rtn_tot_1116()
{
	ta_sleep(8,0,23,0,"TOT");
	ta_sleep(23,0,8,0,"TOT");
};

