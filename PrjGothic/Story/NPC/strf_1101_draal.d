
instance STRF_1101_DRAAL(NPC_DEFAULT)
{
	name[0] = "Äðààë";
	guild = GIL_STRF;
	id = 1101;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_OCMAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_2h_axe_l_01);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_P_NORMALBALD,BODYTEX_P,itar_prisoner);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,15);
	daily_routine = rtn_start_1101;
};


func void rtn_start_1101()
{
	ta_sit_campfire(8,0,23,0,"OC_PRISON_CELL_02_SIT_GROUND");
	ta_sit_campfire(23,0,8,0,"OC_PRISON_CELL_02_SIT_GROUND");
};

