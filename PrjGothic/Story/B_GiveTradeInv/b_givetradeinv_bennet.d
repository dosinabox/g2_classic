
var int bennet_itemsgiven_chapter_1;
var int bennet_itemsgiven_chapter_2;
var int bennet_itemsgiven_chapter_3;
var int bennet_itemsgiven_chapter_4;
var int bennet_itemsgiven_chapter_5;
var int bennet_itemsgiven_chapter_6;

func void b_givetradeinv_bennet(var C_NPC slf)
{
	if((KAPITEL >= 1) && (BENNET_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itmiswordraw,3);
		CreateInvItems(slf,itmw_1h_mace_l_04,2);
		BENNET_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (BENNET_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,250);
		CreateInvItems(slf,itmiswordraw,3);
		BENNET_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (BENNET_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,450);
		CreateInvItems(slf,itmiswordraw,3);
		CreateInvItems(slf,itmi_nugget,1);
		BENNET_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (BENNET_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,700);
		CreateInvItems(slf,itmiswordraw,3);
		CreateInvItems(slf,itmi_nugget,2);
		BENNET_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (BENNET_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,1100);
		CreateInvItems(slf,itmiswordraw,3);
		CreateInvItems(slf,itmi_nugget,2);
		BENNET_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
	if((KAPITEL >= 6) && (BENNET_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,3000);
		BENNET_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};
};

