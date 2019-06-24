
instance VLK_439_VATRAS_DI(NPC_DEFAULT)
{
	name[0] = "Ватрас";
	guild = GIL_VLK;
	id = 4390;
	voice = 5;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_FRIEND;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	b_setnpcvisual(self,MALE,"Hum_Head_Psionic",FACE_B_SATURAS,BODYTEX_B,itar_kdw_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	aivar[AIV_MAGICUSER] = MAGIC_ALWAYS;
	daily_routine = rtn_start_4390;
};


func void rtn_start_4390()
{
	ta_read_bookstand(8,0,23,0,"SHIP_IN_22");
	ta_sleep(23,0,8,0,"SHIP_IN_04");
};

