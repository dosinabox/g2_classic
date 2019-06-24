
instance NOV_600_PEDRO(NPC_DEFAULT)
{
	name[0] = "Педро";
	guild = GIL_NOV;
	id = 600;
	voice = 9;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	aivar[AIV_NEWSOVERRIDE] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_nov_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_PSIONIC",FACE_L_NORMAL_GORNABAR,BODYTEX_L,itar_nov_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_600;
};


func void rtn_start_600()
{
	ta_stand_guarding(8,0,23,0,"NW_MONASTERY_MILTEN");
	ta_stand_guarding(23,0,8,0,"NW_MONASTERY_MILTEN");
};

func void rtn_tot_600()
{
	ta_stand_guarding(8,0,23,0,"TOT");
	ta_stand_guarding(23,0,8,0,"TOT");
};

