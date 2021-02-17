
func void b_extro_avi()
{
	if(!Npc_IsDead(pc_thief_di) && !Npc_IsDead(pc_fighter_di))
	{
		DIEGANDGORNAREONBOARD = TRUE;
	};
	PlayVideo("Extro_Xardas.BIK");
	PlayVideo("Credits_Extro.BIK");
	PlayVideo("g2_classic_credits.BIK");
	PlayVideo("g2_classic_credits2.BIK");
	if(DIEGANDGORNAREONBOARD == TRUE)
	{
		PlayVideo("Extro_AllesWirdGut.BIK");
	};
	ExitSession();
};

