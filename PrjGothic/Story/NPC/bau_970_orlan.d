
instance BAU_970_ORLAN(NPC_DEFAULT)
{
	name[0] = "Орлан";
	guild = GIL_OUT;
	id = 970;
	voice = 5;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_vlk_dagger);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fatbald",FACE_B_NORMAL_SHARKY,BODYTEX_B,itar_bau_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_970;
};


func void rtn_start_970()
{
	ta_stand_wp(8,0,22,0,"NW_TAVERNE_IN_04");
	ta_stand_wp(22,0,8,0,"NW_TAVERNE_IN_04");
};

func void rtn_wettkampf_970()
{
	ta_stand_wp(8,0,22,0,"NW_TAVERNE");
	ta_stand_wp(22,0,8,0,"NW_TAVERNE");
};

