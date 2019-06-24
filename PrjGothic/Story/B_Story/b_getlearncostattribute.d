
func int b_getlearncostattribute(var C_NPC oth,var int attribut)
{
	var int kosten;
	if((attribut == ATR_STRENGTH) || (attribut == ATR_DEXTERITY) || (attribut == ATR_MANA_MAX))
	{
		if((oth.guild == GIL_KDF) || (oth.guild == GIL_NOV))
		{
			if(attribut == ATR_STRENGTH)
			{
				kosten = 2;
			};
			if(attribut == ATR_DEXTERITY)
			{
				kosten = 2;
			};
			if(attribut == ATR_MANA_MAX)
			{
				kosten = 1;
			};
		}
		else
		{
			if(attribut == ATR_STRENGTH)
			{
				kosten = 1;
			};
			if(attribut == ATR_DEXTERITY)
			{
				kosten = 1;
			};
			if(attribut == ATR_MANA_MAX)
			{
				kosten = 2;
			};
		};
	};
	return kosten;
};

