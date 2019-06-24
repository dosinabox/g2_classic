
instance PAL_253_WACHE(NPC_DEFAULT)
{
	name[0] = NAME_RITTER;
	guild = GIL_PAL;
	id = 253;
	voice = 9;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_OCAMBIENT;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_pal_sword);
	EquipItem(self,itrw_mil_crossbow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_B_TOUGH_PACHO,BODYTEX_B,itar_pal_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,65);
	daily_routine = rtn_start_253;
};


func void rtn_start_253()
{
	ta_stand_guarding(8,0,23,0,"OC_GATE_GUARD_01");
	ta_stand_guarding(23,0,8,0,"OC_GATE_GUARD_01");
};

func void rtn_marcos_253()
{
	ta_stand_guarding(8,0,23,0,"OW_STAND_GUARDS");
	ta_stand_guarding(23,0,8,0,"OW_STAND_GUARDS");
};

