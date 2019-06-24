
instance PAL_204_TORWACHE(NPC_DEFAULT)
{
	name[0] = NAME_TORWACHE;
	guild = GIL_PAL;
	id = 204;
	voice = 9;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	aivar[AIV_NEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_2h_pal_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_WHISTLER,BODYTEX_N,itar_pal_m);
	Mdl_SetModelFatness(self,0.5);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,55);
	daily_routine = rtn_start_204;
};


func void rtn_start_204()
{
	ta_guard_passage(8,0,23,0,"NW_CITYHALL_GUARD_01");
	ta_guard_passage(23,0,8,0,"NW_CITYHALL_GUARD_01");
};

