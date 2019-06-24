
var int khaled_itemsgiven_chapter_1;
var int khaled_itemsgiven_chapter_2;
var int khaled_itemsgiven_chapter_3;
var int khaled_itemsgiven_chapter_4;
var int khaled_itemsgiven_chapter_5;
var int khaled_itemsgiven_chapter_6;

func void b_givetradeinv_khaled(var C_NPC slf)
{
	if((KAPITEL >= 1) && (KHALED_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itmw_shortsword3,1);
		CreateInvItems(slf,itmw_shortsword4,1);
		CreateInvItems(slf,itmw_kriegshammer1,1);
		CreateInvItems(slf,itmw_nagelkeule2,1);
		CreateInvItems(slf,itmw_schwert,1);
		CreateInvItems(slf,itmw_1h_mace_l_04,1);
		CreateInvItems(slf,itrw_bow_l_01,1);
		CreateInvItems(slf,itrw_bow_l_02,1);
		CreateInvItems(slf,itrw_bow_l_03,1);
		CreateInvItems(slf,itrw_arrow,30);
		KHALED_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (KHALED_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,250);
		CreateInvItems(slf,itmw_streitaxt1,1);
		CreateInvItems(slf,itmw_schwert2,1);
		CreateInvItems(slf,itmw_morgenstern,1);
		CreateInvItems(slf,itmw_schwert3,1);
		CreateInvItems(slf,itrw_bow_l_03,1);
		CreateInvItems(slf,itrw_bow_l_04,1);
		CreateInvItems(slf,itrw_crossbow_l_02,1);
		CreateInvItems(slf,itrw_arrow,50);
		CreateInvItems(slf,itrw_bolt,30);
		KHALED_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (KHALED_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,450);
		CreateInvItems(slf,itmw_streitkolben,1);
		CreateInvItems(slf,itmw_zweihaender2,1);
		CreateInvItems(slf,itmw_streitaxt2,1);
		CreateInvItems(slf,itrw_bow_m_01,1);
		CreateInvItems(slf,itrw_bow_m_02,1);
		CreateInvItems(slf,itrw_crossbow_m_01,1);
		CreateInvItems(slf,itrw_arrow,70);
		CreateInvItems(slf,itrw_bolt,50);
		CreateInvItems(slf,itmi_nugget,1);
		KHALED_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (KHALED_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,700);
		CreateInvItems(slf,itmiswordraw,1);
		CreateInvItems(slf,itmw_elbastardo,1);
		CreateInvItems(slf,itmw_folteraxt,1);
		CreateInvItems(slf,itmw_zweihaender4,1);
		CreateInvItems(slf,itmw_barbarenstreitaxt,1);
		CreateInvItems(slf,itrw_bow_m_03,1);
		CreateInvItems(slf,itrw_bow_m_04,1);
		CreateInvItems(slf,itrw_bow_h_01,1);
		CreateInvItems(slf,itrw_crossbow_m_02,1);
		CreateInvItems(slf,itrw_crossbow_h_01,1);
		CreateInvItems(slf,itrw_arrow,80);
		CreateInvItems(slf,itrw_bolt,60);
		CreateInvItems(slf,itmi_nugget,2);
		KHALED_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (KHALED_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,1100);
		CreateInvItems(slf,itmw_sturmbringer,1);
		CreateInvItems(slf,itmw_berserkeraxt,1);
		CreateInvItems(slf,itrw_bow_h_02,1);
		CreateInvItems(slf,itrw_bow_h_03,1);
		CreateInvItems(slf,itrw_bow_h_04,1);
		CreateInvItems(slf,itrw_crossbow_h_02,1);
		CreateInvItems(slf,itrw_arrow,100);
		CreateInvItems(slf,itrw_bolt,70);
		KHALED_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
	if((KAPITEL >= 6) && (KHALED_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,3000);
		KHALED_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};
};

