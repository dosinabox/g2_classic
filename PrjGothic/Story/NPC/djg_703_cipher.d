
instance DJG_703_CIPHER(NPC_DEFAULT)
{
	name[0] = "Сифер";
	guild = GIL_DJG;
	id = 703;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_FRIEND;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_sld_sword);
	EquipItem(self,itrw_crossbow_m_01);
	b_createambientinv(self);
	CreateInvItems(self,itpo_health_02,6);
	CreateInvItems(self,itmi_oldcoin,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART10,BODYTEX_N,itar_djg_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_703;
};


func void rtn_start_703()
{
	ta_sit_bench(8,0,23,0,"OW_DJG_SWAMPCAMP_02");
	ta_sit_bench(23,0,8,0,"OW_DJG_SWAMPCAMP_02");
};

func void rtn_swampwait1_703()
{
	ta_guide_player(8,0,23,0,"OW_DJG_SWAMP_WAIT1_01");
	ta_guide_player(23,0,8,0,"OW_DJG_SWAMP_WAIT1_01");
};

func void rtn_swampwait2_703()
{
	ta_runtowp(8,0,23,0,"OW_DJG_SWAMP_WAIT2_01");
	ta_runtowp(23,0,8,0,"OW_DJG_SWAMP_WAIT2_01");
};

func void rtn_swampdragon_703()
{
	ta_runtowp(8,0,23,0,"OW_DRAGONSWAMP_009");
	ta_runtowp(23,0,8,0,"OW_DRAGONSWAMP_009");
};

