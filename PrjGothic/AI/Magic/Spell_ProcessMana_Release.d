
func int spell_processmana_release(var int manainvested)
{
	if(Npc_GetActiveSpell(self) == SPL_PYROKINESIS)
	{
		return SPL_SENDCAST;
	};
	if(Npc_GetActiveSpell(self) == SPL_CHARGEFIREBALL)
	{
		return SPL_SENDCAST;
	};
	if(Npc_GetActiveSpell(self) == SPL_CHARGEZAP)
	{
		return SPL_SENDCAST;
	};
	if(Npc_GetActiveSpell(self) == SPL_WINDFIST)
	{
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

