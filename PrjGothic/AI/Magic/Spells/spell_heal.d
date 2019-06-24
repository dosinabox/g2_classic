
const int SPL_COST_PALLIGHTHEAL = 5;
const int SPL_COST_PALMEDIUMHEAL = 10;
const int SPL_COST_PALFULLHEAL = 15;
const int SPL_COST_LIGHTHEAL = 5;
const int SPL_COST_MEDIUMHEAL = 7;
const int SPL_COST_FULLHEAL = 15;
const int SPL_HEAL_PALLIGHTHEAL = 100;
const int SPL_HEAL_PALMEDIUMHEAL = 200;
const int SPL_HEAL_PALFULLHEAL = 400;
const int SPL_HEAL_LIGHTHEAL = 100;
const int SPL_HEAL_MEDIUMHEAL = 200;
const int SPL_HEAL_FULLHEAL = 400;

instance SPELL_HEAL(C_SPELL_PROTO)
{
	time_per_mana = 0;
	spelltype = SPELL_NEUTRAL;
	targetcollectalgo = TARGET_COLLECT_CASTER;
	canturnduringinvest = 0;
};

instance SPELL_PALHEAL(C_SPELL_PROTO)
{
	time_per_mana = 0;
	spelltype = SPELL_NEUTRAL;
	targetcollectalgo = TARGET_COLLECT_CASTER;
	canturnduringinvest = 0;
};


func int spell_logic_pallightheal(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_PALLIGHTHEAL)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_palmediumheal(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_PALMEDIUMHEAL)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_palfullheal(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_PALFULLHEAL)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_lightheal(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_LIGHTHEAL)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_mediumheal(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_MEDIUMHEAL)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_fullheal(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_FULLHEAL)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_heal()
{
	if(Npc_GetActiveSpell(self) == SPL_LIGHTHEAL)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_LIGHTHEAL;
		Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_HEAL_LIGHTHEAL);
		return;
	};
	if(Npc_GetActiveSpell(self) == SPL_MEDIUMHEAL)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_MEDIUMHEAL;
		Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_HEAL_MEDIUMHEAL);
		return;
	};
	if(Npc_GetActiveSpell(self) == SPL_FULLHEAL)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_FULLHEAL;
		Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_HEAL_FULLHEAL);
		return;
	};
};

func void spell_cast_palheal()
{
	if(Npc_GetActiveSpell(self) == SPL_PALLIGHTHEAL)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_PALLIGHTHEAL;
		Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_HEAL_PALLIGHTHEAL);
		return;
	};
	if(Npc_GetActiveSpell(self) == SPL_PALMEDIUMHEAL)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_PALMEDIUMHEAL;
		Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_HEAL_PALMEDIUMHEAL);
		return;
	};
	if(Npc_GetActiveSpell(self) == SPL_PALFULLHEAL)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_PALFULLHEAL;
		Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_HEAL_PALFULLHEAL);
		return;
	};
};

