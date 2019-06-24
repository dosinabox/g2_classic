
var int sc_isobsessed;
var int sc_obsessioncounter;

func void b_clearscobsession(var C_NPC heiler)
{
	if(Hlp_GetInstanceID(heiler) != Hlp_GetInstanceID(hero))
	{
		AI_StopProcessInfos(heiler);
	};
	SC_ISOBSESSED = FALSE;
	SC_OBSESSIONCOUNTER = 0;
	PrintScreen(PRINT_CLEARSCOBSESSION,-1,-1,FONT_SCREEN,3);
};

func void b_scisobsessed(var C_NPC dementor)
{
	if(Hlp_GetInstanceID(dementor) != Hlp_GetInstanceID(hero))
	{
		AI_StopProcessInfos(dementor);
	};
	if(Npc_HasItems(hero,itam_prot_blackeye_mis) == FALSE)
	{
		if(SC_OBSESSIONCOUNTER >= 2)
		{
			SC_ISOBSESSED = TRUE;
			PrintScreen(PRINT_SCISOBSESSED,-1,-1,FONT_SCREEN,3);
		};
		SC_OBSESSIONCOUNTER = SC_OBSESSIONCOUNTER + 1;
	};
};

