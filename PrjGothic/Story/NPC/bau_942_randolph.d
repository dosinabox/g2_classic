
instance BAU_942_RANDOLPH(NPC_DEFAULT)
{
	name[0] = "Рендольф";
	guild = GIL_OUT;
	id = 942;
	voice = 6;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_B_NORMAL_KHARIM,BODYTEX_B,itar_bau_l);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,20);
	daily_routine = rtn_prestart_942;
};


func void rtn_prestart_942()
{
	ta_stand_guarding(8,0,22,0,"NW_FARM2_FIELD_04_B");
	ta_stand_guarding(22,0,8,0,"NW_FARM2_FIELD_04_B");
};

func void rtn_start_942()
{
	ta_pick_fp(5,0,21,0,"NW_FARM2_FIELD_04");
	ta_stand_eating(21,0,5,0,"NW_FARM2_OUT_07");
};

func void rtn_wettkampf_942()
{
	ta_stand_drinking(8,0,22,0,"NW_TAVERNE_RUKHAR");
	ta_stand_drinking(22,0,8,0,"NW_TAVERNE_RUKHAR");
};

