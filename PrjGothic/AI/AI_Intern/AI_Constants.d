
const int AIV_LASTFIGHTAGAINSTPLAYER = 0;
const int FIGHT_NONE = 0;
const int FIGHT_LOST = 1;
const int FIGHT_WON = 2;
const int FIGHT_CANCEL = 3;
const int AIV_NPCSAWPLAYERCOMMIT = 1;
const int CRIME_NONE = 0;
const int CRIME_SHEEPKILLER = 1;
const int CRIME_ATTACK = 2;
const int CRIME_THEFT = 3;
const int CRIME_MURDER = 4;
const int AIV_NPCSAWPLAYERCOMMITDAY = 2;
const int AIV_NPCSTARTEDTALK = 3;
const int AIV_INVINCIBLE = 4;
const int AIV_TALKEDTOPLAYER = 5;
const int AIV_PLAYERHASPICKEDMYPOCKET = 6;
const int AIV_LASTTARGET = 7;
const int AIV_PURSUITEND = 8;
const int AIV_ATTACKREASON = 9;
const int AR_NONE = 0;
const int AR_LEFTPORTALROOM = 1;
const int AR_CLEARROOM = 2;
const int AR_GUARDCALLEDTOROOM = 3;
const int AR_MONSTERVSHUMAN = 4;
const int AR_MONSTERMURDEREDHUMAN = 5;
const int AR_SHEEPKILLER = 6;
const int AR_THEFT = 7;
const int AR_USEMOB = 8;
const int AR_GUARDCALLEDTOTHIEF = 9;
const int AR_REACTTOWEAPON = 10;
const int AR_REACTTODAMAGE = 11;
const int AR_GUARDSTOPSFIGHT = 12;
const int AR_GUARDCALLEDTOKILL = 13;
const int AR_GUILDENEMY = 14;
const int AR_HUMANMURDEREDHUMAN = 15;
const int AR_MONSTERCLOSETOGATE = 16;
const int AR_GUARDSTOPSINTRUDER = 17;
const int AR_SUDDENENEMYINFERNO = 18;
const int AR_KILL = 19;
const int AIV_RANSACKED = 10;
const int AIV_DEATHINVGIVEN = 11;
const int AIV_GUARDPASSAGE_STATUS = 12;
const int GP_NONE = 0;
const int GP_FIRSTWARNGIVEN = 1;
const int GP_SECONDWARNGIVEN = 2;
const int AIV_LASTDISTTOWP = 13;
const int AIV_PASSGATE = 14;
const int AIV_PARTYMEMBER = 15;
const int AIV_VICTORYXPGIVEN = 16;
const int AIV_GENDER = 17;
const int MALE = 0;
const int FEMALE = 1;
const int AIV_FOOD = 18;
const int FOOD_APPLE = 0;
const int FOOD_CHEESE = 1;
const int FOOD_BACON = 2;
const int FOOD_BREAD = 3;
const int AIV_TAPOSITION = 19;
const int ISINPOS = 0;
const int NOTINPOS = 1;
const int NOTINPOS_WALK = 2;
const int AIV_SELECTSPELL = 20;
const int AIV_SEENLEFTROOM = 21;
var int player_sneakercomment;
var int player_leftroomcomment;
var int player_drawweaponcomment;
var int player_getoutofmybedcomment;
const int AIV_HITBYOTHERNPC = 22;
const int AIV_WAITBEFOREATTACK = 23;
const int AIV_LASTABSOLUTIONLEVEL = 24;
const int AIV_TOUGHGUYNEWSOVERRIDE = 25;
const int AIV_MM_THREATENBEFOREATTACK = 26;
const int AIV_MM_FOLLOWTIME = 27;
const int FOLLOWTIME_SHORT = 5;
const int FOLLOWTIME_MEDIUM = 10;
const int FOLLOWTIME_LONG = 20;
const int AIV_MM_FOLLOWINWATER = 28;
const int AIV_MM_PRIORITY = 29;
const int PRIO_EAT = 0;
const int PRIO_ATTACK = 1;
const int AIV_MM_SLEEPSTART = 30;
const int AIV_MM_SLEEPEND = 31;
const int AIV_MM_RESTSTART = 32;
const int AIV_MM_RESTEND = 33;
const int AIV_MM_ROAMSTART = 34;
const int AIV_MM_ROAMEND = 35;
const int AIV_MM_EATGROUNDSTART = 36;
const int AIV_MM_EATGROUNDEND = 37;
const int AIV_MM_WUSELSTART = 38;
const int AIV_MM_WUSELEND = 39;
const int AIV_MM_ORCSITSTART = 40;
const int AIV_MM_ORCSITEND = 41;
const int ONLYROUTINE = -1;
const int AIV_MM_SHRINKSTATE = 42;
const int AIV_MM_REAL_ID = 43;
const int ID_MEATBUG = 1;
const int ID_SHEEP = 2;
const int ID_GOBBO_GREEN = 3;
const int ID_GOBBO_BLACK = 4;
const int ID_GOBBO_SKELETON = 5;
const int ID_SUMMONED_GOBBO_SKELETON = 6;
const int ID_SCAVENGER = 7;
const int ID_SCAVENGER_DEMON = 8;
const int ID_GIANT_RAT = 8;
const int ID_GIANT_BUG = 9;
const int ID_BLOODFLY = 10;
const int ID_WARAN = 11;
const int ID_FIREWARAN = 12;
const int ID_WOLF = 13;
const int ID_WARG = 14;
const int ID_SUMMONED_WOLF = 15;
const int ID_MINECRAWLER = 16;
const int ID_MINECRAWLERWARRIOR = 17;
const int ID_LURKER = 18;
const int ID_SKELETON = 19;
const int ID_SUMMONED_SKELETON = 20;
const int ID_SKELETON_MAGE = 21;
const int ID_ZOMBIE = 22;
const int ID_SNAPPER = 23;
const int ID_DRAGONSNAPPER = 24;
const int ID_SHADOWBEAST = 25;
const int ID_SHADOWBEAST_SKELETON = 26;
const int ID_HARPY = 27;
const int ID_STONEGOLEM = 28;
const int ID_FIREGOLEM = 29;
const int ID_ICEGOLEM = 30;
const int ID_SUMMONED_GOLEM = 31;
const int ID_DEMON = 32;
const int ID_SUMMONED_DEMON = 33;
const int ID_DEMON_LORD = 34;
const int ID_TROLL = 35;
const int ID_TROLL_BLACK = 36;
const int ID_SWAMPSHARK = 37;
const int ID_DRAGON_FIRE = 38;
const int ID_DRAGON_ICE = 39;
const int ID_DRAGON_ROCK = 40;
const int ID_DRAGON_SWAMP = 41;
const int ID_DRAGON_UNDEAD = 42;
const int ID_MOLERAT = 43;
const int ID_ORCWARRIOR = 44;
const int ID_ORCSHAMAN = 45;
const int ID_ORCELITE = 46;
const int ID_UNDEADORCWARRIOR = 47;
const int ID_DRACONIAN = 48;
const int ID_WISP = 49;
const int ID_ORCCOMMANDER = 65;
const int AIV_LASTBODY = 44;
const int AIV_ARENAFIGHT = 45;
const int AF_NONE = 0;
const int AF_RUNNING = 1;
const int AF_AFTER = 2;
const int AF_AFTER_PLUS_DAMAGE = 3;
const int AIV_CRIMEABSOLUTIONLEVEL = 46;
const int AIV_LASTPLAYERAR = 47;
const int AIV_DUELLOST = 48;
const int AIV_CHAPTERINV = 49;
const int AIV_MM_PACKHUNTER = 50;
const int AIV_MAGICUSER = 51;
const int MAGIC_NEVER = 0;
const int MAGIC_ALWAYS = 1;
const int AIV_DROPDEADANDKILL = 52;
const int AIV_FREEZESTATETIME = 53;
const int AIV_IGNORE_MURDER = 54;
const int AIV_IGNORE_THEFT = 55;
const int AIV_IGNORE_SHEEPKILLER = 56;
const int AIV_TOUGHGUY = 57;
const int AIV_NEWSOVERRIDE = 58;
const int AIV_MAXDISTTOWP = 59;
const int AIV_ORIGINALFIGHTTACTIC = 60;
const int AIV_ENEMYOVERRIDE = 61;
const int AIV_SUMMONTIME = 62;
const int AIV_FIGHTDISTCANCEL = 63;
const int AIV_LASTFIGHTCOMMENT = 64;
const int AIV_LOADGAME = 65;
const int AIV_DEFEATEDBYPLAYER = 66;
const int AIV_KILLEDBYPLAYER = 67;
const int AIV_STATETIME = 68;
const int AIV_DIST = 69;
const int AIV_SpellLevel = 88;
var int absolutionlevel_oldcamp;
var int absolutionlevel_city;
var int absolutionlevel_monastery;
var int absolutionlevel_farm;
var int petzcounter_oldcamp_murder;
var int petzcounter_oldcamp_theft;
var int petzcounter_oldcamp_attack;
var int petzcounter_oldcamp_sheepkiller;
var int petzcounter_city_murder;
var int petzcounter_city_theft;
var int petzcounter_city_attack;
var int petzcounter_city_sheepkiller;
var int petzcounter_monastery_murder;
var int petzcounter_monastery_theft;
var int petzcounter_monastery_attack;
var int petzcounter_monastery_sheepkiller;
var int petzcounter_farm_murder;
var int petzcounter_farm_theft;
var int petzcounter_farm_attack;
var int petzcounter_farm_sheepkiller;
const int LOC_NONE = 0;
const int LOC_OLDCAMP = 1;
const int LOC_CITY = 2;
const int LOC_MONASTERY = 3;
const int LOC_FARM = 4;
const int LOC_ALL = 5;
const int Q_KASERNE = 1;
const int Q_GALGEN = 2;
const int Q_MARKT = 3;
const int Q_TEMPEL = 4;
const int Q_UNTERSTADT = 5;
const int Q_HAFEN = 6;
const int Q_OBERSTADT = 7;
const int PERC_DIST_SUMMONED_ACTIVE_MAX = 2000;
const int PERC_DIST_MONSTER_ACTIVE_MAX = 1500;
const int PERC_DIST_ORC_ACTIVE_MAX = 2500;
const int PERC_DIST_DRAGON_ACTIVE_MAX = 3500;
const int FIGHT_DIST_MONSTER_ATTACKRANGE = 700;
const int FIGHT_DIST_MONSTER_FLEE = 300;
const int MONSTER_THREATEN_TIME = 4;
const int MONSTER_SUMMON_TIME = 60;
const int TA_DIST_SELFWP_MAX = 500;
const int PERC_DIST_ACTIVE_MAX = 2000;
const int PERC_DIST_INTERMEDIAT = 1000;
const int PERC_DIST_DIALOG = 500;
const int PERC_DIST_HEIGHT = 1000;
const int PERC_DIST_INDOOR_HEIGHT = 250;
const int FIGHT_DIST_MELEE = 600;
const int FIGHT_DIST_RANGED_INNER = 900;
const int FIGHT_DIST_RANGED_OUTER = 1000;
const int FIGHT_DIST_CANCEL = 3500;
const int WATCHFIGHT_DIST_MIN = 300;
const int WATCHFIGHT_DIST_MAX = 2000;
const int ZIVILANQUATSCHDIST = 400;

const float RANGED_CHANCE_MINDIST = 1500;
const float RANGED_CHANCE_MAXDIST = 4500;

const int NPC_ANGRY_TIME = 120;
const int HAI_TIME_UNCONSCIOUS = 20;
const int NPC_TIME_FOLLOW = 10;
const int NPC_MINIMAL_DAMAGE = 5;
const int NPC_MINIMAL_PERCENT = 10;
const int FAI_HUMAN_COWARD = 2;
const int FAI_HUMAN_NORMAL = 42;
const int FAI_HUMAN_STRONG = 3;
const int FAI_HUMAN_MASTER = 4;
const int FAI_MONSTER_COWARD = 10;
const int FAI_NAILED = 1;
const int FAI_GOBBO = 7;
const int FAI_SCAVENGER = 15;
const int FAI_GIANT_RAT = 11;
const int FAI_GIANT_BUG = 31;
const int FAI_BLOODFLY = 24;
const int FAI_WARAN = 21;
const int FAI_WOLF = 22;
const int FAI_MINECRAWLER = 5;
const int FAI_LURKER = 9;
const int FAI_ZOMBIE = 23;
const int FAI_SNAPPER = 18;
const int FAI_SHADOWBEAST = 16;
const int FAI_HARPY = 36;
const int FAI_STONEGOLEM = 8;
const int FAI_DEMON = 6;
const int FAI_TROLL = 20;
const int FAI_SWAMPSHARK = 19;
const int FAI_DRAGON = 39;
const int FAI_MOLERAT = 40;
const int FAI_ORC = 12;
const int FAI_DRACONIAN = 41;
const int TRUE = 1;
const int FALSE = 0;
const int LOOP_CONTINUE = 0;
const int LOOP_END = 1;
const int DEFAULT = 0;
const int LP_PER_LEVEL = 10;
const int HP_PER_LEVEL = 12;
const int XP_PER_VICTORY = 10;
const int NPCTYPE_AMBIENT = 0;
const int NPCTYPE_MAIN = 1;
const int NPCTYPE_FRIEND = 2;
const int NPCTYPE_OCAMBIENT = 3;
const int NPCTYPE_OCMAIN = 4;
const int MOBSI_NONE = 0;
const int MOBSI_SMITHWEAPON = 1;
const int MOBSI_SLEEPABIT = 2;
const int MOBSI_MAKERUNE = 3;
const int MOBSI_POTIONALCHEMY = 4;
const int MOBSI_PRAYSHRINE = 5;
var int player_mobsi_production;
const int BODYTEX_P = 0;
const int BODYTEX_N = 1;
const int BODYTEX_L = 2;
const int BODYTEX_B = 3;
const int BODYTEXBABE_P = 4;
const int BODYTEXBABE_N = 5;
const int BODYTEXBABE_L = 6;
const int BODYTEXBABE_B = 7;
const int BODYTEX_PLAYER_G1 = 8;
const int BODYTEX_PLAYER_G2 = 9;
const int BODYTEX_TATTOO_N = 10;
const int BODYTEXBABE_F = 11;
const int BODYTEXBABE_S = 12;
const int BODYTEX_TATTOO_P = 13;
const int BODYTEX_TATTOO_B = 14;
const int NO_ARMOR = -1;
const int FACE_N_GOMEZ = 0;
const int FACE_N_SCAR = 1;
const int FACE_N_RAVEN = 2;
const int FACE_N_BULLIT = 3;
const int FACE_B_THORUS = 4;
const int FACE_N_CORRISTO = 5;
const int FACE_N_MILTEN = 6;
const int FACE_N_BLOODWYN = 7;
const int FACE_L_SCATTY = 8;
const int FACE_N_YBERION = 9;
const int FACE_N_COOLPOCK = 10;
const int FACE_B_CORANGAR = 11;
const int FACE_B_SATURAS = 12;
const int FACE_N_XARDAS = 13;
const int FACE_N_LARES = 14;
const int FACE_L_RATFORD = 15;
const int FACE_N_DRAX = 16;
const int FACE_B_GORN = 17;
const int FACE_N_PLAYER = 18;
const int FACE_P_LESTER = 19;
const int FACE_N_LEE = 20;
const int FACE_N_TORLOF = 21;
const int FACE_N_MUD = 22;
const int FACE_N_RICELORD = 23;
const int FACE_N_HORATIO = 24;
const int FACE_N_RICHTER = 25;
const int FACE_N_CIPHER_NEU = 26;
const int FACE_N_HOMER = 27;
const int FACE_B_CAVALORN = 28;
const int FACE_L_IAN = 29;
const int FACE_L_DIEGO = 30;
const int FACE_N_MADPSI = 31;
const int FACE_N_BARTHOLO = 32;
const int FACE_N_SNAF = 33;
const int FACE_N_MORDRAG = 34;
const int FACE_N_LEFTY = 35;
const int FACE_N_WOLF = 36;
const int FACE_N_FINGERS = 37;
const int FACE_N_WHISTLER = 38;
const int FACE_P_GILBERT = 39;
const int FACE_L_JACKAL = 40;
const int FACE_P_TOUGHBALD = 41;
const int FACE_P_TOUGH_DRAGO = 42;
const int FACE_P_TOUGH_TORREZ = 43;
const int FACE_P_TOUGH_RODRIGUEZ = 44;
const int FACE_P_TOUGHBALD_NEK = 45;
const int FACE_P_NORMALBALD = 46;
const int FACE_P_NORMAL01 = 47;
const int FACE_P_NORMAL02 = 48;
const int FACE_P_NORMAL_FLETCHER = 49;
const int FACE_P_NORMAL03 = 50;
const int FACE_P_NORMALBART01 = 51;
const int FACE_P_NORMALBART_CRONOS = 52;
const int FACE_P_NORMALBART_NEFARIUS = 53;
const int FACE_P_NORMALBART_RIORDIAN = 54;
const int FACE_P_OLDMAN_GRAVO = 55;
const int FACE_P_WEAK_CUTTER = 56;
const int FACE_P_WEAK_ULF_WOHLERS = 57;
const int FACE_N_IMPORTANT_ARTO = 58;
const int FACE_N_IMPORTANTGREY = 59;
const int FACE_N_IMPORTANTOLD = 60;
const int FACE_N_TOUGH_LEE = 61;
const int FACE_N_TOUGH_SKIP = 62;
const int FACE_N_TOUGHBART01 = 63;
const int FACE_N_TOUGH_OKYL = 64;
const int FACE_N_NORMAL01 = 65;
const int FACE_N_NORMAL_CORD = 66;
const int FACE_N_NORMAL_OLLI_KAHN = 67;
const int FACE_N_NORMAL02 = 68;
const int FACE_N_NORMAL_SPASSVOGEL = 69;
const int FACE_N_NORMAL03 = 70;
const int FACE_N_NORMAL04 = 71;
const int FACE_N_NORMAL05 = 72;
const int FACE_N_NORMAL_STONE = 73;
const int FACE_N_NORMAL06 = 74;
const int FACE_N_NORMAL_ERPRESSER = 75;
const int FACE_N_NORMAL07 = 76;
const int FACE_N_NORMAL_BLADE = 77;
const int FACE_N_NORMAL08 = 78;
const int FACE_N_NORMAL14 = 79;
const int FACE_N_NORMAL_SLY = 80;
const int FACE_N_NORMAL16 = 81;
const int FACE_N_NORMAL17 = 82;
const int FACE_N_NORMAL18 = 83;
const int FACE_N_NORMAL19 = 84;
const int FACE_N_NORMAL20 = 85;
const int FACE_N_NORMALBART01 = 86;
const int FACE_N_NORMALBART02 = 87;
const int FACE_N_NORMALBART03 = 88;
const int FACE_N_NORMALBART04 = 89;
const int FACE_N_NORMALBART05 = 90;
const int FACE_N_NORMALBART06 = 91;
const int FACE_N_NORMALBART_SENYAN = 92;
const int FACE_N_NORMALBART08 = 93;
const int FACE_N_NORMALBART09 = 94;
const int FACE_N_NORMALBART10 = 95;
const int FACE_N_NORMALBART11 = 96;
const int FACE_N_NORMALBART12 = 97;
const int FACE_N_NORMALBART_DEXTER = 98;
const int FACE_N_NORMALBART_GRAHAM = 99;
const int FACE_N_NORMALBART_DUSTY = 100;
const int FACE_N_NORMALBART16 = 101;
const int FACE_N_NORMALBART17 = 102;
const int FACE_N_NORMALBART_HUNO = 103;
const int FACE_N_NORMALBART_GRIM = 104;
const int FACE_N_NORMALBART20 = 105;
const int FACE_N_NORMALBART21 = 106;
const int FACE_N_NORMALBART22 = 107;
const int FACE_N_OLDBALD_JEREMIAH = 108;
const int FACE_N_WEAK_ULBERT = 109;
const int FACE_N_WEAK_BAALNETBEK = 110;
const int FACE_N_WEAK_HEREK = 111;
const int FACE_N_WEAK04 = 112;
const int FACE_N_WEAK05 = 113;
const int FACE_N_WEAK_ORRY = 114;
const int FACE_N_WEAK_ASGHAN = 115;
const int FACE_N_WEAK_MARKUS_KARK = 116;
const int FACE_N_WEAK_CIPHER_ALT = 117;
const int FACE_N_NORMALBART_SWINEY = 118;
const int FACE_N_WEAK12 = 119;
const int FACE_L_TOUGHBALD01 = 120;
const int FACE_L_TOUGH01 = 121;
const int FACE_L_TOUGH02 = 122;
const int FACE_L_TOUGH_SANTINO = 123;
const int FACE_L_TOUGHBART_QUENTIN = 124;
const int FACE_L_NORMAL_GORNABAR = 125;
const int FACE_L_NORMALBART01 = 126;
const int FACE_L_NORMALBART02 = 127;
const int FACE_L_NORMALBART_RUFUS = 128;
const int FACE_B_TOUGHBALD = 129;
const int FACE_B_TOUGH_PACHO = 130;
const int FACE_B_TOUGH_SILAS = 131;
const int FACE_B_NORMAL01 = 132;
const int FACE_B_NORMAL_KIRGO = 133;
const int FACE_B_NORMAL_SHARKY = 134;
const int FACE_B_NORMAL_ORIK = 135;
const int FACE_B_NORMAL_KHARIM = 136;
const int FACEBABE_N_BLACKHAIR = 137;
const int FACEBABE_N_BLONDIE = 138;
const int FACEBABE_N_BLONDTATTOO = 139;
const int FACEBABE_N_PINKHAIR = 140;
const int FACEBABE_L_CHARLOTTE = 141;
const int FACEBABE_B_REDLOCKS = 142;
const int FACEBABE_N_HAIRANDCLOTH = 143;
const int FACEBABE_N_WHITECLOTH = 144;
const int FACEBABE_N_GREYCLOTH = 145;
const int FACEBABE_N_BROWN = 146;
const int FACEBABE_N_VLKBLONDE = 147;
const int FACEBABE_N_BAUBLONDE = 148;
const int FACEBABE_N_YOUNGBLONDE = 149;
const int FACEBABE_N_OLDBLONDE = 150;
const int FACEBABE_P_MIDBLONDE = 151;
const int FACEBABE_N_MIDBAUBLONDE = 152;
const int FACEBABE_N_OLDBROWN = 153;
const int FACEBABE_N_LILO = 154;
const int FACEBABE_N_HURE = 155;
const int FACEBABE_N_ANNE = 156;
const int FACEBABE_B_REDLOCKS2 = 157;
const int FACEBABE_L_CHARLOTTE2 = 158;
