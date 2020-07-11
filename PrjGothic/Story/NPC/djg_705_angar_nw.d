
instance DJG_705_ANGAR_NW(NPC_DEFAULT)
{
	name[0] = "Ангар";
	guild = GIL_DJG;
	id = 7050;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_2h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_B_CORANGAR,BODYTEX_TATTOO_B,itar_corangar);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_7050;
};


func void rtn_start_7050()
{
	ta_stand_armscrossed(8,0,23,0,"FARM3");
	ta_stand_armscrossed(23,0,8,0,"FARM3");
};

func void rtn_waitforship_7050()
{
	ta_stand_armscrossed(8,0,23,0,"NW_WAITFOR_SHIP_03");
	ta_stand_armscrossed(23,0,8,0,"NW_WAITFOR_SHIP_03");
};

func void rtn_ship_7050()
{
	ta_stand_armscrossed(8,0,23,0,"SHIP_CREW_03");
	ta_stand_armscrossed(23,0,8,0,"SHIP_CREW_03");
};

