
instance DJG_713_BIFF(NPC_DEFAULT)
{
	name[0] = "¡ËÙÙ";
	guild = GIL_DJG;
	id = 713;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_sld_axe);
	b_createambientinv(self);
	CreateInvItems(self,itpo_health_02,4);
	CreateInvItems(self,itmi_oldcoin,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL16,BODYTEX_N,itar_djg_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,65);
	daily_routine = rtn_prestart_713;
};


func void rtn_prestart_713()
{
	ta_smalltalk(8,0,23,0,"OW_DJG_STARTCAMP_01");
	ta_smalltalk(23,0,8,0,"OW_DJG_STARTCAMP_01");
};

func void rtn_start_713()
{
	ta_stand_armscrossed(8,0,23,0,"OW_DJG_STARTCAMP_01");
	ta_stand_armscrossed(23,0,8,0,"OW_DJG_STARTCAMP_01");
};

func void rtn_follow_713()
{
	ta_follow_player(8,0,23,0,"OW_PATH_298");
	ta_follow_player(23,0,8,0,"OW_PATH_298");
};

func void rtn_stay_swamp_713()
{
	ta_stand_guarding(8,0,23,0,"SWAMPDRAGON");
	ta_stand_guarding(23,0,8,0,"SWAMPDRAGON");
};

func void rtn_stay_rock_713()
{
	ta_stand_guarding(8,0,23,0,"LOCATION_19_01");
	ta_stand_guarding(23,0,8,0,"LOCATION_19_01");
};

func void rtn_stay_fire_713()
{
	ta_stand_guarding(8,0,23,0,"CASTLE_29");
	ta_stand_guarding(23,0,8,0,"CASTLE_29");
};

func void rtn_stay_ice_713()
{
	ta_stand_guarding(8,0,23,0,"OW_ICEDRAGON_09");
	ta_stand_guarding(23,0,8,0,"OW_ICEDRAGON_09");
};

func void rtn_stay_awayfromoc_713()
{
	ta_stand_guarding(8,0,23,0,"OW_PATH_298");
	ta_stand_guarding(23,0,8,0,"OW_PATH_298");
};

func void rtn_runstopass_713()
{
	ta_runtowp(8,0,23,0,"START");
	ta_runtowp(23,0,8,0,"START");
};

