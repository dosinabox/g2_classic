
instance VLK_447_CASSIA(NPC_DEFAULT)
{
	name[0] = "Кассия";
	guild = GIL_OUT;
	id = 447;
	voice = 16;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_DROPDEADANDKILL] = TRUE;
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_meisterdegen);
	b_createambientinv(self);
	CreateInvItems(self,itke_thiefguildkey_hotel_mis,1);
	CreateInvItems(self,itke_thieftreasure,1);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe",FACEBABE_N_BLACKHAIR,BODYTEXBABE_N,itar_vlkbabe_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,90);
	daily_routine = rtn_start_447;
};


func void rtn_start_447()
{
	ta_read_bookstand(7,0,23,0,"NW_CITY_KANAL_ROOM_05_02");
	ta_sleep(23,0,7,0,"NW_CITY_KANAL_ROOM_05_BED_01");
};

