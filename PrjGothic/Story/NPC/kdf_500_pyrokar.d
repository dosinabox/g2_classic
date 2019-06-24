
instance KDF_500_PYROKAR(NPC_DEFAULT)
{
	name[0] = "Пирокар";
	guild = GIL_KDF;
	id = 500;
	voice = 11;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_IMPORTANTOLD,BODYTEX_N,itar_kdf_h);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_500;
};


func void rtn_start_500()
{
	ta_sit_throne(8,0,23,0,"NW_MONASTERY_THRONE_01");
	ta_sit_throne(23,0,8,0,"NW_MONASTERY_THRONE_01");
};

func void rtn_ritualinnoseyerepair_500()
{
	ta_stand_guarding(8,0,23,0,"NW_TROLLAREA_RITUAL_02");
	ta_stand_guarding(23,0,8,0,"NW_TROLLAREA_RITUAL_02");
};

func void rtn_ritualinnoseye_500()
{
	ta_circle(8,0,23,0,"NW_TROLLAREA_RITUAL_02");
	ta_circle(23,0,8,0,"NW_TROLLAREA_RITUAL_02");
};

