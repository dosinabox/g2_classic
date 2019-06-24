
instance BAU_973_RUKHAR(NPC_DEFAULT)
{
	name[0] = "Рухар";
	guild = GIL_OUT;
	id = 973;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_L_NORMALBART02,BODYTEX_L,itar_bau_m);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_973;
};


func void rtn_start_973()
{
	ta_stand_drinking(8,0,22,0,"NW_TAVERNE_RUKHAR");
	ta_sit_bench(22,0,8,0,"NW_TAVERNE_OUT_01");
};

func void rtn_wettkampf_973()
{
	ta_stand_drinking(8,0,22,0,"NW_TAVERNE_RUKHAR");
	ta_stand_drinking(22,0,8,0,"NW_TAVERNE_RUKHAR");
};

func void rtn_wettkampfrukharwon_973()
{
	ta_stand_armscrossed(8,0,22,0,"NW_TAVERNE_RUKHAR");
	ta_stand_armscrossed(22,0,8,0,"NW_TAVERNE_RUKHAR");
};

func void rtn_wettkampfrukharlost_973()
{
	ta_sit_bench(8,0,22,0,"NW_TAVERNE_OUT_01");
	ta_sit_bench(22,0,8,0,"NW_TAVERNE_OUT_01");
};

