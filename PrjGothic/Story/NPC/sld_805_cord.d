
instance SLD_805_CORD(NPC_DEFAULT)
{
	name[0] = "Корд";
	guild = GIL_SLD;
	id = 805;
	voice = 14;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMAL_CORD,BODYTEX_N,itar_sld_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_805;
};


func void rtn_start_805()
{
	ta_practice_sword(7,40,22,40,"NW_BIGFARM_CORD");
	ta_sleep(22,40,7,40,"NW_BIGFARM_HOUSE_08");
};

