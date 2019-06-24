
instance VLK_4152_OLAV(NPC_DEFAULT)
{
	name[0] = "Юырт";
	guild = GIL_MIL;
	id = 4152;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_OCAMBIENT;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 1;
	attribute[ATR_HITPOINTS] = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	CreateInvItems(self,itse_olav,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART22,BODYTEX_N,itar_mil_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_4152;
};


func void rtn_start_4152()
{
	ta_stand_guarding(8,0,23,0,"OW_WOLFHUT_01");
	ta_stand_guarding(23,0,8,0,"OW_WOLFHUT_01");
};

