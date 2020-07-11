
instance SLD_800_LEE(NPC_DEFAULT)
{
	name[0] = "ห่";
	guild = GIL_SLD;
	id = 800;
	voice = 4;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_FRIEND;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	aivar[AIV_IGNORE_MURDER] = TRUE;
	aivar[AIV_IGNORE_THEFT] = TRUE;
	aivar[AIV_IGNORE_SHEEPKILLER] = TRUE;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_2h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_N_LEE,BODYTEX_TATTOO_N,itar_sld_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_800;
};


func void rtn_start_800()
{
	ta_stand_guarding(8,0,19,0,"NW_BIGFARM_HOUSE_LEE_GUARDING");
	ta_sit_chair(19,0,22,0,"NW_BIGFARM_HOUSE_UP2_05");
	ta_sleep(22,0,8,0,"NW_BIGFARM_HOUSE_UP2_04");
};

func void rtn_waitforship_800()
{
	ta_stand_guarding(8,0,19,0,"NW_WAITFOR_SHIP_01");
	ta_stand_guarding(19,0,8,0,"NW_WAITFOR_SHIP_01");
};

func void rtn_shipoff_800()
{
	ta_stand_guarding(8,0,19,0,"NW_BIGFARM_HOUSE_LEE_GUARDING");
	ta_sit_chair(19,0,22,0,"NW_BIGFARM_HOUSE_UP2_05");
	ta_sleep(22,0,8,0,"NW_BIGFARM_HOUSE_UP2_04");
};

func void rtn_ship_800()
{
	ta_stand_guarding(8,0,23,0,"SHIP_CREW_01");
	ta_sleep(23,0,8,0,"SHIP_IN_06");
};

