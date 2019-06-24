
instance PAL_202_ALBRECHT(NPC_DEFAULT)
{
	name[0] = "Альбрехт";
	guild = GIL_PAL;
	id = 202;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_pal_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_P_TOUGH_RODRIGUEZ,BODYTEX_P,itar_pal_h);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_202;
};


func void rtn_start_202()
{
	ta_read_bookstand(8,0,23,0,"NW_CITY_ALBRECHT");
	ta_read_bookstand(23,0,8,0,"NW_CITY_ALBRECHT");
};

