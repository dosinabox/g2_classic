
instance SLD_801_TORLOF(NPC_DEFAULT)
{
	name[0] = "Торлоф";
	guild = GIL_SLD;
	id = 801;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_sld_sword);
	EquipItem(self,itrw_sld_bow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_N_TORLOF,BODYTEX_N,itar_sld_h);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,40);
	daily_routine = rtn_prestart_801;
};


func void rtn_prestart_801()
{
	ta_stand_guarding(8,0,22,0,"NW_BIGFARM_TORLOF");
	ta_stand_guarding(22,0,8,0,"NW_BIGFARM_TORLOF");
};

func void rtn_start_801()
{
	ta_stand_guarding(8,0,19,0,"NW_BIGFARM_TORLOF");
	ta_sit_chair(19,0,23,0,"NW_BIGFARM_HOUSE_UP2_07");
	ta_sleep(23,0,8,0,"NW_BIGFARM_HOUSE_UP2_02");
};

func void rtn_waitforshipcaptain_801()
{
	ta_sit_bench(8,0,20,0,"NW_WAITFOR_SHIP_CAPTAIN");
	ta_sit_bench(20,0,8,0,"NW_WAITFOR_SHIP_CAPTAIN");
};

func void rtn_allonboard_801()
{
	ta_stand_wp(8,0,23,0,"SHIP_CREW_CAPTAIN");
	ta_sleep(23,0,8,0,"SHIP_IN_06");
};

