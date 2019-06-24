
instance BAU_935_BRONKO(NPC_DEFAULT)
{
	name[0] = "Бронко";
	guild = GIL_NONE;
	id = 935;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_bau_axe);
	b_createambientinv(self);
	CreateInvItems(self,itmi_gold,35);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_B_NORMAL_KIRGO,BODYTEX_B,itar_bau_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_prestart_935;
};


func void rtn_prestart_935()
{
	ta_stand_guarding(8,0,22,0,"NW_FARM4_BRONKO");
	ta_sit_campfire(22,0,8,0,"NW_FARM4_REST_02");
};

func void rtn_start_935()
{
	ta_pick_fp(8,0,22,0,"NW_FARM4_FIELD_01");
	ta_pick_fp(22,0,8,0,"NW_FARM4_FIELD_01");
};

