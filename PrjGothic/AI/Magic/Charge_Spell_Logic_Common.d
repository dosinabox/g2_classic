
func int charge_spell_logic_common(var int manainvested,var int manacost)
{
	if((manainvested == manacost * 4 / 10) || (manainvested == 0))
	{
		if(manainvested == 0)
		{
			self.aivar[AIV_SpellLevel] = 0;
		}
		else
		{
			self.aivar[AIV_SpellLevel] += 1;
		};
		return SPL_FORCEINVEST + (manacost * 2 / 10);
	};
	if((self.aivar[AIV_SpellLevel] == 1) || (self.aivar[AIV_SpellLevel] == 2) || (self.aivar[AIV_SpellLevel] == 3))
	{
		if(manainvested == (manacost * 4 / 10) - 1)
		{
			return SPL_NEXTLEVEL;
		};
	};
	if(self.aivar[AIV_SpellLevel] >= 4)
	{
		return SPL_DONTINVEST;
	};
	return SPL_STATUS_CANINVEST_NO_MANADEC;
};

