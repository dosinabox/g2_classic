
var int sengrath_itemsgiven_chapter_1;
var int sengrath_itemsgiven_chapter_2;
var int sengrath_itemsgiven_chapter_3;
var int sengrath_itemsgiven_chapter_4;
var int sengrath_itemsgiven_chapter_5;
var int sengrath_itemsgiven_chapter_6;

func void b_givetradeinv_sengrath(var C_NPC slf)
{
	if((KAPITEL >= 1) && (SENGRATH_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		SENGRATH_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (SENGRATH_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		CreateInvItems(slf,itpo_mana_01,10);
		CreateInvItems(slf,itpo_mana_02,5);
		CreateInvItems(slf,itsc_zap,3);
		CreateInvItems(slf,itsc_sumwolf,1);
		CreateInvItems(slf,itsc_sleep,2);
		CreateInvItems(slf,itsc_icecube,2);
		CreateInvItems(slf,itsc_windfist,3);
		CreateInvItems(slf,itsc_mediumheal,5);
		SENGRATH_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (SENGRATH_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itpo_mana_01,10);
		CreateInvItems(slf,itpo_mana_02,5);
		SENGRATH_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (SENGRATH_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,150);
		CreateInvItems(slf,itpo_mana_01,10);
		CreateInvItems(slf,itpo_mana_02,5);
		CreateInvItems(slf,itsc_lightningflash,2);
		SENGRATH_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (SENGRATH_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		CreateInvItems(slf,itpo_mana_01,10);
		CreateInvItems(slf,itpo_mana_02,5);
		SENGRATH_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
	if((KAPITEL >= 6) && (SENGRATH_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,300);
		SENGRATH_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};
};

