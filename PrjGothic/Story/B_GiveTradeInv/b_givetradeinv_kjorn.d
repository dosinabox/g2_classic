
var int kjorn_itemsgiven_chapter_1;
var int kjorn_itemsgiven_chapter_2;
var int kjorn_itemsgiven_chapter_3;
var int kjorn_itemsgiven_chapter_4;
var int kjorn_itemsgiven_chapter_5;
var int kjorn_itemsgiven_chapter_6;

func void b_givetradeinv_kjorn(var C_NPC slf)
{
	if((KAPITEL >= 1) && (KJORN_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itfo_apple,2);
		CreateInvItems(slf,itfo_water,5);
		CreateInvItems(slf,itfo_beer,5);
		CreateInvItems(slf,itfo_cheese,5);
		KJORN_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (KJORN_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itfo_cheese,5);
		CreateInvItems(slf,itfomutton,5);
		CreateInvItems(slf,itfo_stew,5);
		KJORN_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (KJORN_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itfo_cheese,2);
		CreateInvItems(slf,itfo_bacon,2);
		CreateInvItems(slf,itfomutton,10);
		CreateInvItems(slf,itfo_stew,5);
		CreateInvItems(slf,itfo_sausage,5);
		CreateInvItems(slf,itfo_booze,5);
		KJORN_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (KJORN_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,50);
		CreateInvItems(slf,itfo_wine,2);
		CreateInvItems(slf,itfo_booze,3);
		CreateInvItems(slf,itfo_bacon,5);
		CreateInvItems(slf,itrw_arrow,65);
		CreateInvItems(slf,itrw_bolt,50);
		CreateInvItems(slf,itpo_health_01,4);
		CreateInvItems(slf,itpo_health_02,2);
		CreateInvItems(slf,itke_lockpick,10);
		KJORN_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (KJORN_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,50);
		CreateInvItems(slf,itfo_wine,2);
		CreateInvItems(slf,itfo_booze,3);
		CreateInvItems(slf,itfo_bacon,5);
		CreateInvItems(slf,itrw_arrow,55);
		CreateInvItems(slf,itrw_bolt,55);
		CreateInvItems(slf,itpo_health_01,4);
		CreateInvItems(slf,itpo_health_02,2);
		KJORN_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
	if((KAPITEL >= 6) && (KJORN_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,50);
		CreateInvItems(slf,itfo_wine,2);
		CreateInvItems(slf,itfo_booze,3);
		CreateInvItems(slf,itfo_bacon,5);
		CreateInvItems(slf,itrw_arrow,32);
		CreateInvItems(slf,itrw_bolt,25);
		CreateInvItems(slf,itpo_health_01,4);
		CreateInvItems(slf,itpo_health_02,2);
		KJORN_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};
};

