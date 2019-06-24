
func void b_assigndragontalk(var C_NPC slf)
{
	if(slf.guild == GIL_DRAGON)
	{
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(swampdragon))
		{
			b_assigndragontalk_swamp(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(rockdragon))
		{
			b_assigndragontalk_rock(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(firedragon))
		{
			b_assigndragontalk_fire(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(icedragon))
		{
			b_assigndragontalk_ice(slf);
		};
	};
};

