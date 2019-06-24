
var int halvor_itemsgiven_chapter_1;
var int halvor_itemsgiven_chapter_2;
var int halvor_itemsgiven_chapter_3;
var int halvor_itemsgiven_chapter_4;
var int halvor_itemsgiven_chapter_5;
var int halvor_itemsgiven_chapter_6;

func void b_givetradeinv_halvor(var C_NPC slf)
{
	if((KAPITEL >= 1) && (HALVOR_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itfo_fish,12);
		HALVOR_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (HALVOR_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,50);
		CreateInvItems(slf,itfo_fish,8);
		HALVOR_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (HALVOR_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itfo_fish,4);
		HALVOR_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (HALVOR_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,150);
		CreateInvItems(slf,itfo_fish,19);
		HALVOR_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (HALVOR_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		CreateInvItems(slf,itfo_fish,9);
		HALVOR_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
	if((KAPITEL >= 6) && (HALVOR_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,300);
		CreateInvItems(slf,itfo_fish,11);
		HALVOR_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};
};

