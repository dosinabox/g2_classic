
instance BAU_930_SEKOB(NPC_DEFAULT)
{
	name[0] = "Секоб";
	guild = GIL_OUT;
	id = 930;
	voice = 1;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fatbald",FACE_P_OLDMAN_GRAVO,BODYTEX_P,itar_vlk_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,20);
	daily_routine = rtn_start_930;
};


func void rtn_start_930()
{
	ta_sit_throne(8,0,22,0,"NW_FARM4_SEKOB");
	ta_sleep(22,0,8,0,"NW_FARM4_IN_BED");
};

func void rtn_fleedmt_930()
{
	ta_stand_wp(8,0,22,0,"NW_BIGFARM_FARM4_PATH_01");
	ta_stand_wp(22,0,8,0,"NW_BIGFARM_FARM4_PATH_01");
};

func void rtn_obsessed_930()
{
	ta_stand_guarding(8,0,22,0,"NW_FARM4_02");
	ta_stand_guarding(22,0,8,0,"NW_FARM4_02");
};

