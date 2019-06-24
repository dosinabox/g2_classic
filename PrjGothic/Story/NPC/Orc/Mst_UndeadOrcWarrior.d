
prototype MST_DEFAULT_UNDEADORCWARRIOR(C_NPC)
{
	name[0] = "Орк-нежить";
	guild = GIL_UNDEADORC;
	aivar[AIV_MM_REAL_ID] = ID_UNDEADORCWARRIOR;
	level = 30;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 60;
	protection[PROT_MAGIC] = 60;
	hitchance[NPC_TALENT_1H] = 80;
	hitchance[NPC_TALENT_2H] = 80;
	hitchance[NPC_TALENT_BOW] = 80;
	hitchance[NPC_TALENT_CROSSBOW] = 80;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
};

func void b_setvisuals_undeadorcwarrior()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"UOW_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance UNDEADORCWARRIOR(MST_DEFAULT_UNDEADORCWARRIOR)
{
	b_setvisuals_undeadorcwarrior();
	EquipItem(self,itmw_2h_orcaxe_02);
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

