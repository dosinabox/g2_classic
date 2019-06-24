
func void g_cannotuse(var int bisplayer,var int nattribute,var int nvalue)
{
	var string strmessage;
	var string strattributemissing;
	var int nattributevalue;
	var int ndifference;
	var string strdifference;
	if(nattribute == ATR_HITPOINTS)
	{
		strattributemissing = PRINT_HITPOINTS_MISSING;
		nattributevalue = self.attribute[ATR_HITPOINTS];
	}
	else if(nattribute == ATR_HITPOINTS_MAX)
	{
		strattributemissing = PRINT_HITPOINTS_MAX_MISSING;
		nattributevalue = self.attribute[ATR_HITPOINTS_MAX];
	}
	else if(nattribute == ATR_MANA)
	{
		strattributemissing = PRINT_MANA_MISSING;
		nattributevalue = self.attribute[ATR_MANA];
	}
	else if(nattribute == ATR_MANA_MAX)
	{
		strattributemissing = PRINT_MANA_MAX_MISSING;
		nattributevalue = self.attribute[ATR_MANA_MAX];
	}
	else if(nattribute == ATR_STRENGTH)
	{
		strattributemissing = PRINT_STRENGTH_MISSING;
		nattributevalue = self.attribute[ATR_STRENGTH];
	}
	else if(nattribute == ATR_DEXTERITY)
	{
		strattributemissing = PRINT_DEXTERITY_MISSING;
		nattributevalue = self.attribute[ATR_DEXTERITY];
	}
	else
	{
		strattributemissing = "";
		nattributevalue = 0;
	};
	ndifference = nvalue - nattributevalue;
	strdifference = IntToString(ndifference);
	strmessage = strdifference;
	strmessage = ConcatStrings(strmessage," ");
	strmessage = ConcatStrings(strmessage,strattributemissing);
	if(bisplayer)
	{
		Print(strmessage);
	};
};

