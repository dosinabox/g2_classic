
instance VLK_444_JACK_DI(NPC_DEFAULT)
{
	name[0] = "Джек";
	guild = GIL_VLK;
	id = 4440;
	voice = 14;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_IMPORTANTOLD,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_4440;
};


func void rtn_start_4440()
{
	ta_stand_wp(8,0,23,0,"SHIP_CREW_CAPTAIN");
	ta_sleep(23,0,8,0,"SHIP_IN_06");
};

func void rtn_orksturmdi_4440()
{
	ta_stand_wp(8,0,23,0,"SHIP_DECK_03");
	ta_stand_wp(23,0,8,0,"SHIP_DECK_03");
};

