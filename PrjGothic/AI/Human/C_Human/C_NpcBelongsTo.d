
func int c_npcbelongstooldcamp(var C_NPC slf)
{
	if((slf.npctype == NPCTYPE_OCMAIN) || (slf.npctype == NPCTYPE_OCAMBIENT))
	{
		if((slf.guild == GIL_VLK) || (slf.guild == GIL_MIL) || (slf.guild == GIL_PAL))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func int c_npcbelongstocity(var C_NPC slf)
{
	if(!c_npcbelongstooldcamp(slf))
	{
		if((slf.guild == GIL_VLK) || (slf.guild == GIL_MIL) || (slf.guild == GIL_PAL))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func int c_npcbelongstomonastery(var C_NPC slf)
{
	if((slf.guild == GIL_KDF) || (slf.guild == GIL_NOV))
	{
		return TRUE;
	};
	return FALSE;
};

func int c_npcbelongstofarm(var C_NPC slf)
{
	if((slf.guild == GIL_BAU) || (slf.guild == GIL_SLD))
	{
		return TRUE;
	};
	return FALSE;
};

