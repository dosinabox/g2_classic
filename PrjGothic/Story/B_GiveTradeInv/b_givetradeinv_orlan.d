
var int orlan_itemsgiven_chapter_1;
var int orlan_itemsgiven_chapter_2;
var int orlan_itemsgiven_chapter_3;
var int orlan_itemsgiven_chapter_4;
var int orlan_itemsgiven_chapter_5;
var int orlan_itemsgiven_chapter_6;

func void b_givetradeinv_orlan(var C_NPC slf)
{
	if((KAPITEL >= 1) && (ORLAN_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,30);
		CreateInvItems(slf,itmw_nagelkeule,1);
		CreateInvItems(slf,itmw_kriegskeule,1);
		CreateInvItems(slf,itrw_bow_l_01,1);
		CreateInvItems(slf,itrw_arrow,21);
		CreateInvItems(slf,itrw_bolt,5);
		CreateInvItems(slf,itfo_water,4);
		CreateInvItems(slf,itfo_beer,10);
		CreateInvItems(slf,itfo_bread,4);
		CreateInvItems(slf,itfo_milk,4);
		CreateInvItems(slf,itfo_wine,2);
		CreateInvItems(slf,itfo_bacon,2);
		CreateInvItems(slf,itlstorch,3);
		ORLAN_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (ORLAN_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,50);
		CreateInvItems(slf,itmw_zweihaender1,1);
		CreateInvItems(slf,itmw_bartaxt,1);
		CreateInvItems(slf,itrw_arrow,40);
		CreateInvItems(slf,itrw_bolt,45);
		ORLAN_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (ORLAN_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itmw_orkschlaechter,1);
		CreateInvItems(slf,itmw_schlachtaxt,1);
		CreateInvItems(slf,itmw_barbarenstreitaxt,1);
		CreateInvItems(slf,itru_teleporttaverne,1);
		CreateInvItems(slf,itrw_arrow,120);
		CreateInvItems(slf,itrw_bolt,115);
		ORLAN_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (ORLAN_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		CreateInvItems(slf,itmw_zweihaender1,1);
		CreateInvItems(slf,itmw_bartaxt,1);
		ORLAN_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (ORLAN_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,300);
		CreateInvItems(slf,itrw_arrow,120);
		CreateInvItems(slf,itrw_bolt,115);
		ORLAN_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
	if((KAPITEL >= 6) && (ORLAN_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,300);
		ORLAN_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};
};

