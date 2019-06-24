
instance PAL_256_RITTER(NPC_DEFAULT)
{
	name[0] = NAME_RITTER;
	guild = GIL_PAL;
	id = 256;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_OCAMBIENT;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_pal_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_P_NORMALBART_CRONOS,BODYTEX_P,itar_pal_m);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_256;
};


func void rtn_start_256()
{
	ta_practice_sword(8,0,19,0,"OC_TRAIN_02");
	ta_sit_campfire(19,0,8,0,"OC_CAMPFIRE_OUT_02");
};

