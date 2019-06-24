
instance VLK_4006_BOTE(NPC_DEFAULT)
{
	name[0] = "Мальчик на побегушках";
	guild = GIL_VLK;
	id = 4006;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,3);
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_NORMAL_STONE,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_4006;
};


func void rtn_start_4006()
{
	ta_stand_guarding(8,0,22,0,"NW_PATH_TO_MONASTERY_AREA_01");
	ta_stand_guarding(22,0,8,0,"NW_PATH_TO_MONASTERY_AREA_01");
};

func void rtn_rest_4006()
{
	ta_stand_drinking(8,0,22,0,"TAVERNE");
	ta_stand_drinking(22,0,8,0,"TAVERNE");
};

