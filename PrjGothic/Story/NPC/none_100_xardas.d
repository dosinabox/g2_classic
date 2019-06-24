
instance NONE_100_XARDAS(NPC_DEFAULT)
{
	name[0] = "Ксардас";
	guild = GIL_NONE;
	id = 100;
	voice = 14;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_FRIEND;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	aivar[AIV_IGNORE_MURDER] = TRUE;
	aivar[AIV_IGNORE_THEFT] = TRUE;
	aivar[AIV_IGNORE_SHEEPKILLER] = TRUE;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	b_setnpcvisual(self,MALE,"Hum_Head_Psionic",FACE_N_XARDAS,BODYTEX_N,itar_xardas);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	aivar[AIV_MAGICUSER] = MAGIC_ALWAYS;
	daily_routine = rtn_prestart_100;
};


func void rtn_prestart_100()
{
	ta_stand_armscrossed(8,0,23,0,"NW_XARDAS_START");
	ta_stand_armscrossed(23,0,8,0,"NW_XARDAS_START");
};

func void rtn_start_100()
{
	ta_read_bookstand(8,0,23,0,"NW_XARDAS_TOWER_IN1_28");
	ta_read_bookstand(23,0,8,0,"NW_XARDAS_TOWER_IN1_28");
};

func void rtn_ritualinnoseyerepair_100()
{
	ta_stand_armscrossed(8,0,23,0,"NW_TROLLAREA_RITUAL_01");
	ta_stand_armscrossed(23,0,8,0,"NW_TROLLAREA_RITUAL_01");
};

func void rtn_ritualinnoseye_100()
{
	ta_circle(8,0,23,0,"NW_TROLLAREA_RITUAL_01");
	ta_circle(23,0,8,0,"NW_TROLLAREA_RITUAL_01");
};

func void rtn_tot_100()
{
	ta_circle(8,0,23,0,"TOT");
	ta_circle(23,0,8,0,"TOT");
};

