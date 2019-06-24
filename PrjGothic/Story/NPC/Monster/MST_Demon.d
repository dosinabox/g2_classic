
prototype MST_DEFAULT_DEMON(C_NPC)
{
	name[0] = "Демон";
	guild = GIL_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_DEMON;
	level = 60;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
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

func void b_setvisuals_demon()
{
	Mdl_SetVisual(self,"Demon.mds");
	Mdl_SetVisualBody(self,"Dem_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance DEMON(MST_DEFAULT_DEMON)
{
	b_setvisuals_demon();
	Npc_SetToFistMode(self);
};

instance SUMMONED_DEMON(MST_DEFAULT_DEMON)
{
	name[0] = "Вызванный демон";
	guild = gil_summoned_demon;
	aivar[AIV_MM_REAL_ID] = id_summoned_demon;
	level = 0;
	aivar[AIV_PARTYMEMBER] = TRUE;
	b_setattitude(self,ATT_FRIENDLY);
	start_aistate = zs_mm_rtn_summoned;
	b_setvisuals_demon();
	Npc_SetToFistMode(self);
};

instance XARDAS_DT_DEMON1(MST_DEFAULT_DEMON)
{
	b_setvisuals_demon();
	Npc_SetToFistMode(self);
};

instance XARDAS_DT_DEMON2(MST_DEFAULT_DEMON)
{
	b_setvisuals_demon();
	Npc_SetToFistMode(self);
};

instance XARDAS_DT_DEMON3(MST_DEFAULT_DEMON)
{
	b_setvisuals_demon();
	Npc_SetToFistMode(self);
};

instance XARDAS_DT_DEMON4(MST_DEFAULT_DEMON)
{
	b_setvisuals_demon();
	Npc_SetToFistMode(self);
};

instance XARDAS_DT_DEMON5(MST_DEFAULT_DEMON)
{
	b_setvisuals_demon();
	Npc_SetToFistMode(self);
};

