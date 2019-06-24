
instance PAL_252_PARCIVAL(NPC_DEFAULT)
{
	name[0] = "Парсиваль";
	guild = GIL_PAL;
	id = 252;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_OCMAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_pal_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_P_TOUGH_DRAGO,BODYTEX_P,itar_pal_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,65);
	daily_routine = rtn_start_252;
};


func void rtn_start_252()
{
	ta_smalltalk(8,0,21,0,"OC_EBR_HALL_CENTER");
	ta_sleep(21,0,8,0,"OC_EBR_ROOM_01_SLEEP");
};

