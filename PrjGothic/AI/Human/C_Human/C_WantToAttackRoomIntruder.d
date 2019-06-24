
func int c_wanttoattackroomintruder(var C_NPC slf)
{
	if((self.guild == GIL_MIL) || (self.guild == GIL_PAL) || (self.guild == GIL_SLD) || (self.guild == GIL_DJG) || (b_getplayercrime(self) != CRIME_NONE))
	{
		return TRUE;
	};
	return FALSE;
};

