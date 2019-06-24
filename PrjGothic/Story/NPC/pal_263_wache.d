
instance PAL_263_WACHE(NPC_DEFAULT)
{
	name[0] = NAME_RITTER;
	guild = GIL_PAL;
	id = 263;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_pal_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_BLOODWYN,BODYTEX_N,itar_pal_m);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_263;
};


func void rtn_start_263()
{
	ta_stand_armscrossed(8,0,23,0,"OC_EBR_GUARDPASSAGE_02");
	ta_stand_armscrossed(23,0,8,0,"OC_EBR_GUARDPASSAGE_02");
};

