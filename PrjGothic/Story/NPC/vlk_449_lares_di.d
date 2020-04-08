
instance VLK_449_LARES_DI(NPC_DEFAULT)
{
	name[0] = "Ларес";
	guild = GIL_NONE;
	id = 4490;
	voice = 9;
	flags = 0;
	npctype = NPCTYPE_FRIEND;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_N_LARES,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,35);
	daily_routine = rtn_start_4490;
};


func void rtn_start_4490()
{
	ta_smalltalk(8,0,23,0,"SHIP_CREW_05");
	ta_smalltalk(23,0,8,0,"SHIP_CREW_05");
};

func void rtn_sittingshipdi_4490()
{
	ta_sit_bench(8,0,23,0,"SHIP_CREW_04");
	ta_sit_bench(23,0,8,0,"SHIP_CREW_04");
};

