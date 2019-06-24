
var int sagitta_itemsgiven_chapter_1;
var int sagitta_itemsgiven_chapter_2;
var int sagitta_itemsgiven_chapter_3;
var int sagitta_itemsgiven_chapter_4;
var int sagitta_itemsgiven_chapter_5;
var int sagitta_itemsgiven_chapter_6;

func void b_givetradeinv_sagitta(var C_NPC slf)
{
	if((KAPITEL >= 1) && (SAGITTA_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itpl_swampherb,9);
		CreateInvItems(slf,itmi_joint,3);
		CreateInvItems(slf,itmi_sulfur,2);
		CreateInvItems(slf,itmi_quartz,1);
		CreateInvItems(slf,itmi_flask,5);
		CreateInvItems(slf,itpo_mana_01,4);
		CreateInvItems(slf,itpo_health_01,3);
		SAGITTA_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (SAGITTA_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itmi_flask,7);
		CreateInvItems(slf,itpl_swampherb,7);
		CreateInvItems(slf,itmi_joint,2);
		CreateInvItems(slf,itpl_temp_herb,2);
		CreateInvItems(slf,itpl_perm_herb,1);
		CreateInvItems(slf,itpl_health_herb_01,7);
		CreateInvItems(slf,itpl_health_herb_02,4);
		CreateInvItems(slf,itpl_mana_herb_01,3);
		CreateInvItems(slf,itmi_sulfur,2);
		CreateInvItems(slf,itmi_quartz,2);
		CreateInvItems(slf,itpo_health_01,3);
		CreateInvItems(slf,itpo_health_02,4);
		CreateInvItems(slf,itpo_mana_01,5);
		CreateInvItems(slf,itpo_health_01,1);
		SAGITTA_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (SAGITTA_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itpl_swampherb,7);
		CreateInvItems(slf,itmi_joint,2);
		CreateInvItems(slf,itmi_flask,5);
		CreateInvItems(slf,itpl_temp_herb,3);
		CreateInvItems(slf,itpl_health_herb_01,4);
		CreateInvItems(slf,itpl_mana_herb_01,3);
		CreateInvItems(slf,itpl_mana_herb_02,4);
		CreateInvItems(slf,itpl_speed_herb_01,3);
		CreateInvItems(slf,itpl_strength_herb_01,1);
		CreateInvItems(slf,itmi_sulfur,2);
		CreateInvItems(slf,itmi_quartz,3);
		CreateInvItems(slf,itmi_rockcrystal,2);
		CreateInvItems(slf,itmi_coal,1);
		CreateInvItems(slf,itpo_health_02,3);
		CreateInvItems(slf,itpo_health_03,2);
		CreateInvItems(slf,itpo_mana_01,6);
		CreateInvItems(slf,itsc_trfgiantrat,1);
		CreateInvItems(slf,itsc_trfwaran,1);
		SAGITTA_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (SAGITTA_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,150);
		CreateInvItems(slf,itpl_swampherb,8);
		CreateInvItems(slf,itmi_joint,2);
		CreateInvItems(slf,itmi_flask,5);
		CreateInvItems(slf,itmi_sulfur,4);
		CreateInvItems(slf,itmi_quartz,4);
		CreateInvItems(slf,itmi_rockcrystal,2);
		CreateInvItems(slf,itmi_coal,4);
		CreateInvItems(slf,itmi_aquamarine,1);
		CreateInvItems(slf,itpl_temp_herb,5);
		CreateInvItems(slf,itpl_perm_herb,1);
		CreateInvItems(slf,itpl_health_herb_01,8);
		CreateInvItems(slf,itpl_health_herb_02,6);
		CreateInvItems(slf,itpl_health_herb_03,4);
		CreateInvItems(slf,itpl_mana_herb_01,6);
		CreateInvItems(slf,itpl_mana_herb_02,2);
		CreateInvItems(slf,itpl_speed_herb_01,1);
		CreateInvItems(slf,itpo_health_02,6);
		CreateInvItems(slf,itpo_health_03,4);
		CreateInvItems(slf,itpo_mana_01,7);
		CreateInvItems(slf,itpo_mana_02,3);
		CreateInvItems(slf,itsc_trffirewaran,1);
		SAGITTA_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (SAGITTA_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		CreateInvItems(slf,itpl_swampherb,9);
		CreateInvItems(slf,itmi_joint,2);
		CreateInvItems(slf,itmi_flask,5);
		CreateInvItems(slf,itmi_sulfur,4);
		CreateInvItems(slf,itmi_quartz,5);
		CreateInvItems(slf,itmi_rockcrystal,2);
		CreateInvItems(slf,itmi_coal,2);
		CreateInvItems(slf,itmi_aquamarine,3);
		CreateInvItems(slf,itpl_temp_herb,9);
		CreateInvItems(slf,itpl_perm_herb,1);
		CreateInvItems(slf,itpl_health_herb_01,18);
		CreateInvItems(slf,itpl_health_herb_02,12);
		CreateInvItems(slf,itpl_health_herb_03,6);
		CreateInvItems(slf,itpl_mana_herb_01,7);
		CreateInvItems(slf,itpl_mana_herb_02,4);
		CreateInvItems(slf,itpl_mana_herb_03,2);
		CreateInvItems(slf,itpl_speed_herb_01,1);
		CreateInvItems(slf,itpo_health_02,9);
		CreateInvItems(slf,itpo_health_03,7);
		CreateInvItems(slf,itpo_mana_01,9);
		CreateInvItems(slf,itpo_mana_02,2);
		CreateInvItems(slf,itsc_trfshadowbeast,1);
		SAGITTA_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
	if((KAPITEL >= 6) && (SAGITTA_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,300);
		CreateInvItems(slf,itpl_swampherb,13);
		CreateInvItems(slf,itmi_joint,2);
		CreateInvItems(slf,itmi_flask,5);
		CreateInvItems(slf,itpl_temp_herb,9);
		CreateInvItems(slf,itpl_perm_herb,1);
		CreateInvItems(slf,itmi_aquamarine,3);
		CreateInvItems(slf,itmi_rockcrystal,3);
		CreateInvItems(slf,itpl_health_herb_01,25);
		CreateInvItems(slf,itpl_health_herb_02,14);
		CreateInvItems(slf,itpl_health_herb_03,9);
		CreateInvItems(slf,itpl_mana_herb_01,13);
		CreateInvItems(slf,itpl_mana_herb_02,8);
		CreateInvItems(slf,itpl_mana_herb_03,2);
		CreateInvItems(slf,itpl_strength_herb_01,1);
		CreateInvItems(slf,itpo_health_02,17);
		CreateInvItems(slf,itpo_health_03,14);
		CreateInvItems(slf,itpo_mana_01,13);
		CreateInvItems(slf,itpo_mana_02,10);
		SAGITTA_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};
};

