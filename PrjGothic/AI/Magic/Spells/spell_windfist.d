
const int SPL_COST_WINDFIST = 50;
const int SPL_DAMAGE_WINDFIST = 20;

instance SPELL_WINDFIST(C_SPELL_PROTO)
{
	time_per_mana = 200;
	damage_per_level = SPL_DAMAGE_WINDFIST;
	damagetype = DAM_FLY;
	targetcollectalgo = TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetcollectrange = 1200;
	targetcollecttype = TARGET_TYPE_NPCS;
};


func int spell_logic_windfist(var int manainvested)
{
	if(manainvested == 0)
	{
		return SPL_FORCEINVEST + ((SPL_COST_CHARGEFIREBALL * 2) / 10);
	};
	if((manainvested == ((SPL_COST_WINDFIST * 4) / 10)) || (manainvested == ((SPL_COST_WINDFIST * 6) / 10)) || (manainvested == ((SPL_COST_WINDFIST * 7) / 10)))
	{
		return SPL_NEXTLEVEL;
	};
	if(manainvested >= SPL_COST_WINDFIST)
	{
		return SPL_DONTINVEST;
	};
	return SPL_RECEIVEINVEST;
};

