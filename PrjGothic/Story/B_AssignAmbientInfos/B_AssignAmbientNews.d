
instance DIA_AMBIENT_NEWS(C_INFO)
{
	nr = 1;
	condition = dia_ambient_news_condition;
	information = dia_ambient_news_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_ambient_news_condition()
{
	if(Npc_IsInState(self,zs_talk) && (b_getplayercrime(self) != CRIME_NONE))
	{
		return TRUE;
	};
};

func void dia_ambient_news_info()
{
	if(b_getplayercrime(self) == CRIME_SHEEPKILLER)
	{
		b_say(self,other,"$SHEEPKILLER_CRIME");
	};
	if(b_getplayercrime(self) == CRIME_ATTACK)
	{
		b_say(self,other,"$ATTACK_CRIME");
	};
	if(b_getplayercrime(self) == CRIME_THEFT)
	{
		b_say(self,other,"$THEFT_CRIME");
	};
	if(c_npcbelongstocity(self))
	{
		if((other.guild == GIL_PAL) && (HAGEN_SCHULDEN <= 0))
		{
			b_say(self,other,"$PAL_CITY_CRIME");
		}
		else if((other.guild == GIL_MIL) && (ANDRE_SCHULDEN <= 0))
		{
			b_say(self,other,"$MIL_CITY_CRIME");
		}
		else if(ANDRE_SCHULDEN <= 0)
		{
			b_say(self,other,"$CITY_CRIME");
		};
	};
	if(c_npcbelongstomonastery(self) && (PARLAN_SCHULDEN <= 0))
	{
		b_say(self,other,"$MONA_CRIME");
	};
	if(c_npcbelongstofarm(self) && (LEE_SCHULDEN <= 0))
	{
		b_say(self,other,"$FARM_CRIME");
	};
	if(c_npcbelongstooldcamp(self) && (GAROND_SCHULDEN <= 0))
	{
		b_say(self,other,"$OC_CRIME");
	};
	AI_StopProcessInfos(self);
};

func void b_assignambientnews(var C_NPC slf)
{
	dia_ambient_news.npc = Hlp_GetInstanceID(slf);
};

