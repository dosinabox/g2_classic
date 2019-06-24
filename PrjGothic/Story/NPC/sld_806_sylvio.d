
instance SLD_806_SYLVIO(NPC_DEFAULT)
{
	name[0] = "Сильвио";
	guild = GIL_SLD;
	id = 806;
	voice = 9;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	EquipItem(self,itrw_sld_bow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_N_SCAR,BODYTEX_N,itar_sld_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_806;
};


func void rtn_start_806()
{
	ta_sit_chair(8,0,22,0,"NW_BIGFARM_KITCHEN_BULLCO");
	ta_sit_chair(22,0,8,0,"NW_BIGFARM_KITCHEN_BULLCO");
};

func void rtn_tot_806()
{
	ta_sleep(8,0,23,0,"TOT");
	ta_sleep(23,0,8,0,"TOT");
};

