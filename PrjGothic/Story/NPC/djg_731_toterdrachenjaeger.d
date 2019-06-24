
instance DJG_731_TOTERDRACHENJAEGER(NPC_DEFAULT)
{
	name[0] = NAME_TOTERDRACHENJAEGER;
	guild = GIL_DJG;
	id = 731;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_sld_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_B_NORMAL_ORIK,BODYTEX_B,itar_djg_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_731;
};


func void rtn_start_731()
{
	ta_sit_bench(8,0,23,0,"OW_PATH_064");
	ta_sit_bench(23,0,8,0,"OW_PATH_064");
};

