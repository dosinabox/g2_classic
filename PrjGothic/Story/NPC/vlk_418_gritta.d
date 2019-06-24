
instance VLK_418_GRITTA(NPC_DEFAULT)
{
	name[0] = "Гритта";
	guild = GIL_VLK;
	id = 418;
	voice = 16;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 5;
	attribute[ATR_HITPOINTS] = 5;
	fight_tactic = FAI_HUMAN_MASTER;
	CreateInvItems(self,itmi_gold,100);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe8",FACEBABE_N_YOUNGBLONDE,BODYTEX_N,itar_vlkbabe_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_418;
};


func void rtn_start_418()
{
	ta_stand_sweeping(8,0,12,0,"NW_CITY_MERCHANT_HUT_01_IN");
	ta_cook_stove(12,0,14,0,"NW_CITY_BED_BOSPER_B");
	ta_stand_sweeping(14,0,18,0,"NW_CITY_MERCHANT_HUT_01_IN");
	ta_cook_stove(18,0,20,0,"NW_CITY_BED_BOSPER_B");
	ta_read_bookstand(20,0,23,0,"NW_CITY_MERCHANT_HUT_01_IN");
	ta_sleep(23,0,8,0,"NW_CITY_BED_BOSPER_B");
};

