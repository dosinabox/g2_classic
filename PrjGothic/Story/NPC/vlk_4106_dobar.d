
instance VLK_4106_DOBAR(NPC_DEFAULT)
{
	name[0] = "Добар";
	guild = GIL_MIL;
	id = 4106;
	voice = 8;
	flags = 0;
	npctype = NPCTYPE_OCMAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_axe);
	b_createambientinv(self);
	CreateInvItems(self,itmi_nugget,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_SNAF,BODYTEX_N,itar_smith);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_4106;
};


func void rtn_start_4106()
{
	ta_smith_fire(8,0,8,30,"OC_SMITH_FIRE");
	ta_smith_anvil(8,30,9,0,"OC_SMITH_ANVIL");
	ta_smith_cool(9,0,9,30,"OC_SMITH_COOL");
	ta_smith_fire(9,30,10,0,"OC_SMITH_FIRE");
	ta_smith_anvil(10,0,10,30,"OC_SMITH_ANVIL");
	ta_smith_cool(10,30,11,0,"OC_SMITH_COOL");
	ta_smith_fire(11,0,11,30,"OC_SMITH_FIRE");
	ta_smith_anvil(11,30,12,0,"OC_SMITH_ANVIL");
	ta_smith_cool(12,0,12,30,"OC_SMITH_COOL");
	ta_smith_fire(12,30,13,0,"OC_SMITH_FIRE");
	ta_smith_anvil(13,0,13,30,"OC_SMITH_ANVIL");
	ta_smith_cool(13,30,14,0,"OC_SMITH_COOL");
	ta_smith_fire(14,0,14,30,"OC_SMITH_FIRE");
	ta_smith_anvil(14,30,15,0,"OC_SMITH_ANVIL");
	ta_smith_cool(15,0,15,30,"OC_SMITH_COOL");
	ta_smith_fire(15,30,16,0,"OC_SMITH_FIRE");
	ta_smith_anvil(16,0,16,30,"OC_SMITH_ANVIL");
	ta_smith_cool(16,30,17,0,"OC_SMITH_COOL");
	ta_smith_fire(17,0,17,30,"OC_SMITH_FIRE");
	ta_smith_anvil(17,30,18,0,"OC_SMITH_ANVIL");
	ta_smith_cool(18,0,18,30,"OC_SMITH_COOL");
	ta_smith_fire(18,30,19,0,"OC_SMITH_FIRE");
	ta_smith_anvil(19,0,19,30,"OC_SMITH_ANVIL");
	ta_smith_cool(19,30,20,0,"OC_SMITH_COOL");
	ta_sleep(20,0,8,0,"OC_GUARD_ROOM_01_SLEEP_01");
};

func void rtn_tot_4106()
{
	ta_sleep(8,0,23,0,"TOT");
	ta_sleep(23,0,8,0,"TOT");
};

