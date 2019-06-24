
instance DJG_735_TOTERDRACHENJAEGER(NPC_DEFAULT)
{
	name[0] = NAME_TOTERDRACHENJAEGER;
	guild = GIL_DJG;
	id = 735;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Psionic",FACE_N_RICHTER,BODYTEX_N,itar_djg_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,65);
	daily_routine = rtn_start_735;
};


func void rtn_start_735()
{
	ta_sit_bench(8,0,23,0,"OW_DRAGONSWAMP_023");
	ta_sit_bench(23,0,8,0,"OW_DRAGONSWAMP_023");
};

