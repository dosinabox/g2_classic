
var int ignaz_itemsgiven_chapter_1;
var int ignaz_itemsgiven_chapter_2;
var int ignaz_itemsgiven_chapter_3;
var int ignaz_itemsgiven_chapter_4;
var int ignaz_itemsgiven_chapter_5;
var int ignaz_itemsgiven_chapter_6;

func void b_givetradeinv_ignaz(var C_NPC slf)
{
	if((KAPITEL >= 1) && (IGNAZ_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itpo_mana_01,1);
		CreateInvItems(slf,itpo_health_01,1);
		CreateInvItems(slf,itpo_speed,1);
		CreateInvItems(slf,itsc_charm,3);
		CreateInvItems(slf,itmi_flask,10);
		IGNAZ_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (IGNAZ_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		CreateInvItems(slf,itpo_mana_01,2);
		CreateInvItems(slf,itpo_health_01,2);
		CreateInvItems(slf,itpo_speed,2);
		CreateInvItems(slf,itsc_charm,4);
		CreateInvItems(slf,itmi_flask,10);
		IGNAZ_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (IGNAZ_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,300);
		CreateInvItems(slf,itpo_mana_01,3);
		CreateInvItems(slf,itpo_health_01,3);
		CreateInvItems(slf,itpo_speed,3);
		CreateInvItems(slf,itsc_charm,5);
		CreateInvItems(slf,itmi_flask,10);
		IGNAZ_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (IGNAZ_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,400);
		CreateInvItems(slf,itpo_mana_01,4);
		CreateInvItems(slf,itpo_health_01,4);
		CreateInvItems(slf,itpo_speed,4);
		CreateInvItems(slf,itsc_charm,6);
		CreateInvItems(slf,itmi_flask,10);
		IGNAZ_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (IGNAZ_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,500);
		CreateInvItems(slf,itpo_mana_01,5);
		CreateInvItems(slf,itpo_health_01,5);
		CreateInvItems(slf,itpo_speed,5);
		CreateInvItems(slf,itsc_charm,7);
		CreateInvItems(slf,itmi_flask,10);
		IGNAZ_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
	if((KAPITEL >= 6) && (IGNAZ_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,600);
		CreateInvItems(slf,itpo_mana_01,6);
		CreateInvItems(slf,itpo_health_01,6);
		CreateInvItems(slf,itpo_speed,6);
		CreateInvItems(slf,itsc_charm,8);
		CreateInvItems(slf,itmi_flask,10);
		CreateInvItems(slf,itpo_perm_health,1);
		IGNAZ_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};
};

