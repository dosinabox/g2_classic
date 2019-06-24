
instance SLD_819_SOELDNER(NPC_DEFAULT)
{
	name[0] = NAME_SOELDNER;
	guild = GIL_SLD;
	id = 819;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_P_TOUGH_DRAGO,BODYTEX_P,itar_sld_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_819;
};


func void rtn_start_819()
{
	ta_stand_drinking(7,45,23,45,"NW_BIGFARM_KITCHEN_03");
	ta_sleep(23,45,7,45,"NW_BIGFARM_HOUSE_SLD_SLEEP");
};

