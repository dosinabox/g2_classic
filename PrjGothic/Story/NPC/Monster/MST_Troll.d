
prototype MST_DEFAULT_TROLL(C_NPC)
{
	name[0] = "Тролль";
	guild = GIL_TROLL;
	aivar[AIV_MM_REAL_ID] = ID_TROLL;
	level = 50;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = 50;
	damagetype = DAM_FLY;
	fight_tactic = FAI_TROLL;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_THREATENBEFOREATTACK] = TRUE;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	bodystateinterruptableoverride = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

func void b_setvisuals_troll()
{
	Mdl_SetVisual(self,"Troll.mds");
	Mdl_SetVisualBody(self,"Tro_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance TROLL(MST_DEFAULT_TROLL)
{
	b_setvisuals_troll();
	Npc_SetToFistMode(self);
};

instance MAYA_TROLL(MST_DEFAULT_TROLL)
{
	aivar[AIV_MAXDISTTOWP] = 1000;
	aivar[AIV_ORIGINALFIGHTTACTIC] = FAI_TROLL;
	b_setvisuals_troll();
	Npc_SetToFistMode(self);
};

instance TROLL_DI(MST_DEFAULT_TROLL)
{
	name[0] = "Пещерный тролль";
	aivar[AIV_MAXDISTTOWP] = 300;
	aivar[AIV_ORIGINALFIGHTTACTIC] = FAI_TROLL;
	b_setvisuals_troll();
	Npc_SetToFistMode(self);
};

