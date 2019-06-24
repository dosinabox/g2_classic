
instance VLK_441_GARVELL(NPC_DEFAULT)
{
	name[0] = "Гарвелл";
	guild = GIL_VLK;
	id = 441;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_vlk_axe);
	b_createambientinv(self);
	CreateInvItems(self,itse_goldpocket25,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_LEFTY,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_441;
};


func void rtn_start_441()
{
	ta_stand_drinking(4,50,19,11,"NW_CITY_HABOUR_07");
	ta_smalltalk(19,11,0,1,"NW_CITY_HABOUR_TAVERN01_SMALLTALK_01");
	ta_stand_drinking(0,1,4,50,"NW_CITY_HABOUR_TAVERN01_STAND_01");
};

