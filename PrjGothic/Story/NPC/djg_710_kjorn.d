
instance DJG_710_KJORN(NPC_DEFAULT)
{
	name[0] = "Êימנם";
	guild = GIL_DJG;
	id = 710;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMAL02,BODYTEX_N,itar_djg_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,65);
	daily_routine = rtn_prestart_710;
};


func void rtn_prestart_710()
{
	ta_smalltalk(8,0,23,0,"OW_PATH_1_5_3A");
	ta_smalltalk(23,0,8,0,"OW_PATH_1_5_3A");
};

func void rtn_start_710()
{
	ta_sit_bench(8,0,23,0,"OW_DJG_VORPOSTEN_01");
	ta_sit_bench(23,0,8,0,"OW_DJG_VORPOSTEN_01");
};

