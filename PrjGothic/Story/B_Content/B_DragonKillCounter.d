
var int SwapDragnIsDead;
var int RckDragnIsDead;
var int FreDragnIsDead;
var int IcDragnIsDead;

func void b_dragonkillcounter(var C_NPC current_dragon)
{
	var C_Npc SwapDragn;
	var C_Npc RckDragn;
	var C_Npc FreDragn;
	var C_Npc IcDragn;
	if(current_dragon.guild == GIL_DRAGON)
	{
		SwapDragn = Hlp_GetNpc(Dragon_Swamp);
		RckDragn = Hlp_GetNpc(Dragon_Rock);
		FreDragn = Hlp_GetNpc(Dragon_Fire);
		IcDragn = Hlp_GetNpc(Dragon_Ice);
		if((Hlp_GetInstanceID(current_dragon) == Hlp_GetInstanceID(SwapDragn)) && (SwapDragnIsDead == FALSE))
		{
			MIS_KILLEDDRAGONS += 1;
			SwapDragnIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(current_dragon) == Hlp_GetInstanceID(RckDragn)) && (RckDragnIsDead == FALSE))
		{
			MIS_KILLEDDRAGONS += 1;
			RckDragnIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(current_dragon) == Hlp_GetInstanceID(FreDragn)) && (FreDragnIsDead == FALSE))
		{
			MIS_KILLEDDRAGONS += 1;
			FreDragnIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(current_dragon) == Hlp_GetInstanceID(IcDragn)) && (IcDragnIsDead == FALSE))
		{
			MIS_KILLEDDRAGONS += 1;
			IcDragnIsDead = TRUE;
		};
	};
	if(MIS_KILLEDDRAGONS == 4)
	{
		MIS_ALLDRAGONSDEAD = TRUE;
	};
	if(current_dragon.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
	{
		UNDEADDRAGONISDEAD = TRUE;
		Log_CreateTopic(TOPIC_BACKTOSHIP,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_BACKTOSHIP,LOG_RUNNING);
		b_logentry(TOPIC_BACKTOSHIP,PRINT_DRAGKILLCOUNT);
		AI_Teleport(hero,"UNDEAD_ENDTELEPORT");
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			PlayVideoEx("EXTRO_PAL.BIK",TRUE,FALSE);
		}
		else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			PlayVideoEx("EXTRO_DJG.BIK",TRUE,FALSE);
		}
		else
		{
			PlayVideoEx("EXTRO_KDF.BIK",TRUE,FALSE);
		};
	};
};

