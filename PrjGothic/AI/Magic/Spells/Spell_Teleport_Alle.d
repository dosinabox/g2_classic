
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
	if(self.attribute[ATR_MANA] < SPL_COST_TELEPORT)
	{
		return SPL_SENDSTOP;
	};
	if(manainvested == 0)
	{
		return SPL_NEXTLEVEL;
	};
	return SPL_SENDCAST;
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
	var int activeSpell;
	activeSpell = Npc_GetActiveSpell(self);
	if(activeSpell == SPL_PALTELEPORTSECRET)
	{
		B_TeleportBySpell(NEWWORLD_ZEN,"NW_PAL_SECRETCHAMBER");
	}
	else if(activeSpell == SPL_TELEPORTSEAPORT)
	{
		B_TeleportBySpell(NEWWORLD_ZEN,"HAFEN");
	}
	else if(activeSpell == SPL_TELEPORTMONASTERY)
	{
		B_TeleportBySpell(NEWWORLD_ZEN,"KLOSTER");
	}
	else if(activeSpell == SPL_TELEPORTFARM)
	{
		B_TeleportBySpell(NEWWORLD_ZEN,"BIGFARM");
	}
	else if(activeSpell == SPL_TELEPORTXARDAS)
	{
		B_TeleportBySpell(NEWWORLD_ZEN,"XARDAS");
	}
	else if(activeSpell == SPL_TELEPORTPASSNW)
	{
		B_TeleportBySpell(NEWWORLD_ZEN,"LEVELCHANGE");
	}
	else if(activeSpell == SPL_TELEPORTPASSOW)
	{
		B_TeleportBySpell(OLDWORLD_ZEN,"SPAWN_MOLERAT02_SPAWN01");
	}
	else if(activeSpell == SPL_TELEPORTOC)
	{
		B_TeleportBySpell(OLDWORLD_ZEN,"OC_MAGE_CENTER");
	}
	else if(activeSpell == SPL_TELEPORTOWDEMONTOWER)
	{
		B_TeleportBySpell(OLDWORLD_ZEN,"DT_E3_03");
	}
	else if(activeSpell == SPL_TELEPORTTAVERNE)
	{
		B_TeleportBySpell(NEWWORLD_ZEN,"NW_TAVERNE_04");
	};
};

