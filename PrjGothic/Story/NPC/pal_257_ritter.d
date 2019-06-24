
instance PAL_257_RITTER(NPC_DEFAULT)
{
	name[0] = NAME_RITTER;
	guild = GIL_PAL;
	id = 257;
	voice = 9;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_OCAMBIENT;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_pal_sword);
	EquipItem(self,itrw_mil_crossbow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART_SWINEY,BODYTEX_N,itar_pal_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_257;
};


func void rtn_start_257()
{
	ta_practice_sword(8,0,19,0,"OC_TRAIN_03");
	ta_sit_campfire(19,0,8,0,"OC_CAMPFIRE_OUT_03");
};

func void rtn_marcos_257()
{
	ta_stand_guarding(8,0,19,0,"OW_STAND_GUARDS");
	ta_stand_guarding(19,0,8,0,"OW_STAND_GUARDS");
};

