
var int hakon_itemsgiven_chapter_1;
var int hakon_itemsgiven_chapter_2;
var int hakon_itemsgiven_chapter_3;
var int hakon_itemsgiven_chapter_4;
var int hakon_itemsgiven_chapter_5;
var int hakon_itemsgiven_chapter_6;

func void b_givetradeinv_hakon(var C_NPC slf)
{
	if((KAPITEL >= 1) && (HAKON_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itmw_shortsword3,1);
		CreateInvItems(slf,itmw_shortsword4,1);
		CreateInvItems(slf,itmw_richtstab,1);
		CreateInvItems(slf,itmw_schiffsaxt,1);
		CreateInvItems(slf,itmw_shortsword5,1);
		CreateInvItems(slf,itmiswordraw,5);
		HAKON_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (HAKON_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itmw_zweihaender1,1);
		CreateInvItems(slf,itmw_steinbrecher,1);
		CreateInvItems(slf,itmw_doppelaxt,1);
		CreateInvItems(slf,itmiswordraw,5);
		HAKON_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (HAKON_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itmw_streitkolben,1);
		CreateInvItems(slf,itmw_streitaxt2,1);
		CreateInvItems(slf,itmw_schwert5,1);
		CreateInvItems(slf,itmiswordraw,5);
		HAKON_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (HAKON_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,150);
		CreateInvItems(slf,itmw_kriegshammer2,1);
		CreateInvItems(slf,itmw_orkschlaechter,1);
		CreateInvItems(slf,itmw_schlachtaxt,1);
		CreateInvItems(slf,itmiswordraw,5);
		HAKON_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (HAKON_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		CreateInvItems(slf,itmw_drachenschneide,1);
		CreateInvItems(slf,itmiswordraw,5);
		HAKON_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
	if((KAPITEL >= 6) && (HAKON_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,300);
		HAKON_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};
};

