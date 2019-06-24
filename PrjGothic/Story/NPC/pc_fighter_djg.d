
instance PC_FIGHTER_DJG(NPC_DEFAULT)
{
	name[0] = "Горн";
	guild = GIL_DJG;
	id = 704;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_FRIEND;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_2h_sld_axe);
	EquipItem(self,itrw_crossbow_m_01);
	CreateInvItems(self,itpo_health_02,6);
	CreateInvItems(self,itmi_oldcoin,1);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_B_GORN,BODYTEX_B,itar_djg_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_prestart_704;
};


func void rtn_prestart_704()
{
	ta_stand_armscrossed(8,0,23,0,"OW_DJG_STARTCAMP_01");
	ta_stand_armscrossed(23,0,8,0,"OW_DJG_STARTCAMP_01");
};

func void rtn_start_704()
{
	ta_sit_campfire(8,0,23,0,"OW_DJG_ROCKCAMP_01");
	ta_sit_campfire(23,0,8,0,"OW_DJG_ROCKCAMP_01");
};

func void rtn_runtorockruinbridge_704()
{
	ta_runtowp(8,0,23,0,"LOCATION_19_01");
	ta_runtowp(23,0,8,0,"LOCATION_19_01");
};

func void rtn_tot_704()
{
	ta_stand_armscrossed(8,0,23,0,"TOT");
	ta_stand_armscrossed(23,0,8,0,"TOT");
};

