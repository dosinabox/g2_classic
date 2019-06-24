
instance PAL_280_TENGRON(NPC_DEFAULT)
{
	name[0] = "Тенгрон";
	guild = GIL_OUT;
	id = 280;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_pal_sword);
	EquipItem(self,itrw_mil_crossbow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_L_TOUGHBALD01,BODYTEX_L,itar_pal_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,65);
	daily_routine = rtn_start_280;
};


func void rtn_start_280()
{
	ta_stand_guarding(8,0,23,0,"OW_NEWMINE_02");
	ta_stand_guarding(23,0,8,0,"OW_NEWMINE_02");
};

func void rtn_runaftervirtualrefugee_280()
{
	ta_runtowp(8,0,23,0,"OW_PATH_06_05");
	ta_runtowp(23,0,8,0,"OW_PATH_06_05");
};

