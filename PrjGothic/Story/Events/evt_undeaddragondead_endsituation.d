
var int evt_undeaddragondead_endsituation_onetime;

func void evt_undeaddragondead_endsituation()
{
	if((evt_undeaddragondead_endsituation_onetime == FALSE) && Npc_IsDead(dragon_undead))
	{
		ANGAR_DI_PARTY = LOG_SUCCESS;
		b_startotherroutine(angar_di,"FireDragonIsland");
		b_startotherroutine(lee_di,"UNDEADDRAGONDEAD");
		b_startotherroutine(diego_di,"UNDEADDRAGONDEAD");
		b_startotherroutine(milten_di,"UNDEADDRAGONDEAD");
		b_startotherroutine(gorn_di,"UNDEADDRAGONDEAD");
		b_startotherroutine(lester_di,"UNDEADDRAGONDEAD");
		evt_undeaddragondead_endsituation_onetime = TRUE;
	};
};

