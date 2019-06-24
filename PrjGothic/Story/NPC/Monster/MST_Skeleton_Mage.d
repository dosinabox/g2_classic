
prototype MST_DEFAULT_SKELETON_MAGE(C_NPC)
{
	name[0] = "Скелет-маг";
	guild = GIL_SKELETON_MAGE;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_MAGE;
	level = 24;
	attribute[ATR_STRENGTH] = 120;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 240;
	attribute[ATR_HITPOINTS] = 240;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_STRONG;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

func void b_setvisuals_skeleton_mage()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton_fly.mds");
	Mdl_SetVisualBody(self,"Ske_Fly_Body",1,DEFAULT,"",1,DEFAULT,-1);
};


instance SKELETONMAGE(MST_DEFAULT_SKELETON_MAGE)
{
	b_setvisuals_skeleton_mage();
};

instance SKELETONMAGE_ANGAR(MST_DEFAULT_SKELETON_MAGE)
{
	b_setvisuals_skeleton_mage();
	CreateInvItems(self,itam_mana_angar_mis,1);
	CreateInvItems(self,itpo_perm_mana,1);
};

instance SECRETLIBRARYSKELETON(MST_DEFAULT_SKELETON_MAGE)
{
	b_setvisuals_skeleton_mage();
};

