
var int enter_oldworld_firsttime_trigger_onetime;

func void enter_oldworld_firsttime_trigger()
{
	if(enter_oldworld_firsttime_trigger_onetime == FALSE)
	{
		b_killnpc(bruder);
		b_killnpc(vlk_leiche3);
		b_killnpc(vlk_leiche2);
		b_killnpc(strf_leiche1);
		b_killnpc(strf_leiche2);
		b_killnpc(strf_leiche3);
		b_killnpc(strf_leiche4);
		b_killnpc(strf_leiche5);
		b_killnpc(strf_leiche6);
		b_killnpc(strf_leiche7);
		b_killnpc(strf_leiche8);
		b_killnpc(pal_leiche1);
		b_killnpc(pal_leiche2);
		b_killnpc(pal_leiche3);
		b_killnpc(vlk_leiche1);
		b_killnpc(pal_leiche4);
		b_killnpc(pal_leiche5);
		b_killnpc(olav);
		PlayVideo("DRAGONATTACK.BIK");
		enter_oldworld_firsttime_trigger_onetime = TRUE;
	};
	if(TSCHUESSBILGOT == TRUE)
	{
		b_removenpc(bilgot);
	};
};

