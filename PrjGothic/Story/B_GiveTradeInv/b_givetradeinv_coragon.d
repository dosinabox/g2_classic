
var int coragon_itemsgiven_chapter_1;
var int coragon_itemsgiven_chapter_2;
var int coragon_itemsgiven_chapter_3;
var int coragon_itemsgiven_chapter_4;
var int coragon_itemsgiven_chapter_5;
var int coragon_itemsgiven_chapter_6;

func void b_givetradeinv_coragon(var C_NPC slf)
{
	if((KAPITEL >= 1) && (CORAGON_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,50);
		CreateInvItems(slf,itfo_wine,6);
		CreateInvItems(slf,itfo_booze,3);
		CreateInvItems(slf,itfo_beer,5);
		CreateInvItems(slf,itfo_apple,5);
		CreateInvItems(slf,itfo_stew,5);
		CORAGON_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (CORAGON_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,50);
		CreateInvItems(slf,itfo_wine,4);
		CreateInvItems(slf,itfo_booze,3);
		CreateInvItems(slf,itfo_beer,5);
		CreateInvItems(slf,itfo_cheese,5);
		CreateInvItems(slf,itfo_bacon,5);
		CreateInvItems(slf,itfo_sausage,5);
		CreateInvItems(slf,itfo_honey,5);
		CORAGON_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (CORAGON_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,50);
		CreateInvItems(slf,itfo_wine,4);
		CreateInvItems(slf,itfo_booze,5);
		CreateInvItems(slf,itfo_beer,6);
		CreateInvItems(slf,itfo_bacon,5);
		CreateInvItems(slf,itfo_sausage,5);
		CreateInvItems(slf,itfo_honey,5);
		CORAGON_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (CORAGON_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,150);
		CreateInvItems(slf,itfo_wine,7);
		CreateInvItems(slf,itfo_booze,4);
		CreateInvItems(slf,itfo_beer,6);
		CreateInvItems(slf,itfo_apple,5);
		CreateInvItems(slf,itfo_stew,5);
		CORAGON_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (CORAGON_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,150);
		CreateInvItems(slf,itfo_wine,5);
		CreateInvItems(slf,itfo_booze,4);
		CreateInvItems(slf,itfo_beer,5);
		CreateInvItems(slf,itfo_apple,5);
		CreateInvItems(slf,itfo_stew,5);
		CreateInvItems(slf,itfo_bacon,5);
		CreateInvItems(slf,itfo_sausage,5);
		CreateInvItems(slf,itfo_honey,5);
		CORAGON_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
	if((KAPITEL >= 6) && (CORAGON_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		CreateInvItems(slf,itfo_wine,6);
		CreateInvItems(slf,itfo_booze,4);
		CreateInvItems(slf,itfo_beer,2);
		CORAGON_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};
};

