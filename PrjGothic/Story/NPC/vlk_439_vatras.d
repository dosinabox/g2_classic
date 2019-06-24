
instance VLK_439_VATRAS(NPC_DEFAULT)
{
	name[0] = "Ватрас";
	guild = GIL_VLK;
	id = 439;
	voice = 5;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_MAGICUSER] = MAGIC_ALWAYS;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItems(self,itsc_lightheal,2);
	CreateInvItems(self,itsc_zap,2);
	CreateInvItems(self,itsc_icebolt,2);
	CreateInvItems(self,itsc_light,2);
	CreateInvItems(self,itsc_trfscavenger,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Psionic",FACE_B_SATURAS,BODYTEX_B,itar_kdw_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_439;
};


func void rtn_start_439()
{
	ta_preach_vatras(5,5,20,10,"NW_CITY_MERCHANT_TEMPLE_FRONT");
	ta_pray_innos_fp(20,10,5,5,"NW_CITY_MERCHANT_TEMPLE_IN");
};

func void rtn_ritualinnoseyerepair_439()
{
	ta_stand_guarding(8,0,20,0,"NW_TROLLAREA_RITUAL_04");
	ta_stand_guarding(20,0,8,0,"NW_TROLLAREA_RITUAL_04");
};

func void rtn_ritualinnoseye_439()
{
	ta_circle(8,0,23,0,"NW_TROLLAREA_RITUAL_04");
	ta_circle(23,0,8,0,"NW_TROLLAREA_RITUAL_04");
};

func void rtn_waitforship_439()
{
	ta_sit_bench(8,0,23,0,"NW_WAITFOR_SHIP_04");
	ta_sit_bench(23,0,8,0,"NW_WAITFOR_SHIP_04");
};

func void rtn_ship_439()
{
	ta_read_bookstand(8,0,23,0,"SHIP_IN_22");
	ta_sleep(23,0,8,0,"SHIP_IN_04");
};

func void rtn_pray_439()
{
	ta_pray_innos_fp(5,5,20,10,"NW_CITY_MERCHANT_TEMPLE_FRONT");
	ta_pray_innos_fp(20,10,5,5,"NW_CITY_MERCHANT_TEMPLE_IN");
};

