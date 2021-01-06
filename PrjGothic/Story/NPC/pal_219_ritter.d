
instance PAL_219_RITTER(NPC_DEFAULT)
{
	name[0] = NAME_RITTER;
	guild = GIL_OUT;
	id = 219;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_OCAMBIENT;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_pal_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_L_TOUGHBALD01,BODYTEX_L,itar_pal_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,55);
	daily_routine = rtn_start_219;
};


func void rtn_start_219()
{
	ta_stand_guarding(8,0,23,0,"OW_PATH_264");
	ta_stand_guarding(23,0,8,0,"OW_PATH_264");
};

