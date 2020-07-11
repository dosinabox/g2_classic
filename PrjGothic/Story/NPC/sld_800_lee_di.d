
instance SLD_800_LEE_DI(NPC_DEFAULT)
{
	name[0] = "ห่";
	guild = GIL_SLD;
	id = 8000;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_FRIEND;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_2h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_N_LEE,BODYTEX_TATTOO_N,itar_sld_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_8000;
};


func void rtn_start_8000()
{
	ta_stand_guarding(8,0,23,0,"SHIP_CREW_01");
	ta_sleep(23,0,8,0,"SHIP_IN_06");
};

func void rtn_undeaddragondead_8000()
{
	ta_stand_guarding(8,0,23,0,"DI_ORKAREA_14");
	ta_stand_guarding(23,0,8,0,"DI_ORKAREA_14");
};

