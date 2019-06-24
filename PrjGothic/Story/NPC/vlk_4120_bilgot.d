
instance VLK_4120_BILGOT(NPC_DEFAULT)
{
	name[0] = "Билгот";
	guild = GIL_OUT;
	id = 4120;
	voice = 5;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	CreateInvItems(self,itpo_health_02,4);
	CreateInvItems(self,itmi_oldcoin,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_P_WEAK_ULF_WOHLERS,BODYTEX_P,itar_mil_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_4120;
};


func void rtn_start_4120()
{
	ta_sit_campfire(8,0,23,0,"OW_NEWMINE_11");
	ta_sit_campfire(23,0,8,0,"OW_NEWMINE_11");
};

func void rtn_followtoocbridge_4120()
{
	ta_follow_player(8,0,23,0,"START");
	ta_follow_player(23,0,8,0,"START");
};

func void rtn_fleeoutofow_4120()
{
	ta_sit_campfire(8,0,23,0,"START");
	ta_sit_campfire(23,0,8,0,"START");
};

func void rtn_tot_4120()
{
	ta_sit_campfire(8,0,23,0,"TOT");
	ta_sit_campfire(23,0,8,0,"TOT");
};

