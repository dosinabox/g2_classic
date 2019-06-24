
instance VLK_4132_TALBIN_NW(NPC_DEFAULT)
{
	name[0] = "Талбин";
	guild = GIL_VLK;
	id = 4132;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_bau_mace);
	EquipItem(self,itrw_sld_bow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_BULLIT,BODYTEX_N,itar_leather_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_prestart_4132;
};


func void rtn_prestart_4132()
{
	ta_stand_eating(8,0,23,0,"LEVELCHANGE");
	ta_stand_eating(23,0,8,0,"LEVELCHANGE");
};

func void rtn_farm_4132()
{
	ta_stand_eating(8,0,23,0,"NW_FARM2_OUT_07");
	ta_stand_eating(23,0,8,0,"NW_FARM2_OUT_07");
};

