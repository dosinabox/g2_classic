
instance PAL_268_UDAR(NPC_DEFAULT)
{
	name[0] = "Удар";
	guild = GIL_PAL;
	id = 268;
	voice = 9;
	flags = 0;
	npctype = NPCTYPE_OCMAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_NAILED;
	EquipItem(self,itmw_2h_pal_sword);
	EquipItem(self,itrw_crossbow_h_01);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_NORMAL_STONE,BODYTEX_N,itar_pal_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,65);
	daily_routine = rtn_start_268;
};


func void rtn_start_268()
{
	ta_stand_guarding(8,0,23,0,"OC_CENTER_GUARD_03");
	ta_stand_guarding(23,0,8,0,"OC_CENTER_GUARD_03");
};

