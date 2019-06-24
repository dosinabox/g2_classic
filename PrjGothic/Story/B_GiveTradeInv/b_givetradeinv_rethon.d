
var int rethon_itemsgiven_chapter_1;
var int rethon_itemsgiven_chapter_2;
var int rethon_itemsgiven_chapter_3;
var int rethon_itemsgiven_chapter_4;
var int rethon_itemsgiven_chapter_5;
var int rethon_itemsgiven_chapter_6;

func void b_givetradeinv_rethon(var C_NPC slf)
{
	if(RETHON_ITEMSGIVEN_CHAPTER_4 == FALSE)
	{
		CreateInvItems(slf,itmw_inquisitor,1);
		CreateInvItems(slf,itmw_streitaxt2,1);
		CreateInvItems(slf,itmw_kriegshammer2,1);
		CreateInvItems(slf,itmw_orkschlaechter,1);
		CreateInvItems(slf,itmw_folteraxt,1);
		CreateInvItems(slf,itmw_krummschwert,1);
		CreateInvItems(slf,itmw_barbarenstreitaxt,1);
		RETHON_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (RETHON_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmw_berserkeraxt,1);
		RETHON_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
	if((KAPITEL >= 6) && (RETHON_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,300);
		RETHON_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};
};

