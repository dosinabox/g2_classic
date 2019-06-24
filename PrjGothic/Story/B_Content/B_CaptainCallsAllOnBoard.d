
func void b_captaincallsallonboard(var C_NPC captain)
{
	b_giveinvitems(hero,captain,itwr_seamap_irdorath,1);
	CreateInvItems(captain,itke_ship_levelchange_mis,1);
	b_giveinvitems(captain,other,itke_ship_levelchange_mis,1);
	b_startotherroutine(captain,"AllOnBoard");
	if(LEE_ISONBOARD == LOG_SUCCESS)
	{
		b_startotherroutine(lee,"Ship");
	};
	if(MILTENNW_ISONBOARD == LOG_SUCCESS)
	{
		b_startotherroutine(miltennw,"Ship");
	};
	if(LESTER_ISONBOARD == LOG_SUCCESS)
	{
		b_startotherroutine(lester,"Ship");
	};
	if(GORN_ISONBOARD == LOG_SUCCESS)
	{
		b_startotherroutine(gornnw_nach_djg,"Ship");
	};
	if(MARIO_ISONBOARD == LOG_SUCCESS)
	{
		b_startotherroutine(mario,"Ship");
	};
	if(WOLF_ISONBOARD == LOG_SUCCESS)
	{
		b_startotherroutine(sld_wolf,"Ship");
	};
	if(LARES_ISONBOARD == LOG_SUCCESS)
	{
		b_startotherroutine(lares,"Ship");
	};
	if(BENNET_ISONBOARD == LOG_SUCCESS)
	{
		b_startotherroutine(bennet,"Ship");
	};
	if(DIEGO_ISONBOARD == LOG_SUCCESS)
	{
		b_startotherroutine(diegonw,"Ship");
	};
	if(BIFF_ISONBOARD == LOG_SUCCESS)
	{
		b_startotherroutine(biff_nw,"Ship");
	};
	if(VATRAS_ISONBOARD == LOG_SUCCESS)
	{
		b_startotherroutine(vatras,"Ship");
	};
	if(ANGAR_ISONBOARD == LOG_SUCCESS)
	{
		b_startotherroutine(angar_nw,"Ship");
	};
	if(GIRION_ISONBOARD == LOG_SUCCESS)
	{
		b_startotherroutine(girion,"Ship");
	};
	MIS_READYFORCHAPTER6 = TRUE;
};

