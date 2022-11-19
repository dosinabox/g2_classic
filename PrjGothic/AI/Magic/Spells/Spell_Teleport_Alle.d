
const int SPL_COST_TELEPORT = 5;

func void B_TeleportBySpell(var int level,var string waypoint)
{
	self.attribute[ATR_MANA] -= SPL_COST_TELEPORT;
	if(level == CURRENTLEVEL)
	{
		AI_Teleport(self,waypoint);
	}
	else
	{
		PrintScreen(PRINT_TELEPORTTOOFARAWAY,-1,YPOS_LEVELUP,FONT_SCREENSMALL,2);
	};
};

func int Teleport_Spell_Logic_Common(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_TELEPORT)
	{
		if(manainvested == 0)
		{
			return SPL_NEXTLEVEL;
		};
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
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


func void spell_cast_teleport()
{
	self.attribute[ATR_MANA] -= SPL_COST_TELEPORT;
	if(Npc_GetActiveSpell(self) == SPL_PALTELEPORTSECRET)
	{
		B_TeleportBySpell(NEWWORLD_ZEN,"NW_PAL_SECRETCHAMBER");
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTSEAPORT)
	{
		B_TeleportBySpell(NEWWORLD_ZEN,"HAFEN");
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTMONASTERY)
	{
		B_TeleportBySpell(NEWWORLD_ZEN,"KLOSTER");
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTFARM)
	{
		B_TeleportBySpell(NEWWORLD_ZEN,"BIGFARM");
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTXARDAS)
	{
		B_TeleportBySpell(NEWWORLD_ZEN,"XARDAS");
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTPASSNW)
	{
		B_TeleportBySpell(NEWWORLD_ZEN,"LEVELCHANGE");
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTPASSOW)
	{
		B_TeleportBySpell(OLDWORLD_ZEN,"SPAWN_MOLERAT02_SPAWN01");
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTOC)
	{
		B_TeleportBySpell(OLDWORLD_ZEN,"OC_MAGE_CENTER");
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTOWDEMONTOWER)
	{
		B_TeleportBySpell(OLDWORLD_ZEN,"DT_E3_03");
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTTAVERNE)
	{
		B_TeleportBySpell(NEWWORLD_ZEN,"NW_TAVERNE_04");
	};
};

