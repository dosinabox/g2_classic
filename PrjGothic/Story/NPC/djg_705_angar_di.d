
instance DJG_705_ANGAR_DI(NPC_DEFAULT)
{
	name[0] = "Ангар";
	guild = GIL_DJG;
	id = 70500;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_FRIEND;
	aivar[AIV_PARTYMEMBER] = TRUE;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_2h_sld_sword);
	CreateInvItems(self,itpo_health_02,6);
	CreateInvItems(self,itmi_oldcoin,1);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_B_CORANGAR,BODYTEX_TATTOO_B,itar_corangar);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_70500;
};


func void rtn_start_70500()
{
	ta_stand_armscrossed(8,0,23,0,"SHIP_CREW_03");
	ta_stand_armscrossed(23,0,8,0,"SHIP_CREW_03");
};

func void rtn_followdi_70500()
{
	ta_follow_player(8,0,23,0,"SHIP_CREW_03");
	ta_follow_player(23,0,8,0,"SHIP_CREW_03");
};

func void rtn_firedragonisland_70500()
{
	ta_stand_armscrossed(8,0,23,0,"DI_DRACONIANAREA_FIREDRAGON");
	ta_stand_armscrossed(23,0,8,0,"DI_DRACONIANAREA_FIREDRAGON");
};

func void rtn_orkoberst_di_70500()
{
	ta_stand_armscrossed(8,0,23,0,"DI_ORKOBERST");
	ta_stand_armscrossed(23,0,8,0,"DI_ORKOBERST");
};

func void rtn_troll_di_70500()
{
	ta_stand_armscrossed(8,0,23,0,"DI_ORKAREA_TROLL");
	ta_stand_armscrossed(23,0,8,0,"DI_ORKAREA_TROLL");
};

