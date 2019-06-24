
var int evt_crypt_01_onetime;

func void evt_crypt_01()
{
	if(evt_crypt_01_onetime == FALSE)
	{
		Wld_InsertNpc(lesser_skeleton,"EVT_CRYPT_ROOM_01_SPAWN_01");
		Wld_InsertNpc(lesser_skeleton,"EVT_CRYPT_ROOM_01_SPAWN_02");
		Wld_InsertNpc(skeleton,"EVT_CRYPT_ROOM_01_SPAWN_03");
		Wld_InsertNpc(skeleton,"EVT_CRYPT_ROOM_01_SPAWN_04");
		Wld_InsertNpc(lesser_skeleton,"EVT_CRYPT_ROOM_01_SPAWN_05");
		Wld_InsertNpc(lesser_skeleton,"EVT_CRYPT_ROOM_01_SPAWN_06");
		Wld_InsertNpc(skeletonmage,"EVT_CRYPT_ROOM_01_SPAWN_07");
		evt_crypt_01_onetime = TRUE;
	};
};


var int evt_crypt_02_onetime;

func void evt_crypt_02()
{
	if(evt_crypt_02_onetime == FALSE)
	{
		Wld_InsertNpc(lesser_skeleton,"EVT_CRYPT_ROOM_02_SPAWN_01");
		Wld_InsertNpc(lesser_skeleton,"EVT_CRYPT_ROOM_02_SPAWN_02");
		Wld_InsertNpc(skeleton,"EVT_CRYPT_ROOM_02_SPAWN_03");
		Wld_InsertNpc(skeleton,"EVT_CRYPT_ROOM_02_SPAWN_04");
		Wld_InsertNpc(lesser_skeleton,"EVT_CRYPT_ROOM_02_SPAWN_05");
		Wld_InsertNpc(lesser_skeleton,"EVT_CRYPT_ROOM_02_SPAWN_06");
		Wld_InsertNpc(skeletonmage,"EVT_CRYPT_ROOM_02_SPAWN_07");
		evt_crypt_02_onetime = TRUE;
	};
};


var int evt_crypt_03_onetime;

func void evt_crypt_03()
{
	if(evt_crypt_03_onetime == FALSE)
	{
		Wld_InsertNpc(lesser_skeleton,"EVT_CRYPT_ROOM_03_SPAWN_01");
		Wld_InsertNpc(lesser_skeleton,"EVT_CRYPT_ROOM_03_SPAWN_02");
		Wld_InsertNpc(skeleton,"EVT_CRYPT_ROOM_03_SPAWN_03");
		Wld_InsertNpc(skeleton,"EVT_CRYPT_ROOM_03_SPAWN_04");
		Wld_InsertNpc(lesser_skeleton,"EVT_CRYPT_ROOM_03_SPAWN_05");
		Wld_InsertNpc(lesser_skeleton,"EVT_CRYPT_ROOM_03_SPAWN_06");
		Wld_InsertNpc(skeletonmage,"EVT_CRYPT_ROOM_03_SPAWN_07");
		evt_crypt_03_onetime = TRUE;
	};
};


var int evt_crypt_final_onetime;

func void evt_crypt_final()
{
	if(evt_crypt_final_onetime == FALSE)
	{
		Wld_InsertNpc(skeleton,"EVT_CRYPT_ROOM_FINAL_SPAWN_01");
		Wld_InsertNpc(skeleton,"EVT_CRYPT_ROOM_FINAL_SPAWN_02");
		Wld_InsertNpc(skeletonmage,"EVT_CRYPT_ROOM_FINAL_SPAWN_03");
		Wld_InsertNpc(skeletonmage,"EVT_CRYPT_ROOM_FINAL_SPAWN_04");
		Wld_InsertNpc(skeletonmage,"EVT_CRYPT_ROOM_FINAL_SPAWN_05");
		Wld_InsertNpc(crypt_skeleton_lord,"EVT_CRYPT_ROOM_FINAL_SPAWN_06");
		evt_crypt_final_onetime = TRUE;
	};
};

func void evt_crypt_room_01_triggerentrance()
{
	crypt_skeleton_room_01.aivar[AIV_ENEMYOVERRIDE] = FALSE;
};

func void evt_crypt_room_02_triggerentrance()
{
	crypt_skeleton_room_02.aivar[AIV_ENEMYOVERRIDE] = FALSE;
};

func void evt_crypt_room_03_triggerentrance()
{
	crypt_skeleton_room_03.aivar[AIV_ENEMYOVERRIDE] = FALSE;
};

