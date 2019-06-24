
instance VLK_4150_LEICHE(NPC_DEFAULT)
{
	name[0] = NAME_WAFFENKNECHT;
	guild = GIL_MIL;
	id = 4150;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_OCAMBIENT;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 1;
	attribute[ATR_HITPOINTS] = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_B_NORMAL01,BODYTEX_B,itar_mil_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_4150;
};


func void rtn_start_4150()
{
	ta_stand_guarding(8,0,22,0,"OW_MINE3_LEICHE_03");
	ta_stand_guarding(22,0,8,0,"OW_MINE3_LEICHE_03");
};

