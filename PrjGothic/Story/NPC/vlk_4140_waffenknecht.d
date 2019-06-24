
instance VLK_4140_WAFFENKNECHT(NPC_DEFAULT)
{
	name[0] = NAME_WAFFENKNECHT;
	guild = GIL_MIL;
	id = 4140;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_OCAMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_B_TOUGH_SILAS,BODYTEX_B,itar_mil_l);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_4140;
};


func void rtn_start_4140()
{
	ta_smalltalk(8,0,23,0,"OC_CENTER_03");
	ta_sit_campfire(23,0,8,0,"OC_KNECHTCAMP_01");
};

