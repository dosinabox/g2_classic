
instance BAU_961_GAAN(NPC_DEFAULT)
{
	name[0] = "√‡‡Ì";
	guild = GIL_OUT;
	id = 961;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_bau_mace);
	EquipItem(self,itrw_sld_bow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL02,BODYTEX_N,itar_bau_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,25);
	daily_routine = rtn_prestart_961;
};


func void rtn_prestart_961()
{
	ta_stand_armscrossed(8,0,22,0,"NW_FARM3_PATH_LEVELCHANGE_02");
	ta_stand_armscrossed(22,0,8,0,"NW_FARM3_PATH_LEVELCHANGE_02");
};

func void rtn_start_961()
{
	ta_stand_armscrossed(8,0,22,0,"NW_FARM3_GAAN");
	ta_stand_armscrossed(22,0,8,0,"NW_FARM3_STABLE_REST_01");
};

