
instance VLK_4131_ENGROM(NPC_DEFAULT)
{
	name[0] = "Ёнгром";
	guild = GIL_OUT;
	id = 4131;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_vlk_axe);
	EquipItem(self,itrw_mil_crossbow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART20,BODYTEX_N,itar_leather_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,45);
	daily_routine = rtn_start_4131;
};


func void rtn_start_4131()
{
	ta_sit_campfire(8,0,23,0,"SPAWN_TALL_PATH_BANDITOS2_03");
	ta_sit_campfire(23,0,8,0,"SPAWN_TALL_PATH_BANDITOS2_03");
};

func void rtn_obsessed_4131()
{
	ta_stand_armscrossed(8,0,23,0,"OW_SAWHUT_MOLERAT_MOVEMENT");
	ta_stand_armscrossed(23,0,8,0,"OW_SAWHUT_MOLERAT_MOVEMENT");
};

