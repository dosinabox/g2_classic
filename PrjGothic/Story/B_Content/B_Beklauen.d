
func int c_beklauen(var int theftdex,var int theftgold)
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == TRUE) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (theftdex - THEFTDIFF)) && (NPCOBSESSEDBYDMT == FALSE))
	{
		if(Npc_IsInState(self,zs_talk))
		{
			if(theftdex <= 20)
			{
				THEFTDEXGLOB = 10;
			}
			else
			{
				THEFTDEXGLOB = theftdex;
			};
			THEFTGOLDGLOB = theftgold;
		};
		return TRUE;
	};
	return FALSE;
};

func void b_givethiefxp()
{
	var int xp;
	if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(ingmar))
	{
		xp = XP_AMBIENT;
	}
	else
	{
		xp = XP_AMBIENT * 2;
	};
	b_giveplayerxp(xp);
	TotalTheftXP += xp;
	TotalThefts += 1;
	self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
};

func void b_beklauen()
{
	if(other.attribute[ATR_DEXTERITY] >= THEFTDEXGLOB)
	{
		b_giveinvitems(self,other,itmi_gold,THEFTGOLDGLOB);
		TotalTheftGold += THEFTGOLDGLOB;
		b_givethiefxp();
		Snd_Play("Geldbeutel");
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

