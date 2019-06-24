
var int lutero_itemsgiven_chapter_1;
var int lutero_itemsgiven_chapter_2;
var int lutero_itemsgiven_chapter_3;
var int lutero_itemsgiven_chapter_4;
var int lutero_itemsgiven_chapter_5;
var int lutero_itemsgiven_chapter_6;

func void b_givetradeinv_lutero(var C_NPC slf)
{
	if((KAPITEL >= 1) && (LUTERO_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itmi_quartz,1);
		CreateInvItems(slf,itpl_temp_herb,1);
		CreateInvItems(slf,itlstorch,10);
		CreateInvItems(slf,itsc_charm,1);
		CreateInvItems(slf,itmi_holywater,1);
		CreateInvItems(slf,itmi_sulfur,1);
		CreateInvItems(slf,itpo_speed,1);
		CreateInvItems(slf,itmi_pitch,1);
		CreateInvItems(slf,itmi_coal,1);
		CreateInvItems(slf,itmi_apfeltabak,1);
		CreateInvItems(slf,itat_crawlermandibles,1);
		LUTERO_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (LUTERO_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itmi_holywater,1);
		CreateInvItems(slf,itsc_sleep,1);
		CreateInvItems(slf,itmi_aquamarine,1);
		CreateInvItems(slf,itmi_quartz,1);
		CreateInvItems(slf,itpl_temp_herb,1);
		CreateInvItems(slf,itlstorch,10);
		CreateInvItems(slf,itsc_charm,2);
		CreateInvItems(slf,itat_sting,1);
		CreateInvItems(slf,itpo_speed,2);
		CreateInvItems(slf,itwr_zweihandbuch,1);
		CreateInvItems(slf,itwr_einhandbuch,1);
		LUTERO_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (LUTERO_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itpo_speed,1);
		CreateInvItems(slf,itmi_darkpearl,1);
		CreateInvItems(slf,itpl_temp_herb,1);
		CreateInvItems(slf,itlstorch,10);
		CreateInvItems(slf,itpo_speed,3);
		CreateInvItems(slf,itsc_charm,3);
		CreateInvItems(slf,itat_crawlermandibles,1);
		LUTERO_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (LUTERO_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,150);
		CreateInvItems(slf,itmi_rockcrystal,1);
		CreateInvItems(slf,itat_stonegolemheart,1);
		CreateInvItems(slf,itpo_speed,1);
		CreateInvItems(slf,itpl_temp_herb,1);
		CreateInvItems(slf,itpo_speed,4);
		CreateInvItems(slf,itlstorch,10);
		CreateInvItems(slf,itsc_charm,3);
		LUTERO_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (LUTERO_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		CreateInvItems(slf,itsc_armyofdarkness,1);
		CreateInvItems(slf,itat_demonheart,1);
		CreateInvItems(slf,itpl_perm_herb,1);
		CreateInvItems(slf,itmi_runeblank,1);
		CreateInvItems(slf,itpo_speed,1);
		LUTERO_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
	if((KAPITEL >= 6) && (LUTERO_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,300);
		CreateInvItems(slf,itmi_darkpearl,1);
		LUTERO_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};
};

