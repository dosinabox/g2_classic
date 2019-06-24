
instance MIL_313_BOLTAN(NPC_DEFAULT)
{
	name[0] = "Болтан";
	guild = GIL_MIL;
	id = 313;
	voice = 5;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_B_NORMAL01,BODYTEX_B,itar_mil_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,55);
	daily_routine = rtn_start_313;
};


func void rtn_start_313()
{
	ta_sit_chair(6,55,21,0,"NW_CITY_HABOUR_KASERN_PRISON_SIT");
	ta_stand_guarding(21,0,6,55,"NW_CITY_HABOUR_KASERN_PRISON_02");
};

