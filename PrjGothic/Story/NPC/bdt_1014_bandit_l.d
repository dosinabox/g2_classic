
instance BDT_1014_BANDIT_L(NPC_DEFAULT)
{
	name[0] = "Браго";
	guild = GIL_BDT;
	id = 1014;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_setattributestochapter(self,0);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_nagelknueppel);
	b_createambientinv(self);
	CreateInvItems(self,itke_bandit,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Psionic",FACE_N_MUD,BODYTEX_N,itar_leather_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,10);
	daily_routine = rtn_start_1014;
};


func void rtn_start_1014()
{
	ta_stand_armscrossed(0,0,12,0,"NW_XARDAS_BANDITS_LEFT");
	ta_stand_armscrossed(12,0,0,0,"NW_XARDAS_BANDITS_LEFT");
};

