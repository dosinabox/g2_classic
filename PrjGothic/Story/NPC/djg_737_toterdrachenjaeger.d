
instance DJG_737_TOTERDRACHENJAEGER(NPC_DEFAULT)
{
	name[0] = NAME_TOTERDRACHENJAEGER;
	guild = GIL_DJG;
	id = 737;
	voice = 5;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_sld_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_B_TOUGH_PACHO,BODYTEX_B,itar_djg_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_737;
};


func void rtn_start_737()
{
	ta_sit_bench(8,0,23,0,"LOCATION_18_IN");
	ta_sit_bench(23,0,8,0,"LOCATION_18_IN");
};

