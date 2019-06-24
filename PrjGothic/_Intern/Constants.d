
const string FONT_SCREEN = "FONT_OLD_20_WHITE.TGA";
const string FONT_SCREENSMALL = "FONT_OLD_10_WHITE.TGA";
const string FONT_BOOK = "FONT_10_BOOK.TGA";
const string FONT_BOOKHEADLINE = "FONT_20_BOOK.TGA";

const int ATR_HITPOINTS = 0;
const int ATR_HITPOINTS_MAX = 1;
const int ATR_MANA = 2;
const int ATR_MANA_MAX = 3;
const int ATR_STRENGTH = 4;
const int ATR_DEXTERITY = 5;
const int ATR_REGENERATEHP = 6;
const int ATR_REGENERATEMANA = 7;
const int ATR_INDEX_MAX = 8;
const int NPC_FLAG_FRIEND = 1;
const int NPC_FLAG_IMMORTAL = 2;
const int FMODE_NONE = 0;
const int FMODE_FIST = 1;
const int FMODE_MELEE = 2;
const int FMODE_FAR = 5;
const int FMODE_MAGIC = 7;
const int NPC_RUN = 0;
const int NPC_WALK = 1;
const int NPC_SNEAK = 2;
const int NPC_RUN_WEAPON = 128;
const int NPC_WALK_WEAPON = 129;
const int NPC_SNEAK_WEAPON = 130;
const int WEAR_TORSO = 1;
const int WEAR_HEAD = 2;
const int INV_WEAPON = 1;
const int INV_ARMOR = 2;
const int INV_RUNE = 3;
const int INV_MAGIC = 4;
const int INV_FOOD = 5;
const int INV_POTION = 6;
const int INV_DOC = 7;
const int INV_MISC = 8;
const int INV_CAT_MAX = 9;
const int INV_MAX_WEAPONS = 6;
const int INV_MAX_ARMORS = 2;
const int INV_MAX_RUNES = 1000;
const int INV_MAX_FOOD = 15;
const int INV_MAX_DOCS = 1000;
const int INV_MAX_POTIONS = 1000;
const int INV_MAX_MAGIC = 1000;
const int INV_MAX_MISC = 1000;
const int ITM_TEXT_MAX = 6;
const int ITEM_KAT_NONE = 1;
const int ITEM_KAT_NF = 2;
const int ITEM_KAT_FF = 4;
const int ITEM_KAT_MUN = 8;
const int ITEM_KAT_ARMOR = 16;
const int ITEM_KAT_FOOD = 32;
const int ITEM_KAT_DOCS = 64;
const int ITEM_KAT_POTIONS = 128;
const int ITEM_KAT_LIGHT = 256;
const int ITEM_KAT_RUNE = 512;
const int ITEM_KAT_MAGIC = 1 << 31;
const int ITEM_KAT_KEYS = 1;
const int ITEM_BURN = 1 << 10;
const int ITEM_DROPPED = 1 << 11;
const int ITEM_MISSION = 1 << 12;
const int ITEM_MULTI = 1 << 21;
const int ITEM_TORCH = 1 << 28;
const int ITEM_THROW = 1 << 29;
const int ITEM_SWD = 1 << 14;
const int ITEM_AXE = 1 << 15;
const int ITEM_2HD_SWD = 1 << 16;
const int ITEM_2HD_AXE = 1 << 17;
const int ITEM_BOW = 1 << 19;
const int ITEM_CROSSBOW = 1 << 20;
const int ITEM_AMULET = 1 << 22;
const int ITEM_RING = 1 << 11;
const int DAM_INVALID = 0;
const int DAM_BARRIER = 1;
const int DAM_BLUNT = 2;
const int DAM_EDGE = 4;
const int DAM_FIRE = 8;
const int DAM_FLY = 16;
const int DAM_MAGIC = 32;
const int DAM_POINT = 64;
const int DAM_FALL = 128;
const int DAM_INDEX_BARRIER = 0;
const int DAM_INDEX_BLUNT = 1;
const int DAM_INDEX_EDGE = 2;
const int DAM_INDEX_FIRE = 3;
const int DAM_INDEX_FLY = 4;
const int DAM_INDEX_MAGIC = 5;
const int DAM_INDEX_POINT = 6;
const int DAM_INDEX_FALL = 7;
const int DAM_INDEX_MAX = 8;
const int NPC_ATTACK_FINISH_DISTANCE = 180;
const int NPC_BURN_TICKS_PER_DAMAGE_POINT = 1000;
const int NPC_BURN_DAMAGE_POINTS_PER_INTERVALL = 50;
const int DAM_CRITICAL_MULTIPLIER = 2;
const int BLOOD_SIZE_DIVISOR = 1000;
const int BLOOD_DAMAGE_MAX = 200;
const int DAMAGE_FLY_CM_MAX = 2000;
const int DAMAGE_FLY_CM_MIN = 300;
const int DAMAGE_FLY_CM_PER_POINT = 5;
const int NPC_DAM_DIVE_TIME = 100;
const int IMMUNE = -1;

const float NPC_COLLISION_CORRECTION_SCALER = 0.75;

const int PROT_BARRIER = 0;
const int PROT_BLUNT = 1;
const int PROT_EDGE = 2;
const int PROT_FIRE = 3;
const int PROT_FLY = 4;
const int PROT_MAGIC = 5;
const int PROT_POINT = 6;
const int PROT_FALL = 7;
const int PROT_INDEX_MAX = 8;
const int PERC_ASSESSPLAYER = 1;
const int PERC_ASSESSENEMY = 2;
const int PERC_ASSESSFIGHTER = 3;
const int PERC_ASSESSBODY = 4;
const int PERC_ASSESSITEM = 5;
const int SENSE_SEE = 1;
const int SENSE_HEAR = 2;
const int SENSE_SMELL = 4;
const int PERC_ASSESSMURDER = 6;
const int PERC_ASSESSDEFEAT = 7;
const int PERC_ASSESSDAMAGE = 8;
const int PERC_ASSESSOTHERSDAMAGE = 9;
const int PERC_ASSESSTHREAT = 10;
const int PERC_ASSESSREMOVEWEAPON = 11;
const int PERC_OBSERVEINTRUDER = 12;
const int PERC_ASSESSFIGHTSOUND = 13;
const int PERC_ASSESSQUIETSOUND = 14;
const int PERC_ASSESSWARN = 15;
const int PERC_CATCHTHIEF = 16;
const int PERC_ASSESSTHEFT = 17;
const int PERC_ASSESSCALL = 18;
const int PERC_ASSESSTALK = 19;
const int PERC_ASSESSGIVENITEM = 20;
const int PERC_ASSESSFAKEGUILD = 21;
const int PERC_MOVEMOB = 22;
const int PERC_MOVENPC = 23;
const int PERC_DRAWWEAPON = 24;
const int PERC_OBSERVESUSPECT = 25;
const int PERC_NPCCOMMAND = 26;
const int PERC_ASSESSMAGIC = 27;
const int PERC_ASSESSSTOPMAGIC = 28;
const int PERC_ASSESSCASTER = 29;
const int PERC_ASSESSSURPRISE = 30;
const int PERC_ASSESSENTERROOM = 31;
const int PERC_ASSESSUSEMOB = 32;
const int NEWS_DONT_SPREAD = 0;
const int NEWS_SPREAD_NPC_FRIENDLY_TOWARDS_VICTIM = 1;
const int NEWS_SPREAD_NPC_FRIENDLY_TOWARDS_WITNESS = 2;
const int NEWS_SPREAD_NPC_FRIENDLY_TOWARDS_OFFENDER = 3;
const int NEWS_SPREAD_NPC_SAME_GUILD_VICTIM = 4;
const int IMPORTANT = 1;
const int INF_TELL = 0;
const int INF_UNKNOWN = 2;
const int LOG_RUNNING = 1;
const int LOG_SUCCESS = 2;
const int LOG_FAILED = 3;
const int LOG_OBSOLETE = 4;
const int ATT_FRIENDLY = 3;
const int ATT_NEUTRAL = 2;
const int ATT_ANGRY = 1;
const int ATT_HOSTILE = 0;
const int GIL_NONE = 0;
const int GIL_HUMAN = 1;
const int GIL_PAL = 1;
const int GIL_MIL = 2;
const int GIL_VLK = 3;
const int GIL_KDF = 4;
const int GIL_NOV = 5;
const int GIL_DJG = 6;
const int GIL_SLD = 7;
const int GIL_BAU = 8;
const int GIL_BDT = 9;
const int GIL_STRF = 10;
const int GIL_DMT = 11;
const int GIL_OUT = 12;
const int GIL_EMPTY_B = 13;
const int GIL_EMPTY_C = 14;
const int GIL_EMPTY_D = 15;
const int GIL_PUBLIC = 15;
const int GIL_SEPERATOR_HUM = 16;
const int GIL_MEATBUG = 17;
const int GIL_SHEEP = 18;
const int GIL_GOBBO = 19;
const int GIL_GOBBO_SKELETON = 20;
const int GIL_SUMMONED_GOBBO_SKELETON = 21;
const int GIL_SCAVENGER = 22;
const int GIL_GIANT_RAT = 23;
const int GIL_GIANT_BUG = 24;
const int GIL_BLOODFLY = 25;
const int GIL_WARAN = 26;
const int GIL_WOLF = 27;
const int GIL_SUMMONED_WOLF = 28;
const int GIL_MINECRAWLER = 29;
const int GIL_LURKER = 30;
const int GIL_SKELETON = 31;
const int GIL_SUMMONED_SKELETON = 32;
const int GIL_SKELETON_MAGE = 33;
const int GIL_ZOMBIE = 34;
const int GIL_SNAPPER = 35;
const int GIL_SHADOWBEAST = 36;
const int GIL_SHADOWBEAST_SKELETON = 37;
const int GIL_HARPY = 38;
const int GIL_STONEGOLEM = 39;
const int GIL_FIREGOLEM = 40;
const int GIL_ICEGOLEM = 41;
const int GIL_SUMMONED_GOLEM = 42;
const int GIL_DEMON = 43;
const int GIL_SUMMONED_DEMON = 44;
const int GIL_TROLL = 45;
const int GIL_SWAMPSHARK = 46;
const int GIL_DRAGON = 47;
const int GIL_MOLERAT = 48;
const int GIL_EMPTY_M = 49;
const int GIL_EMPTY_N = 50;
const int GIL_EMPTY_O = 51;
const int GIL_EMPTY_P = 52;
const int GIL_EMPTY_Q = 53;
const int GIL_SEPERATOR_ORC = 54;
const int GIL_ORC = 55;
const int GIL_FRIENDLY_ORC = 56;
const int GIL_UNDEADORC = 57;
const int GIL_DRACONIAN = 58;
const int GIL_EMPTY_X = 59;
const int GIL_EMPTY_Y = 60;
const int GIL_EMPTY_Z = 61;
const int GIL_MAX = 62;

class C_GILVALUES
{
	var int water_depth_knee[62];
	var int water_depth_chest[62];
	var int jumpup_height[62];
	var int swim_time[62];
	var int dive_time[62];
	var int step_height[62];
	var int jumplow_height[62];
	var int jumpmid_height[62];
	var int slide_angle[62];
	var int slide_angle2[62];
	var int disable_autoroll[62];
	var int surface_align[62];
	var int climb_heading_angle[62];
	var int climb_horiz_angle[62];
	var int climb_ground_angle[62];
	var int fight_range_base[62];
	var int fight_range_fist[62];
	var int fight_range_g[62];
	var int fight_range_1hs[62];
	var int fight_range_1ha[62];
	var int fight_range_2hs[62];
	var int fight_range_2ha[62];
	var int falldown_height[62];
	var int falldown_damage[62];
	var int blood_disabled[62];
	var int blood_max_distance[62];
	var int blood_amount[62];
	var int blood_flow[62];
	var string blood_emitter[62];
	var string blood_texture[62];
	var int turn_speed[62];
};

const int NPC_SOUND_DROPTAKE = 1;
const int NPC_SOUND_SPEAK = 3;
const int NPC_SOUND_STEPS = 4;
const int NPC_SOUND_THROWCOLL = 5;
const int NPC_SOUND_DRAWWEAPON = 6;
const int NPC_SOUND_SCREAM = 7;
const int NPC_SOUND_FIGHT = 8;
const int MAT_WOOD = 0;
const int MAT_STONE = 1;
const int MAT_METAL = 2;
const int MAT_LEATHER = 3;
const int MAT_CLAY = 4;
const int MAT_GLAS = 5;
const int LOG_MISSION = 0;
const int LOG_NOTE = 1;
const int TIME_INFINITE = -1000;
const int NPC_VOICE_VARIATION_MAX = 10;

const float TRADE_VALUE_MULTIPLIER = 0.3;

const string TRADE_CURRENCY_INSTANCE = "ITMI_GOLD";

const int SPELL_GOOD = 0;
const int SPELL_NEUTRAL = 1;
const int SPELL_BAD = 2;
const int SPL_DONTINVEST = 0;
const int SPL_RECEIVEINVEST = 1;
const int SPL_SENDCAST = 2;
const int SPL_SENDSTOP = 3;
const int SPL_NEXTLEVEL = 4;
const int SPL_FORCEINVEST = 1 << 16;
const int TARGET_COLLECT_NONE = 0;
const int TARGET_COLLECT_CASTER = 1;
const int TARGET_COLLECT_FOCUS = 2;
const int TARGET_COLLECT_ALL = 3;
const int TARGET_COLLECT_FOCUS_FALLBACK_NONE = 4;
const int TARGET_COLLECT_FOCUS_FALLBACK_CASTER = 5;
const int TARGET_COLLECT_ALL_FALLBACK_NONE = 6;
const int TARGET_COLLECT_ALL_FALLBACK_CASTER = 7;
const int TARGET_TYPE_ALL = 1;
const int TARGET_TYPE_ITEMS = 2;
const int TARGET_TYPE_NPCS = 4;
const int TARGET_TYPE_ORCS = 8;
const int TARGET_TYPE_HUMANS = 16;
const int TARGET_TYPE_UNDEAD = 32;
const int SPL_PALLIGHT = 0;
const int SPL_PALLIGHTHEAL = 1;
const int SPL_PALHOLYBOLT = 2;
const int SPL_PALMEDIUMHEAL = 3;
const int SPL_PALREPELEVIL = 4;
const int SPL_PALFULLHEAL = 5;
const int SPL_PALDESTROYEVIL = 6;
const int SPL_PALTELEPORTSECRET = 7;
const int SPL_TELEPORTSEAPORT = 8;
const int SPL_TELEPORTMONASTERY = 9;
const int SPL_TELEPORTFARM = 10;
const int SPL_TELEPORTXARDAS = 11;
const int SPL_TELEPORTPASSNW = 12;
const int SPL_TELEPORTPASSOW = 13;
const int SPL_TELEPORTOC = 14;
const int SPL_TELEPORTOWDEMONTOWER = 15;
const int SPL_TELEPORTTAVERNE = 16;
const int SPL_TELEPORT_3 = 17;
const int SPL_LIGHT = 18;
const int SPL_FIREBOLT = 19;
const int SPL_ZAP = 24;
const int SPL_LIGHTHEAL = 21;
const int SPL_SUMMONGOBLINSKELETON = 22;
const int SPL_INSTANTFIREBALL = 23;
const int SPL_ICEBOLT = 20;
const int SPL_SUMMONWOLF = 25;
const int SPL_WINDFIST = 26;
const int SPL_SLEEP = 27;
const int SPL_MEDIUMHEAL = 28;
const int SPL_LIGHTNINGFLASH = 29;
const int SPL_CHARGEFIREBALL = 30;
const int SPL_SUMMONSKELETON = 31;
const int SPL_FEAR = 32;
const int SPL_ICECUBE = 33;
const int SPL_CHARGEZAP = 34;
const int SPL_SUMMONGOLEM = 35;
const int SPL_DESTROYUNDEAD = 36;
const int SPL_PYROKINESIS = 37;
const int SPL_FIRESTORM = 38;
const int SPL_ICEWAVE = 39;
const int SPL_SUMMONDEMON = 40;
const int SPL_FULLHEAL = 41;
const int SPL_MASTEROFDISASTER = 60;
const int SPL_FIRERAIN = 42;
const int SPL_BREATHOFDEATH = 43;
const int SPL_MASSDEATH = 44;
const int SPL_ARMYOFDARKNESS = 45;
const int SPL_SHRINK = 46;
const int SPL_TRFSHEEP = 47;
const int SPL_TRFSCAVENGER = 48;
const int SPL_TRFGIANTRAT = 49;
const int SPL_TRFGIANTBUG = 50;
const int SPL_TRFWOLF = 51;
const int SPL_TRFWARAN = 52;
const int SPL_TRFSNAPPER = 53;
const int SPL_TRFWARG = 54;
const int SPL_TRFFIREWARAN = 55;
const int SPL_TRFLURKER = 56;
const int SPL_TRFSHADOWBEAST = 57;
const int SPL_TRFDRAGONSNAPPER = 58;
const int SPL_CHARM = 59;
const int SPL_DEATHBOLT = 61;
const int SPL_DEATHBALL = 62;
const int SPL_CONCUSSIONBOLT = 63;
const int SPL_E = 64;
const int SPL_F = 65;
const int SPL_G = 66;
const int SPL_H = 67;
const int MAX_SPELL = 68;


const string SPELLFXINSTANCENAMES[68] =
{
	"PalLight",
	"PalHeal",
	"PalHolyBolt",
	"PalHeal",
	"PalRepelEvil",
	"PalHeal",
	"PalDestroyEvil",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Light",
	"Firebolt",
	"Icebolt",
	"Heal",
	"SummonGoblinSkeleton",
	"InstantFireball",
	"Zap",
	"SummonWolf",
	"WindFist",
	"Sleep",
	"Heal",
	"LightningFlash",
	"ChargeFireball",
	"SummonSkeleton",
	"Fear",
	"Icecube",
	"ChargeZap",
	"SummonGolem",
	"DestroyUndead",
	"Pyrokinesis",
	"Firestorm",
	"Icewave",
	"SummonDemon",
	"Heal",
	"Firerain",
	"BreathOfDeath",
	"MassDeath",
	"ArmyOfDarkness",
	"Shrink",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Charm",
	"MasterOfDisaster",
	"Deathbolt",
	"Deathball",
	"Concussionbolt",
	"Light",
	"Light",
	"Light",
	"Light"
};

const string SPELLFXANILETTERS[68] =
{
	"SLE",
	"HEA",
	"FBT",
	"HEA",
	"FBT",
	"HEA",
	"FIB",
	"HEA",
	"HEA",
	"HEA",
	"HEA",
	"HEA",
	"HEA",
	"HEA",
	"HEA",
	"HEA",
	"HEA",
	"HEA",
	"SLE",
	"FBT",
	"FBT",
	"HEA",
	"SUM",
	"FBT",
	"FBT",
	"SUM",
	"WND",
	"SLE",
	"HEA",
	"WND",
	"FIB",
	"SUM",
	"FEA",
	"FRZ",
	"FIB",
	"SUM",
	"FIB",
	"FIB",
	"FIB",
	"FEA",
	"SUM",
	"HEA",
	"FEA",
	"FIB",
	"MSD",
	"SUM",
	"SLE",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"FIB",
	"FIB",
	"FBT",
	"FBT",
	"FBT",
	"FBT",
	"FBT",
	"XXX",
	"XXX"
};

const int NPC_TALENT_UNKNOWN = 0;
const int NPC_TALENT_1H = 1;
const int NPC_TALENT_2H = 2;
const int NPC_TALENT_BOW = 3;
const int NPC_TALENT_CROSSBOW = 4;
const int NPC_TALENT_PICKLOCK = 5;
const int NPC_TALENT_MAGE = 7;
const int NPC_TALENT_SNEAK = 8;
const int NPC_TALENT_REGENERATE = 9;
const int NPC_TALENT_FIREMASTER = 10;
const int NPC_TALENT_ACROBAT = 11;
const int NPC_TALENT_PICKPOCKET = 12;
const int NPC_TALENT_SMITH = 13;
const int NPC_TALENT_RUNES = 14;
const int NPC_TALENT_ALCHEMY = 15;
const int NPC_TALENT_TAKEANIMALTROPHY = 16;
const int NPC_TALENT_A = 17;
const int NPC_TALENT_B = 18;
const int NPC_TALENT_C = 19;
const int NPC_TALENT_D = 20;
const int NPC_TALENT_E = 21;
const int NPC_TALENT_MAX = 22;

var int player_talent_runes[68];
const int POTION_HEALTH_01 = 0;
const int POTION_HEALTH_02 = 1;
const int POTION_HEALTH_03 = 2;
const int POTION_MANA_01 = 3;
const int POTION_MANA_02 = 4;
const int POTION_MANA_03 = 5;
const int POTION_SPEED = 6;
const int POTION_PERM_STR = 7;
const int POTION_PERM_DEX = 8;
const int POTION_PERM_MANA = 9;
const int POTION_PERM_HEALTH = 10;
const int POTION_MEGADRINK = 11;
const int CHARGE_INNOSEYE = 12;
const int MAX_POTION = 13;

var int player_talent_alchemy[13];
const int WEAPON_COMMON = 0;
const int WEAPON_1H_SPECIAL_01 = 1;
const int WEAPON_2H_SPECIAL_01 = 2;
const int WEAPON_1H_SPECIAL_02 = 3;
const int WEAPON_2H_SPECIAL_02 = 4;
const int WEAPON_1H_SPECIAL_03 = 5;
const int WEAPON_2H_SPECIAL_03 = 6;
const int WEAPON_1H_SPECIAL_04 = 7;
const int WEAPON_2H_SPECIAL_04 = 8;
const int MAX_WEAPONS = 9;

var int player_talent_smith[9];
const int TROPHY_TEETH = 0;
const int TROPHY_CLAWS = 1;
const int TROPHY_FUR = 2;
const int TROPHY_HEART = 3;
const int TROPHY_SHADOWHORN = 4;
const int TROPHY_FIRETONGUE = 5;
const int TROPHY_BFWING = 6;
const int TROPHY_BFSTING = 7;
const int TROPHY_MANDIBLES = 8;
const int TROPHY_CRAWLERPLATE = 9;
const int TROPHY_DRGSNAPPERHORN = 10;
const int TROPHY_DRAGONSCALE = 11;
const int TROPHY_DRAGONBLOOD = 12;
const int MAX_TROPHIES = 13;

var int player_talent_takeanimaltrophy[13];

const string TEXT_FONT_20 = "Font_old_20_white.tga";
const string TEXT_FONT_10 = "Font_old_10_white.tga";
const string TEXT_FONT_DEFAULT = "Font_old_10_white.tga";
const string TEXT_FONT_INVENTORY = "Font_old_10_white.tga";

const float VIEW_TIME_PER_CHAR = 550;

const int NEWWORLD_ZEN = 1;
const int OLDWORLD_ZEN = 2;
const int DRAGONISLAND_ZEN = 3;
const int INVCAM_ENTF_RING_STANDARD = 400;
const int INVCAM_ENTF_AMULETTE_STANDARD = 150;
const int INVCAM_ENTF_MISC_STANDARD = 200;
const int INVCAM_ENTF_MISC2_STANDARD = 250;
const int INVCAM_X_RING_STANDARD = 25;
const int INVCAM_Z_RING_STANDARD = 45;
