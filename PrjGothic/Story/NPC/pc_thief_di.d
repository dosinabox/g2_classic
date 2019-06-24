
instance PC_THIEF_DI(NPC_DEFAULT)
{
	name[0] = "Диего";
	guild = GIL_NONE;
	id = 31;
	voice = 11;
	flags = 0;
	npctype = NPCTYPE_FRIEND;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_L_DIEGO,BODYTEX_L,itar_diego);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_31;
};


func void rtn_start_31()
{
	ta_smalltalk(8,0,23,0,"SHIP_CREW_05");
	ta_smalltalk(23,0,8,0,"SHIP_CREW_05");
};

func void rtn_undeaddragondead_31()
{
	ta_stand_wp(8,0,23,0,"WP_UNDEAD_RIGHT_DOWN_01");
	ta_stand_wp(23,0,8,0,"WP_UNDEAD_RIGHT_DOWN_01");
};

func void rtn_sittingshipdi_31()
{
	ta_sit_bench(8,0,23,0,"SHIP_CREW_04");
	ta_sit_bench(23,0,8,0,"SHIP_CREW_04");
};

