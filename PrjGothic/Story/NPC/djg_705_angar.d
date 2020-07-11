
instance DJG_705_ANGAR(NPC_DEFAULT)
{
	name[0] = "Ангар";
	guild = GIL_DJG;
	id = 705;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_zweihaender2);
	CreateInvItems(self,itpo_health_03,6);
	CreateInvItems(self,itmi_oldcoin,1);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_B_CORANGAR,BODYTEX_TATTOO_B,itar_corangar);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_prestart_705;
};


func void rtn_prestart_705()
{
	ta_stand_armscrossed(8,0,23,0,"OC_TO_MAGE");
	ta_stand_armscrossed(23,0,8,0,"OC_TO_MAGE");
};

func void rtn_start_705()
{
	ta_stand_armscrossed(8,0,23,0,"OW_DJG_WATCH_STONEHENGE_01");
	ta_stand_armscrossed(23,0,8,0,"OW_DJG_WATCH_STONEHENGE_01");
};

func void rtn_zwischenstop_705()
{
	ta_stand_armscrossed(8,0,23,0,"OW_PATH_3_13");
	ta_stand_armscrossed(23,0,8,0,"OW_PATH_3_13");
};

func void rtn_gotostonehendgeentrance_705()
{
	ta_stand_armscrossed(8,0,23,0,"OW_PATH_3_STONES");
	ta_stand_armscrossed(23,0,8,0,"OW_PATH_3_STONES");
};

func void rtn_leavingow_705()
{
	ta_sit_campfire(8,0,23,0,"OW_CAVALORN_01");
	ta_sit_campfire(23,0,8,0,"OW_CAVALORN_01");
};

func void rtn_angriff_705()
{
	ta_stand_armscrossed(8,0,23,0,"OW_UNDEAD_DUNGEON_02");
	ta_stand_armscrossed(23,0,8,0,"OW_UNDEAD_DUNGEON_02");
};

func void rtn_runtoentrance_705()
{
	ta_runtowp(8,0,23,0,"OW_PATH_3_STONES");
	ta_runtowp(23,0,8,0,"OW_PATH_3_STONES");
};

func void rtn_tot_705()
{
	ta_runtowp(8,0,23,0,"TOT");
	ta_runtowp(23,0,8,0,"TOT");
};

