
prototype MST_DEFAULT_SKELETON(C_NPC)
{
	name[0] = "Скелет-воин";
	guild = GIL_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	level = 22;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 90;
	attribute[ATR_HITPOINTS_MAX] = 180;
	attribute[ATR_HITPOINTS] = 180;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 30;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 30;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_STRONG;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

func void b_setvisuals_skeleton()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Ske_Body2",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_lesser_skeleton()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Ske_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance SKELETON(MST_DEFAULT_SKELETON)
{
	b_setvisuals_skeleton();
	EquipItem(self,itmw_2h_sword_m_01);
};

instance SUMMONED_SKELETON(MST_DEFAULT_SKELETON)
{
	name[0] = "Вызванный скелет";
	guild = GIL_SUMMONED_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONED_SKELETON;
	level = 0;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_HITPOINTS_MAX] = 120;
	attribute[ATR_HITPOINTS] = 120;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 20;
	protection[PROT_EDGE] = 20;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 20;
	fight_tactic = FAI_HUMAN_NORMAL;
	b_setvisuals_lesser_skeleton();
	aivar[AIV_PARTYMEMBER] = TRUE;
	b_setattitude(self,ATT_FRIENDLY);
	start_aistate = zs_mm_rtn_summoned;
	b_setvisuals_lesser_skeleton();
	EquipItem(self,itmw_2h_sword_m_01);
};

instance LESSER_SKELETON(MST_DEFAULT_SKELETON)
{
	name[0] = "Скелет";
	level = 12;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_HITPOINTS_MAX] = 120;
	attribute[ATR_HITPOINTS] = 120;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 20;
	protection[PROT_EDGE] = 20;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 20;
	fight_tactic = FAI_HUMAN_NORMAL;
	b_setvisuals_lesser_skeleton();
	EquipItem(self,itmw_1h_misc_sword);
};

instance CRYPT_SKELETON_ROOM_01(MST_DEFAULT_SKELETON)
{
	name[0] = "Страж склепа";
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_setvisuals_skeleton();
	EquipItem(self,itmw_1h_misc_sword);
	CreateInvItem(self,itke_evt_crypt_01);
};

instance CRYPT_SKELETON_ROOM_02(MST_DEFAULT_SKELETON)
{
	name[0] = "Страж склепа";
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_setvisuals_skeleton();
	EquipItem(self,itmw_2h_sword_m_01);
	CreateInvItem(self,itke_evt_crypt_02);
};

instance CRYPT_SKELETON_ROOM_03(MST_DEFAULT_SKELETON)
{
	name[0] = "Страж склепа";
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_setvisuals_skeleton();
	EquipItem(self,itmw_1h_misc_sword);
	CreateInvItem(self,itke_evt_crypt_03);
};

instance SKELETON_ARCHOL1(MST_DEFAULT_SKELETON)
{
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_setvisuals_skeleton();
	EquipItem(self,itmw_1h_misc_sword);
};

instance SKELETON_ARCHOL2(MST_DEFAULT_SKELETON)
{
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_setvisuals_skeleton();
	EquipItem(self,itmw_2h_sword_m_01);
};

instance SKELETON_ARCHOL3(MST_DEFAULT_SKELETON)
{
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_setvisuals_skeleton();
	EquipItem(self,itmw_1h_misc_sword);
};

instance SKELETON_ARCHOL4(MST_DEFAULT_SKELETON)
{
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_setvisuals_skeleton();
	EquipItem(self,itmw_2h_sword_m_01);
};

instance SKELETON_ARCHOL5(MST_DEFAULT_SKELETON)
{
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_setvisuals_skeleton();
	EquipItem(self,itmw_1h_misc_sword);
};

instance SKELETON_ARCHOL6(MST_DEFAULT_SKELETON)
{
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_setvisuals_skeleton();
	EquipItem(self,itmw_2h_sword_m_01);
};

instance SKELETON_MARIO1(MST_DEFAULT_SKELETON)
{
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_setvisuals_skeleton();
	EquipItem(self,itmw_1h_misc_sword);
};

instance SKELETON_MARIO2(MST_DEFAULT_SKELETON)
{
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_setvisuals_skeleton();
	EquipItem(self,itmw_2h_sword_m_01);
};

instance SKELETON_MARIO3(MST_DEFAULT_SKELETON)
{
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_setvisuals_skeleton();
	EquipItem(self,itmw_1h_misc_sword);
};

instance SKELETON_MARIO4(MST_DEFAULT_SKELETON)
{
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_setvisuals_skeleton();
	EquipItem(self,itmw_2h_sword_m_01);
};

