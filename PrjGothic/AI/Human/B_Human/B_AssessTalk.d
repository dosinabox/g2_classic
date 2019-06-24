
func void b_assesstalk()
{
	var C_NPC pcl;
	var C_NPC pcr;
	var int rnd;
	pcl = Hlp_GetNpc(pc_levelinspektor);
	pcr = Hlp_GetNpc(pc_rockefeller);
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(pcl)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(pcr)))
	{
		PrintScreen(ConcatStrings("Stimme: ",IntToString(self.voice)),-1,70,FONT_SCREEN,2);
		PrintScreen("KEIN HERO!",-1,-1,FONT_SCREEN,2);
		if(c_npcisinquarter(self) == Q_KASERNE)
		{
			PrintScreen("Q_KASERNE",-1,30,FONT_SCREEN,2);
		};
		if(c_npcisinquarter(self) == Q_GALGEN)
		{
			PrintScreen("Q_GALGEN",-1,30,FONT_SCREEN,2);
		};
		if(c_npcisinquarter(self) == Q_MARKT)
		{
			PrintScreen("Q_MARKT",-1,30,FONT_SCREEN,2);
		};
		if(c_npcisinquarter(self) == Q_TEMPEL)
		{
			PrintScreen("Q_TEMPEL",-1,30,FONT_SCREEN,2);
		};
		if(c_npcisinquarter(self) == Q_UNTERSTADT)
		{
			PrintScreen("Q_UNTERSTADT",-1,30,FONT_SCREEN,2);
		};
		if(c_npcisinquarter(self) == Q_HAFEN)
		{
			PrintScreen("Q_HAFEN",-1,30,FONT_SCREEN,2);
		};
		if(c_npcisinquarter(self) == Q_OBERSTADT)
		{
			PrintScreen("Q_OBERSTADT",-1,30,FONT_SCREEN,2);
		};
		return;
	};
	if(self.guild > GIL_SEPERATOR_HUM)
	{
		if(Npc_CheckInfo(self,1) == FALSE)
		{
			if(Npc_CheckInfo(self,0) == FALSE)
			{
				return;
			};
		};
	};
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		if(b_assessenemy())
		{
			return;
		};
		if((b_getplayercrime(self) == CRIME_MURDER) && c_wanttoattackmurder(self,other))
		{
			b_attack(self,other,AR_HUMANMURDEREDHUMAN,0);
			return;
		};
		if(c_refusetalk(self))
		{
			b_say(self,other,"$NOTNOW");
			return;
		};
	};
	if(self.aivar[AIV_NPCSTARTEDTALK] == FALSE)
	{
		if(c_bodystatecontains(self,BS_WALK) || c_bodystatecontains(self,BS_RUN))
		{
			b_say(other,self,"$SC_HEYWAITASECOND");
		}
		else if(!Npc_CanSeeNpc(self,other))
		{
			rnd = Hlp_Random(100);
			if(rnd <= 25)
			{
				b_say(other,self,"$SC_HEYTURNAROUND");
			}
			else if(rnd <= 50)
			{
				b_say(other,self,"$SC_HEYTURNAROUND02");
			}
			else if(rnd <= 75)
			{
				b_say(other,self,"$SC_HEYTURNAROUND03");
			}
			else if(rnd <= 99)
			{
				b_say(other,self,"$SC_HEYTURNAROUND04");
			};
		};
	};
	Npc_ClearAIQueue(self);
	b_clearperceptions(self);
	if(c_bodystatecontains(self,BS_SIT))
	{
		if(self.aivar[AIV_NPCSTARTEDTALK] == TRUE)
		{
			AI_StandupQuick(other);
		}
		else
		{
			AI_Standup(other);
		};
		if(Npc_CanSeeNpc(self,other))
		{
			AI_StartState(self,zs_talk,0,"");
		}
		else
		{
			if(Npc_IsInState(self,ZS_ObservePlayer))
			{
				AI_Standup(self);
			};
			AI_StartState(self,zs_talk,1,"");
		};
		return;
	}
	else
	{
		if(self.aivar[AIV_NPCSTARTEDTALK] == TRUE)
		{
			AI_StandupQuick(self);
			AI_StandupQuick(other);
		}
		else
		{
			AI_Standup(self);
			AI_Standup(other);
		};
		AI_StartState(self,zs_talk,0,"");
		return;
	};
};

