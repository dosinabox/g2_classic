
func void b_attack(var C_NPC slf,var C_NPC oth,var int attack_reason,var int wait)
{
	slf.aivar[AIV_WAITBEFOREATTACK] = wait;
	if(attack_reason == AR_SUDDENENEMYINFERNO)
	{
		slf.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		Npc_SendPassivePerc(slf,PERC_ASSESSFIGHTSOUND,slf,oth);
	};
	if(Npc_IsInState(slf,zs_talk))
	{
		slf.aivar[AIV_INVINCIBLE] = FALSE;
		oth.aivar[AIV_INVINCIBLE] = FALSE;
	};
	if(Npc_IsInState(slf,zs_attack) && (Hlp_GetInstanceID(oth) == slf.aivar[AIV_LASTTARGET]))
	{
		if(!c_npchasattackreasontokill(slf) && (attack_reason > slf.aivar[AIV_ATTACKREASON]))
		{
			slf.aivar[AIV_ATTACKREASON] = attack_reason;
			if(Npc_IsPlayer(oth))
			{
				slf.aivar[AIV_LASTPLAYERAR] = attack_reason;
			};
		};
	}
	else
	{
		slf.aivar[AIV_ATTACKREASON] = attack_reason;
		if(Npc_IsPlayer(oth))
		{
			slf.aivar[AIV_LASTPLAYERAR] = attack_reason;
		};
	};
	if(slf.aivar[AIV_ATTACKREASON] == AR_SHEEPKILLER)
	{
		b_memorizeplayercrime(slf,oth,CRIME_SHEEPKILLER);
	};
	if((slf.aivar[AIV_ATTACKREASON] == AR_REACTTODAMAGE) || (slf.aivar[AIV_ATTACKREASON] == AR_REACTTOWEAPON))
	{
		if(!c_npcistoughguy(slf) && !(Npc_IsPlayer(oth) && (slf.npctype == NPCTYPE_FRIEND)))
		{
			b_memorizeplayercrime(slf,oth,CRIME_ATTACK);
		};
	};
	if((slf.aivar[AIV_ATTACKREASON] == AR_THEFT) || (slf.aivar[AIV_ATTACKREASON] == AR_USEMOB))
	{
		b_memorizeplayercrime(slf,oth,CRIME_THEFT);
	};
	if(slf.aivar[AIV_ATTACKREASON] == AR_HUMANMURDEREDHUMAN)
	{
		b_memorizeplayercrime(slf,oth,CRIME_MURDER);
	};
	if(Npc_IsInState(slf,zs_attack))
	{
		return;
	};
	if(slf.aivar[AIV_ATTACKREASON] == AR_KILL)
	{
		b_setattitude(slf,ATT_HOSTILE);
	};
	if(Npc_IsPlayer(oth))
	{
		slf.aivar[AIV_LASTFIGHTAGAINSTPLAYER] = FIGHT_CANCEL;
		slf.aivar[AIV_LASTFIGHTCOMMENT] = FALSE;
	};
	if(!Npc_IsInState(slf,zs_talk))
	{
		Npc_ClearAIQueue(slf);
	};
	b_clearperceptions(slf);
	Npc_SetTarget(slf,oth);
	if(c_bodystatecontains(slf,BS_LIE))
	{
		AI_StartState(slf,zs_attack,1,"");
	}
	else
	{
		AI_StartState(slf,zs_attack,0,"");
	};
};

