
instance DJG_708_KURGAN(NPC_DEFAULT)
{
	name[0] = "Курган";
	guild = GIL_DJG;
	id = 708;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_sld_sword);
	EquipItem(self,itrw_crossbow_m_01);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_IMPORTANTGREY,BODYTEX_N,itar_djg_h);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_prestart_708;
};


func void rtn_prestart_708()
{
	ta_stand_guarding(8,0,23,0,"OW_PATH_1_5_4");
	ta_stand_guarding(23,0,8,0,"OW_PATH_1_5_4");
};

func void rtn_start_708()
{
	ta_stand_guarding(8,0,23,0,"OW_MOVEMENT_LURKER_NEARBGOBBO03");
	ta_stand_guarding(23,0,8,0,"OW_MOVEMENT_LURKER_NEARBGOBBO03");
};

