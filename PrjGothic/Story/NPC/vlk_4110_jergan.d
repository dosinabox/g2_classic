
instance VLK_4110_JERGAN(NPC_DEFAULT)
{
	name[0] = "Джерган";
	guild = GIL_NONE;
	id = 4110;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_sld_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_WHISTLER,BODYTEX_N,itar_bdt_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,75);
	daily_routine = rtn_start_4110;
};


func void rtn_start_4110()
{
	ta_sit_campfire(8,0,23,0,"OW_STAND_JERGAN");
	ta_sit_campfire(23,0,8,0,"OW_STAND_JERGAN");
};

func void rtn_fajeth_4110()
{
	ta_sit_campfire(8,0,23,0,"OW_NEWMINE_04");
	ta_sit_campfire(23,0,8,0,"OW_NEWMINE_04");
};

