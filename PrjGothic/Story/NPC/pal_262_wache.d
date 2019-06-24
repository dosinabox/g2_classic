
instance PAL_262_WACHE(NPC_DEFAULT)
{
	name[0] = NAME_WACHE;
	guild = GIL_PAL;
	id = 262;
	voice = 10;
	flags = 0;
	npctype = NPCTYPE_OCMAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_pal_sword);
	EquipItem(self,itrw_mil_crossbow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_NORMALBART17,BODYTEX_N,itar_pal_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,65);
	daily_routine = rtn_start_262;
};


func void rtn_start_262()
{
	ta_stand_armscrossed(8,0,23,0,"OC_EBR_GUARDPASSAGE_01");
	ta_stand_armscrossed(23,0,8,0,"OC_EBR_GUARDPASSAGE_01");
};

