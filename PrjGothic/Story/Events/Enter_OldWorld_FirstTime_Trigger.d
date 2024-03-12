
var int enter_oldworld_firsttime_trigger_onetime;

func void enter_oldworld_firsttime_trigger()
{
	if(enter_oldworld_firsttime_trigger_onetime == FALSE)
	{
		b_killnpc(pal_2004_bruder);
		b_killnpc(vlk_4112_den);
		b_killnpc(vlk_4151_leiche);
		b_killnpc(strf_1150_leiche);
		b_killnpc(strf_1151_leiche);
		b_killnpc(strf_1153_leiche);
		b_killnpc(strf_1152_leiche);
		b_killnpc(strf_1154_leiche);
		b_killnpc(strf_1155_leiche);
		b_killnpc(strf_1156_leiche);
		b_killnpc(strf_1157_leiche);
		b_killnpc(pal_2002_leiche);
		b_killnpc(pal_2003_leiche);
		b_killnpc(pal_2005_leiche);
		b_killnpc(vlk_4150_leiche);
		b_killnpc(pal_2006_leiche);
		b_killnpc(pal_2007_leiche);
		b_killnpc(vlk_4152_olav);
		PlayVideo("DRAGONATTACK.BIK");
		enter_oldworld_firsttime_trigger_onetime = TRUE;
	};
};

