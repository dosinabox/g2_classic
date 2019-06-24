
var int rosi_itemsgiven_chapter_1;
var int rosi_itemsgiven_chapter_2;
var int rosi_itemsgiven_chapter_3;
var int rosi_itemsgiven_chapter_4;
var int rosi_itemsgiven_chapter_5;
var int rosi_itemsgiven_chapter_6;

func void b_givetradeinv_rosi(var C_NPC slf)
{
	if((KAPITEL >= 1) && (ROSI_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itfo_water,5);
		CreateInvItems(slf,itfo_bread,3);
		CreateInvItems(slf,itrw_bow_l_01,1);
		CreateInvItems(slf,itrw_arrow,50);
		CreateInvItems(slf,itrw_bolt,30);
		ROSI_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (ROSI_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itfo_cheese,5);
		CreateInvItems(slf,itfomutton,2);
		CreateInvItems(slf,itfo_stew,5);
		CreateInvItems(slf,itfo_fishsoup,5);
		CreateInvItems(slf,itrw_bow_l_01,1);
		CreateInvItems(slf,itrw_arrow,70);
		CreateInvItems(slf,itrw_bolt,80);
		ROSI_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (ROSI_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itfo_cheese,2);
		CreateInvItems(slf,itfo_stew,5);
		CreateInvItems(slf,itfo_sausage,5);
		CreateInvItems(slf,itfo_booze,5);
		CreateInvItems(slf,itrw_bow_l_04,1);
		CreateInvItems(slf,itrw_arrow,90);
		CreateInvItems(slf,itrw_bolt,40);
		ROSI_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (ROSI_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,150);
		CreateInvItems(slf,itfo_wine,5);
		CreateInvItems(slf,itfomutton,5);
		CreateInvItems(slf,itfo_stew,5);
		CreateInvItems(slf,itfo_bacon,5);
		CreateInvItems(slf,itrw_arrow,100);
		CreateInvItems(slf,itrw_bolt,130);
		ROSI_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (ROSI_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		CreateInvItems(slf,itfo_wine,3);
		CreateInvItems(slf,itfo_milk,2);
		CreateInvItems(slf,itfomutton,5);
		CreateInvItems(slf,itfo_bacon,5);
		CreateInvItems(slf,itrw_bow_h_01,1);
		CreateInvItems(slf,itrw_crossbow_m_02,1);
		CreateInvItems(slf,itrw_arrow,150);
		CreateInvItems(slf,itrw_bolt,130);
		ROSI_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
	if((KAPITEL >= 6) && (ROSI_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,300);
		CreateInvItems(slf,itfo_wine,2);
		CreateInvItems(slf,itfomutton,5);
		CreateInvItems(slf,itfo_stew,5);
		CreateInvItems(slf,itfo_sausage,10);
		CreateInvItems(slf,itfo_bacon,5);
		CreateInvItems(slf,itrw_arrow,150);
		CreateInvItems(slf,itrw_bolt,130);
		ROSI_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};
};

