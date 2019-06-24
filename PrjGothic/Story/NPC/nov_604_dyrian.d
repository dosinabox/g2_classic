
instance NOV_604_DYRIAN(NPC_DEFAULT)
{
	name[0] = "Дуриан";
	guild = GIL_NOV;
	id = 604;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nov_mace);
	b_createambientinv(self);
	CreateInvItems(self,itsc_sleep,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_P_TOUGH_TORREZ,BODYTEX_P,itar_nov_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_604;
};


func void rtn_start_604()
{
	ta_stand_wp(8,0,10,0,"NW_MONASTERY_GRASS_04");
	ta_pray_innos_fp(10,0,11,0,"NW_MONASTERY_CHURCH_03");
	ta_stand_wp(11,0,23,30,"NW_MONASTERY_GRASS_04");
	ta_sleep(23,30,8,0,"NW_MONASTERY_NOVICE01_04");
};

func void rtn_favour_604()
{
	ta_rake_fp(8,0,23,30,"NW_MONASTERY_HERB_05");
	ta_sleep(23,30,8,0,"NW_MONASTERY_NOVICE01_04");
};

func void rtn_nofavour_604()
{
	ta_stand_drinking(8,0,23,30,"TAVERNE");
	ta_stand_drinking(23,30,8,0,"TAVERNE");
};

