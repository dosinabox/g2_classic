
instance PAL_264_RITTER(NPC_DEFAULT)
{
	name[0] = NAME_RITTER;
	guild = GIL_PAL;
	id = 264;
	voice = 9;
	flags = 0;
	npctype = NPCTYPE_OCAMBIENT;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_pal_sword);
	EquipItem(self,itrw_mil_crossbow);
	b_createambientinv(self);
	CreateInvItems(self,itke_oc_store,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_L_RATFORD,BODYTEX_L,itar_pal_m);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,65);
	daily_routine = rtn_start_264;
};


func void rtn_start_264()
{
	ta_stand_guarding(8,0,19,0,"OC_GUARD_STORE_01");
	ta_stand_guarding(19,0,8,0,"OC_GUARD_STORE_01");
};

