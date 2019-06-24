
instance DJG_700_SYLVIO(NPC_DEFAULT)
{
	name[0] = "Сильвио";
	guild = GIL_DJG;
	id = 700;
	voice = 9;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_DROPDEADANDKILL] = TRUE;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_sld_sword);
	EquipItem(self,itrw_crossbow_m_01);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_N_SCAR,BODYTEX_N,itar_djg_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_700;
};


func void rtn_start_700()
{
	ta_sit_bench(8,0,23,0,"OW_DJG_ICECAMP_01");
	ta_sit_bench(23,0,8,0,"OW_DJG_ICECAMP_01");
};

func void rtn_icewait1_700()
{
	ta_stand_guarding(0,0,23,0,"OW_ICEREGION_ENTRANCE");
	ta_stand_guarding(23,0,24,0,"OW_ICEREGION_ENTRANCE");
};

func void rtn_icewait2_700()
{
	ta_stand_guarding(0,0,23,0,"OW_DJG_ICEREGION_WAIT2_01");
	ta_stand_guarding(23,0,24,0,"OW_DJG_ICEREGION_WAIT2_01");
};

func void rtn_icedragon_700()
{
	ta_stand_guarding(0,0,23,0,"OW_ICEDRAGON_01");
	ta_stand_guarding(23,0,24,0,"OW_ICEDRAGON_01");
};

