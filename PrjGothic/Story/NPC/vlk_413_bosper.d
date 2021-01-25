
instance VLK_413_BOSPER(NPC_DEFAULT)
{
	name[0] = "Боспер";
	guild = GIL_VLK;
	id = 413;
	voice = 11;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_vlk_dagger);
	EquipItem(self,itrw_sld_bow);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_L_TOUGH_SANTINO,BODYTEX_L,itar_leather_l);
	Mdl_SetModelFatness(self,0.8);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,35);
	daily_routine = rtn_start_413;
};


func void rtn_start_413()
{
	ta_stand_guarding(5,0,0,0,"NW_CITY_MERCHANT_SHOP01_IN_02");
	ta_sleep(0,0,5,0,"NW_CITY_BED_GRITTA");
};

