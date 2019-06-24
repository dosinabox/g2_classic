
instance VLK_4100_BRUTUS(NPC_DEFAULT)
{
	name[0] = "Брутус";
	guild = GIL_MIL;
	id = 4100;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_OCMAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_vlk_dagger);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_P_TOUGHBALD,BODYTEX_P,itar_mil_l);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_4100;
};


func void rtn_start_4100()
{
	ta_smith_sharp(8,0,23,0,"OC_FOLTER_SHARP");
	ta_smith_sharp(23,0,8,0,"OC_FOLTER_SHARP");
};

func void rtn_meatbugs_4100()
{
	ta_guard_passage(8,0,23,0,"OC_BRUTUS_MEATBUGS");
	ta_guard_passage(23,0,8,0,"OC_BRUTUS_MEATBUGS");
};

