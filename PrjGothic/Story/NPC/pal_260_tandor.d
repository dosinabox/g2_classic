
instance PAL_260_TANDOR(NPC_DEFAULT)
{
	name[0] = "Тандор";
	guild = GIL_PAL;
	id = 260;
	voice = 8;
	flags = 0;
	npctype = NPCTYPE_OCMAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_pal_sword);
	EquipItem(self,itrw_mil_crossbow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_P_TOUGH_RODRIGUEZ,BODYTEX_P,itar_pal_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_260;
};


func void rtn_start_260()
{
	ta_stand_guarding(8,0,23,0,"OC_STAND_TANDOR_01");
	ta_stand_guarding(23,0,8,0,"OC_STAND_TANDOR_01");
};

func void rtn_postenverlassen_260()
{
	ta_practice_sword(8,0,23,0,"OC_CENTER_03");
	ta_stand_eating(23,0,8,0,"OC_CENTER_03");
};

