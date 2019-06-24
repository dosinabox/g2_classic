
instance VLK_4130_TALBIN(NPC_DEFAULT)
{
	name[0] = "Талбин";
	guild = GIL_OUT;
	id = 4130;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_FRIEND;
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
	daily_routine = rtn_start_4130;
};


func void rtn_start_4130()
{
	ta_sit_campfire(8,0,23,0,"SPAWN_TALL_PATH_BANDITOS2_03");
	ta_sit_campfire(23,0,8,0,"SPAWN_TALL_PATH_BANDITOS2_03");
};

func void rtn_fleepass_4130()
{
	ta_runtowp(8,0,23,0,"START");
	ta_runtowp(23,0,8,0,"START");
};

func void rtn_intopass_4130()
{
	ta_stand_eating(8,0,23,0,"TOT");
	ta_stand_eating(23,0,8,0,"TOT");
};

