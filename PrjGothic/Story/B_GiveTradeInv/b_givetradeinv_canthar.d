
var int canthar_itemsgiven_chapter_1;
var int canthar_itemsgiven_chapter_2;
var int canthar_itemsgiven_chapter_3;
var int canthar_itemsgiven_chapter_4;
var int canthar_itemsgiven_chapter_5;
var int canthar_itemsgiven_chapter_6;

func void b_givetradeinv_canthar(var C_NPC slf)
{
	if((KAPITEL >= 0) && (CANTHAR_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itmw_nagelkeule,1);
		CreateInvItems(slf,itmw_shortsword5,1);
		CreateInvItems(slf,itmw_hellebarde,1);
		CreateInvItems(slf,itmw_piratensaebel,1);
		CreateInvItems(slf,itpl_beet,10);
		CreateInvItems(slf,itfo_wine,5);
		CreateInvItems(slf,itmi_pan,1);
		CreateInvItems(slf,itmi_flask,5);
		CreateInvItems(slf,itmi_saw,1);
		CANTHAR_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (CANTHAR_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itmw_schwert2,2);
		CreateInvItems(slf,itmw_schwert4,1);
		CreateInvItems(slf,itmw_spicker,1);
		CreateInvItems(slf,itmw_bartaxt,1);
		CANTHAR_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (CANTHAR_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itmw_zweihaender3,1);
		CreateInvItems(slf,itmw_rabenschnabel,1);
		CreateInvItems(slf,itmw_streitkolben,1);
		CANTHAR_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (CANTHAR_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,150);
		CreateInvItems(slf,itmw_elbastardo,1);
		CreateInvItems(slf,itmw_krummschwert,1);
		CreateInvItems(slf,itmw_sturmbringer,1);
		CANTHAR_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (CANTHAR_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		CANTHAR_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
	if((KAPITEL >= 6) && (CANTHAR_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,300);
		CANTHAR_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};
};

