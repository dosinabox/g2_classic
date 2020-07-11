
instance PC_PSIONIC_DI(NPC_DEFAULT)
{
	name[0] = "Лестер";
	guild = GIL_NONE;
	id = 24;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_FRIEND;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	b_createambientinv(self);
	EquipItem(self,itmw_kriegshammer2);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_P_LESTER,BODYTEX_TATTOO_P,itar_lester);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_24;
};


func void rtn_start_24()
{
	ta_smalltalk(8,0,23,0,"SHIP_CREW_19");
	ta_smalltalk(23,0,8,0,"SHIP_CREW_19");
};

func void rtn_undeaddragondead_24()
{
	ta_stand_armscrossed(8,0,23,0,"DI_DRACONIANAREA_19");
	ta_stand_armscrossed(23,0,8,0,"DI_DRACONIANAREA_19");
};

func void rtn_sittingshipdi_24()
{
	ta_sit_bench(8,0,23,0,"SHIP_CREW_19");
	ta_sit_bench(23,0,8,0,"SHIP_CREW_19");
};

