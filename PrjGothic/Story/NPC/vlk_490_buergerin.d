
instance VLK_490_BUERGERIN(NPC_DEFAULT)
{
	name[0] = NAME_BUERGERIN;
	guild = GIL_VLK;
	id = 490;
	voice = 17;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	EquipItem(self,itmw_1h_vlk_dagger);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe8",FACEBABE_N_LILO,BODYTEX_N,itar_vlkbabe_l);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_490;
};


func void rtn_start_490()
{
	ta_stand_guarding(8,0,22,0,"NW_CITY_HABOUR_04");
	ta_stand_guarding(22,0,8,0,"NW_CITY_MERCHANT_SHOP01_IN_01");
};

