
instance ITRW_ARROW(C_ITEM)
{
	name = "Стрела";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI;
	value = VALUE_PFEIL;
	visual = "ItRw_Arrow.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOLT(C_ITEM)
{
	name = "Болт";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	value = VALUE_BOLZEN;
	visual = "ItRw_Bolt.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_MIL_CROSSBOW(C_ITEM)
{
	name = "Арбалет ополчения";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = VALUE_MILARMBRUST;
	damagetotal = DAMAGE_MILARMBRUST;
	damagetype = DAM_POINT;
	munition = itrw_bolt;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_MILARMBRUST;
	visual = "ItRw_Mil_Crossbow.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_SLD_BOW(C_ITEM)
{
	name = "Лук наемника";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_SLDBOGEN;
	damagetotal = DAMAGE_SLDBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_SLDBOGEN;
	visual = "ItRw_Sld_Bow.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOW_L_01(C_ITEM)
{
	name = "Короткий лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_KURZBOGEN;
	damagetotal = DAMAGE_KURZBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_KURZBOGEN;
	visual = "ItRw_Bow_L_01.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOW_L_02(C_ITEM)
{
	name = "Ивовый лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_WEIDENBOGEN;
	damagetotal = DAMAGE_WEIDENBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_WEIDENBOGEN;
	visual = "ItRw_Bow_L_02.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOW_L_03(C_ITEM)
{
	name = "Охотничий лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_JAGDBOGEN;
	damagetotal = DAMAGE_JAGDBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_JAGDBOGEN;
	visual = "ItRw_Bow_L_03.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOW_L_04(C_ITEM)
{
	name = "Вязовый лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_ULMENBOGEN;
	damagetotal = DAMAGE_ULMENBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_ULMENBOGEN;
	visual = "ItRw_Bow_L_04.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOW_M_01(C_ITEM)
{
	name = "Композитный лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_KOMPOSITBOGEN;
	damagetotal = DAMAGE_KOMPOSITBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_KOMPOSITBOGEN;
	visual = "ItRw_Bow_M_01.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOW_M_02(C_ITEM)
{
	name = "Ясеневый лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_ESCHENBOGEN;
	damagetotal = DAMAGE_ESCHENBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_ESCHENBOGEN;
	visual = "ItRw_Bow_M_02.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOW_M_03(C_ITEM)
{
	name = "Длинный лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_LANGBOGEN;
	damagetotal = DAMAGE_LANGBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_LANGBOGEN;
	visual = "ItRw_Bow_M_03.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOW_M_04(C_ITEM)
{
	name = "Буковый лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_BUCHENBOGEN;
	damagetotal = DAMAGE_BUCHENBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_BUCHENBOGEN;
	visual = "ItRw_Bow_M_04.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOW_H_01(C_ITEM)
{
	name = "Костяной лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_KNOCHENBOGEN;
	damagetotal = DAMAGE_KNOCHENBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_KNOCHENBOGEN;
	visual = "ItRw_Bow_H_01.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOW_H_02(C_ITEM)
{
	name = "Дубовый лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_EICHENBOGEN;
	damagetotal = DAMAGE_EICHENBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_EICHENBOGEN;
	visual = "ItRw_Bow_H_02.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOW_H_03(C_ITEM)
{
	name = "Военный лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_KRIEGSBOGEN;
	damagetotal = DAMAGE_KRIEGSBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_KRIEGSBOGEN;
	visual = "ItRw_Bow_H_03.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOW_H_04(C_ITEM)
{
	name = "Драконий лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_DRACHENBOGEN;
	damagetotal = DAMAGE_DRACHENBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_DRACHENBOGEN;
	visual = "ItRw_Bow_H_04.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_CROSSBOW_L_01(C_ITEM)
{
	name = "Охотничий арбалет";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = VALUE_JAGDARMBRUST;
	damagetotal = DAMAGE_JAGDARMBRUST;
	damagetype = DAM_POINT;
	munition = itrw_bolt;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_JAGDARMBRUST;
	visual = "ItRw_Crossbow_L_01.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_CROSSBOW_L_02(C_ITEM)
{
	name = "Легкий арбалет";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = VALUE_LEICHTEARMBRUST;
	damagetotal = DAMAGE_LEICHTEARMBRUST;
	damagetype = DAM_POINT;
	munition = itrw_bolt;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_LEICHTEARMBRUST;
	visual = "ItRw_Crossbow_L_02.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_CROSSBOW_M_01(C_ITEM)
{
	name = "Штурмовой арбалет";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = VALUE_ARMBRUST;
	damagetotal = DAMAGE_ARMBRUST;
	damagetype = DAM_POINT;
	munition = itrw_bolt;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_ARMBRUST;
	visual = "ItRw_Crossbow_M_01.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_CROSSBOW_M_02(C_ITEM)
{
	name = "Военный арбалет";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = VALUE_KRIEGSARMBRUST;
	damagetotal = DAMAGE_KRIEGSARMBRUST;
	damagetype = DAM_POINT;
	munition = itrw_bolt;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_KRIEGSARMBRUST;
	visual = "ItRw_Crossbow_M_02.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_CROSSBOW_H_01(C_ITEM)
{
	name = "Тяжелый арбалет";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = VALUE_SCHWEREARMBRUST;
	damagetotal = DAMAGE_SCHWEREARMBRUST;
	damagetype = DAM_POINT;
	munition = itrw_bolt;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_SCHWEREARMBRUST;
	visual = "ItRw_Crossbow_H_01.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_CROSSBOW_H_02(C_ITEM)
{
	name = "Арбалет охотника на драконов";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = VALUE_DRACHENJAEGERARMBRUST;
	damagetotal = DAMAGE_DRACHENJAEGERARMBRUST;
	damagetype = DAM_POINT;
	munition = itrw_bolt;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_DRACHENJAEGERARMBRUST;
	visual = "ItRw_Crossbow_H_02.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

