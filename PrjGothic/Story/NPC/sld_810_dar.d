
instance SLD_810_DAR(NPC_DEFAULT)
{
	name[0] = "Дар";
	guild = GIL_SLD;
	id = 810;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	EquipItem(self,itrw_sld_bow);
	b_createambientinv(self);
	CreateInvItems(self,itmi_joint,10);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL_SPASSVOGEL,BODYTEX_N,itar_sld_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,40);
	daily_routine = rtn_prestart_810;
};


func void rtn_prestart_810()
{
	ta_smoke_joint(8,0,22,0,"NW_BIGFARM_KITCHEN_DAR");
	ta_smoke_joint(22,0,8,0,"NW_BIGFARM_KITCHEN_DAR");
};

func void rtn_start_810()
{
	ta_smoke_joint(8,0,22,0,"NW_BIGFARM_KITCHEN_DAR");
	ta_sit_chair(22,0,8,0,"NW_BIGFARM_HOUSE_12");
};

