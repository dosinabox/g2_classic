
instance MIL_335_RUMBOLD(NPC_DEFAULT)
{
	name[0] = "Румболд";
	guild = GIL_MIL;
	id = 335;
	voice = 10;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_DROPDEADANDKILL] = TRUE;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_IMPORTANT_ARTO,BODYTEX_N,itar_mil_l);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_335;
};


func void rtn_start_335()
{
	ta_smalltalk(8,0,22,0,"NW_FARM3_PATH_02");
	ta_smalltalk(22,0,8,0,"NW_FARM3_PATH_02");
};

func void rtn_milcoming_335()
{
	ta_smalltalk(8,0,22,0,"NW_FARM3_BENGAR");
	ta_smalltalk(22,0,8,0,"NW_FARM3_BENGAR");
};

func void rtn_flucht2_335()
{
	ta_smalltalk(8,0,22,0,"NW_RUMBOLD_FLUCHT2");
	ta_smalltalk(22,0,8,0,"NW_RUMBOLD_FLUCHT2");
};

func void rtn_flucht3_335()
{
	ta_smalltalk(8,0,22,0,"NW_RUMBOLD_FLUCHT3");
	ta_smalltalk(22,0,8,0,"NW_RUMBOLD_FLUCHT3");
};

