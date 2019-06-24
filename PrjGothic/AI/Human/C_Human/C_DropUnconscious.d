
func int c_dropunconscious()
{
	if((other.guild > GIL_SEPERATOR_HUM) || (other.guild == GIL_DMT) || (other.guild == GIL_BDT) || (other.aivar[AIV_DROPDEADANDKILL] == TRUE))
	{
		return FALSE;
	};
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		if((self.guild != GIL_DMT) && (self.guild != GIL_BDT) && (self.aivar[AIV_DROPDEADANDKILL] == FALSE))
		{
			return TRUE;
		};
	};
	return FALSE;
};

