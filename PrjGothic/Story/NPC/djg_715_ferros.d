
instance DJG_715_FERROS(NPC_DEFAULT)
{
	name[0] = "Ферос";
	guild = GIL_DJG;
	id = 715;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	EquipItem(self,itrw_crossbow_m_01);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_B_NORMAL_ORIK,BODYTEX_B,itar_djg_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_715;
};


func void rtn_start_715()
{
	ta_stand_eating(8,0,23,0,"OC_JAN");
	ta_stand_eating(23,0,8,0,"OC_JAN");
};

