
instance DJG_701_BULLCO(NPC_DEFAULT)
{
	name[0] = "Булко";
	guild = GIL_DJG;
	id = 701;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMAL_OLLI_KAHN,BODYTEX_N,itar_djg_m);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,65);
	daily_routine = rtn_start_701;
};


func void rtn_start_701()
{
	ta_sit_bench(8,0,23,0,"OW_DJG_ICECAMP_02");
	ta_sit_bench(23,0,8,0,"OW_DJG_ICECAMP_02");
};

func void rtn_icewait1_701()
{
	ta_stand_armscrossed(0,0,23,0,"OW_ICEREGION_ENTRANCE");
	ta_stand_armscrossed(23,0,24,0,"OW_ICEREGION_ENTRANCE");
};

func void rtn_icewait2_701()
{
	ta_stand_armscrossed(0,0,23,0,"OW_DJG_ICEREGION_WAIT2_02");
	ta_stand_armscrossed(23,0,24,0,"OW_DJG_ICEREGION_WAIT2_02");
};

func void rtn_icedragon_701()
{
	ta_stand_armscrossed(0,0,23,0,"OW_ICEDRAGON_02");
	ta_stand_armscrossed(23,0,24,0,"OW_ICEDRAGON_02");
};

func void rtn_djgvorposten_701()
{
	ta_stand_armscrossed(0,0,23,0,"OW_MOVEMENT_BGOBBO1");
	ta_stand_armscrossed(23,0,24,0,"OW_MOVEMENT_BGOBBO1");
};

func void rtn_follow_701()
{
	ta_follow_player(0,0,23,0,"SPAWN_OW_BLACKGOBBO_A1");
	ta_follow_player(23,0,24,0,"SPAWN_OW_BLACKGOBBO_A1");
};

