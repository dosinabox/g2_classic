
func int c_predatorfoundprey(var C_NPC slf,var C_NPC oth)
{
	if(slf.guild == GIL_WOLF)
	{
		if(oth.guild == GIL_SHEEP)
		{
			return TRUE;
		};
		if(oth.guild == GIL_GIANT_RAT)
		{
			return TRUE;
		};
		if(oth.guild == GIL_MOLERAT)
		{
			return TRUE;
		};
		if(oth.guild == GIL_SCAVENGER)
		{
			return TRUE;
		};
	};
	if(slf.guild == GIL_LURKER)
	{
		if(oth.guild == GIL_GOBBO)
		{
			return TRUE;
		};
	};
	if(slf.guild == GIL_SNAPPER)
	{
		if(oth.guild < GIL_SEPERATOR_HUM)
		{
			return TRUE;
		};
		if(oth.guild == GIL_GOBBO)
		{
			return TRUE;
		};
		if(oth.guild == GIL_SHEEP)
		{
			return TRUE;
		};
		if(oth.guild == GIL_GIANT_RAT)
		{
			return TRUE;
		};
		if(oth.guild == GIL_MOLERAT)
		{
			return TRUE;
		};
		if(oth.guild == GIL_SCAVENGER)
		{
			return TRUE;
		};
	};
	if(slf.guild == GIL_SHADOWBEAST)
	{
		if(oth.guild < GIL_SEPERATOR_HUM)
		{
			return TRUE;
		};
		if(oth.guild > GIL_SEPERATOR_ORC)
		{
			return TRUE;
		};
		if(oth.guild == GIL_SHEEP)
		{
			return TRUE;
		};
		if(oth.guild == GIL_GIANT_RAT)
		{
			return TRUE;
		};
		if(oth.guild == GIL_MOLERAT)
		{
			return TRUE;
		};
		if(oth.guild == GIL_SCAVENGER)
		{
			return TRUE;
		};
	};
	return FALSE;
};

