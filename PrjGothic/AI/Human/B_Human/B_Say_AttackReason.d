
func void b_say_attackreason()
{
	var int rnd;
	if((Wld_GetGuildAttitude(self.guild,other.guild) != ATT_HOSTILE) && (Npc_GetAttitude(self,other) == ATT_HOSTILE))
	{
		if(self.aivar[AIV_ATTACKREASON] == AR_KILL)
		{
			return;
		};
		b_say_overlay(self,other,"$IGETYOUSTILL");
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_GUILDENEMY)
	{
		if(self.aivar[AIV_PARTYMEMBER] == TRUE)
		{
			rnd = Hlp_Random(100);
			if(rnd > 15)
			{
				return;
			};
		};
		if(other.guild < GIL_SEPERATOR_HUM)
		{
			b_say_overlay(self,other,"$DIEENEMY");
			Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		}
		else
		{
			b_say_overlay(self,other,"$DIEMONSTER");
			Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		};
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_THEFT)
	{
		b_say_overlay(self,other,"$DIRTYTHIEF");
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_USEMOB)
	{
		b_say_overlay(self,other,"$HANDSOFF");
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_SHEEPKILLER)
	{
		if(other.guild < GIL_SEPERATOR_HUM)
		{
			b_say_overlay(self,other,"$SHEEPKILLER");
		}
		else
		{
			b_say_overlay(self,other,"$SHEEPKILLERMONSTER");
		};
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_HUMANMURDEREDHUMAN)
	{
		b_say_overlay(self,other,"$YOUMURDERER");
		Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_MONSTERMURDEREDHUMAN)
	{
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_MONSTERVSHUMAN)
	{
		b_say_overlay(self,other,"$DIEMONSTER");
		Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_MONSTERCLOSETOGATE)
	{
		b_say_overlay(self,other,"$DIESTUPIDBEAST");
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_REACTTODAMAGE)
	{
		if(other.guild > GIL_SEPERATOR_HUM)
		{
			b_say_overlay(self,other,"$YOUASKEDFORIT");
			return;
		}
		else
		{
			b_say_overlay(self,other,"$YOUDAREHITME");
			return;
		};
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_REACTTOWEAPON)
	{
		b_say_overlay(self,other,"$YOUASKEDFORIT");
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_CLEARROOM)
	{
		b_say_overlay(self,other,"$THENIBEATYOUOUTOFHERE");
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_LEFTPORTALROOM)
	{
		b_say_overlay(self,other,"$WHATDIDYOUDOINTHERE");
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_GUARDSTOPSFIGHT)
	{
		b_say_overlay(self,other,"$WILLYOUSTOPFIGHTING");
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_GUARDCALLEDTOTHIEF)
	{
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_GUARDCALLEDTOROOM)
	{
		return;
	};
};

