
instance DJG_702_ROD(NPC_DEFAULT)
{
	name[0] = "Род";
	guild = GIL_DJG;
	id = 702;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_FRIEND;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	CreateInvItems(self,itpo_health_02,6);
	CreateInvItems(self,itmi_oldcoin,1);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_TOUGHBART01,BODYTEX_N,itar_djg_m);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_702;
};


func void rtn_start_702()
{
	ta_sit_bench(8,0,23,0,"OW_DJG_SWAMPCAMP_01");
	ta_sit_bench(23,0,8,0,"OW_DJG_SWAMPCAMP_01");
};

func void rtn_swampwait1_702()
{
	ta_guide_player(8,0,23,0,"OW_DJG_SWAMP_WAIT1_02");
	ta_guide_player(23,0,8,0,"OW_DJG_SWAMP_WAIT1_02");
};

func void rtn_swampwait2_702()
{
	ta_runtowp(8,0,23,0,"OW_DJG_SWAMP_WAIT2_02");
	ta_runtowp(23,0,8,0,"OW_DJG_SWAMP_WAIT2_02");
};

func void rtn_swampdragon_702()
{
	ta_runtowp(8,0,23,0,"OW_SWAMPDRAGON_01");
	ta_runtowp(23,0,8,0,"OW_SWAMPDRAGON_01");
};

