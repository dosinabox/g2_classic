
func void b_spawn_skeleton_s1()
{
	if(SKELETT_SPAWN == FALSE)
	{
		Wld_InsertNpc(lesser_skeleton,"OC_EBR_DARK_FLOOR");
		SKELETT_SPAWN = TRUE;
	};
};

