
var int evt_open_door_library_s1_onetime;

func void evt_open_door_library_s1()
{
	if(evt_open_door_library_s1_onetime == FALSE)
	{
		Snd_Play("DEM_Die");
		Wld_InsertNpc(skeleton,"FP_ROAM_NW_KDF_LIBRARY_19");
		Wld_InsertNpc(skeleton,"FP_ROAM_NW_KDF_LIBRARY_18");
		Wld_InsertNpc(skeleton,"FP_ROAM_NW_KDF_LIBRARY_30");
		Wld_InsertNpc(demon,"FP_ROAM_NW_KDF_LIBRARY_21");
		Wld_InsertNpc(demon,"FP_ROAM_NW_KDF_LIBRARY_22");
		Wld_InsertNpc(demonlord,"FP_ROAM_NW_KDF_LIBRARY_20");
		evt_open_door_library_s1_onetime = TRUE;
	};
};

