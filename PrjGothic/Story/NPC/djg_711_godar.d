
instance DJG_711_GODAR(NPC_DEFAULT)
{
	name[0] = "Годар";
	guild = GIL_DJG;
	id = 711;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMAL14,BODYTEX_N,itar_djg_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,65);
	daily_routine = rtn_prestart_711;
};


func void rtn_prestart_711()
{
	ta_smalltalk(8,0,23,0,"OW_PATH_1_5_3A");
	ta_smalltalk(23,0,8,0,"OW_PATH_1_5_3A");
};

func void rtn_start_711()
{
	ta_roast_scavenger(8,0,23,0,"OW_DJG_VORPOSTEN_01");
	ta_roast_scavenger(23,0,8,0,"OW_DJG_VORPOSTEN_01");
};

