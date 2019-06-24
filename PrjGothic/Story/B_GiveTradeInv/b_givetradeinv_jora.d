
var int jora_itemsgiven_chapter_1;
var int jora_itemsgiven_chapter_2;
var int jora_itemsgiven_chapter_3;
var int jora_itemsgiven_chapter_4;
var int jora_itemsgiven_chapter_5;
var int jora_itemsgiven_chapter_6;

func void b_givetradeinv_jora(var C_NPC slf)
{
	if((KAPITEL >= 1) && (JORA_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itsc_light,1);
		CreateInvItems(slf,itpl_health_herb_01,2);
		CreateInvItems(slf,itpl_mushroom_01,3);
		CreateInvItems(slf,itfomutton,8);
		CreateInvItems(slf,itmw_richtstab,1);
		CreateInvItems(slf,itmw_shortsword3,1);
		CreateInvItems(slf,itrw_bow_l_01,1);
		CreateInvItems(slf,itrw_arrow,30);
		CreateInvItems(slf,itrw_bolt,30);
		JORA_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (JORA_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itmiswordraw,1);
		CreateInvItems(slf,itpl_health_herb_01,3);
		CreateInvItems(slf,itpl_mushroom_02,2);
		CreateInvItems(slf,itfo_fishsoup,3);
		CreateInvItems(slf,itmw_morgenstern,1);
		CreateInvItems(slf,itrw_crossbow_l_02,1);
		CreateInvItems(slf,itrw_arrow,60);
		CreateInvItems(slf,itrw_bolt,60);
		JORA_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (JORA_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itfo_wine,1);
		CreateInvItems(slf,itpl_mana_herb_01,4);
		CreateInvItems(slf,itpl_health_herb_02,3);
		CreateInvItems(slf,itmw_rabenschnabel,1);
		CreateInvItems(slf,itrw_bow_m_01,1);
		CreateInvItems(slf,itrw_arrow,60);
		CreateInvItems(slf,itrw_bolt,60);
		JORA_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (JORA_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,150);
		CreateInvItems(slf,itmi_rockcrystal,1);
		CreateInvItems(slf,itpl_mana_herb_02,4);
		CreateInvItems(slf,itpl_health_herb_03,5);
		CreateInvItems(slf,itmw_folteraxt,1);
		CreateInvItems(slf,itrw_bow_m_04,1);
		CreateInvItems(slf,itrw_arrow,60);
		CreateInvItems(slf,itrw_bolt,60);
		JORA_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (JORA_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		CreateInvItems(slf,itmi_coal,3);
		CreateInvItems(slf,itmi_pitch,2);
		CreateInvItems(slf,itpl_health_herb_03,5);
		CreateInvItems(slf,itpl_mana_herb_03,5);
		CreateInvItems(slf,itrw_arrow,160);
		CreateInvItems(slf,itrw_bolt,160);
		JORA_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
	if((KAPITEL >= 6) && (JORA_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,300);
		CreateInvItems(slf,itmi_coal,3);
		CreateInvItems(slf,itmi_pitch,2);
		CreateInvItems(slf,itpl_health_herb_03,10);
		CreateInvItems(slf,itpl_mana_herb_03,10);
		CreateInvItems(slf,itrw_arrow,30);
		CreateInvItems(slf,itrw_bolt,30);
		JORA_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};
};

