
instance PC_PSIONIC(NPC_DEFAULT)
{
	name[0] = "Лестер";
	guild = GIL_NONE;
	id = 4;
	voice = 13;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_FRIEND;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	b_createambientinv(self);
	EquipItem(self,itmw_kriegshammer2);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_P_LESTER,BODYTEX_TATTOO_P,itar_lester);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_4;
};


func void rtn_start_4()
{
	ta_sit_campfire(8,0,23,0,"NW_XARDAS_TOWER_LESTER");
	ta_sit_campfire(23,0,8,0,"NW_XARDAS_TOWER_LESTER");
};

func void rtn_xardas_4()
{
	ta_sleep(8,0,23,0,"NW_XARDAS_TOWER_IN1_31");
	ta_sleep(23,0,8,0,"NW_XARDAS_TOWER_IN1_31");
};

func void rtn_xardasweg_4()
{
	ta_stand_guarding(8,0,23,0,"NW_XARDAS_TOWER_02");
	ta_stand_guarding(23,0,8,0,"NW_XARDAS_TOWER_02");
};

func void rtn_waitforplayer_4()
{
	ta_stand_armscrossed(8,0,23,0,"LEVELCHANGE");
	ta_stand_armscrossed(23,0,8,0,"LEVELCHANGE");
};

func void rtn_waitforship_4()
{
	ta_smalltalk(8,0,23,0,"NW_CITY_WAY_TO_SHIP_19");
	ta_smalltalk(23,0,8,0,"NW_CITY_WAY_TO_SHIP_19");
};

func void rtn_shipoff_4()
{
	ta_stand_guarding(8,0,23,0,"NW_XARDAS_TOWER_02");
	ta_stand_guarding(23,0,8,0,"NW_XARDAS_TOWER_02");
};

func void rtn_ship_4()
{
	ta_smalltalk(8,0,23,0,"SHIP_CREW_19");
	ta_smalltalk(23,0,8,0,"SHIP_CREW_19");
};

