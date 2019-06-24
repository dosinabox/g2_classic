
instance BAU_984_NICLAS(NPC_DEFAULT)
{
	name[0] = "Никлас";
	guild = GIL_OUT;
	id = 984;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	EquipItem(self,itrw_sld_bow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_N_NORMALBART12,BODYTEX_N,itar_leather_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,40);
	daily_routine = rtn_start_984;
};


func void rtn_start_984()
{
	ta_sit_bench(8,0,23,0,"NW_CITY_JAEGER_SIT");
	ta_sit_bench(23,0,8,0,"NW_CITY_JAEGER_SIT");
};

