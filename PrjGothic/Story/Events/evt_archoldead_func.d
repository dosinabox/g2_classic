
var int evt_archoldead_func_onetime;

func void evt_archoldead_func()
{
	if(Npc_IsDead(skeleton_lord_archol))
	{
		skeleton_archol1.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		skeleton_archol2.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		skeleton_archol3.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		skeleton_archol4.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		skeleton_archol5.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		skeleton_archol6.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	};
	if(evt_archoldead_func_onetime == FALSE)
	{
		b_logentry(TOPIC_HALLENVONIRDORATH,"Я нашел здесь что-то вроде храма. Его населяют толпы нежити. Это все напоминает мне проклятый храм Спящих. Но на этот раз, я не подведу. Только не на этот раз!");
		evt_archoldead_func_onetime = TRUE;
	};
};

