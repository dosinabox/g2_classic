
instance PAL_267_SENGRATH(NPC_DEFAULT)
{
	name[0] = "Сенграт";
	guild = GIL_PAL;
	id = 267;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_OCMAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_NAILED;
	EquipItem(self,itmw_1h_pal_sword);
	EquipItem(self,itrw_mil_crossbow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_NORMAL03,BODYTEX_N,itar_pal_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,65);
	daily_routine = rtn_start_267;
};


func void rtn_start_267()
{
	ta_stand_guarding(8,0,23,0,"OC_CENTER_GUARD_01");
	ta_stand_guarding(23,0,8,0,"OC_CENTER_GUARD_01");
};

func void rtn_orcbarrier_267()
{
	ta_sleep(8,0,23,0,"OW_ORCBARRIER_12");
	ta_sleep(23,0,8,0,"OW_ORCBARRIER_12");
};

