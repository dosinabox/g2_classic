
instance NONE_101_MARIO_DI(NPC_DEFAULT)
{
	name[0] = "Марио";
	guild = GIL_DMT;
	id = 1010;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	aivar[AIV_MAGICUSER] = MAGIC_NEVER;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_sturmbringer);
	b_createambientinv(self);
	CreateInvItems(self,itwr_dementorobsessionbook_mis,1);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_B_NORMAL_KIRGO,BODYTEX_B,itar_mil_m);
	Mdl_SetModelFatness(self,1.2);
	Mdl_ApplyOverlayMds(self,"Humans_MILITIA.mds");
	b_givenpctalents(self);
	b_setfightskills(self,95);
	daily_routine = rtn_start_1010;
};


func void rtn_start_1010()
{
	ta_sit_bench(8,0,23,0,"SHIP_DECK_25");
	ta_sit_bench(23,0,8,0,"SHIP_DECK_25");
};

func void rtn_orksturmdi_1010()
{
	ta_stand_armscrossed(8,0,23,0,"DI_MARIO_AMBUSH");
	ta_stand_armscrossed(23,0,8,0,"DI_MARIO_AMBUSH");
};

