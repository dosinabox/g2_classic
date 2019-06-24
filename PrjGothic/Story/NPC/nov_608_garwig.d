
instance NOV_608_GARWIG(NPC_DEFAULT)
{
	name[0] = "Гарвиг";
	guild = GIL_NOV;
	id = 608;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	level = 1;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_MANA_MAX] = 60;
	attribute[ATR_MANA] = 60;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_nov_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_L_TOUGH02,BODYTEX_L,itar_nov_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_608;
};


func void rtn_start_608()
{
	ta_guard_hammer(8,0,23,0,"NW_MONASTERY_SANCTUM_02");
	ta_guard_hammer(23,0,8,0,"NW_MONASTERY_SNACTUM_02");
};

