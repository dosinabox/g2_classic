
instance STRF_1106_FED(NPC_DEFAULT)
{
	name[0] = "‘Â‰";
	guild = GIL_OUT;
	id = 1106;
	voice = 8;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_2h_axe_l_01);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_P_GILBERT,BODYTEX_N,itar_prisoner);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,15);
	daily_routine = rtn_start_1106;
};


func void rtn_start_1106()
{
	ta_pick_ore(8,0,23,0,"OW_NEWMINE_06_B");
	ta_pick_ore(23,0,8,0,"OW_NEWMINE_06_B");
};

