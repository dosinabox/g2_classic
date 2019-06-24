
instance VLK_4148_GESTATH(NPC_DEFAULT)
{
	name[0] = "Гестат";
	guild = GIL_OUT;
	id = 4148;
	voice = 9;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Psionic",FACE_B_THORUS,BODYTEX_B,itar_djg_crawler);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_4148;
};


func void rtn_start_4148()
{
	ta_stand_guarding(8,0,23,0,"OW_DJG_ROCKCAMP_01");
	ta_sit_campfire(23,0,8,0,"OW_DJG_ROCKCAMP_01");
};

