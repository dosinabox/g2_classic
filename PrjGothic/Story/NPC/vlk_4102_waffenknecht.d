
instance VLK_4102_WAFFENKNECHT(NPC_DEFAULT)
{
	name[0] = NAME_WAFFENKNECHT;
	guild = GIL_MIL;
	id = 4102;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_OCAMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMAL_SPASSVOGEL,BODYTEX_N,itar_mil_l);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_4102;
};


func void rtn_start_4102()
{
	ta_stand_guarding(8,0,23,0,"OC_GUARD_TOWER_01");
	ta_stand_guarding(23,0,8,0,"OC_GUARD_TOWER_01");
};

