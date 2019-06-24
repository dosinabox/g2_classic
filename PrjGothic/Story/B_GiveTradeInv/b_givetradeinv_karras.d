
var int karras_itemsgiven_chapter_1;
var int karras_itemsgiven_chapter_2;
var int karras_itemsgiven_chapter_3;
var int karras_itemsgiven_chapter_4;
var int karras_itemsgiven_chapter_5;
var int karras_itemsgiven_chapter_6;

func void b_givetradeinv_karras(var C_NPC slf)
{
	if((KAPITEL >= 1) && (KARRAS_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itsc_sumgobskel,1);
		KARRAS_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (ENTEROW_KAPITEL2 == TRUE) && (KARRAS_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itsc_trfsheep,1);
		CreateInvItems(slf,itsc_trfscavenger,1);
		CreateInvItems(slf,itsc_trfgiantrat,1);
		CreateInvItems(slf,itsc_trfgiantbug,1);
		CreateInvItems(slf,itsc_trfwolf,1);
		CreateInvItems(slf,itsc_sumgobskel,1);
		CreateInvItems(slf,itsc_sumwolf,1);
		KARRAS_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (KARRAS_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itsc_trfsheep,3);
		CreateInvItems(slf,itsc_trfscavenger,3);
		CreateInvItems(slf,itsc_trfgiantrat,3);
		CreateInvItems(slf,itsc_trfgiantbug,3);
		CreateInvItems(slf,itsc_trfwolf,3);
		CreateInvItems(slf,itsc_trfwaran,3);
		CreateInvItems(slf,itsc_trfsnapper,3);
		CreateInvItems(slf,itsc_sumgobskel,1);
		CreateInvItems(slf,itsc_sumwolf,1);
		CreateInvItems(slf,itsc_sumskel,1);
		KARRAS_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (KARRAS_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,150);
		CreateInvItems(slf,itsc_trfsheep,4);
		CreateInvItems(slf,itsc_trfscavenger,4);
		CreateInvItems(slf,itsc_trfgiantrat,4);
		CreateInvItems(slf,itsc_trfgiantbug,2);
		CreateInvItems(slf,itsc_trfwolf,2);
		CreateInvItems(slf,itsc_trfwaran,2);
		CreateInvItems(slf,itsc_trfsnapper,2);
		CreateInvItems(slf,itsc_trfwarg,2);
		CreateInvItems(slf,itsc_trffirewaran,2);
		CreateInvItems(slf,itsc_sumgobskel,1);
		CreateInvItems(slf,itsc_sumwolf,1);
		CreateInvItems(slf,itsc_sumskel,1);
		CreateInvItems(slf,itsc_sumgol,1);
		KARRAS_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (KARRAS_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		CreateInvItems(slf,itsc_trfsheep,4);
		CreateInvItems(slf,itsc_trfscavenger,4);
		CreateInvItems(slf,itsc_trfgiantrat,4);
		CreateInvItems(slf,itsc_trfgiantbug,2);
		CreateInvItems(slf,itsc_trfwolf,2);
		CreateInvItems(slf,itsc_trfwaran,2);
		CreateInvItems(slf,itsc_trfsnapper,2);
		CreateInvItems(slf,itsc_trfwarg,2);
		CreateInvItems(slf,itsc_trffirewaran,2);
		CreateInvItems(slf,itsc_trflurker,2);
		CreateInvItems(slf,itsc_trfshadowbeast,2);
		CreateInvItems(slf,itsc_trfdragonsnapper,2);
		CreateInvItems(slf,itsc_sumgobskel,1);
		CreateInvItems(slf,itsc_sumwolf,1);
		CreateInvItems(slf,itsc_sumskel,1);
		CreateInvItems(slf,itsc_sumgol,1);
		CreateInvItems(slf,itsc_sumdemon,1);
		CreateInvItems(slf,itsc_armyofdarkness,1);
		KARRAS_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
	if((KAPITEL >= 6) && (KARRAS_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,300);
		CreateInvItems(slf,itsc_trfsheep,1);
		CreateInvItems(slf,itsc_trfscavenger,2);
		CreateInvItems(slf,itsc_trfgiantrat,1);
		CreateInvItems(slf,itsc_trfgiantbug,2);
		CreateInvItems(slf,itsc_trfwolf,2);
		CreateInvItems(slf,itsc_trfwaran,2);
		CreateInvItems(slf,itsc_trfsnapper,2);
		CreateInvItems(slf,itsc_trfwarg,2);
		CreateInvItems(slf,itsc_trffirewaran,2);
		CreateInvItems(slf,itsc_trflurker,2);
		CreateInvItems(slf,itsc_trfshadowbeast,2);
		CreateInvItems(slf,itsc_trfdragonsnapper,2);
		CreateInvItems(slf,itsc_sumgobskel,1);
		CreateInvItems(slf,itsc_sumwolf,1);
		CreateInvItems(slf,itsc_sumskel,1);
		CreateInvItems(slf,itsc_sumgol,1);
		CreateInvItems(slf,itsc_sumdemon,1);
		CreateInvItems(slf,itsc_armyofdarkness,1);
		KARRAS_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};
};

