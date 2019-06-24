
func void evt_monastery_secretlibrary_s1()
{
	if(SECRETLIBRARYISOPEN == FALSE)
	{
		b_giveplayerxp(XP_OPENSECRETLIBRARY);
		SECRETLIBRARYISOPEN = TRUE;
		Wld_InsertNpc(skeleton,"FP_ROAM_NW_KDF_LIBRARY_01");
		Wld_InsertNpc(skeleton,"FP_ROAM_NW_KDF_LIBRARY_02");
		Wld_InsertNpc(skeleton,"FP_ROAM_NW_KDF_LIBRARY_04");
		Wld_InsertNpc(skeleton,"FP_ROAM_NW_KDF_LIBRARY_25");
		Wld_InsertNpc(skeleton,"FP_ROAM_NW_KDF_LIBRARY_27");
		Wld_InsertNpc(skeleton,"FP_ROAM_NW_KDF_LIBRARY_17");
		Wld_InsertNpc(skeleton,"FP_ROAM_NW_KDF_LIBRARY_15");
		Wld_InsertNpc(skeleton,"FP_ROAM_NW_KDF_LIBRARY_16");
		Wld_InsertNpc(skeleton,"FP_ROAM_NW_KDF_LIBRARY_03");
		Wld_InsertNpc(skeleton,"FP_ROAM_NW_KDF_LIBRARY_06");
		Wld_InsertNpc(skeleton,"FP_ROAM_NW_KDF_LIBRARY_08");
		Wld_InsertNpc(skeleton,"FP_ROAM_NW_KDF_LIBRARY_14");
		Wld_InsertNpc(skeleton,"FP_ROAM_NW_KDF_LIBRARY_11");
		Wld_InsertNpc(skeleton,"FP_ROAM_NW_KDF_LIBRARY_12");
		Wld_InsertNpc(skeleton,"FP_ROAM_NW_KDF_LIBRARY_10");
		Wld_InsertNpc(secretlibraryskeleton,"FP_ROAM_NW_KDF_LIBRARY_29");
	};
	PrintScreen("",-1,-1,FONT_SCREEN,0);
};

