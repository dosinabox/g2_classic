
instance VLK_4143_HAUPTTORWACHE(NPC_DEFAULT)
{
	name[0] = "Стражник у главных ворот";
	guild = GIL_VLK;
	id = 4143;
	voice = 13;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL18,BODYTEX_N,itar_mil_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_4143;
};


func void rtn_start_4143()
{
	ta_stand_guarding(8,0,23,0,"OC_GUARD_PALISADE_09");
	ta_stand_guarding(23,0,8,0,"OC_GUARD_PALISADE_09");
};

