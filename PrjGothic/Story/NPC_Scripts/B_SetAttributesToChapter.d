
func void b_setattributestochapter(var C_NPC slf,var int kapitel)
{
	if(kapitel == 0)
	{
		slf.level = 5;
		slf.attribute[ATR_STRENGTH] = 10;
		slf.attribute[ATR_DEXTERITY] = 10;
		slf.attribute[ATR_MANA_MAX] = 0;
		slf.attribute[ATR_MANA] = 0;
		slf.attribute[ATR_HITPOINTS_MAX] = 40;
		slf.attribute[ATR_HITPOINTS] = 40;
	};
	if(kapitel == 1)
	{
		slf.level = 8;
		slf.attribute[ATR_STRENGTH] = 20;
		slf.attribute[ATR_DEXTERITY] = 20;
		slf.attribute[ATR_MANA_MAX] = 100;
		slf.attribute[ATR_MANA] = 100;
		slf.attribute[ATR_HITPOINTS_MAX] = 80;
		slf.attribute[ATR_HITPOINTS] = 80;
	};
	if(kapitel == 2)
	{
		slf.level = 12;
		slf.attribute[ATR_STRENGTH] = 40;
		slf.attribute[ATR_DEXTERITY] = 40;
		slf.attribute[ATR_MANA_MAX] = 100;
		slf.attribute[ATR_MANA] = 100;
		slf.attribute[ATR_HITPOINTS_MAX] = 120;
		slf.attribute[ATR_HITPOINTS] = 120;
	};
	if(kapitel == 3)
	{
		slf.level = 18;
		slf.attribute[ATR_STRENGTH] = 60;
		slf.attribute[ATR_DEXTERITY] = 60;
		slf.attribute[ATR_MANA_MAX] = 100;
		slf.attribute[ATR_MANA] = 100;
		slf.attribute[ATR_HITPOINTS_MAX] = 200;
		slf.attribute[ATR_HITPOINTS] = 200;
	};
	if(kapitel == 4)
	{
		slf.level = 24;
		slf.attribute[ATR_STRENGTH] = 80;
		slf.attribute[ATR_DEXTERITY] = 80;
		slf.attribute[ATR_MANA_MAX] = 100;
		slf.attribute[ATR_MANA] = 100;
		slf.attribute[ATR_HITPOINTS_MAX] = 300;
		slf.attribute[ATR_HITPOINTS] = 300;
	};
	if(kapitel == 5)
	{
		slf.level = 30;
		slf.attribute[ATR_STRENGTH] = 100;
		slf.attribute[ATR_DEXTERITY] = 100;
		slf.attribute[ATR_MANA_MAX] = 100;
		slf.attribute[ATR_MANA] = 100;
		slf.attribute[ATR_HITPOINTS_MAX] = 400;
		slf.attribute[ATR_HITPOINTS] = 400;
	};
	if(kapitel >= 6)
	{
		slf.level = 36;
		slf.attribute[ATR_STRENGTH] = 120;
		slf.attribute[ATR_DEXTERITY] = 120;
		slf.attribute[ATR_MANA_MAX] = 100;
		slf.attribute[ATR_MANA] = 100;
		slf.attribute[ATR_HITPOINTS_MAX] = 500;
		slf.attribute[ATR_HITPOINTS] = 500;
	};
	slf.exp = 500 * ((slf.level + 1) / 2) * (slf.level + 1);
	slf.exp_next = 500 * ((slf.level + 2) / 2) * (slf.level + 1);
};

