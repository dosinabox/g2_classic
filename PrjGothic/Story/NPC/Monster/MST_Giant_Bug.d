
prototype MST_DEFAULT_GIANT_BUG(C_NPC)
{
	name[0] = "Полевой хищник";
	guild = GIL_GIANT_BUG;
	aivar[AIV_MM_REAL_ID] = ID_GIANT_BUG;
	level = 8;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_HITPOINTS_MAX] = 60;
	attribute[ATR_HITPOINTS] = 60;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 20;
	protection[PROT_EDGE] = 20;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_GIANT_BUG;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_THREATENBEFOREATTACK] = TRUE;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_SHORT;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_ROAMSTART] = ONLYROUTINE;
};

func void b_setvisuals_giant_bug()
{
	Mdl_SetVisual(self,"Giant_Bug.mds");
	Mdl_SetVisualBody(self,"Giant_Bug_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance GIANT_BUG(MST_DEFAULT_GIANT_BUG)
{
	b_setvisuals_giant_bug();
	Npc_SetToFistMode(self);
};

instance YGIANT_BUG(MST_DEFAULT_GIANT_BUG)
{
	name[0] = "Молодой полевой хищник";
	level = 4;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 0;
	fight_tactic = FAI_GIANT_BUG;
	b_setvisuals_giant_bug();
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	Npc_SetToFistMode(self);
};

instance YGIANT_BUG_VINORITUAL1(MST_DEFAULT_GIANT_BUG)
{
	name[0] = "Молодой полевой хищник";
	level = 4;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 0;
	fight_tactic = FAI_GIANT_BUG;
	b_setvisuals_giant_bug();
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	Npc_SetToFistMode(self);
};

instance YGIANT_BUG_VINORITUAL2(MST_DEFAULT_GIANT_BUG)
{
	name[0] = "Молодой полевой хищник";
	level = 4;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 0;
	fight_tactic = FAI_GIANT_BUG;
	b_setvisuals_giant_bug();
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	Npc_SetToFistMode(self);
};

instance LOBARTS_GIANT_BUG1(MST_DEFAULT_GIANT_BUG)
{
	b_setvisuals_giant_bug();
	Npc_SetToFistMode(self);
};

instance LOBARTS_GIANT_BUG2(MST_DEFAULT_GIANT_BUG)
{
	b_setvisuals_giant_bug();
	Npc_SetToFistMode(self);
};

instance LOBARTS_GIANT_BUG3(MST_DEFAULT_GIANT_BUG)
{
	b_setvisuals_giant_bug();
	Npc_SetToFistMode(self);
};

instance LOBARTS_GIANT_BUG4(MST_DEFAULT_GIANT_BUG)
{
	b_setvisuals_giant_bug();
	Npc_SetToFistMode(self);
};

instance LOBARTS_GIANT_BUG5(MST_DEFAULT_GIANT_BUG)
{
	b_setvisuals_giant_bug();
	Npc_SetToFistMode(self);
};

instance LOBARTS_GIANT_BUG6(MST_DEFAULT_GIANT_BUG)
{
	b_setvisuals_giant_bug();
	Npc_SetToFistMode(self);
};

instance LOBARTS_GIANT_BUG7(MST_DEFAULT_GIANT_BUG)
{
	b_setvisuals_giant_bug();
	Npc_SetToFistMode(self);
};

