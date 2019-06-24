
instance STRF_1107_STRAEFLING(NPC_DEFAULT)
{
	name[0] = "Повар";
	guild = GIL_STRF;
	id = 1107;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_OCMAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_2h_axe_l_01);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART04,BODYTEX_N,itar_prisoner);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,15);
	daily_routine = rtn_start_1107;
};


func void rtn_start_1107()
{
	ta_cook_cauldron(8,0,23,0,"OC_EBR_KITCHEN_COOK");
	ta_cook_cauldron(23,0,8,0,"OC_EBR_KITCHEN_COOK");
};

