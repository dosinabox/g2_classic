
const int VALUE_APPLE = 8;
const int HP_APPLE = 3;
const int VALUE_CHEESE = 30;
const int HP_CHEESE = 15;
const int VALUE_BACON = 50;
const int HP_BACON = 20;
const int VALUE_BREAD = 20;
const int HP_BREAD = 10;
const int VALUE_FISH = 15;
const int HP_FISH = 5;
const int VALUE_RAWMEAT = 3;
const int HP_RAWMEAT = 6;
const int VALUE_MEAT = 6;
const int HP_MEAT = 12;
const int VALUE_STEW = 8;
const int HP_STEW = 20;
const int VALUE_FISHSOUP = 20;
const int HP_FISHSOUP = 10;
const int VALUE_SAUSAGE = 30;
const int HP_SAUSAGE = 12;
const int VALUE_HONEY = 30;
const int HP_HONEY = 12;
const int VALUE_WATER = 10;
const int HP_WATER = 8;
const int VALUE_BEER = 20;
const int HP_BEER = 3;
const int MANA_BEER = 1;
const int VALUE_BOOZE = 15;
const int HP_BOOZE = 4;
const int MANA_BOOZE = 1;
const int VALUE_WINE = 20;
const int HP_WINE = 2;
const int MANA_WINE = 1;
const int VALUE_MILK = 15;
const int HP_MILK = 5;
const int MANA_MILK = 1;

instance ITFO_APPLE(C_ITEM)
{
	name = "Яблоко";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_APPLE;
	visual = "ItFo_Apple.3DS";
	material = MAT_LEATHER;
	scemename = "FOOD";
	on_state[0] = use_apple;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_APPLE;
	text[3] = "Свежее яблоко,";
	text[4] = "твердое и сочное.";
	text[5] = NAME_VALUE;
	count[5] = VALUE_APPLE;
};


func void use_apple()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_APPLE);
	if(Npc_IsPlayer(self))
	{
		APPLE_BONUS = APPLE_BONUS + 1;
		if(APPLE_BONUS == 7)
		{
			Print(PRINT_EAT1);
		};
		if(APPLE_BONUS == 15)
		{
			Print(PRINT_EAT2);
		};
		if(APPLE_BONUS == 25)
		{
			Print(PRINT_EAT3);
			Npc_ChangeAttribute(self,ATR_STRENGTH,1);
			Print(PRINT_STR1);
			Snd_Play("LevelUp");
		};
	};
};


instance ITFO_CHEESE(C_ITEM)
{
	name = "Сыр";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_CHEESE;
	visual = "ItFo_Cheese.3DS";
	material = MAT_LEATHER;
	scemename = "FOODHUGE";
	on_state[0] = use_cheese;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_CHEESE;
	text[5] = NAME_VALUE;
	count[5] = VALUE_CHEESE;
};


func void use_cheese()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_CHEESE);
};


instance ITFO_BACON(C_ITEM)
{
	name = "Окорок";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_BACON;
	visual = "ItFo_Bacon.3ds";
	material = MAT_LEATHER;
	scemename = "FOODHUGE";
	on_state[0] = use_bacon;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_BACON;
	text[5] = NAME_VALUE;
	count[5] = VALUE_BACON;
};


func void use_bacon()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_BACON);
};


instance ITFO_BREAD(C_ITEM)
{
	name = "Хлеб";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_BREAD;
	visual = "ItFo_Bread.3DS";
	material = MAT_LEATHER;
	scemename = "FOODHUGE";
	on_state[0] = use_bread;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_BREAD;
	text[5] = NAME_VALUE;
	count[5] = VALUE_BREAD;
};


func void use_bread()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_BREAD);
};


instance ITFO_FISH(C_ITEM)
{
	name = "Рыба";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_FISH;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemename = "FOODHUGE";
	on_state[0] = use_fish;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_FISH;
	text[5] = NAME_VALUE;
	count[5] = VALUE_FISH;
};


func void use_fish()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_FISH);
};


instance ITFOMUTTONRAW(C_ITEM)
{
	name = "Сырое мясо";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_RAWMEAT;
	visual = "ItFoMuttonRaw.3DS";
	material = MAT_LEATHER;
	scemename = "MEAT";
	on_state[0] = use_rawmeat;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_RAWMEAT;
	text[5] = NAME_VALUE;
	count[5] = VALUE_RAWMEAT;
};


func void use_rawmeat()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_RAWMEAT);
};


instance ITFOMUTTON(C_ITEM)
{
	name = "Жареное мясо";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MEAT;
	visual = "ItFoMutton.3DS";
	material = MAT_LEATHER;
	scemename = "MEAT";
	on_state[0] = use_meat;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_MEAT;
	text[5] = NAME_VALUE;
	count[5] = VALUE_MEAT;
};


func void use_meat()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_MEAT);
};


instance ITFO_STEW(C_ITEM)
{
	name = "Похлебка";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_STEW;
	visual = "ItFo_Stew.3ds";
	material = MAT_WOOD;
	scemename = "RICE";
	on_state[0] = use_stew;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_STEW;
	text[5] = NAME_VALUE;
	count[5] = VALUE_STEW;
};


func void use_stew()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_STEW);
};


instance ITFO_XPSTEW(C_ITEM)
{
	name = "Похлебка Теклы";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_STEW;
	visual = "ItFo_XPStew.3ds";
	material = MAT_WOOD;
	scemename = "RICE";
	on_state[0] = use_xpstew;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_STEW;
	text[5] = NAME_VALUE;
	count[5] = VALUE_STEW;
};


func void use_xpstew()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_STEW);
	Print(PRINT_STR1);
	Snd_Play("LevelUp");
	Npc_ChangeAttribute(self,ATR_STRENGTH,1);
};


instance ITFO_CORAGONSBEER(C_ITEM)
{
	name = "Пиво";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_BEER;
	visual = "ItFo_CoragonsBeer.3DS";
	material = MAT_GLAS;
	scemename = "POTION";
	on_state[0] = use_coragonsbeerbeer;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_BEER;
	text[2] = NAME_BONUS_MANA;
	count[2] = MANA_BEER;
	text[4] = "Особое пиво Корагона";
	text[5] = NAME_VALUE;
	count[5] = VALUE_BEER;
};


func void use_coragonsbeerbeer()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,HP_BEER);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_BEER);
	Npc_ChangeAttribute(self,ATR_MANA_MAX,MANA_BEER);
	Npc_ChangeAttribute(self,ATR_MANA,MANA_BEER);
};


instance ITFO_FISHSOUP(C_ITEM)
{
	name = "Уха";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_FISHSOUP;
	visual = "ItFo_FishSoup.3ds";
	material = MAT_WOOD;
	scemename = "RICE";
	on_state[0] = use_fishsoup;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_FISHSOUP;
	text[5] = NAME_VALUE;
	count[5] = VALUE_FISHSOUP;
};


func void use_fishsoup()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_FISHSOUP);
};


instance ITFO_SAUSAGE(C_ITEM)
{
	name = "Колбаса";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_SAUSAGE;
	visual = "ItFo_Sausage.3DS";
	material = MAT_LEATHER;
	scemename = "FOODHUGE";
	on_state[0] = use_sausage;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_SAUSAGE;
	text[5] = NAME_VALUE;
	count[5] = VALUE_SAUSAGE;
};


func void use_sausage()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_SAUSAGE);
};


instance ITFO_HONEY(C_ITEM)
{
	name = "Мед";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_HONEY;
	visual = "ItFo_Honey.3DS";
	material = MAT_STONE;
	scemename = "FOODHUGE";
	on_state[0] = use_honey;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_HONEY;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HONEY;
};


func void use_honey()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_HONEY);
};


instance ITFO_WATER(C_ITEM)
{
	name = "Вода";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_WATER;
	visual = "ItFo_Water.3ds";
	material = MAT_GLAS;
	scemename = "POTION";
	on_state[0] = use_water;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_WATER;
	text[5] = NAME_VALUE;
	count[5] = VALUE_WATER;
};


func void use_water()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_WATER);
};


instance ITFO_BEER(C_ITEM)
{
	name = "Пиво";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_BEER;
	visual = "ItFo_Beer.3DS";
	material = MAT_GLAS;
	scemename = "POTION";
	on_state[0] = use_beer;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_BEER;
	text[2] = NAME_BONUS_MANA;
	count[2] = MANA_BEER;
	text[4] = "Темное паладинское";
	text[5] = NAME_VALUE;
	count[5] = VALUE_BEER;
};


func void use_beer()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_BEER);
	Npc_ChangeAttribute(self,ATR_MANA,MANA_BEER);
};


instance ITFO_BOOZE(C_ITEM)
{
	name = "Джин";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_BOOZE;
	visual = "ItFo_Booze.3DS";
	material = MAT_GLAS;
	scemename = "POTION";
	on_state[0] = use_booze;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_BOOZE;
	text[2] = NAME_BONUS_MANA;
	count[2] = MANA_BOOZE;
	text[5] = NAME_VALUE;
	count[5] = VALUE_BOOZE;
};


func void use_booze()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_BOOZE);
	Npc_ChangeAttribute(self,ATR_MANA,MANA_BOOZE);
};


instance ITFO_WINE(C_ITEM)
{
	name = "Вино";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_WINE;
	visual = "ItFo_Wine.3DS";
	material = MAT_GLAS;
	scemename = "POTION";
	on_state[0] = use_wine;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_WINE;
	text[2] = NAME_BONUS_MANA;
	count[2] = MANA_WINE;
	text[5] = NAME_VALUE;
	count[5] = VALUE_WINE;
};


func void use_wine()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_WINE);
	Npc_ChangeAttribute(self,ATR_MANA,MANA_WINE);
};


instance ITFO_MILK(C_ITEM)
{
	name = "Молоко";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MILK;
	visual = "ItFo_Milk.3DS";
	material = MAT_GLAS;
	scemename = "POTION";
	on_state[0] = use_milk;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_MILK;
	text[2] = NAME_BONUS_MANA;
	count[2] = MANA_MILK;
	text[5] = NAME_VALUE;
	count[5] = VALUE_MILK;
};


func void use_milk()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_MILK);
	Npc_ChangeAttribute(self,ATR_MANA,MANA_MILK);
};

