
instance PC_MAGE_DI(NPC_DEFAULT)
{
	name[0] = "Милтен";
	guild = GIL_KDF;
	id = 22;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_FRIEND;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_MILTEN,BODYTEX_N,itar_kdf_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_22;
};


func void rtn_start_22()
{
	ta_smalltalk(8,0,23,0,"SHIP_CREW_19");
	ta_smalltalk(23,0,8,0,"SHIP_CREW_19");
};

func void rtn_undeaddragondead_22()
{
	ta_stand_wp(8,0,23,0,"SKELETTE");
	ta_stand_wp(23,0,8,0,"SKELETTE");
};

func void rtn_sittingshipdi_22()
{
	ta_sit_bench(8,0,23,0,"SHIP_CREW_19");
	ta_sit_bench(23,0,8,0,"SHIP_CREW_19");
};

