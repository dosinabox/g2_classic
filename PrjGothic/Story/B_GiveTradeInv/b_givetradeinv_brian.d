
var int brian_itemsgiven_chapter_1;
var int brian_itemsgiven_chapter_2;
var int brian_itemsgiven_chapter_3;
var int brian_itemsgiven_chapter_4;
var int brian_itemsgiven_chapter_5;
var int brian_itemsgiven_chapter_6;

func void b_givetradeinv_brian(var C_NPC slf)
{
	if((KAPITEL >= 1) && (BRIAN_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,20);
		CreateInvItems(slf,itmiswordraw,2);
		BRIAN_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (BRIAN_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,20);
		CreateInvItems(slf,itmiswordraw,1);
		BRIAN_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (BRIAN_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,20);
		CreateInvItems(slf,itmiswordraw,1);
		BRIAN_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (BRIAN_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,20);
		CreateInvItems(slf,itmiswordraw,1);
		BRIAN_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (BRIAN_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,40);
		CreateInvItems(slf,itmiswordraw,1);
		BRIAN_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
	if((KAPITEL >= 6) && (BRIAN_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,40);
		CreateInvItems(slf,itmiswordraw,1);
		BRIAN_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};
};

