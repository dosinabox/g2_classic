
prototype C_SPELL_PROTO(C_SPELL)
{
	time_per_mana = 500;
	damage_per_level = 1;
	damagetype = DAM_MAGIC;
	spelltype = SPELL_BAD;
	canturnduringinvest = 1;
	canchangetargetduringinvest = 1;
	ismultieffect = 0;
	targetcollectalgo = TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetcollecttype = TARGET_TYPE_NPCS;
	targetcollectrange = 10000;
	targetcollectazi = 60;
	targetcollectelev = 60;
};

