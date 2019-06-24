
func int b_dragonkillcounter(var C_NPC current_dragon)
{
	if(current_dragon.guild == GIL_DRAGON)
	{
		MIS_KILLEDDRAGONS = MIS_KILLEDDRAGONS + 1;
	};
	if(MIS_KILLEDDRAGONS == 4)
	{
		MIS_ALLDRAGONSDEAD = TRUE;
		if((DJG_BIFFPARTY == TRUE) && (Npc_IsDead(biff) == FALSE))
		{
			DJG_BIFFSURVIVEDLASTDRAGON = TRUE;
		};
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

