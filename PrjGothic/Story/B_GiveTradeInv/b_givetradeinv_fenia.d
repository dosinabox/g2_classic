
var int fenia_itemsgiven_chapter_1;
var int fenia_itemsgiven_chapter_2;
var int fenia_itemsgiven_chapter_3;
var int fenia_itemsgiven_chapter_4;
var int fenia_itemsgiven_chapter_5;
var int fenia_itemsgiven_chapter_6;

func void b_givetradeinv_fenia(var C_NPC slf)
{
	if((KAPITEL >= 1) && (FENIA_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,50);
		CreateInvItems(slf,itfo_water,5);
		CreateInvItems(slf,itfo_bread,3);
		CreateInvItems(slf,itfo_fish,5);
		FENIA_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (FENIA_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,50);
		CreateInvItems(slf,itfo_cheese,5);
		CreateInvItems(slf,itfo_fishsoup,5);
		CreateInvItems(slf,itfo_fish,3);
		FENIA_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (FENIA_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itfomutton,2);
		CreateInvItems(slf,itfo_stew,5);
		CreateInvItems(slf,itfo_fish,2);
		CreateInvItems(slf,itfo_sausage,5);
		CreateInvItems(slf,itfo_booze,5);
		FENIA_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (FENIA_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,150);
		CreateInvItems(slf,itfo_wine,5);
		CreateInvItems(slf,itfomutton,5);
		CreateInvItems(slf,itfo_stew,5);
		CreateInvItems(slf,itfo_bacon,5);
		CreateInvItems(slf,itfo_fish,5);
		FENIA_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (FENIA_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		CreateInvItems(slf,itfo_wine,2);
		CreateInvItems(slf,itfomutton,2);
		CreateInvItems(slf,itfo_stew,2);
		CreateInvItems(slf,itfo_fish,5);
		FENIA_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
	if((KAPITEL >= 6) && (FENIA_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,300);
		CreateInvItems(slf,itfo_fish,5);
		FENIA_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};
};

