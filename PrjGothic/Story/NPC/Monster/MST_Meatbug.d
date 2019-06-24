
prototype MST_DEFAULT_MEATBUG(C_NPC)
{
	name[0] = "ћ€сной жук";
	guild = GIL_MEATBUG;
	aivar[AIV_MM_REAL_ID] = ID_MEATBUG;
	level = 1;
	attribute[ATR_STRENGTH] = 1;
	attribute[ATR_DEXTERITY] = 1;
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	senses = SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_WUSELSTART] = ONLYROUTINE;
};

func void b_setvisuals_meatbug()
{
	Mdl_SetVisual(self,"Meatbug.mds");
	Mdl_SetVisualBody(self,"Mbg_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance MEATBUG(MST_DEFAULT_MEATBUG)
{
	b_setvisuals_meatbug();
};

instance MEATBUG_BRUTUS1(MST_DEFAULT_MEATBUG)
{
	b_setvisuals_meatbug();
};

instance MEATBUG_BRUTUS2(MST_DEFAULT_MEATBUG)
{
	b_setvisuals_meatbug();
};

instance MEATBUG_BRUTUS3(MST_DEFAULT_MEATBUG)
{
	b_setvisuals_meatbug();
};

instance MEATBUG_BRUTUS4(MST_DEFAULT_MEATBUG)
{
	b_setvisuals_meatbug();
};

