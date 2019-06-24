
instance PAL_200_HAGEN(NPC_DEFAULT)
{
	name[0] = "Лорд Хаген";
	guild = GIL_PAL;
	id = 200;
	voice = 4;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	aivar[AIV_IGNORE_MURDER] = TRUE;
	aivar[AIV_IGNORE_THEFT] = TRUE;
	aivar[AIV_IGNORE_SHEEPKILLER] = TRUE;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_2h_pal_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_TOUGH_OKYL,BODYTEX_N,itar_pal_h);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_200;
};


func void rtn_start_200()
{
	ta_stand_armscrossed(8,0,20,0,"NW_CITY_HAGEN");
	ta_stand_armscrossed(20,0,8,0,"NW_CITY_HAGEN");
};

func void rtn_shipfree_200()
{
	ta_stand_guarding(8,0,23,0,"NW_CITY_UPTOWNPARADE_HAGEN");
	ta_stand_guarding(23,0,8,0,"NW_CITY_UPTOWNPARADE_HAGEN");
};

