
instance BAU_982_GRIMBALD(NPC_DEFAULT)
{
	name[0] = "ֳנטלבאכüה";
	guild = GIL_OUT;
	id = 982;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_sld_sword);
	EquipItem(self,itrw_sld_bow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Psionic",FACE_B_NORMAL_KIRGO,BODYTEX_B,itar_leather_l);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_982;
};


func void rtn_start_982()
{
	ta_stand_guarding(8,0,23,0,"NW_TROLLAREA_PATH_79");
	ta_stand_guarding(23,0,8,0,"NW_TROLLAREA_PATH_79");
};

func void rtn_jagd_982()
{
	ta_runtowp(8,0,23,0,"NW_TROLLAREA_PATH_80");
	ta_runtowp(23,0,8,0,"NW_TROLLAREA_PATH_80");
};

func void rtn_jagdover_982()
{
	ta_stand_guarding(8,0,23,0,"NW_TROLLAREA_PATH_79");
	ta_stand_guarding(23,0,8,0,"NW_TROLLAREA_PATH_79");
};

