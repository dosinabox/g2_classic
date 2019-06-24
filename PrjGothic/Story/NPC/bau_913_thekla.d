
instance BAU_913_THEKLA(NPC_DEFAULT)
{
	name[0] = "Текла";
	guild = GIL_BAU;
	id = 913;
	voice = 17;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe",FACEBABE_N_BROWN,BODYTEXBABE_N,itar_baubabe_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,10);
	daily_routine = rtn_start_913;
};


func void rtn_start_913()
{
	ta_stand_guarding(8,0,8,30,"NW_BIGFARM_KITCHEN_BARKEEPER");
	ta_cook_stove(8,30,9,0,"NW_BIGFARM_KITCHEN_COOK");
	ta_stand_guarding(9,0,9,30,"NW_BIGFARM_KITCHEN_BARKEEPER");
	ta_cook_stove(9,30,10,0,"NW_BIGFARM_KITCHEN_COOK");
	ta_stand_guarding(10,0,10,30,"NW_BIGFARM_KITCHEN_BARKEEPER");
	ta_cook_stove(10,30,11,0,"NW_BIGFARM_KITCHEN_COOK");
	ta_stand_guarding(11,0,11,30,"NW_BIGFARM_KITCHEN_BARKEEPER");
	ta_cook_stove(11,30,12,0,"NW_BIGFARM_KITCHEN_COOK");
	ta_stand_guarding(12,0,12,30,"NW_BIGFARM_KITCHEN_BARKEEPER");
	ta_cook_stove(12,30,13,0,"NW_BIGFARM_KITCHEN_COOK");
	ta_stand_guarding(13,0,13,30,"NW_BIGFARM_KITCHEN_BARKEEPER");
	ta_cook_stove(13,30,14,0,"NW_BIGFARM_KITCHEN_COOK");
	ta_stand_guarding(14,0,14,30,"NW_BIGFARM_KITCHEN_BARKEEPER");
	ta_cook_stove(14,30,15,0,"NW_BIGFARM_KITCHEN_COOK");
	ta_stand_guarding(15,0,15,30,"NW_BIGFARM_KITCHEN_BARKEEPER");
	ta_cook_stove(15,30,16,0,"NW_BIGFARM_KITCHEN_COOK");
	ta_stand_guarding(16,0,16,30,"NW_BIGFARM_KITCHEN_BARKEEPER");
	ta_cook_stove(16,30,17,0,"NW_BIGFARM_KITCHEN_COOK");
	ta_stand_guarding(17,0,17,30,"NW_BIGFARM_KITCHEN_BARKEEPER");
	ta_cook_stove(17,30,18,0,"NW_BIGFARM_KITCHEN_COOK");
	ta_stand_guarding(18,0,18,30,"NW_BIGFARM_KITCHEN_BARKEEPER");
	ta_cook_stove(18,30,19,0,"NW_BIGFARM_KITCHEN_COOK");
	ta_stand_guarding(19,0,19,30,"NW_BIGFARM_KITCHEN_BARKEEPER");
	ta_cook_stove(19,30,20,0,"NW_BIGFARM_KITCHEN_COOK");
	ta_stand_guarding(20,0,20,30,"NW_BIGFARM_KITCHEN_BARKEEPER");
	ta_cook_stove(20,30,21,0,"NW_BIGFARM_KITCHEN_COOK");
	ta_stand_guarding(21,0,21,30,"NW_BIGFARM_KITCHEN_BARKEEPER");
	ta_cook_stove(21,30,22,0,"NW_BIGFARM_KITCHEN_COOK");
	ta_stand_guarding(22,0,8,0,"NW_BIGFARM_KITCHEN_BARKEEPER");
};

