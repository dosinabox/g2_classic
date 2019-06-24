
prototype MST_DEFAULT_SHEEP(C_NPC)
{
	name[0] = "Овца";
	guild = GIL_SHEEP;
	aivar[AIV_MM_REAL_ID] = ID_SHEEP;
	level = 1;
	attribute[ATR_STRENGTH] = 5;
	attribute[ATR_DEXTERITY] = 5;
	attribute[ATR_HITPOINTS_MAX] = 5;
	attribute[ATR_HITPOINTS] = 5;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
};

func void b_setvisuals_sheep()
{
	Mdl_SetVisual(self,"Sheep.mds");
	Mdl_SetVisualBody(self,"Sheep_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_hammel()
{
	Mdl_SetVisual(self,"Sheep.mds");
	Mdl_SetVisualBody(self,"Hammel_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance SHEEP(MST_DEFAULT_SHEEP)
{
	b_setvisuals_sheep();
	Npc_SetToFistMode(self);
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_ROAMSTART] = ONLYROUTINE;
};

instance HAMMEL(MST_DEFAULT_SHEEP)
{
	b_setvisuals_hammel();
	Npc_SetToFistMode(self);
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_ROAMSTART] = ONLYROUTINE;
};

instance FOLLOW_SHEEP(MST_DEFAULT_SHEEP)
{
	name[0] = "Бетси";
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setvisuals_sheep();
	Npc_SetToFistMode(self);
	aivar[AIV_MM_ROAMSTART] = ONLYROUTINE;
	start_aistate = zs_mm_rtn_follow_sheep;
};

instance FOLLOW_SHEEP_AKIL(MST_DEFAULT_SHEEP)
{
	name[0] = "Овца";
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setvisuals_sheep();
	Npc_SetToFistMode(self);
	aivar[AIV_MM_ROAMSTART] = ONLYROUTINE;
	start_aistate = zs_mm_rtn_follow_sheep;
};

instance BALTHASAR_SHEEP1(MST_DEFAULT_SHEEP)
{
	b_setvisuals_hammel();
	Npc_SetToFistMode(self);
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_ROAMSTART] = ONLYROUTINE;
};

instance BALTHASAR_SHEEP2(MST_DEFAULT_SHEEP)
{
	b_setvisuals_sheep();
	Npc_SetToFistMode(self);
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_ROAMSTART] = ONLYROUTINE;
};

instance BALTHASAR_SHEEP3(MST_DEFAULT_SHEEP)
{
	b_setvisuals_sheep();
	Npc_SetToFistMode(self);
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_ROAMSTART] = ONLYROUTINE;
};

