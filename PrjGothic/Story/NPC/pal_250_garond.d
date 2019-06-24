
instance PAL_250_GAROND(NPC_DEFAULT)
{
	name[0] = "Гаронд";
	guild = GIL_PAL;
	id = 250;
	voice = 10;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_OCMAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	aivar[AIV_IGNORE_MURDER] = TRUE;
	aivar[AIV_IGNORE_THEFT] = TRUE;
	aivar[AIV_IGNORE_SHEEPKILLER] = TRUE;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_2h_pal_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_RAVEN,BODYTEX_N,itar_pal_h);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_prestart_250;
};


func void rtn_prestart_250()
{
	ta_sit_throne(8,0,21,0,"OC_EBR_HALL_THRONE");
	ta_sit_throne(21,0,8,0,"OC_EBR_HALL_THRONE");
};

func void rtn_start_250()
{
	ta_sit_throne(8,0,21,0,"OC_EBR_HALL_THRONE");
	ta_sleep(21,0,8,0,"OC_EBR_ROOM_04_SLEEP");
};

