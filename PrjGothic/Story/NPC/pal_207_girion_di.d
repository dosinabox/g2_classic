
instance PAL_207_GIRION_DI(NPC_DEFAULT)
{
	name[0] = "Гирион";
	guild = GIL_PAL;
	id = 2070;
	voice = 8;
	flags = 0;
	npctype = NPCTYPE_FRIEND;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_pal_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_N_LEFTY,BODYTEX_N,itar_pal_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,55);
	daily_routine = rtn_start_2070;
};


func void rtn_start_2070()
{
	ta_sit_bench(8,0,23,0,"SHIP_DECK_18");
	ta_sit_bench(23,0,8,0,"SHIP_DECK_18");
};

