
instance BAU_960_BENGAR(NPC_DEFAULT)
{
	name[0] = "Бенгар";
	guild = GIL_OUT;
	id = 960;
	voice = 10;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_bau_axe);
	EquipItem(self,itrw_sld_bow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL_OLLI_KAHN,BODYTEX_N,itar_bau_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,25);
	daily_routine = rtn_start_960;
};


func void rtn_start_960()
{
	ta_stand_guarding(8,0,22,0,"NW_FARM3_BENGAR");
	ta_stand_guarding(22,0,8,0,"NW_FARM3_BENGAR");
};

func void rtn_milcoming_960()
{
	ta_smalltalk(8,0,22,0,"NW_FARM3_BENGAR");
	ta_smalltalk(22,0,8,0,"NW_FARM3_BENGAR");
};

