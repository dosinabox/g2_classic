
instance PAL_281_FAJETH(NPC_DEFAULT)
{
	name[0] = "Фаджет";
	guild = GIL_OUT;
	id = 281;
	voice = 13;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_pal_sword);
	EquipItem(self,itrw_mil_crossbow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_FINGERS,BODYTEX_N,itar_pal_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,65);
	daily_routine = rtn_start_281;
};


func void rtn_start_281()
{
	ta_stand_guarding(8,0,23,0,"OW_NEWMINE_09");
	ta_stand_guarding(23,0,8,0,"OW_NEWMINE_09");
};

