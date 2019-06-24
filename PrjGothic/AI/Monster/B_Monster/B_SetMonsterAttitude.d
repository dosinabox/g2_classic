
func void b_setmonsterattitude(var int fromguild,var int attitude,var int toguild)
{
	if(toguild == GIL_SEPERATOR_HUM)
	{
		Wld_SetGuildAttitude(fromguild,attitude,GIL_NONE);
		Wld_SetGuildAttitude(fromguild,attitude,GIL_PAL);
		Wld_SetGuildAttitude(fromguild,attitude,GIL_MIL);
		Wld_SetGuildAttitude(fromguild,attitude,GIL_VLK);
		Wld_SetGuildAttitude(fromguild,attitude,GIL_KDF);
		Wld_SetGuildAttitude(fromguild,attitude,GIL_NOV);
		Wld_SetGuildAttitude(fromguild,attitude,GIL_DJG);
		Wld_SetGuildAttitude(fromguild,attitude,GIL_SLD);
		Wld_SetGuildAttitude(fromguild,attitude,GIL_BAU);
		Wld_SetGuildAttitude(fromguild,attitude,GIL_BDT);
		Wld_SetGuildAttitude(fromguild,attitude,GIL_STRF);
		Wld_SetGuildAttitude(fromguild,attitude,GIL_OUT);
	}
	else if(fromguild == GIL_SEPERATOR_HUM)
	{
		Wld_SetGuildAttitude(GIL_NONE,attitude,toguild);
		Wld_SetGuildAttitude(GIL_PAL,attitude,toguild);
		Wld_SetGuildAttitude(GIL_MIL,attitude,toguild);
		Wld_SetGuildAttitude(GIL_VLK,attitude,toguild);
		Wld_SetGuildAttitude(GIL_KDF,attitude,toguild);
		Wld_SetGuildAttitude(GIL_NOV,attitude,toguild);
		Wld_SetGuildAttitude(GIL_DJG,attitude,toguild);
		Wld_SetGuildAttitude(GIL_SLD,attitude,toguild);
		Wld_SetGuildAttitude(GIL_BAU,attitude,toguild);
		Wld_SetGuildAttitude(GIL_BDT,attitude,toguild);
		Wld_SetGuildAttitude(GIL_STRF,attitude,toguild);
		Wld_SetGuildAttitude(GIL_OUT,attitude,toguild);
	}
	else
	{
		Wld_SetGuildAttitude(fromguild,attitude,toguild);
	};
};

