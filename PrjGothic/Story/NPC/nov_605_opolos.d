
instance NOV_605_OPOLOS(NPC_DEFAULT)
{
	name[0] = "Ополос";
	guild = GIL_NOV;
	id = 605;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_nov_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_B_TOUGH_SILAS,BODYTEX_B,itar_nov_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_605;
};


func void rtn_start_605()
{
	ta_stand_guarding(8,0,23,0,"NW_MONASTERY_SHEEP_05");
	ta_stand_guarding(23,0,8,0,"NW_MONASTERY_SHEEP_05");
};

func void rtn_favour_605()
{
	ta_read_bookstand(8,0,23,0,"NW_MONASTERY_RUNEMAKER_07");
	ta_read_bookstand(23,0,8,0,"NW_MONASTERY_RUNEMAKER_07");
};

