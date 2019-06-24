
instance DJG_709_RETHON(NPC_DEFAULT)
{
	name[0] = "Ретон";
	guild = GIL_DJG;
	id = 709;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_COOLPOCK,BODYTEX_N,itar_djg_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_709;
};


func void rtn_start_709()
{
	ta_smith_sharp(8,0,8,30,"OC_SMITH_SHARP");
	ta_stand_guarding(8,30,9,0,"OC_CENTER_04");
	ta_practice_sword(9,0,9,30,"OC_CENTER_04");
	ta_smith_sharp(9,30,10,0,"OC_SMITH_SHARP");
	ta_stand_guarding(10,0,10,30,"OC_CENTER_04");
	ta_practice_sword(10,30,11,0,"OC_CENTER_04");
	ta_smith_sharp(11,0,11,30,"OC_SMITH_SHARP");
	ta_stand_guarding(11,30,12,0,"OC_CENTER_04");
	ta_practice_sword(12,0,12,30,"OC_CENTER_04");
	ta_smith_sharp(12,30,13,0,"OC_SMITH_SHARP");
	ta_stand_guarding(13,0,13,30,"OC_CENTER_04");
	ta_practice_sword(13,30,14,0,"OC_CENTER_04");
	ta_smith_sharp(14,0,14,30,"OC_SMITH_SHARP");
	ta_stand_guarding(14,30,15,0,"OC_CENTER_04");
	ta_practice_sword(15,0,15,30,"OC_CENTER_04");
	ta_smith_sharp(15,30,16,0,"OC_SMITH_SHARP");
	ta_stand_guarding(16,0,16,30,"OC_CENTER_04");
	ta_practice_sword(16,30,17,0,"OC_CENTER_04");
	ta_smith_sharp(17,0,17,30,"OC_SMITH_SHARP");
	ta_stand_guarding(17,30,18,0,"OC_CENTER_04");
	ta_practice_sword(18,0,18,30,"OC_CENTER_04");
	ta_smith_sharp(18,30,19,0,"OC_SMITH_SHARP");
	ta_stand_guarding(19,0,19,30,"OC_CENTER_04");
	ta_practice_sword(19,30,20,0,"OC_CENTER_04");
	ta_sit_campfire(20,0,8,0,"OC_CAMPFIRE_OUT_03");
};

