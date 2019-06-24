
instance PAL_2002_LEICHE(NPC_DEFAULT)
{
	name[0] = "Сильвестро";
	guild = GIL_NONE;
	id = 2002;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 1;
	attribute[ATR_HITPOINTS] = 1;
	fight_tactic = FAI_HUMAN_STRONG;
	CreateInvItems(self,itwr_silvestro_mis,1);
	CreateInvItems(self,itpo_mana_02,2);
	CreateInvItems(self,itmi_gold,100);
	CreateInvItems(self,itpo_health_02,2);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL20,BODYTEX_N,itar_pal_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_2002;
};


func void rtn_start_2002()
{
	ta_stand_guarding(8,0,23,0,"OW_MINE3_LEICHE_01");
	ta_stand_guarding(23,0,8,0,"OW_MINE3_LEICHE_01");
};

