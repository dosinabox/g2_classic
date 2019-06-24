
instance VLK_4107_PARLAF(NPC_DEFAULT)
{
	name[0] = "Парлаф";
	guild = GIL_MIL;
	id = 4107;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_OCMAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART_HUNO,BODYTEX_N,itar_mil_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_4107;
};


func void rtn_start_4107()
{
	ta_smith_sharp(8,0,20,0,"OC_SMITH_SHARP");
	ta_sleep(20,0,8,0,"OC_GUARD_ROOM_01_SLEEP_02");
};

func void rtn_tot_4107()
{
	ta_sleep(8,0,20,0,"TOT");
	ta_sleep(20,0,8,0,"TOT");
};

