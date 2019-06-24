
prototype MST_DEFAULT_DEMONLORD(C_NPC)
{
	name[0] = "Демон-лорд";
	guild = GIL_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_DEMON_LORD;
	level = 100;
	attribute[ATR_STRENGTH] = 240;
	attribute[ATR_DEXTERITY] = 240;
	attribute[ATR_HITPOINTS_MAX] = 472;
	attribute[ATR_HITPOINTS] = 472;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_DEMON;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = TRUE;
	aivar[AIV_MM_PACKHUNTER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

func void b_setvisuals_demonlord()
{
	Mdl_SetVisual(self,"Demon.mds");
	Mdl_SetVisualBody(self,"Dem2_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance DEMONLORD(MST_DEFAULT_DEMONLORD)
{
	b_setvisuals_demonlord();
	Npc_SetToFistMode(self);
};

instance XARDAS_DT_DEMONLORD(MST_DEFAULT_DEMONLORD)
{
	b_setvisuals_demonlord();
	Npc_SetToFistMode(self);
};

