
var int elena_itemsgiven_chapter_1;
var int elena_itemsgiven_chapter_2;
var int elena_itemsgiven_chapter_3;
var int elena_itemsgiven_chapter_4;
var int elena_itemsgiven_chapter_5;
var int elena_itemsgiven_chapter_6;

func void b_givetradeinv_elena(var C_NPC slf)
{
	if((KAPITEL >= 1) && (ELENA_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itfo_apple,2);
		CreateInvItems(slf,itfo_water,3);
		CreateInvItems(slf,itfo_cheese,5);
		CreateInvItems(slf,itfo_bacon,3);
		CreateInvItems(slf,itfo_milk,5);
		ELENA_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (ELENA_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itfo_cheese,5);
		CreateInvItems(slf,itfomutton,3);
		CreateInvItems(slf,itfo_stew,5);
		CreateInvItems(slf,itfo_fishsoup,5);
		CreateInvItems(slf,itfo_milk,3);
		ELENA_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (ELENA_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itfo_cheese,2);
		CreateInvItems(slf,itfo_bacon,2);
		CreateInvItems(slf,itfomutton,3);
		CreateInvItems(slf,itfo_stew,5);
		CreateInvItems(slf,itfo_sausage,3);
		CreateInvItems(slf,itfo_milk,5);
		ELENA_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (ELENA_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,150);
		CreateInvItems(slf,itfo_wine,5);
		CreateInvItems(slf,itfo_milk,10);
		CreateInvItems(slf,itfomutton,5);
		CreateInvItems(slf,itfo_stew,1);
		CreateInvItems(slf,itfo_sausage,5);
		CreateInvItems(slf,itfo_bacon,5);
		ELENA_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (ELENA_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		CreateInvItems(slf,itfo_wine,2);
		CreateInvItems(slf,itfo_milk,5);
		CreateInvItems(slf,itfomutton,5);
		CreateInvItems(slf,itfo_stew,3);
		CreateInvItems(slf,itfo_sausage,5);
		CreateInvItems(slf,itfo_bacon,3);
		CreateInvItems(slf,itfo_milk,5);
		ELENA_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
	if((KAPITEL >= 6) && (ELENA_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,300);
		CreateInvItems(slf,itfo_wine,2);
		CreateInvItems(slf,itfo_milk,5);
		CreateInvItems(slf,itfomutton,3);
		CreateInvItems(slf,itfo_stew,5);
		CreateInvItems(slf,itfo_sausage,5);
		CreateInvItems(slf,itfo_bacon,3);
		CreateInvItems(slf,itfo_milk,5);
		ELENA_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};
};

