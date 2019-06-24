
instance PC_THIEFOW(NPC_DEFAULT)
{
	name[0] = "Диего";
	guild = GIL_NONE;
	id = 1;
	voice = 11;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_FRIEND;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_L_DIEGO,BODYTEX_L,itar_diego);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_1;
};


func void rtn_start_1()
{
	ta_sit_bench(8,0,23,0,"LOCATION_02_05");
	ta_sit_bench(23,0,8,0,"LOCATION_02_05");
};

func void rtn_tot_1()
{
	ta_sit_bench(8,0,23,0,"TOT");
	ta_sit_bench(23,0,8,0,"TOT");
};

