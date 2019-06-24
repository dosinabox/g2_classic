
var int sarah_itemsgiven_chapter_1;
var int sarah_itemsgiven_chapter_2;
var int sarah_itemsgiven_chapter_3;
var int sarah_itemsgiven_chapter_4;
var int sarah_itemsgiven_chapter_5;
var int sarah_itemsgiven_chapter_6;

func void b_givetradeinv_sarah(var C_NPC slf)
{
	if((KAPITEL >= 1) && (SARAH_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,20);
		CreateInvItems(slf,itmw_shortsword3,1);
		CreateInvItems(slf,itmw_shortsword4,1);
		CreateInvItems(slf,itmw_shortsword5,1);
		CreateInvItems(slf,itmw_kriegshammer1,1);
		CreateInvItems(slf,itmw_1h_vlk_sword,1);
		CreateInvItems(slf,itmw_1h_nov_mace,1);
		SARAH_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (SARAH_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,20);
		CreateInvItems(slf,itlstorch,1);
		CreateInvItems(slf,itmw_stabkeule,1);
		CreateInvItems(slf,itmw_steinbrecher,1);
		CreateInvItems(slf,itmw_schwert2,1);
		CreateInvItems(slf,itmw_bartaxt,1);
		CreateInvItems(slf,itrw_arrow,50);
		SARAH_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (SARAH_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,25);
		CreateInvItems(slf,itmw_zweihaender2,1);
		CreateInvItems(slf,itmw_schwert5,1);
		CreateInvItems(slf,itmw_inquisitor,1);
		CreateInvItems(slf,itrw_arrow,50);
		SARAH_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (SARAH_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itmw_kriegshammer2,1);
		CreateInvItems(slf,itmw_zweihaender4,1);
		CreateInvItems(slf,itmw_krummschwert,1);
		CreateInvItems(slf,itrw_arrow,50);
		SARAH_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (SARAH_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		CreateInvItems(slf,itrw_arrow,50);
		SARAH_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
	if((KAPITEL >= 6) && (SARAH_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		SARAH_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};
};

