
instance VLK_4108_ENGOR(NPC_DEFAULT)
{
	name[0] = "Ёнгор";
	guild = GIL_MIL;
	id = 4108;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_OCMAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_mil_sword);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_L_JACKAL,BODYTEX_L,itar_mil_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_4108;
};


func void rtn_start_4108()
{
	ta_read_bookstand(8,0,22,0,"OC_COUNT_01");
	ta_sleep(22,0,8,0,"OC_GUARD_ROOM_03_SLEEP");
};

