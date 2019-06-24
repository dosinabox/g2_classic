
instance DJG_739_TOTERDRACHENJAEGER(NPC_DEFAULT)
{
	name[0] = NAME_TOTERDRACHENJAEGER;
	guild = GIL_DJG;
	id = 739;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMALBART01,BODYTEX_N,itar_djg_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,65);
	daily_routine = rtn_start_739;
};


func void rtn_start_739()
{
	ta_sit_bench(8,0,23,0,"OW_ORC_LOOKOUT_05");
	ta_sit_bench(23,0,8,0,"OW_ORC_LOOKOUT_05");
};

