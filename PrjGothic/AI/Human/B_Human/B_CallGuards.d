
func int c_wanttocallguards(var C_NPC slf)
{
	if(self.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		if((slf.guild == GIL_PAL) || (slf.guild == GIL_MIL) || (slf.guild == GIL_VLK) || (slf.guild == GIL_SLD) || (slf.guild == GIL_BAU))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func void b_callguards()
{
	if(!c_wanttocallguards(self))
	{
		return;
	};
	if((self.aivar[AIV_ATTACKREASON] == AR_GUARDCALLEDTOKILL) || (self.aivar[AIV_ATTACKREASON] == AR_GUARDSTOPSFIGHT) || (self.aivar[AIV_ATTACKREASON] == AR_GUARDCALLEDTOTHIEF) || (self.aivar[AIV_ATTACKREASON] == AR_GUARDCALLEDTOROOM))
	{
		b_say_overlay(self,other,"$ALARM");
		return;
	};
	if((self.aivar[AIV_ATTACKREASON] == AR_GUILDENEMY) || (self.aivar[AIV_ATTACKREASON] == AR_HUMANMURDEREDHUMAN))
	{
		if((self.guild == GIL_MIL) || (self.guild == GIL_PAL) || (self.guild == GIL_SLD))
		{
			b_say_overlay(self,other,"$ALARM");
			Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
			return;
		};
		if(!c_npcistoughguy(self))
		{
			b_say_overlay(self,other,"$GUARDS");
			Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
			return;
		};
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_GUARDSTOPSINTRUDER)
	{
		b_say_overlay(self,other,"$ALARM");
		Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		return;
	};
	if((self.aivar[AIV_ATTACKREASON] == AR_THEFT) || (self.aivar[AIV_ATTACKREASON] == AR_USEMOB))
	{
		if(!c_npcistoughguy(self))
		{
			b_say_overlay(self,other,"$GUARDS");
			Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		};
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_REACTTOWEAPON)
	{
		if(!c_npcistoughguy(self))
		{
			b_say_overlay(self,other,"$GUARDS");
			Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		};
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_CLEARROOM)
	{
		if((self.guild == GIL_MIL) || (self.guild == GIL_PAL) || (self.guild == GIL_SLD))
		{
			b_say_overlay(self,other,"$ALARM");
			Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
			return;
		};
		if(!c_npcistoughguy(self))
		{
			b_say_overlay(self,other,"$GUARDS");
			Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
			return;
		};
		return;
	};
};

