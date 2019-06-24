
var int brahim_itemsgiven_chapter_1;
var int brahim_itemsgiven_chapter_2;
var int brahim_itemsgiven_chapter_3;
var int brahim_itemsgiven_chapter_4;
var int brahim_itemsgiven_chapter_5;
var int brahim_itemsgiven_chapter_6;

func void b_givetradeinv_brahim(var C_NPC slf)
{
	if((KAPITEL >= 1) && (BRAHIM_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,50);
		CreateInvItems(slf,itwr_map_newworld,1);
		CreateInvItems(slf,itwr_map_newworld_city,2);
		BRAHIM_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (BRAHIM_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,50);
		CreateInvItems(slf,itwr_map_shrine_mis,1);
		CreateInvItems(slf,itwr_map_newworld,1);
		BRAHIM_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (BRAHIM_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itwr_shatteredgolem_mis,1);
		CreateInvItems(slf,itwr_map_newworld,1);
		CreateInvItems(slf,itwr_map_oldworld,1);
		CreateInvItems(slf,itmi_gold,50);
		BRAHIM_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (BRAHIM_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itwr_map_caves_mis,1);
		BRAHIM_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (BRAHIM_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		BRAHIM_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
	if((KAPITEL >= 6) && (BRAHIM_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		BRAHIM_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};
};

