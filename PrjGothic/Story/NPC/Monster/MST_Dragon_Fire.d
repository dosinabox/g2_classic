
prototype MST_DEFAULT_DRAGON_FIRE(C_NPC)
{
	name[0] = "Огненный дракон";
	guild = GIL_DRAGON;
	aivar[AIV_MM_REAL_ID] = ID_DRAGON_FIRE;
	level = 450;
	bodystateinterruptableoverride = TRUE;
//	attribute[ATR_STRENGTH] = 140;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 700;
	attribute[ATR_HITPOINTS] = 700;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = 50;
	damagetype = DAM_FLY;
	fight_tactic = FAI_DRAGON;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_DRAGON_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	aivar[AIV_MAXDISTTOWP] = 700;
	aivar[AIV_ORIGINALFIGHTTACTIC] = FAI_DRAGON;
	start_aistate = zs_mm_rtn_dragonrest;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

func void b_setvisuals_dragon_fire()
{
	Mdl_SetVisual(self,"Dragon.mds");
	Mdl_SetVisualBody(self,"Dragon_FIRE_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance DRAGON_FIRE(MST_DEFAULT_DRAGON_FIRE)
{
	name[0] = "Феоматар";
	flags = NPC_FLAG_IMMORTAL;
	b_setvisuals_dragon_fire();
	Npc_SetToFistMode(self);
};

instance DRAGON_FIRE_ISLAND(MST_DEFAULT_DRAGON_FIRE)
{
	name[0] = "Феодарон";
	flags = NPC_FLAG_IMMORTAL;
	b_setvisuals_dragon_fire();
	Npc_SetToFistMode(self);
};

