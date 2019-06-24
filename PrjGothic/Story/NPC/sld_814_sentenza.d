
instance SLD_814_SENTENZA(NPC_DEFAULT)
{
	name[0] = "Сентенза";
	guild = GIL_SLD;
	id = 814;
	voice = 9;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_MM_FOLLOWTIME] = 60;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	CreateInvItems(self,itfo_apple,1);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_TOUGH_OKYL,BODYTEX_N,itar_sld_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_814;
};


func void rtn_start_814()
{
	ta_stand_eating(8,0,22,0,"NW_BIGFARM_ALLEE_01");
	ta_stand_eating(22,0,8,0,"NW_BIGFARM_ALLEE_01");
};

func void rtn_follow_814()
{
	ta_follow_player(8,0,22,0,"NW_BIGFARM_VORPOSTEN1_02");
	ta_follow_player(22,0,8,0,"NW_BIGFARM_VORPOSTEN1_02");
};

