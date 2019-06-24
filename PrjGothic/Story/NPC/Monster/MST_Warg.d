
prototype MST_DEFAULT_WARG(C_NPC)
{
	name[0] = "Варг";
	guild = GIL_WOLF;
	aivar[AIV_MM_REAL_ID] = ID_WARG;
	level = 15;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 30;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_WOLF;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_THREATENBEFOREATTACK] = TRUE;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_LONG;
	aivar[AIV_MM_FOLLOWINWATER] = TRUE;
	aivar[AIV_MM_PACKHUNTER] = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_ROAMSTART] = ONLYROUTINE;
};

func void b_setvisuals_warg()
{
	Mdl_SetVisual(self,"Wolf.mds");
	Mdl_SetVisualBody(self,"Warg_Body2",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_blackwolf()
{
	Mdl_SetVisual(self,"Wolf.mds");
	Mdl_SetVisualBody(self,"Warg_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance WARG(MST_DEFAULT_WARG)
{
	b_setvisuals_warg();
	Npc_SetToFistMode(self);
};

instance BLACKWOLF(MST_DEFAULT_WARG)
{
	name[0] = "Черный волк";
	level = 6;
	aivar[AIV_MM_REAL_ID] = ID_WOLF;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_HITPOINTS_MAX] = 120;
	attribute[ATR_HITPOINTS] = 120;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 12;
	protection[PROT_EDGE] = 12;
	protection[PROT_POINT] = 12;
	protection[PROT_FIRE] = 12;
	protection[PROT_FLY] = 12;
	protection[PROT_MAGIC] = 12;
	b_setvisuals_blackwolf();
	Npc_SetToFistMode(self);
};

