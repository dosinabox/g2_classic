
var int constantino_itemsgiven_chapter_1;
var int constantino_itemsgiven_chapter_2;
var int constantino_itemsgiven_chapter_3;
var int constantino_itemsgiven_chapter_4;
var int constantino_itemsgiven_chapter_5;
var int constantino_itemsgiven_chapter_6;

func void b_givetradeinv_constantino(var C_NPC slf)
{
	if((KAPITEL >= 1) && (CONSTANTINO_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,31);
		CreateInvItems(slf,itmi_flask,5);
		CreateInvItems(slf,itat_goblinbone,1);
		CreateInvItems(slf,itat_wing,3);
		CreateInvItems(slf,itwr_astronomy_mis,1);
		CONSTANTINO_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (CONSTANTINO_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,60);
		CreateInvItems(slf,itmi_flask,15);
		CreateInvItems(slf,itpl_temp_herb,10);
		CreateInvItems(slf,itpl_swampherb,2);
		CreateInvItems(slf,itpl_health_herb_01,5);
		CreateInvItems(slf,itpl_health_herb_02,2);
		CreateInvItems(slf,itpl_mana_herb_01,5);
		CreateInvItems(slf,itat_wing,2);
		CreateInvItems(slf,itmi_rockcrystal,2);
		CreateInvItems(slf,itat_goblinbone,2);
		CreateInvItems(slf,itpl_mushroom_01,5);
		CONSTANTINO_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (CONSTANTINO_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,120);
		CreateInvItems(slf,itmi_flask,20);
		CreateInvItems(slf,itpl_temp_herb,2);
		CreateInvItems(slf,itpl_perm_herb,1);
		CreateInvItems(slf,itpl_swampherb,1);
		CreateInvItems(slf,itpl_health_herb_01,9);
		CreateInvItems(slf,itpl_mana_herb_01,12);
		CreateInvItems(slf,itpl_mana_herb_02,7);
		CreateInvItems(slf,itpl_speed_herb_01,2);
		CreateInvItems(slf,itpl_dex_herb_01,1);
		CreateInvItems(slf,itpl_blueplant,9);
		CreateInvItems(slf,itpl_mushroom_01,3);
		CreateInvItems(slf,itpl_mushroom_02,2);
		CreateInvItems(slf,itmi_quartz,2);
		CreateInvItems(slf,itat_shadowhorn,1);
		CreateInvItems(slf,itat_skeletonbone,1);
		CONSTANTINO_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (CONSTANTINO_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,220);
		CreateInvItems(slf,itmi_flask,25);
		CreateInvItems(slf,itpl_temp_herb,3);
		CreateInvItems(slf,itpl_perm_herb,1);
		CreateInvItems(slf,itpl_health_herb_01,16);
		CreateInvItems(slf,itpl_health_herb_02,8);
		CreateInvItems(slf,itpl_health_herb_03,3);
		CreateInvItems(slf,itpl_mana_herb_01,7);
		CreateInvItems(slf,itpl_mana_herb_02,4);
		CreateInvItems(slf,itpl_speed_herb_01,2);
		CreateInvItems(slf,itpl_dex_herb_01,2);
		CreateInvItems(slf,itat_goblinbone,2);
		CreateInvItems(slf,itat_skeletonbone,1);
		CreateInvItems(slf,itat_shadowhorn,2);
		CreateInvItems(slf,itat_wing,2);
		CreateInvItems(slf,itat_wolffur,1);
		CreateInvItems(slf,itpo_health_01,6);
		CONSTANTINO_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (CONSTANTINO_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,321);
		CreateInvItems(slf,itmi_flask,25);
		CreateInvItems(slf,itpl_temp_herb,4);
		CreateInvItems(slf,itpl_perm_herb,2);
		CreateInvItems(slf,itpl_swampherb,2);
		CreateInvItems(slf,itpl_strength_herb_01,1);
		CreateInvItems(slf,itpl_health_herb_01,24);
		CreateInvItems(slf,itpl_health_herb_02,9);
		CreateInvItems(slf,itpl_health_herb_03,6);
		CreateInvItems(slf,itpl_mana_herb_01,9);
		CreateInvItems(slf,itpl_mana_herb_02,6);
		CreateInvItems(slf,itpl_mana_herb_03,3);
		CreateInvItems(slf,itpl_speed_herb_01,2);
		CONSTANTINO_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
	if((KAPITEL >= 6) && (CONSTANTINO_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,411);
		CreateInvItems(slf,itmi_flask,30);
		CreateInvItems(slf,itpl_temp_herb,5);
		CreateInvItems(slf,itpl_perm_herb,3);
		CreateInvItems(slf,itpl_health_herb_01,21);
		CreateInvItems(slf,itpl_health_herb_02,14);
		CreateInvItems(slf,itpl_health_herb_03,10);
		CreateInvItems(slf,itpl_mana_herb_01,14);
		CreateInvItems(slf,itpl_mana_herb_02,9);
		CreateInvItems(slf,itpl_mana_herb_03,4);
		CreateInvItems(slf,itpl_strength_herb_01,1);
		CreateInvItems(slf,itpl_speed_herb_01,2);
		CreateInvItems(slf,itpl_forestberry,3);
		CreateInvItems(slf,itpo_health_03,15);
		CONSTANTINO_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};
};

