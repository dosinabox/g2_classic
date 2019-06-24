
var int engor_itemsgiven_chapter_1;
var int engor_itemsgiven_chapter_2;
var int engor_itemsgiven_chapter_3;
var int engor_itemsgiven_chapter_4;
var int engor_itemsgiven_chapter_5;
var int engor_itemsgiven_chapter_6;

func void b_givetradeinv_engor(var C_NPC slf)
{
	if((KAPITEL >= 1) && (ENGOR_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,80);
		CreateInvItems(slf,itmiswordraw,3);
		CreateInvItems(slf,itpo_health_01,10);
		CreateInvItems(slf,itpo_health_02,5);
		CreateInvItems(slf,itpo_health_03,5);
		CreateInvItems(slf,itfo_stew,5);
		CreateInvItems(slf,itfo_water,4);
		CreateInvItems(slf,itsc_firebolt,3);
		CreateInvItems(slf,itsc_icebolt,3);
		CreateInvItems(slf,itwr_map_oldworld,1);
		ENGOR_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (ENGOR_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,90);
		CreateInvItems(slf,itpo_health_02,1);
		CreateInvItems(slf,itpo_health_01,10);
		CreateInvItems(slf,itpo_health_02,5);
		CreateInvItems(slf,itpo_health_03,5);
		CreateInvItems(slf,itpo_mana_01,25);
		CreateInvItems(slf,itpo_mana_02,25);
		CreateInvItems(slf,itfo_sausage,1);
		CreateInvItems(slf,itfo_booze,5);
		CreateInvItems(slf,itfo_wine,2);
		CreateInvItems(slf,itfo_bread,1);
		CreateInvItems(slf,itrw_arrow,55);
		CreateInvItems(slf,itrw_bolt,50);
		CreateInvItems(slf,itmi_sulfur,1);
		CreateInvItems(slf,itmi_quartz,2);
		CreateInvItems(slf,itke_lockpick,6);
		ENGOR_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (ENGOR_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itfo_wine,4);
		CreateInvItems(slf,itpo_health_01,10);
		CreateInvItems(slf,itpo_health_02,5);
		CreateInvItems(slf,itpo_health_03,5);
		CreateInvItems(slf,itpo_mana_01,25);
		CreateInvItems(slf,itpo_mana_02,25);
		CreateInvItems(slf,itmi_pitch,2);
		CreateInvItems(slf,itmi_rockcrystal,1);
		CreateInvItems(slf,itmi_coal,2);
		CreateInvItems(slf,itsc_mediumheal,2);
		CreateInvItems(slf,itsc_firestorm,3);
		CreateInvItems(slf,itrw_arrow,70);
		CreateInvItems(slf,itrw_bolt,70);
		CreateInvItems(slf,itke_lockpick,6);
		ENGOR_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (ENGOR_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,150);
		CreateInvItems(slf,itpo_health_01,10);
		CreateInvItems(slf,itpo_health_02,5);
		CreateInvItems(slf,itpo_health_03,5);
		CreateInvItems(slf,itpo_mana_01,25);
		CreateInvItems(slf,itpo_mana_02,25);
		CreateInvItems(slf,itmi_pitch,2);
		CreateInvItems(slf,itmi_rockcrystal,1);
		CreateInvItems(slf,itmi_coal,1);
		CreateInvItems(slf,itsc_lightningflash,1);
		CreateInvItems(slf,itsc_sumgol,2);
		CreateInvItems(slf,itrw_arrow,100);
		CreateInvItems(slf,itrw_bolt,110);
		CreateInvItems(slf,itke_lockpick,12);
		ENGOR_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (ENGOR_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		CreateInvItems(slf,itpo_health_01,10);
		CreateInvItems(slf,itpo_health_02,5);
		CreateInvItems(slf,itpo_health_03,5);
		CreateInvItems(slf,itpo_mana_01,35);
		CreateInvItems(slf,itpo_mana_02,35);
		CreateInvItems(slf,itmi_aquamarine,1);
		CreateInvItems(slf,itmi_darkpearl,1);
		CreateInvItems(slf,itmi_coal,4);
		CreateInvItems(slf,itsc_pyrokinesis,1);
		CreateInvItems(slf,itsc_sumdemon,2);
		CreateInvItems(slf,itrw_arrow,125);
		CreateInvItems(slf,itrw_bolt,125);
		ENGOR_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
	if((KAPITEL >= 6) && (ENGOR_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,300);
		ENGOR_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};
};

