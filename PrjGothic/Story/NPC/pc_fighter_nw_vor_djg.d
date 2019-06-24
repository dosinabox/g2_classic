
instance PC_FIGHTER_NW_VOR_DJG(NPC_DEFAULT)
{
	name[0] = "Горн";
	guild = GIL_SLD;
	id = 813;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_FRIEND;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_B_GORN,BODYTEX_B,itar_sld_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_813;
};


func void rtn_start_813()
{
	ta_sit_chair(8,0,23,0,"NW_BIGFARM_HOUSE_14");
	ta_sit_chair(23,0,8,0,"NW_BIGFARM_HOUSE_14");
};

func void rtn_tot_813()
{
	ta_sit_campfire(8,0,23,0,"TOT");
	ta_sit_campfire(23,0,8,0,"TOT");
};

