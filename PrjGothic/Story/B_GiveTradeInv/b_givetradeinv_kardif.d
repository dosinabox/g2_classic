
var int kardif_itemsgiven_chapter_1;
var int kardif_itemsgiven_chapter_2;
var int kardif_itemsgiven_chapter_3;
var int kardif_itemsgiven_chapter_4;
var int kardif_itemsgiven_chapter_5;
var int kardif_itemsgiven_chapter_6;

func void b_givetradeinv_kardif(var C_NPC slf)
{
	if((KAPITEL >= 1) && (KARDIF_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,80);
		CreateInvItems(slf,itfo_fishsoup,3);
		CreateInvItems(slf,itfomutton,1);
		CreateInvItems(slf,itfo_fish,4);
		CreateInvItems(slf,itfo_booze,2);
		CreateInvItems(slf,itfo_beer,4);
		CreateInvItems(slf,itfo_wine,3);
		KARDIF_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (KARDIF_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itfo_sausage,2);
		CreateInvItems(slf,itfo_fish,4);
		CreateInvItems(slf,itfo_booze,2);
		CreateInvItems(slf,itfo_beer,4);
		CreateInvItems(slf,itfo_wine,3);
		if(KNOWS_SECRETSIGN == TRUE)
		{
			CreateInvItems(self,itke_lockpick,20);
		};
		KARDIF_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (KARDIF_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,150);
		CreateInvItems(slf,itfo_sausage,2);
		CreateInvItems(slf,itfo_fishsoup,3);
		CreateInvItems(slf,itfomutton,1);
		CreateInvItems(slf,itfo_wine,1);
		CreateInvItems(slf,itfo_beer,4);
		if(KNOWS_SECRETSIGN == TRUE)
		{
			CreateInvItems(self,itke_lockpick,20);
		};
		KARDIF_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (KARDIF_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		CreateInvItems(slf,itfo_sausage,2);
		CreateInvItems(slf,itfo_fishsoup,3);
		CreateInvItems(slf,itfomutton,1);
		CreateInvItems(slf,itfo_fish,4);
		CreateInvItems(slf,itfo_wine,1);
		CreateInvItems(slf,itfo_booze,2);
		CreateInvItems(slf,itfo_beer,4);
		if(KNOWS_SECRETSIGN == TRUE)
		{
			CreateInvItems(self,itke_lockpick,20);
		};
		KARDIF_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (KARDIF_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,300);
		CreateInvItems(slf,itfo_sausage,3);
		CreateInvItems(slf,itfo_fishsoup,5);
		CreateInvItems(slf,itfomutton,7);
		CreateInvItems(slf,itfo_fish,8);
		CreateInvItems(slf,itfo_wine,3);
		CreateInvItems(slf,itfo_booze,4);
		CreateInvItems(slf,itfo_beer,4);
		if(KNOWS_SECRETSIGN == TRUE)
		{
			CreateInvItems(self,itke_lockpick,20);
		};
		KARDIF_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
	if((KAPITEL >= 6) && (KARDIF_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,300);
		CreateInvItems(slf,itfo_sausage,3);
		CreateInvItems(slf,itfo_fishsoup,4);
		CreateInvItems(slf,itfomutton,2);
		CreateInvItems(slf,itfo_fish,5);
		CreateInvItems(slf,itfo_wine,2);
		CreateInvItems(slf,itfo_booze,6);
		CreateInvItems(slf,itfo_beer,1);
		if(KNOWS_SECRETSIGN == TRUE)
		{
			CreateInvItems(self,itke_lockpick,20);
		};
		KARDIF_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};
};

