
prototype MST_DEFAULT_TROLL_BLACK(C_NPC)
{
	name[0] = "Черный тролль";
	guild = GIL_TROLL;
	aivar[AIV_MM_REAL_ID] = ID_TROLL_BLACK;
	level = 100;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 75;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = 100;
	damagetype = DAM_FLY;
	fight_tactic = FAI_TROLL;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_THREATENBEFOREATTACK] = TRUE;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
	bodystateinterruptableoverride = TRUE;
};

func void b_setvisuals_troll_black()
{
	Mdl_SetVisual(self,"Troll.mds");
	Mdl_SetVisualBody(self,"Troll_Black_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance TROLL_BLACK(MST_DEFAULT_TROLL_BLACK)
{
	aivar[AIV_MAXDISTTOWP] = 1000;
	aivar[AIV_ORIGINALFIGHTTACTIC] = FAI_TROLL;
	b_setvisuals_troll_black();
	Npc_SetToFistMode(self);
};

