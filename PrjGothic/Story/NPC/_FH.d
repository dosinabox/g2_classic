
instance FH(NPC_DEFAULT)
{
	name[0] = "Помощник по лицам";
	npctype = NPCTYPE_FRIEND;
	guild = GIL_NONE;
	level = 999;
	voice = 5;
	id = 1311;
	flags = 0;
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 50;
	attribute[ATR_MANA] = 50;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,0,"Hum_Head_Bald",0,0,NO_ARMOR);
	fight_tactic = FAI_HUMAN_STRONG;
	daily_routine = rtn_start_1311;
};


func void rtn_start_1311()
{
	ta_smalltalk(8,0,23,0,"XXX");
	ta_smalltalk(23,0,8,0,"XXX");
};

