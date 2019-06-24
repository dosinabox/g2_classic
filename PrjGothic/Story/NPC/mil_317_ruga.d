
instance MIL_317_RUGA(NPC_DEFAULT)
{
	name[0] = "Руга";
	guild = GIL_MIL;
	id = 317;
	voice = 11;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_mil_sword);
	EquipItem(self,itrw_mil_crossbow);
	b_createambientinv(self);
	CreateInvItems(self,itke_city_tower_03,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_N_NORMALBART03,BODYTEX_N,itar_mil_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_317;
};


func void rtn_start_317()
{
	ta_stand_drinking(7,0,20,0,"KASERNE");
	ta_sit_chair(20,0,7,0,"NW_CITY_HABOUR_KASERN_15_B");
};

