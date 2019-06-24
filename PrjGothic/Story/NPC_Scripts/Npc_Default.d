
prototype NPC_DEFAULT(C_NPC)
{
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	hitchance[NPC_TALENT_1H] = 0;
	hitchance[NPC_TALENT_2H] = 0;
	hitchance[NPC_TALENT_BOW] = 0;
	hitchance[NPC_TALENT_CROSSBOW] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_BLUNT;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = NPC_TIME_FOLLOW;
	aivar[AIV_FIGHTDISTCANCEL] = FIGHT_DIST_CANCEL;
	bodystateinterruptableoverride = FALSE;
};

