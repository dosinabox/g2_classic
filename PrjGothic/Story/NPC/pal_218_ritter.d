
instance PAL_218_RITTER(NPC_DEFAULT)
{
	name[0] = NAME_RITTER;
	guild = GIL_OUT;
	id = 218;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_OCAMBIENT;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_pal_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_NORMALBART05,BODYTEX_N,itar_pal_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,65);
	daily_routine = rtn_start_218;
};


func void rtn_start_218()
{
	ta_stand_guarding(8,0,23,0,"OW_PATH_148_A");
	ta_stand_guarding(23,0,8,0,"OW_PATH_148_A");
};

