
const string NAME_PALADINSPELL = "Магия Паладинов";

const int VALUE_RU_PALLIGHT = 50;
const int VALUE_RU_PALLIGHTHEAL = 50;
const int VALUE_RU_PALHOLYBOLT = 50;
const int VALUE_RU_PALMEDIUMHEAL = 100;
const int VALUE_RU_PALREPELEVIL = 100;
const int VALUE_RU_PALFULLHEAL = 150;
const int VALUE_RU_PALDESTROYEVIL = 150;
const int VALUE_RU_LIGHT = 500;
const int VALUE_RU_FIREBOLT = 500;
const int VALUE_RU_ZAP = 500;
const int VALUE_RU_LIGHTHEAL = 500;
const int VALUE_RU_SUMGOBSKEL = 500;
const int VALUE_RU_INSTANTFIREBALL = 1000;
const int VALUE_RU_ICEBOLT = 1000;
const int VALUE_RU_SUMWOLF = 1000;
const int VALUE_RU_WINDFIST = 1000;
const int VALUE_RU_SLEEP = 1000;
const int VALUE_RU_MEDIUMHEAL = 1500;
const int VALUE_RU_SUMSKEL = 1500;
const int VALUE_RU_FEAR = 1500;
const int VALUE_RU_ICECUBE = 1500;
const int VALUE_RU_THUNDERBALL = 1500;
const int VALUE_RU_FIRESTORM = 1500;
const int VALUE_RU_SUMGOL = 2000;
const int VALUE_RU_HARMUNDEAD = 2000;
const int VALUE_RU_LIGHTNINGFLASH = 2000;
const int VALUE_RU_CHARGEFIREBALL = 2000;
const int VALUE_RU_ICEWAVE = 2500;
const int VALUE_RU_SUMDEMON = 2500;
const int VALUE_RU_FULLHEAL = 2500;
const int VALUE_RU_PYROKINESIS = 2500;
const int VALUE_RU_FIRERAIN = 3000;
const int VALUE_RU_BREATHOFDEATH = 3000;
const int VALUE_RU_MASSDEATH = 3000;
const int VALUE_RU_MASTEROFDISASTER = 3000;
const int VALUE_RU_ARMYOFDARKNESS = 3000;
const int VALUE_RU_SHRINK = 3000;
const int VALUE_RU_PALTELEPORTSECRET = 500;
const int VALUE_RU_TELEPORTSEAPORT = 500;
const int VALUE_RU_TELEPORTMONASTERY = 500;
const int VALUE_RU_TELEPORTFARM = 500;
const int VALUE_RU_TELEPORTXARDAS = 500;
const int VALUE_RU_TELEPORTPASSNW = 500;
const int VALUE_RU_TELEPORTPASSOW = 500;
const int VALUE_RU_TELEPORTOC = 500;
const int VALUE_RU_TELEPORTOWDEMONTOWER = 500;
const int VALUE_RU_TELEPORTTAVERNE = 500;
const int VALUE_RU_TELEPORT_3 = 500;

instance ITRU_PALLIGHT(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_PALLIGHT;
	visual = "ItRu_PalLight.3ds";
	material = MAT_STONE;
	spell = SPL_PALLIGHT;
	description = NAME_SPL_PALLIGHT;
	text[0] = NAME_PALADINSPELL;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_PALLIGHT;
	text[2] = NAME_DURATION;
	count[2] = SPL_DURATION_PALLIGHT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_PALLIGHTHEAL(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_PALLIGHTHEAL;
	visual = "ItRu_PalLightHeal.3ds";
	material = MAT_STONE;
	spell = SPL_PALLIGHTHEAL;
	description = NAME_SPL_PALLIGHTHEAL;
	text[0] = NAME_PALADINSPELL;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_PALLIGHTHEAL;
	text[2] = NAME_HEALINGPERCAST;
	count[2] = SPL_HEAL_PALLIGHTHEAL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_PALMEDIUMHEAL(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_PALMEDIUMHEAL;
	visual = "ItRu_PalMediumHeal.3ds";
	material = MAT_STONE;
	spell = SPL_PALMEDIUMHEAL;
	description = NAME_SPL_PALMEDIUMHEAL;
	text[0] = NAME_PALADINSPELL;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_PALMEDIUMHEAL;
	text[2] = NAME_HEALINGPERCAST;
	count[2] = SPL_HEAL_PALMEDIUMHEAL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_PALFULLHEAL(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_PALFULLHEAL;
	visual = "ItRu_PalFullHeal.3ds";
	material = MAT_STONE;
	spell = SPL_PALFULLHEAL;
	description = NAME_SPL_PALFULLHEAL;
	text[0] = NAME_PALADINSPELL;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_PALFULLHEAL;
	text[2] = NAME_HEALINGPERCAST;
	count[2] = SPL_HEAL_PALFULLHEAL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_PALHOLYBOLT(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_PALHOLYBOLT;
	visual = "ItRu_PalHolyBolt.3DS";
	material = MAT_STONE;
	spell = SPL_PALHOLYBOLT;
	description = NAME_SPL_PALHOLYBOLT;
	text[0] = NAME_PALADINSPELL;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_PALHOLYBOLT;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_PALHOLYBOLT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_PALREPELEVIL(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_PALREPELEVIL;
	visual = "ItRu_PalRepelEvil.3DS";
	material = MAT_STONE;
	spell = SPL_PALREPELEVIL;
	description = NAME_SPL_PALREPELEVIL;
	text[0] = NAME_PALADINSPELL;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_PALREPELEVIL;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_PALREPELEVIL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_PALDESTROYEVIL(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_PALDESTROYEVIL;
	visual = "ItRu_PalDestroyEvil.3DS";
	material = MAT_STONE;
	spell = SPL_PALDESTROYEVIL;
	description = NAME_SPL_PALDESTROYEVIL;
	text[0] = NAME_PALADINSPELL;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_PALDESTROYEVIL;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_PALDESTROYEVIL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_PALTELEPORTSECRET(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_PALTELEPORTSECRET;
	visual = "ItRu_PalTeleportSecret.3DS";
	material = MAT_STONE;
	spell = SPL_PALTELEPORTSECRET;
	description = NAME_SPL_PALTELEPORTSECRET;
	text[0] = NAME_PALADINSPELL;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_TELEPORT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_TELEPORTSEAPORT(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_TELEPORTSEAPORT;
	visual = "ItRu_TeleportSeaport.3ds";
	material = MAT_STONE;
	spell = SPL_TELEPORTSEAPORT;
	description = NAME_SPL_TELEPORTSEAPORT;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_TELEPORT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_TELEPORTMONASTERY(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_TELEPORTMONASTERY;
	visual = "ItRu_TeleportMonastery.3ds";
	material = MAT_STONE;
	spell = SPL_TELEPORTMONASTERY;
	description = NAME_SPL_TELEPORTMONASTERY;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_TELEPORT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_TELEPORTFARM(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_TELEPORTFARM;
	visual = "ItRu_TeleportFarm.3ds";
	material = MAT_STONE;
	spell = SPL_TELEPORTFARM;
	description = NAME_SPL_TELEPORTFARM;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_TELEPORT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_TELEPORTXARDAS(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_TELEPORTXARDAS;
	visual = "ItRu_TeleportXardas.3ds";
	material = MAT_STONE;
	spell = SPL_TELEPORTXARDAS;
	description = NAME_SPL_TELEPORTXARDAS;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_TELEPORT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_TELEPORTPASSNW(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_TELEPORTPASSNW;
	visual = "ItRu_TeleportPassNW.3ds";
	material = MAT_STONE;
	spell = SPL_TELEPORTPASSNW;
	description = NAME_SPL_TELEPORTPASSNW;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_TELEPORT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_TELEPORTPASSOW(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_TELEPORTPASSOW;
	visual = "ItRu_TeleportPassOW.3ds";
	material = MAT_STONE;
	spell = SPL_TELEPORTPASSOW;
	description = NAME_SPL_TELEPORTPASSOW;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_TELEPORT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_TELEPORTOC(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_TELEPORTOC;
	visual = "ItRu_TeleportOC.3ds";
	material = MAT_STONE;
	spell = SPL_TELEPORTOC;
	description = NAME_SPL_TELEPORTOC;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_TELEPORT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_TELEPORTOWDEMONTOWER(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_TELEPORTOWDEMONTOWER;
	visual = "ItRu_Teleport_2.3ds";
	material = MAT_STONE;
	spell = SPL_TELEPORTOWDEMONTOWER;
	description = NAME_SPL_TELEPORTOWDEMONTOWER;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_TELEPORT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_TELEPORTTAVERNE(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_TELEPORTTAVERNE;
	visual = "ItRu_Teleport_3.3ds";
	material = MAT_STONE;
	spell = SPL_TELEPORTTAVERNE;
	description = NAME_SPL_TELEPORTTAVERNE;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_TELEPORT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_TELEPORT_3(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_TELEPORT_3;
	visual = "ItRu_Teleport_3.3ds";
	material = MAT_STONE;
	spell = SPL_TELEPORT_3;
	description = NAME_SPL_TELEPORT_3;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_TELEPORT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_LIGHT(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_LIGHT;
	visual = "ItRu_Light.3ds";
	material = MAT_STONE;
	spell = SPL_LIGHT;
	mag_circle = 1;
	description = NAME_SPL_LIGHT;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_LIGHT;
	text[2] = NAME_DURATION;
	count[2] = SPL_DURATION_LIGHT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_FIREBOLT(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_FIREBOLT;
	visual = "ItRu_FireBolt.3DS";
	material = MAT_STONE;
	spell = SPL_FIREBOLT;
	mag_circle = 1;
	description = NAME_SPL_FIREBOLT;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_FIREBOLT;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_FIREBOLT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_ZAP(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_ZAP;
	visual = "ItRu_Zap.3DS";
	material = MAT_STONE;
	mag_circle = 1;
	spell = SPL_ZAP;
	description = NAME_SPL_ZAP;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_ZAP;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_ZAP;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_LIGHTHEAL(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_LIGHTHEAL;
	visual = "ItRu_LightHeal.3ds";
	material = MAT_STONE;
	spell = SPL_LIGHTHEAL;
	mag_circle = 1;
	description = NAME_SPL_LIGHTHEAL;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_LIGHTHEAL;
	text[2] = NAME_HEALINGPERCAST;
	count[2] = SPL_HEAL_LIGHTHEAL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_SUMGOBSKEL(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_SUMGOBSKEL;
	visual = "ItRu_SumGobSkel.3DS";
	material = MAT_STONE;
	spell = SPL_SUMMONGOBLINSKELETON;
	mag_circle = 1;
	description = NAME_SPL_SUMMONGOBLINSKELETON;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_SUMMONSKELETON;
	text[2] = "Блуждающие кости";
	text[3] = "мертвых гоблинов.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_INSTANTFIREBALL(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_INSTANTFIREBALL;
	visual = "ItRu_InstantFireball.3DS";
	material = MAT_STONE;
	mag_circle = 2;
	spell = SPL_INSTANTFIREBALL;
	description = NAME_SPL_INSTANTFIREBALL;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_INSTANTFIREBALL;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_INSTANTFIREBALL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_ICEBOLT(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_ICEBOLT;
	visual = "ItRu_Icebolt.3ds";
	material = MAT_STONE;
	spell = SPL_ICEBOLT;
	mag_circle = 2;
	description = NAME_SPL_ICEBOLT;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_ICEBOLT;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_ICEBOLT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_SUMWOLF(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_SUMWOLF;
	visual = "ItRu_SumWolf.3DS";
	material = MAT_STONE;
	spell = SPL_SUMMONWOLF;
	mag_circle = 2;
	description = NAME_SPL_SUMMONWOLF;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_SUMMONSKELETON;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_WINDFIST(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_WINDFIST;
	visual = "ItRu_Windfist.3ds";
	material = MAT_STONE;
	spell = SPL_WINDFIST;
	mag_circle = 2;
	description = NAME_SPL_WINDFIST;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTENMAX;
	count[1] = SPL_COST_WINDFIST;
	text[2] = NAME_DAMAGE_MAX;
	count[2] = SPL_DAMAGE_WINDFIST * 3;
	text[4] = NAME_MANAPERSEC;
	count[4] = 1000 / 200;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_SLEEP(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_SLEEP;
	visual = "ItRu_Sleep.3ds";
	material = MAT_STONE;
	spell = SPL_SLEEP;
	mag_circle = 2;
	description = NAME_SPL_SLEEP;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_SLEEP;
	text[2] = NAME_DURATION;
	count[2] = SPL_TIME_SLEEP;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_MEDIUMHEAL(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_MEDIUMHEAL;
	visual = "ItRu_MediumHeal.3ds";
	material = MAT_STONE;
	spell = SPL_MEDIUMHEAL;
	mag_circle = 3;
	description = NAME_SPL_MEDIUMHEAL;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_MEDIUMHEAL;
	text[2] = NAME_HEALINGPERCAST;
	count[2] = SPL_HEAL_MEDIUMHEAL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_LIGHTNINGFLASH(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_LIGHTNINGFLASH;
	visual = "ItRu_LightningFlash.3DS";
	material = MAT_STONE;
	mag_circle = 4;
	spell = SPL_LIGHTNINGFLASH;
	description = NAME_SPL_LIGHTNINGFLASH;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_LIGHTNINGFLASH;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_LIGHTNINGFLASH;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_CHARGEFIREBALL(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_CHARGEFIREBALL;
	visual = "ItRu_ChargeFireball.3DS";
	material = MAT_STONE;
	mag_circle = 4;
	spell = SPL_CHARGEFIREBALL;
	description = NAME_SPL_CHARGEFIREBALL;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTENMAX;
	count[1] = SPL_COST_CHARGEFIREBALL;
	text[2] = NAME_DAMAGE_MAX;
	count[2] = SPL_DAMAGE_CHARGEFIREBALL * 3;
	text[4] = NAME_MANAPERSEC;
	count[4] = 1000 / 120;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_SUMSKEL(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_SUMSKEL;
	visual = "ItRu_SumSkel.3DS";
	material = MAT_STONE;
	spell = SPL_SUMMONSKELETON;
	mag_circle = 3;
	description = NAME_SPL_SUMMONSKELETON;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_SUMMONSKELETON;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_FEAR(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_FEAR;
	visual = "ItRu_Fear.3DS";
	material = MAT_STONE;
	mag_circle = 3;
	spell = SPL_FEAR;
	description = NAME_SPL_FEAR;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_FEAR;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_ICECUBE(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_ICECUBE;
	visual = "ItRu_IceCube.3ds";
	material = MAT_STONE;
	spell = SPL_ICECUBE;
	mag_circle = 3;
	description = NAME_SPL_ICECUBE;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_ICECUBE;
	text[2] = NAME_DAMAGE;
	count[2] = SPL_FREEZE_DAMAGE;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_THUNDERBALL(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_THUNDERBALL;
	visual = "ItRu_ThunderBall.3ds";
	material = MAT_STONE;
	spell = SPL_CHARGEZAP;
	mag_circle = 3;
	description = NAME_SPL_CHARGEZAP;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTENMAX;
	count[1] = SPL_COST_CHARGEZAP;
	text[2] = NAME_DAMAGE_MAX;
	count[2] = SPL_DAMAGE_CHARGEZAP * 3;
	text[4] = NAME_MANAPERSEC;
	count[4] = 1000 / 100;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_SUMGOL(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_SUMGOL;
	visual = "ItRu_SumGol.3DS";
	material = MAT_STONE;
	spell = SPL_SUMMONGOLEM;
	mag_circle = 4;
	description = NAME_SPL_SUMMONGOLEM;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_SUMMONSKELETON;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_HARMUNDEAD(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_HARMUNDEAD;
	visual = "ItRu_HarmUndead.3DS";
	material = MAT_STONE;
	spell = SPL_DESTROYUNDEAD;
	mag_circle = 4;
	description = NAME_SPL_DESTROYUNDEAD;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_DESTROYUNDEAD;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_DESTROYUNDEAD;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_PYROKINESIS(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_PYROKINESIS;
	visual = "ItRu_Pyrokinesis.3ds";
	material = MAT_STONE;
	spell = SPL_PYROKINESIS;
	mag_circle = 5;
	description = NAME_SPL_PYROKINESIS;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTENMAX;
	count[1] = SPL_COST_FIRESTORM;
	text[2] = NAME_DAMAGE_MAX;
	count[2] = SPL_DAMAGE_FIRESTORM * 3;
	text[4] = NAME_MANAPERSEC;
	count[4] = 1000 / 120;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_FIRESTORM(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_FIRESTORM;
	visual = "ItRu_Firestorm.3ds";
	material = MAT_STONE;
	spell = SPL_FIRESTORM;
	mag_circle = 3;
	description = NAME_SPL_FIRESTORM;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_INSTANTFIRESTORM;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_INSTANTFIRESTORM;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_ICEWAVE(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_ICEWAVE;
	visual = "ItRu_IceWave.3ds";
	material = MAT_STONE;
	spell = SPL_ICEWAVE;
	mag_circle = 5;
	description = NAME_SPL_ICEWAVE;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_ICEWAVE;
	text[2] = NAME_DAMAGE;
	count[2] = SPL_FREEZE_DAMAGE;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_SUMDEMON(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_SUMDEMON;
	visual = "ItRu_SumDemon.3DS";
	material = MAT_STONE;
	spell = SPL_SUMMONDEMON;
	mag_circle = 5;
	description = NAME_SPL_SUMMONDEMON;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_SUMMONDEMON;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_FULLHEAL(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_FULLHEAL;
	visual = "ItRu_FullHeal.3ds";
	material = MAT_STONE;
	spell = SPL_FULLHEAL;
	mag_circle = 5;
	description = NAME_SPL_FULLHEAL;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_FULLHEAL;
	text[2] = NAME_HEALINGPERCAST;
	count[2] = SPL_HEAL_FULLHEAL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_FIRERAIN(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_FIRERAIN;
	visual = "ItRu_Firerain.3ds";
	material = MAT_STONE;
	spell = SPL_FIRERAIN;
	mag_circle = 6;
	description = NAME_SPL_FIRERAIN;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_FIRERAIN;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_FIRERAIN;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_BREATHOFDEATH(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_BREATHOFDEATH;
	visual = "ItRu_BreathOfDeath.3ds";
	material = MAT_STONE;
	spell = SPL_BREATHOFDEATH;
	mag_circle = 6;
	description = NAME_SPL_BREATHOFDEATH;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_BREATHOFDEATH;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_BREATHOFDEATH;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_MASSDEATH(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = VALUE_RU_MASSDEATH;
	visual = "ItRu_MassDeath.3ds";
	material = MAT_STONE;
	spell = SPL_MASSDEATH;
	mag_circle = 6;
	description = NAME_SPL_MASSDEATH;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_MASSDEATH;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_MASSDEATH;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_MASTEROFDISASTER(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_MASTEROFDISASTER;
	visual = "ItRu_MasterOfDesaster.3DS";
	material = MAT_STONE;
	spell = SPL_MASTEROFDISASTER;
	mag_circle = 6;
	description = NAME_SPL_MASTEROFDISASTER;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_MASTEROFDISASTER;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_MASTEROFDISASTER;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_ARMYOFDARKNESS(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_ARMYOFDARKNESS;
	visual = "ItRu_ArmyOfDarkness.3DS";
	material = MAT_STONE;
	spell = SPL_ARMYOFDARKNESS;
	mag_circle = 6;
	description = NAME_SPL_ARMYOFDARKNESS;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_ARMYOFDARKNESS;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_SHRINK(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_SHRINK;
	visual = "ItRu_Shrink.3DS";
	material = MAT_STONE;
	spell = SPL_SHRINK;
	mag_circle = 6;
	description = NAME_SPL_SHRINK;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_SHRINK;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_DEATHBOLT(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 0;
	visual = "ItRu_PalRepelEvil.3DS";
	material = MAT_STONE;
	spell = SPL_DEATHBOLT;
	mag_circle = 6;
	description = "Стрела смерти";
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_DEATHBOLT;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_DEATHBOLT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_DEATHBALL(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 0;
	visual = "ItRu_PalRepelEvil.3DS";
	material = MAT_STONE;
	spell = SPL_DEATHBALL;
	mag_circle = 6;
	description = "Шар смерти";
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_DEATHBALL;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_DEATHBALL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_CONCUSSIONBOLT(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 0;
	visual = "ItRu_PalRepelEvil.3DS";
	material = MAT_STONE;
	spell = SPL_CONCUSSIONBOLT;
	mag_circle = 6;
	description = "Стрела сотрясения";
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_CONCUSSIONBOLT;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_CONCUSSIONBOLT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

