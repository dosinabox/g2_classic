
func void b_extro_avi()
{
	if((Npc_IsDead(pc_thief_di) == FALSE) && (Npc_IsDead(pc_fighter_di) == FALSE))
	{
		DIEGANDGORNAREONBOARD = TRUE;
	};
	PlayVideo("Extro_Xardas.BIK");
	PlayVideo("Credits_Extro.BIK");
	PlayVideo("Credits2.BIK");
	if(DIEGANDGORNAREONBOARD == TRUE)
	{
		PlayVideo("Extro_AllesWirdGut.BIK");
	};
	ExitSession();
};

