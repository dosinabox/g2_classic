
instance PAL_203_LOTHAR(NPC_DEFAULT)
{
	name[0] = "Лотар";
	guild = GIL_PAL;
	id = 203;
	voice = 1;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_pal_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Psionic",FACE_P_NORMALBART_NEFARIUS,BODYTEX_P,itar_pal_h);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_prestart_203;
};


func void rtn_prestart_203()
{
	ta_stand_guarding(8,0,23,0,"NW_CITY_MAINSTREET_01_B");
	ta_stand_guarding(23,0,8,0,"NW_CITY_MAINSTREET_01_B");
};

func void rtn_start_203()
{
	ta_stand_guarding(8,0,23,0,"NW_CITY_LOTHAR");
	ta_stand_guarding(23,0,8,0,"NW_CITY_LOTHAR");
};

func void rtn_tot_203()
{
	ta_sleep(8,0,23,0,"TOT");
	ta_sleep(23,0,8,0,"TOT");
};

