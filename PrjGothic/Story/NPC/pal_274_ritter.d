
instance PAL_274_RITTER(NPC_DEFAULT)
{
	name[0] = NAME_RITTER;
	guild = GIL_PAL;
	id = 274;
	voice = 9;
	flags = 0;
	npctype = NPCTYPE_OCAMBIENT;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_pal_sword);
	EquipItem(self,itrw_mil_crossbow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_P_TOUGH_TORREZ,BODYTEX_P,itar_pal_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,65);
	daily_routine = rtn_start_274;
};


func void rtn_start_274()
{
	ta_smalltalk(8,0,23,0,"OC_TO_MAGE");
	ta_smalltalk(23,0,8,0,"OC_KNECHTCAMP_02");
};

