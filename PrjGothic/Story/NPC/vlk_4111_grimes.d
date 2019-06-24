
instance VLK_4111_GRIMES(NPC_DEFAULT)
{
	name[0] = "Гримс";
	guild = GIL_OUT;
	id = 4111;
	voice = 5;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_axe_l_01);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_N_IMPORTANTGREY,BODYTEX_N,itar_prisoner);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,40);
	daily_routine = rtn_start_4111;
};


func void rtn_start_4111()
{
	ta_pick_ore(8,0,23,0,"OW_MINE2_GRIMES");
	ta_pick_ore(23,0,8,0,"OW_MINE2_GRIMES");
};

