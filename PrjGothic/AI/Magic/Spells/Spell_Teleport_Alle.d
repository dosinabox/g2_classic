
const int SPL_COST_TELEPORT = 5;

func void b_printteleporttoofaraway(var int level)
{
	if(level != CURRENTLEVEL)
	{
		PrintScreen(PRINT_TELEPORTTOOFARAWAY,-1,YPOS_LEVELUP,FONT_SCREENSMALL,2);
	};
};


instance SPELL_TELEPORT(C_SPELL_PROTO)
{
	time_per_mana = 0;
	spelltype = SPELL_NEUTRAL;
	targetcollectalgo = TARGET_COLLECT_CASTER;
	canturnduringinvest = 0;
	targetcollectrange = 0;
	targetcollectazi = 0;
	targetcollectelev = 0;
};


func int spell_logic_palteleportsecret(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_TELEPORT)
	{
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

func void spell_cast_palteleportsecret()
{
	b_printteleporttoofaraway(NEWWORLD_ZEN);
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TELEPORT;
	AI_Teleport(self,"NW_PAL_SECRETCHAMBER");
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
};

func int spell_logic_teleportseaport(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_TELEPORT)
	{
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

func void spell_cast_teleportseaport()
{
	b_printteleporttoofaraway(NEWWORLD_ZEN);
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TELEPORT;
	AI_Teleport(self,"HAFEN");
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
};

func int spell_logic_teleportmonastery(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_TELEPORT)
	{
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

func void spell_cast_teleportmonastery()
{
	b_printteleporttoofaraway(NEWWORLD_ZEN);
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TELEPORT;
	AI_Teleport(self,"KLOSTER");
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
};

func int spell_logic_teleportfarm(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_TELEPORT)
	{
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

func void spell_cast_teleportfarm()
{
	b_printteleporttoofaraway(NEWWORLD_ZEN);
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TELEPORT;
	AI_Teleport(self,"BIGFARM");
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
};

func int spell_logic_teleportxardas(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_TELEPORT)
	{
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

func void spell_cast_teleportxardas()
{
	b_printteleporttoofaraway(NEWWORLD_ZEN);
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TELEPORT;
	AI_Teleport(self,"XARDAS");
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
};

func int spell_logic_teleportpassnw(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_TELEPORT)
	{
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

func void spell_cast_teleportpassnw()
{
	b_printteleporttoofaraway(NEWWORLD_ZEN);
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TELEPORT;
	AI_Teleport(self,"LEVELCHANGE");
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
};

func int spell_logic_teleportpassow(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_TELEPORT)
	{
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

func void spell_cast_teleportpassow()
{
	b_printteleporttoofaraway(OLDWORLD_ZEN);
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TELEPORT;
	AI_Teleport(self,"SPAWN_MOLERAT02_SPAWN01");
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
};

func int spell_logic_teleportoc(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_TELEPORT)
	{
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

func void spell_cast_teleportoc()
{
	b_printteleporttoofaraway(OLDWORLD_ZEN);
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TELEPORT;
	AI_Teleport(self,"OC_MAGE_CENTER");
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
};

func int spell_logic_teleportowdemontower(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_TELEPORT)
	{
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

func void spell_cast_teleportowdemontower()
{
	b_printteleporttoofaraway(OLDWORLD_ZEN);
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TELEPORT;
	AI_Teleport(self,"DT_E3_03");
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
};

func int spell_logic_teleporttaverne(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_TELEPORT)
	{
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

func void spell_cast_teleporttaverne()
{
	b_printteleporttoofaraway(NEWWORLD_ZEN);
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TELEPORT;
	AI_Teleport(self,"NW_TAVERNE_04");
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
};

func void spell_cast_teleport()
{
	if(Npc_GetActiveSpell(self) == SPL_PALTELEPORTSECRET)
	{
		spell_cast_palteleportsecret();
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTSEAPORT)
	{
		spell_cast_teleportseaport();
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTMONASTERY)
	{
		spell_cast_teleportmonastery();
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTFARM)
	{
		spell_cast_teleportfarm();
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTXARDAS)
	{
		spell_cast_teleportxardas();
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTPASSNW)
	{
		spell_cast_teleportpassnw();
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTPASSOW)
	{
		spell_cast_teleportpassow();
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTOC)
	{
		spell_cast_teleportoc();
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTOWDEMONTOWER)
	{
		spell_cast_teleportowdemontower();
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTTAVERNE)
	{
		spell_cast_teleporttaverne();
	};
};

