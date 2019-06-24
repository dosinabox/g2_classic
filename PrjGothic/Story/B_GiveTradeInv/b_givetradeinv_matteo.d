
var int matteo_itemsgiven_chapter_1;
var int matteo_itemsgiven_chapter_2;
var int matteo_itemsgiven_chapter_3;
var int matteo_itemsgiven_chapter_4;
var int matteo_itemsgiven_chapter_5;
var int matteo_itemsgiven_chapter_6;

func void b_givetradeinv_matteo(var C_NPC slf)
{
	if((KAPITEL >= 1) && (MATTEO_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itmw_kriegskeule,1);
		CreateInvItems(slf,itmw_nagelkeule2,1);
		CreateInvItems(slf,itlstorch,5);
		CreateInvItems(slf,itpo_health_01,1);
		CreateInvItems(slf,itfo_cheese,5);
		CreateInvItems(slf,itfo_bread,4);
		CreateInvItems(slf,itfo_water,1);
		CreateInvItems(slf,itfo_beer,4);
		CreateInvItems(slf,itrw_arrow,15);
		MATTEO_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (MATTEO_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_broom,2);
		CreateInvItems(slf,itmw_schwert4,1);
		CreateInvItems(slf,itlstorch,5);
		CreateInvItems(slf,itpl_forestberry,3);
		CreateInvItems(slf,itfo_stew,5);
		CreateInvItems(slf,itfo_water,4);
		CreateInvItems(slf,itfo_wine,4);
		CreateInvItems(slf,itfo_beer,4);
		CreateInvItems(slf,itrw_arrow,30);
		MATTEO_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (MATTEO_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmw_rubinklinge,1);
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itlstorch,5);
		CreateInvItems(slf,itpl_forestberry,3);
		CreateInvItems(slf,itfo_bread,2);
		CreateInvItems(slf,itfo_sausage,3);
		CreateInvItems(slf,itfo_wine,2);
		CreateInvItems(slf,itfo_beer,4);
		CreateInvItems(slf,itrw_arrow,50);
		MATTEO_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (MATTEO_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,150);
		CreateInvItems(slf,itpl_mana_herb_02,2);
		CreateInvItems(slf,itpl_health_herb_02,3);
		CreateInvItems(slf,itmi_lute,1);
		CreateInvItems(slf,itfo_sausage,3);
		CreateInvItems(slf,itfo_wine,2);
		CreateInvItems(slf,itfo_beer,4);
		CreateInvItems(slf,itrw_arrow,100);
		MATTEO_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (MATTEO_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		CreateInvItems(slf,itpl_health_herb_02,2);
		CreateInvItems(slf,itmi_lute,1);
		CreateInvItems(slf,itfo_bacon,1);
		CreateInvItems(slf,itfo_fishsoup,1);
		CreateInvItems(slf,itmiswordraw,1);
		CreateInvItems(slf,itrw_arrow,20);
		MATTEO_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
	if((KAPITEL >= 6) && (MATTEO_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,300);
		MATTEO_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};
};

