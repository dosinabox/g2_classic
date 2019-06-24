
instance VLK_4112_DEN(NPC_DEFAULT)
{
	name[0] = "Δεν";
	guild = GIL_MIL;
	id = 4112;
	voice = 5;
	flags = 0;
	npctype = NPCTYPE_OCAMBIENT;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 1;
	attribute[ATR_HITPOINTS] = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_dagger);
	CreateInvItems(self,itmi_gold,200);
	CreateInvItems(self,itmi_silverring,1);
	CreateInvItems(self,itmi_goldring,1);
	CreateInvItems(self,itmi_silvercandleholder,1);
	CreateInvItems(self,itmi_goldnecklace,1);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMALBART_GRIM,BODYTEX_N,itar_mil_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_4112;
};


func void rtn_start_4112()
{
	ta_stand_guarding(8,0,23,0,"OW_PATH_182");
	ta_stand_guarding(23,0,8,0,"OW_PATH_182");
};

