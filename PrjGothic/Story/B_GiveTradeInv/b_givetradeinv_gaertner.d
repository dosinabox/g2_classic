
var int gaertner_itemsgiven_chapter_1;
var int gaertner_itemsgiven_chapter_2;
var int gaertner_itemsgiven_chapter_3;
var int gaertner_itemsgiven_chapter_4;
var int gaertner_itemsgiven_chapter_5;
var int gaertner_itemsgiven_chapter_6;

func void b_givetradeinv_gaertner(var C_NPC slf)
{
	if((KAPITEL >= 1) && (GAERTNER_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,50);
		CreateInvItems(slf,itpl_mana_herb_01,5);
		CreateInvItems(slf,itpl_mana_herb_02,3);
		GAERTNER_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (GAERTNER_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,50);
		CreateInvItems(slf,itpl_mana_herb_01,5);
		CreateInvItems(slf,itpl_mana_herb_02,5);
		GAERTNER_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (GAERTNER_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,50);
		CreateInvItems(slf,itpl_mana_herb_01,5);
		CreateInvItems(slf,itpl_mana_herb_02,3);
		CreateInvItems(slf,itpl_mana_herb_03,3);
		GAERTNER_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (GAERTNER_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,50);
		CreateInvItems(slf,itpl_mana_herb_01,5);
		CreateInvItems(slf,itpl_mana_herb_02,3);
		CreateInvItems(slf,itpl_mana_herb_03,3);
		GAERTNER_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (GAERTNER_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,50);
		CreateInvItems(slf,itpl_mana_herb_01,5);
		CreateInvItems(slf,itpl_mana_herb_02,3);
		CreateInvItems(slf,itpl_mana_herb_03,3);
		GAERTNER_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
	if((KAPITEL >= 6) && (GAERTNER_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,50);
		CreateInvItems(slf,itpl_mana_herb_01,5);
		CreateInvItems(slf,itpl_mana_herb_02,3);
		CreateInvItems(slf,itpl_mana_herb_03,3);
		GAERTNER_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};
};

