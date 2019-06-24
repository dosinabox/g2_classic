
instance PAL_269_RITTER(NPC_DEFAULT)
{
	name[0] = NAME_RITTER;
	guild = GIL_PAL;
	id = 269;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_OCMAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_pal_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMAL_ERPRESSER,BODYTEX_N,itar_pal_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_269;
};


func void rtn_start_269()
{
	ta_stand_guarding(8,0,21,0,"OC_EBR_STAND_THRONE_01");
	ta_stand_guarding(21,0,8,0,"OC_EBR_FLOOR_02");
};

