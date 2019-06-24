
var int harad_itemsgiven_chapter_1;
var int harad_itemsgiven_chapter_2;
var int harad_itemsgiven_chapter_3;
var int harad_itemsgiven_chapter_4;
var int harad_itemsgiven_chapter_5;
var int harad_itemsgiven_chapter_6;

func void b_givetradeinv_harad(var C_NPC slf)
{
	if((KAPITEL >= 1) && (HARAD_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		HARAD_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (HARAD_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		HARAD_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (HARAD_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,400);
		HARAD_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (HARAD_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,600);
		CreateInvItems(slf,itmi_nugget,1);
		HARAD_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (HARAD_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,1000);
		CreateInvItems(slf,itmi_nugget,2);
		HARAD_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
	if((KAPITEL >= 6) && (HARAD_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,300);
		CreateInvItems(slf,itmi_nugget,1);
		HARAD_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};
};

