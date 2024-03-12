
instance ITMW_1H_VLK_DAGGER(C_ITEM)
{
	name = "Кинжал";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_VLKDOLCH;
	damagetotal = DAMAGE_VLKDOLCH;
	damagetype = DAM_EDGE;
	range = RANGE_VLKDOLCH;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_VLKDOLCH;
	visual = "Itmw_005_1h_dagger_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_MACE_L_01(C_ITEM)
{
	name = "Кочерга";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_SCHUERHAKEN;
	damagetotal = DAMAGE_SCHUERHAKEN;
	damagetype = DAM_BLUNT;
	range = RANGE_SCHUERHAKEN;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SCHUERHAKEN;
	visual = "Itmw_005_1h_poker_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_BAU_AXE(C_ITEM)
{
	name = "Серп";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_BAUAXE;
	damagetotal = DAMAGE_BAUAXE;
	damagetype = DAM_EDGE;
	range = RANGE_BAUAXE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_BAUAXE;
	visual = "Itmw_007_1h_sickle_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_VLK_MACE(C_ITEM)
{
	name = "Трость";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_VLKMACE;
	damagetotal = DAMAGE_VLKMACE;
	damagetype = DAM_BLUNT;
	range = RANGE_VLKMACE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_VLKMACE;
	visual = "Itmw_008_1h_pole_01.3ds";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_MACE_L_03(C_ITEM)
{
	name = "Дубина";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_BELEGNAGEL;
	damagetotal = DAMAGE_BELEGNAGEL;
	damagetype = DAM_BLUNT;
	range = RANGE_BELEGNAGEL;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_BELEGNAGEL;
	visual = "ItMw_008_1h_mace_light_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_BAU_MACE(C_ITEM)
{
	name = "Тяжелый сук";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_BAUMACE;
	damagetotal = DAMAGE_BAUMACE;
	damagetype = DAM_BLUNT;
	range = RANGE_BAUMACE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_BAUMACE;
	visual = "ItMw_010_1h_Club_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_VLK_AXE(C_ITEM)
{
	name = "Легкий топор";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_VLKAXE;
	damagetotal = DAMAGE_VLKAXE;
	damagetype = DAM_EDGE;
	range = RANGE_VLKAXE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_VLKAXE;
	visual = "Itmw_010_1h_vlk_hatchet_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_MACE_L_04(C_ITEM)
{
	name = "Молот кузнеца";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_SCHMIEDEHAMMER;
	damagetotal = DAMAGE_SCHMIEDEHAMMER;
	damagetype = DAM_BLUNT;
	range = RANGE_SCHMIEDEHAMMER;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SCHMIEDEHAMMER;
	visual = "ItMw_010_1h_sledgehammer_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SHORTSWORD1(C_ITEM)
{
	name = "Короткий меч ополчения";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SHORTSWORD1;
	damagetotal = DAMAGE_SHORTSWORD1;
	damagetype = DAM_EDGE;
	range = RANGE_SHORTSWORD1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SHORTSWORD1;
	visual = "ItMw_012_1h_Sword_short_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_NAGELKNUEPPEL(C_ITEM)
{
	name = "Палка с гвоздями";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_NAGELKNUEPPEL;
	damagetotal = DAMAGE_NAGELKNUEPPEL;
	damagetype = DAM_BLUNT;
	range = RANGE_NAGELKNUEPPEL;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_NAGELKNUEPPEL;
	visual = "ItMw_012_1h_Nailmace_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SWORD_L_03(C_ITEM)
{
	name = "Волчий нож";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_WOLFSMESSER;
	damagetotal = DAMAGE_WOLFSMESSER;
	damagetype = DAM_EDGE;
	range = RANGE_WOLFSMESSER;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_WOLFSMESSER;
	visual = "ItMw_012_1h_Knife_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SHORTSWORD2(C_ITEM)
{
	name = "Грубый короткий меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SHORTSWORD2;
	damagetotal = DAMAGE_SHORTSWORD2;
	damagetype = DAM_EDGE;
	range = RANGE_SHORTSWORD2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SHORTSWORD2;
	visual = "ItMw_010_1h_Sword_short_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SENSE(C_ITEM)
{
	name = "Малая коса";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SENSE;
	damagetotal = DAMAGE_SENSE;
	damagetype = DAM_EDGE;
	range = RANGE_SENSE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SENSE;
	visual = "ItMw_012_1h_Scythe_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_VLK_SWORD(C_ITEM)
{
	name = "Шпага";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_VLKSCHWERT;
	damagetotal = DAMAGE_VLKSCHWERT;
	damagetype = DAM_EDGE;
	range = RANGE_VLKSCHWERT;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_VLKSCHWERT;
	visual = "ItMw_018_1h_SwordCane_01.3ds";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_NOV_MACE(C_ITEM)
{
	name = "Боевой посох";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = VALUE_NOVMACE;
	damagetotal = DAMAGE_NOVMACE;
	damagetype = DAM_BLUNT;
	range = RANGE_NOVMACE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_NOVMACE;
	visual = "ItMw_020_2h_Nov_Staff_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_BAU_AXE(C_ITEM)
{
	name = "Топор дровосека";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = VALUE_BAU2HAXT;
	damagetotal = DAMAGE_BAU2HAXT;
	damagetype = DAM_EDGE;
	range = RANGE_BAU2HAXT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_BAU2HAXT;
	visual = "ItMw_020_2h_Axe_Lumberjack_01.3ds";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_AXE_L_01(C_ITEM)
{
	name = "Кирка";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_NSPLIT;
	material = MAT_METAL;
	value = VALUE_SPITZHACKE;
	damagetotal = DAMAGE_SPITZHACKE;
	damagetype = DAM_EDGE;
	range = RANGE_SPITZHACKE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPITZHACKE;
	visual = "ItMw_020_2h_Pickaxe_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_MISC_SWORD(C_ITEM)
{
	name = "Ржавый меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_MISCSWORD;
	damagetotal = DAMAGE_MISCSWORD;
	damagetype = DAM_EDGE;
	range = RANGE_MISCSWORD;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_MISCSWORD;
	visual = "ItMw_020_1h_sword_old_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_MISC_AXE(C_ITEM)
{
	name = "Ржавый топор";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_MISCAXE;
	damagetotal = DAMAGE_MISCAXE;
	damagetype = DAM_EDGE;
	range = RANGE_MISCAXE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_MISCAXE;
	visual = "ItMw_025_2h_Misc_Axe_old_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_SWORD_M_01(C_ITEM)
{
	name = "Ржавый двуручный меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_MISC2HSWORD;
	damagetotal = DAMAGE_MISC2HSWORD;
	damagetype = DAM_EDGE;
	range = RANGE_MISC2HSWORD;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_MISC2HSWORD;
	visual = "ItMw_025_2h_Sword_old_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_MIL_SWORD(C_ITEM)
{
	name = "Широкий меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_MILSCHWERT;
	damagetotal = DAMAGE_MILSCHWERT;
	damagetype = DAM_EDGE;
	range = RANGE_MILSCHWERT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_MILSCHWERT;
	visual = "Itmw_025_1h_Mil_Sword_broad_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SLD_AXE(C_ITEM)
{
	name = "Грубый тесак";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_SLD1HAXT;
	damagetotal = DAMAGE_SLD1HAXT;
	damagetype = DAM_EDGE;
	range = RANGE_SLD1HAXT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SLD1HAXT;
	visual = "ItMw_025_1h_sld_axe_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SLD_SWORD(C_ITEM)
{
	name = "Грубый меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SLD1HSCHWERT;
	damagetotal = DAMAGE_SLD1HSCHWERT;
	damagetype = DAM_EDGE;
	range = RANGE_SLD1HSCHWERT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SLD1HSCHWERT;
	visual = "ItMw_025_1h_sld_sword_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_SLD_AXE(C_ITEM)
{
	name = "Грубый боевой топор";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_SLD2HAXE;
	damagetotal = DAMAGE_SLD2HAXE;
	damagetype = DAM_EDGE;
	range = RANGE_SLD2HAXE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SLD2HAXE;
	visual = "ItMw_035_2h_sld_axe_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_SLD_SWORD(C_ITEM)
{
	name = "Грубый двуручный меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_SLD2HSCHWERT;
	damagetotal = DAMAGE_SLD2HSCHWERT;
	damagetype = DAM_EDGE;
	range = RANGE_SLD2HSCHWERT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SLD2HSCHWERT;
	visual = "ItMw_035_2h_sld_sword_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_PAL_SWORD(C_ITEM)
{
	name = "Меч паладина";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_PALSCHWERT;
	damagetotal = DAMAGE_PALSCHWERT;
	damagetype = DAM_EDGE;
	range = RANGE_PALSCHWERT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_PALSCHWERT;
	visual = "ItMw_030_1h_PAL_Sword_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_PAL_SWORD(C_ITEM)
{
	name = "Двуручный меч паладина";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_PALZWEIHAENDER;
	damagetotal = DAMAGE_PALZWEIHAENDER;
	damagetype = DAM_EDGE;
	range = RANGE_PALZWEIHAENDER;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_PALZWEIHAENDER;
	visual = "ItMw_040_2h_PAL_Sword_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_ORCAXE_01(C_ITEM)
{
	name = "Легкий топор орков";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_ORKAXT_01;
	damagetotal = DAMAGE_ORKAXT_01;
	damagetype = DAM_EDGE;
	range = RANGE_ORKAXT_01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ORKAXT_01;
	visual = "ItMw_2H_OrcAxe_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_ORCAXE_02(C_ITEM)
{
	name = "Средний топор орков";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_ORKAXT_02;
	damagetotal = DAMAGE_ORKAXT_02;
	damagetype = DAM_EDGE;
	range = RANGE_ORKAXT_02;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ORKAXT_02;
	visual = "ItMw_2H_OrcAxe_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_ORCAXE_03(C_ITEM)
{
	name = "Тяжелый топор орков";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_ORKAXT_03;
	damagetotal = DAMAGE_ORKAXT_03;
	damagetype = DAM_EDGE;
	range = RANGE_ORKAXT_03;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ORKAXT_03;
	visual = "ItMw_2H_OrcAxe_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_ORCAXE_04(C_ITEM)
{
	name = "Брутальный топор орков";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_ORKAXT_04;
	damagetotal = DAMAGE_ORKAXT_04;
	damagetype = DAM_EDGE;
	range = RANGE_ORKAXT_04;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ORKAXT_04;
	visual = "ItMw_2H_OrcAxe_04.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_ORCMACE_01(C_Item)
{
	name = "Молот орков";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 40;
	damageTotal = 60;
	damagetype = DAM_BLUNT;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	visual = "ItMw_2H_OrcMace_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_2H_ORCSWORD_01(C_ITEM)
{
	name = "Меч ящера";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_ORKSCHWERT;
	damagetotal = DAMAGE_ORKSCHWERT;
	damagetype = DAM_EDGE;
	range = RANGE_ORKSCHWERT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ORKSCHWERT;
	visual = "ItMw_2H_OrcSword_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_ORCSWORD_02(C_ITEM)
{
	name = "Военный меч орков";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_ORKSCHWERT_01;
	damagetotal = DAMAGE_ORKSCHWERT_01;
	damagetype = DAM_EDGE;
	range = RANGE_ORKSCHWERT_01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ORKSCHWERT_01;
	visual = "ItMw_2H_OrcSword_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SHORTSWORD3(C_ITEM)
{
	name = "Короткий меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SHORTSWORD3;
	damagetotal = DAMAGE_SHORTSWORD3;
	damagetype = DAM_EDGE;
	range = RANGE_SHORTSWORD3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SHORTSWORD3;
	visual = "ItMw_016_1h_Sword_short_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_NAGELKEULE(C_ITEM)
{
	name = "Дубина с шипами";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_NAGELKEULE;
	damagetotal = DAMAGE_NAGELKEULE;
	damagetype = DAM_BLUNT;
	range = RANGE_NAGELKEULE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_NAGELKEULE;
	visual = "ItMw_018_1h_Mace_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SHORTSWORD4(C_ITEM)
{
	name = "Волчий зуб";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SHORTSWORD4;
	damagetotal = DAMAGE_SHORTSWORD4;
	damagetype = DAM_EDGE;
	range = RANGE_SHORTSWORD4;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SHORTSWORD4;
	visual = "ItMw_020_1h_Sword_short_04.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_KRIEGSKEULE(C_ITEM)
{
	name = "Военная дубина";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_KRIEGSKEULE;
	damagetotal = DAMAGE_KRIEGSKEULE;
	damagetype = DAM_BLUNT;
	range = RANGE_KRIEGSKEULE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_KRIEGSKEULE;
	visual = "ItMw_022_1h_mace_war_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_RICHTSTAB(C_ITEM)
{
	name = "Посох судьи";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_RICHTSTAB;
	damagetotal = DAMAGE_RICHTSTAB;
	damagetype = DAM_EDGE;
	range = RANGE_RICHTSTAB;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_RICHTSTAB;
	visual = "ItMw_025_2h_Staff_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SHORTSWORD5(C_ITEM)
{
	name = "Изысканный короткий меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SHORTSWORD5;
	damagetotal = DAMAGE_SHORTSWORD5;
	damagetype = DAM_EDGE;
	range = RANGE_SHORTSWORD5;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SHORTSWORD5;
	visual = "ItMw_025_1h_Sword_short_05.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_KRIEGSHAMMER1(C_ITEM)
{
	name = "Военный молот";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_KRIEGSHAMMER1;
	damagetotal = DAMAGE_KRIEGSHAMMER1;
	damagetype = DAM_BLUNT;
	range = RANGE_KRIEGSHAMMER1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_KRIEGSHAMMER1;
	visual = "ItMw_028_1h_warhammer_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_HELLEBARDE(C_ITEM)
{
	name = "Алебарда";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_HELLEBARDE;
	damagetotal = DAMAGE_HELLEBARDE;
	damagetype = DAM_EDGE;
	range = RANGE_HELLEBARDE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_HELLEBARDE;
	visual = "itmw_028_2h_halberd_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_NAGELKEULE2(C_ITEM)
{
	name = "Тяжелая дубина с шипами";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_NAGELKEULE2;
	damagetotal = DAMAGE_NAGELKEULE2;
	damagetype = DAM_BLUNT;
	range = RANGE_NAGELKEULE2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_NAGELKEULE2;
	visual = "ItMw_028_1h_Mace_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SCHIFFSAXT(C_ITEM)
{
	name = "Корабельный топор";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_SCHIFFSAXT;
	damagetotal = DAMAGE_SCHIFFSAXT;
	damagetype = DAM_EDGE;
	range = RANGE_SCHIFFSAXT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SCHIFFSAXT;
	visual = "ItMw_030_1h_axe_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_PIRATENSAEBEL(C_ITEM)
{
	name = "Пиратская сабля";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_PIRATENSAEBEL;
	damagetotal = DAMAGE_PIRATENSAEBEL;
	damagetype = DAM_EDGE;
	range = RANGE_PIRATENSAEBEL;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_PIRATENSAEBEL;
	visual = "ItMw_030_1h_sword_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SCHWERT(C_ITEM)
{
	name = "Грубый длинный меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SCHWERT;
	damagetotal = DAMAGE_SCHWERT;
	damagetype = DAM_EDGE;
	range = RANGE_SCHWERT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SCHWERT;
	visual = "ItMw_030_1h_sword_long_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_COMMON_01(C_ITEM)
{
	name = name_itmw_1h_common_01;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_COMMON1;
	damagetotal = DAMAGE_COMMON1;
	damagetype = DAM_EDGE;
	range = RANGE_COMMON1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_COMMON1;
	visual = "ItMw_030_1h_Common_Sword_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_STABKEULE(C_ITEM)
{
	name = "Палица";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = VALUE_STABKEULE;
	damagetotal = DAMAGE_STABKEULE;
	damagetype = DAM_BLUNT;
	range = RANGE_STABKEULE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_STABKEULE;
	visual = "ItMw_032_2h_staff_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_ZWEIHAENDER1(C_ITEM)
{
	name = "Легкий двуручный меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_ZWEIHAENDER1;
	damagetotal = DAMAGE_ZWEIHAENDER1;
	damagetype = DAM_EDGE;
	range = RANGE_ZWEIHAENDER1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ZWEIHAENDER1;
	visual = "ItMw_032_2h_sword_light_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_STEINBRECHER(C_ITEM)
{
	name = "Дробитель камней";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_STEINBRECHER;
	damagetotal = DAMAGE_STEINBRECHER;
	damagetype = DAM_BLUNT;
	range = RANGE_STEINBRECHER;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_STEINBRECHER;
	visual = "ItMw_035_1h_mace_war_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SPICKER(C_ITEM)
{
	name = "Раскалыватель черепов";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_SPICKER;
	damagetotal = DAMAGE_SPICKER;
	damagetype = DAM_BLUNT;
	range = RANGE_SPICKER;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPICKER;
	visual = "ItMw_035_1h_mace_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_STREITAXT1(C_ITEM)
{
	name = "Легкий боевой топор";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_STREITAXT1;
	damagetotal = DAMAGE_STREITAXT1;
	damagetype = DAM_EDGE;
	range = RANGE_STREITAXT1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_STREITAXT1;
	visual = "ItMw_035_2h_Axe_light_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SCHWERT1(C_ITEM)
{
	name = "Изысканный меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SCHWERT1;
	damagetotal = DAMAGE_SCHWERT1;
	damagetype = DAM_EDGE;
	range = RANGE_SCHWERT1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SCHWERT1;
	visual = "ItMw_035_1h_Sword_04.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SCHWERT2(C_ITEM)
{
	name = "Длинный меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SCHWERT2;
	damagetotal = DAMAGE_SCHWERT2;
	damagetype = DAM_EDGE;
	range = RANGE_SCHWERT2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SCHWERT2;
	visual = "ItMw_037_1h_sword_long_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_DOPPELAXT(C_ITEM)
{
	name = "Двойной топор";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_DOPPELAXT;
	damagetotal = DAMAGE_DOPPELAXT;
	damagetype = DAM_EDGE;
	range = RANGE_DOPPELAXT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_DOPPELAXT;
	visual = "ItMw_040_1h_Axe_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_BARTAXT(C_ITEM)
{
	name = "Бердыш";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_BARTAXT;
	damagetotal = DAMAGE_BARTAXT;
	damagetype = DAM_EDGE;
	range = RANGE_BARTAXT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_BARTAXT;
	visual = "ItMw_040_1h_axe_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_MORGENSTERN(C_ITEM)
{
	name = "Булава с шипами";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_MORGENSTERN;
	damagetotal = DAMAGE_MORGENSTERN;
	damagetype = DAM_BLUNT;
	range = RANGE_MORGENSTERN;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_MORGENSTERN;
	visual = "ItMW_045_1h_mace_04.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SCHWERT3(C_ITEM)
{
	name = "Грубый полуторный меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SCHWERT3;
	damagetotal = DAMAGE_SCHWERT3;
	damagetype = DAM_EDGE;
	range = RANGE_SCHWERT3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SCHWERT3;
	visual = "ItMw_045_1h_Sword_Bastard_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SCHWERT4(C_ITEM)
{
	name = "Изысканный длинный меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SCHWERT4;
	damagetotal = DAMAGE_SCHWERT4;
	damagetype = DAM_EDGE;
	range = RANGE_SCHWERT4;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SCHWERT4;
	visual = "ItMw_045_1h_Sword_long_04.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SPECIAL_01(C_ITEM)
{
	name = name_itmw_1h_special_01;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SPECIAL_1H_1;
	damagetotal = DAMAGE_SPECIAL_1H_1;
	damagetype = DAM_EDGE;
	range = RANGE_SPECIAL_1H_1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPECIAL_1H_1;
	visual = "ItMw_045_1h_Sword_smith_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_SPECIAL_01(C_ITEM)
{
	name = name_itmw_2h_special_01;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_SPECIAL_2H_1;
	damagetotal = DAMAGE_SPECIAL_2H_1;
	damagetype = DAM_EDGE;
	range = RANGE_SPECIAL_2H_1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPECIAL_2H_1;
	visual = "ItMw_050_2h_Sword_smith_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_RAPIER(C_ITEM)
{
	name = "Рапира";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_RAPIER;
	damagetotal = DAMAGE_RAPIER;
	damagetype = DAM_EDGE;
	range = RANGE_RAPIER;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_RAPIER;
	visual = "ItMw_050_1h_Sword_Rapier_01.3ds";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_RUBINKLINGE(C_ITEM)
{
	name = "Рубиновый клинок";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_RUBINKLINGE;
	damagetotal = DAMAGE_RUBINKLINGE;
	damagetype = DAM_EDGE;
	range = RANGE_RUBINKLINGE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_RUBINKLINGE;
	visual = "ItMw_050_1h_sword_05.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_STREITKOLBEN(C_ITEM)
{
	name = "Булава";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_STREITKOLBEN;
	damagetotal = DAMAGE_STREITKOLBEN;
	damagetype = DAM_BLUNT;
	range = RANGE_STREITKOLBEN;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_STREITKOLBEN;
	visual = "ItMw_050_1h_mace_war_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_ZWEIHAENDER2(C_ITEM)
{
	name = "Усиленный двуручный меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_ZWEIHAENDER2;
	damagetotal = DAMAGE_ZWEIHAENDER2;
	damagetype = DAM_EDGE;
	range = RANGE_ZWEIHAENDER2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ZWEIHAENDER2;
	visual = "ItMw_055_2h_sword_light_05.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_RUNENSCHWERT(C_ITEM)
{
	name = "Рунный меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_RUNENSCHWERT;
	damagetotal = DAMAGE_RUNENSCHWERT;
	damagetype = DAM_EDGE;
	range = RANGE_RUNENSCHWERT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_RUNENSCHWERT;
	visual = "ItMw_055_1h_sword_long_05.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_RABENSCHNABEL(C_ITEM)
{
	name = "Клюв ворона";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_RABENSCHNABEL;
	damagetotal = DAMAGE_RABENSCHNABEL;
	damagetype = DAM_BLUNT;
	range = RANGE_RABENSCHNABEL;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_RABENSCHNABEL;
	visual = "ItMw_058_1h_warhammer_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SCHWERT5(C_ITEM)
{
	name = "Изысканный полуторный меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SCHWERT5;
	damagetotal = DAMAGE_SCHWERT5;
	damagetype = DAM_EDGE;
	range = RANGE_SCHWERT5;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SCHWERT5;
	visual = "ItMw_058_1h_Sword_Bastard_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_INQUISITOR(C_ITEM)
{
	name = "Инквизитор";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_INQUISITOR;
	damagetotal = DAMAGE_INQUISITOR;
	damagetype = DAM_BLUNT;
	range = RANGE_INQUISITOR;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_INQUISITOR;
	visual = "ItMw_060_1h_mace_war_04.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_STREITAXT2(C_ITEM)
{
	name = "Боевой топор";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_STREITAXT2;
	damagetotal = DAMAGE_STREITAXT2;
	damagetype = DAM_EDGE;
	range = RANGE_STREITAXT2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_STREITAXT2;
	visual = "ItMw_060_2h_axe_heavy_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_ZWEIHAENDER3(C_ITEM)
{
	name = "Сила Рун";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_ZWEIHAENDER3;
	damagetotal = DAMAGE_ZWEIHAENDER3;
	damagetype = DAM_EDGE;
	range = RANGE_ZWEIHAENDER3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ZWEIHAENDER3;
	visual = "ItMw_060_2h_sword_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SPECIAL_02(C_ITEM)
{
	name = name_itmw_1h_special_02;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SPECIAL_1H_2;
	damagetotal = DAMAGE_SPECIAL_1H_2;
	damagetype = DAM_EDGE;
	range = RANGE_SPECIAL_1H_2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPECIAL_1H_2;
	visual = "ItMw_060_1h_Sword_smith_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_SPECIAL_02(C_ITEM)
{
	name = name_itmw_2h_special_02;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_SPECIAL_2H_2;
	damagetotal = DAMAGE_SPECIAL_2H_2;
	damagetype = DAM_EDGE;
	range = RANGE_SPECIAL_2H_2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPECIAL_2H_2;
	visual = "ItMw_070_2h_Sword_smith_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_ELBASTARDO(C_ITEM)
{
	name = "Эль-бастардо";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_ELBASTARDO;
	damagetotal = DAMAGE_ELBASTARDO;
	damagetype = DAM_EDGE;
	range = RANGE_ELBASTARDO;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ELBASTARDO;
	visual = "ItMw_065_1h_sword_bastard_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_KRIEGSHAMMER2(C_ITEM)
{
	name = "Тяжелый военный молот";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_KRIEGSHAMMER2;
	damagetotal = DAMAGE_KRIEGSHAMMER2;
	damagetype = DAM_BLUNT;
	range = RANGE_KRIEGSHAMMER2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_KRIEGSHAMMER2;
	visual = "ItMw_065_1h_warhammer_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_MEISTERDEGEN(C_ITEM)
{
	name = "Шпага мастера";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_MEISTERDEGEN;
	damagetotal = DAMAGE_MEISTERDEGEN;
	damagetype = DAM_EDGE;
	range = RANGE_MEISTERDEGEN;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_MEISTERDEGEN;
	visual = "ItMw_065_1h_SwordCane_02.3ds";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_FOLTERAXT(C_ITEM)
{
	name = "Топор палача";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_FOLTERAXT;
	damagetotal = DAMAGE_FOLTERAXT;
	damagetype = DAM_EDGE;
	range = RANGE_FOLTERAXT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_FOLTERAXT;
	visual = "ItMw_065_2h_greataxe_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_ORKSCHLAECHTER(C_ITEM)
{
	name = "Убийца орков";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_ORKSCHLAECHTER;
	damagetotal = DAMAGE_ORKSCHLAECHTER;
	damagetype = DAM_EDGE;
	range = RANGE_ORKSCHLAECHTER;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ORKSCHLAECHTER;
	visual = "ItMw_065_1h_sword_bastard_04.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_ZWEIHAENDER4(C_ITEM)
{
	name = "Тяжелый двуручный меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_ZWEIHAENDER4;
	damagetotal = DAMAGE_ZWEIHAENDER4;
	damagetype = DAM_EDGE;
	range = RANGE_ZWEIHAENDER4;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ZWEIHAENDER4;
	visual = "ItMw_068_2h_sword_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SCHLACHTAXT(C_ITEM)
{
	name = "Военный топор";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_SCHLACHTAXT;
	damagetotal = DAMAGE_SCHLACHTAXT;
	damagetype = DAM_EDGE;
	range = RANGE_SCHLACHTAXT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SCHLACHTAXT;
	visual = "ItMw_070_2h_axe_heavy_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_KRUMMSCHWERT(C_ITEM)
{
	name = "Тяжелый ятаган";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_SCIMITAR;
	damagetotal = DAMAGE_SCIMITAR;
	damagetype = DAM_EDGE;
	range = RANGE_SCIMITAR;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SCIMITAR;
	visual = "ItMw_070_2h_sword_09.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_BARBARENSTREITAXT(C_ITEM)
{
	name = "Боевой топор варваров";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_BARBARENSTREITAXT;
	damagetotal = DAMAGE_BARBARENSTREITAXT;
	damagetype = DAM_EDGE;
	range = RANGE_BARBARENSTREITAXT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_BARBARENSTREITAXT;
	visual = "ItMw_075_2h_axe_heavy_04.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_STURMBRINGER(C_ITEM)
{
	name = "Несущий бурю";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_STURMBRINGER;
	damagetotal = DAMAGE_STURMBRINGER;
	damagetype = DAM_EDGE;
	range = RANGE_STURMBRINGER;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_STURMBRINGER;
	visual = "ItMw_075_2h_sword_heavy_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SPECIAL_03(C_ITEM)
{
	name = name_itmw_1h_special_03;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SPECIAL_1H_3;
	damagetotal = DAMAGE_SPECIAL_1H_3;
	damagetype = DAM_EDGE;
	range = RANGE_SPECIAL_1H_3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPECIAL_1H_3;
	visual = "ItMw_075_1h_sword_smith_04.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_SPECIAL_03(C_ITEM)
{
	name = name_itmw_2h_special_03;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_SPECIAL_2H_3;
	damagetotal = DAMAGE_SPECIAL_2H_3;
	damagetype = DAM_EDGE;
	range = RANGE_SPECIAL_2H_3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPECIAL_2H_3;
	visual = "ItMw_090_2h_sword_smith_04.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_BERSERKERAXT(C_ITEM)
{
	name = "Топор берсеркера";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_BERSERKERAXT;
	damagetotal = DAMAGE_BERSERKERAXT;
	damagetype = DAM_EDGE;
	range = RANGE_BERSERKERAXT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_BERSERKERAXT;
	visual = "ItMw_080_2h_axe_heavy_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_DRACHENSCHNEIDE(C_ITEM)
{
	name = "Гроза драконов";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_DRACHENSCHNEIDE;
	damagetotal = DAMAGE_DRACHENSCHNEIDE;
	damagetype = DAM_EDGE;
	range = RANGE_DRACHENSCHNEIDE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_DRACHENSCHNEIDE;
	visual = "itMw_080_2h_sword_heavy_04.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SPECIAL_04(C_ITEM)
{
	name = name_itmw_1h_special_04;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SPECIAL_1H_4;
	damagetotal = DAMAGE_SPECIAL_1H_4;
	damagetype = DAM_EDGE;
	range = RANGE_SPECIAL_1H_4;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPECIAL_1H_4;
	visual = "ItMw_090_1h_sword_smith_05.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_SPECIAL_04(C_ITEM)
{
	name = name_itmw_2h_special_04;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_SPECIAL_2H_4;
	damagetotal = DAMAGE_SPECIAL_2H_4;
	damagetype = DAM_EDGE;
	range = RANGE_SPECIAL_2H_4;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPECIAL_2H_4;
	visual = "ItMw_110_2h_sword_smith_05.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_BLESSED_01(C_ITEM)
{
	name = "Грубый рудный клинок";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = VALUE_BLESSED_1H_1;
	damagetotal = DAMAGE_BLESSED_1H_1;
	damagetype = DAM_EDGE;
	range = RANGE_BLESSED_1H_1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_BLESSED_1H_1;
	visual = "itmw_030_1h_PAL_sword_bastard_RAW_01.3ds";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_BLESSED_02(C_ITEM)
{
	name = "Освященный рудный клинок";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = VALUE_BLESSED_1H_2;
	damagetotal = DAMAGE_BLESSED_1H_2;
	damagetype = DAM_EDGE;
	range = RANGE_BLESSED_1H_2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_BLESSED_1H_2;
	visual = "ItMw_030_1h_PAL_sword_bastard_RAW_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_BLESSED_03(C_ITEM)
{
	name = "Гнев Инноса";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = VALUE_BLESSED_1H_3;
	damagetotal = DAMAGE_BLESSED_1H_3;
	damagetype = DAM_EDGE;
	range = RANGE_BLESSED_1H_3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_BLESSED_1H_3;
	visual = "ItMw_030_1h_PAL_sword_bastard_RAW_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_BLESSED_01(C_ITEM)
{
	name = "Грубый рудный клинок";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_BLESSED_2H_1;
	damagetotal = DAMAGE_BLESSED_2H_1;
	damagetype = DAM_EDGE;
	range = RANGE_BLESSED_2H_1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_BLESSED_2H_1;
	visual = "ItMw_040_2h_PAL_sword_heavy_RAW_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_BLESSED_02(C_ITEM)
{
	name = "Меч ордена";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_BLESSED_2H_2;
	damagetotal = DAMAGE_BLESSED_2H_2;
	damagetype = DAM_EDGE;
	range = RANGE_BLESSED_2H_2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_BLESSED_2H_2;
	visual = "ItMw_040_2h_PAL_sword_heavy_RAW_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_BLESSED_03(C_ITEM)
{
	name = "Святой палач";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_BLESSED_2H_3;
	damagetotal = DAMAGE_BLESSED_2H_3;
	damagetype = DAM_EDGE;
	range = RANGE_BLESSED_2H_3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_BLESSED_2H_3;
	visual = "ItMw_040_2h_PAL_sword_heavy_RAW_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

