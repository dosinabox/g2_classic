
instance PC_FIGHTER_OW(NPC_DEFAULT)
{
	name[0] = "Горн";
	guild = GIL_NONE;
	id = 3;
	voice = 12;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_FRIEND;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_B_GORN,BODYTEX_B,itar_sld_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_3;
};


func void rtn_start_3()
{
	ta_sit_campfire(8,0,23,0,"OC_PRISON_CELL_03_SIT_GROUND");
	ta_sit_campfire(23,0,8,0,"OC_PRISON_CELL_03_SIT_GROUND");
};

func void rtn_free_3()
{
	ta_smalltalk(8,0,23,0,"OC_MAGE_LIBRARY_IN");
	ta_smalltalk(23,0,8,0,"OC_MAGE_LIBRARY_IN");
};

func void rtn_tot_3()
{
	ta_sit_campfire(8,0,23,0,"TOT");
	ta_sit_campfire(23,0,8,0,"TOT");
};

