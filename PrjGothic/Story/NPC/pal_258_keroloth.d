
instance PAL_258_KEROLOTH(NPC_DEFAULT)
{
	name[0] = "Керолот";
	guild = GIL_PAL;
	id = 258;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_OCMAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_pal_sword);
	EquipItem(self,itrw_mil_crossbow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_NORMAL20,BODYTEX_N,itar_pal_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,65);
	daily_routine = rtn_start_258;
};


func void rtn_start_258()
{
	ta_stand_guarding(8,0,19,0,"OC_CENTER_05_B");
	ta_roast_scavenger(19,0,8,0,"OC_CAMPFIRE_BARBQ");
};

