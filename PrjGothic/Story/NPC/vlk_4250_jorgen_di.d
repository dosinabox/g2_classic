
instance VLK_4250_JORGEN_DI(NPC_DEFAULT)
{
	name[0] = "Йорген";
	guild = GIL_NONE;
	id = 42500;
	voice = 7;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_N_TOUGH_SKIP,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_42500;
};


func void rtn_start_42500()
{
	ta_stand_wp(8,0,23,0,"SHIP_CREW_CAPTAIN");
	ta_sleep(23,0,8,0,"SHIP_IN_06");
};

