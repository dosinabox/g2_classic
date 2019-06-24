
instance MIL_306_TUERWACHE(NPC_DEFAULT)
{
	name[0] = "Стражник судьи";
	guild = GIL_MIL;
	id = 306;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_L_TOUGHBALD01,BODYTEX_L,itar_mil_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_306;
};


func void rtn_start_306()
{
	ta_stand_guarding(8,0,18,45,"NW_CITY_JUDGE_GUARD_01");
	ta_stand_guarding(18,45,22,0,"NW_CITY_UPTOWN_JUDGE_01");
	ta_stand_guarding(22,0,8,0,"NW_CITY_JUDGE_GUARD_01");
};

