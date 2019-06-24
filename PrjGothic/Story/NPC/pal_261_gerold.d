
instance PAL_261_GEROLD(NPC_DEFAULT)
{
	name[0] = "ֳונמכüה";
	guild = GIL_PAL;
	id = 261;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_OCMAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_2h_pal_sword);
	EquipItem(self,itrw_mil_crossbow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMAL_BLADE,BODYTEX_N,itar_pal_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_261;
};


func void rtn_start_261()
{
	ta_stand_guarding(8,0,22,0,"OC_PRISON_GUARD_01");
	ta_stand_guarding(22,0,8,0,"OC_PRISON_GUARD_01");
};

func void rtn_food_261()
{
	ta_stand_guarding(8,0,23,10,"OC_PRISON_GUARD_01");
	ta_stand_guarding(23,10,8,0,"OC_MAGE_IN");
};

