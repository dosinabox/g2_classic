
const int COLL_DONOTHING = 0;
const int COLL_DOEVERYTHING = 1;
const int COLL_APPLYDAMAGE = 2;
const int COLL_APPLYHALVEDAMAGE = 4;
const int COLL_APPLYDOUBLEDAMAGE = 8;
const int COLL_APPLYVICTIMSTATE = 16;
const int COLL_DONTKILL = 32;

func int c_cannpccollidewithspell(var int spelltype)
{
	var C_NPC her;
	if((spelltype == SPL_ZAP) || (spelltype == SPL_CHARGEZAP) || (spelltype == SPL_WINDFIST) || (spelltype == SPL_CONCUSSIONBOLT))
	{
		if((spelltype == SPL_WINDFIST) && (Npc_GetDistToNpc(other,self) >= 1000))
		{
			return COLL_DONOTHING;
		};
		if(c_npcisdown(self) || (self.guild == GIL_STONEGOLEM) || (self.guild == GIL_ICEGOLEM) || (self.guild == GIL_FIREGOLEM) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_DEMON) || (self.guild == GIL_SUMMONED_DEMON) || (self.guild == GIL_TROLL) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_DRAGON))
		{
			return COLL_DONOTHING;
		};
		return COLL_APPLYDAMAGE | COLL_DONTKILL;
	};
	if((spelltype == SPL_CHARGEFIREBALL) || (spelltype == SPL_INSTANTFIREBALL) || (spelltype == SPL_FIRERAIN) || (spelltype == SPL_FIREBOLT) || (spelltype == SPL_FIRESTORM) || (spelltype == SPL_PYROKINESIS) || (spelltype == SPL_DEATHBOLT) || (spelltype == SPL_DEATHBALL))
	{
		if(c_npcisdown(self) || c_bodystatecontains(self,BS_SWIM) || c_bodystatecontains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
		if((self.guild == GIL_FIREGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN))
		{
			return COLL_APPLYHALVEDAMAGE;
		};
		if(self.guild == GIL_ICEGOLEM)
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		if((self.guild == GIL_STONEGOLEM) || (self.guild == GIL_ICEGOLEM) || (self.guild == GIL_FIREGOLEM) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_DEMON) || (self.guild == GIL_SUMMONED_DEMON) || (self.guild == GIL_TROLL) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_DRAGON))
		{
			return COLL_APPLYDAMAGE;
		};
	};
	if((spelltype == SPL_ICECUBE) || (spelltype == SPL_ICEWAVE) || (spelltype == SPL_ICEBOLT))
	{
		if(c_npcisdown(self) || c_bodystatecontains(self,BS_SWIM) || c_bodystatecontains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
		if((self.guild == GIL_FIREGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		if(self.guild == GIL_ICEGOLEM)
		{
			return COLL_APPLYHALVEDAMAGE;
		};
		if((self.guild == GIL_STONEGOLEM) || (self.guild == GIL_ICEGOLEM) || (self.guild == GIL_FIREGOLEM) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_DEMON) || (self.guild == GIL_SUMMONED_DEMON) || (self.guild == GIL_TROLL) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_DRAGON))
		{
			return COLL_APPLYDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if(spelltype == SPL_LIGHTNINGFLASH)
	{
		if(c_npcisdown(self) || c_bodystatecontains(self,BS_SWIM) || c_bodystatecontains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
		return COLL_DOEVERYTHING;
	};
	if(spelltype == SPL_FEAR)
	{
		if((self.guild != GIL_DEMON) && (self.guild != GIL_FIREGOLEM) && (self.guild != GIL_ICEGOLEM) && (self.guild != GIL_STONEGOLEM) && (self.guild != GIL_SUMMONED_GOLEM) && (self.guild != GIL_SWAMPSHARK) && (self.guild != GIL_TROLL) && (self.guild != GIL_SKELETON) && (self.guild != GIL_SUMMONED_SKELETON) && (self.guild != GIL_ZOMBIE) && (self.guild != GIL_SUMMONED_DEMON) && (self.guild != GIL_DRAGON) && (c_npcisgateguard(self) == FALSE))
		{
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	};
	if(spelltype == SPL_DESTROYUNDEAD)
	{
		if(c_npcisundead(self))
		{
			return COLL_DOEVERYTHING;
		}
		else if(self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
		{
			return COLL_APPLYHALVEDAMAGE;
		}
		else
		{
			return COLL_DONOTHING;
		};
	};
	her = Hlp_GetNpc(pc_hero);
	if(spelltype == SPL_BREATHOFDEATH)
	{
		if(Npc_GetDistToNpc(other,self) >= 1000)
		{
			return COLL_DONOTHING;
		};
		if((self.guild != GIL_DRAGON) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(her)))
		{
			return COLL_DOEVERYTHING;
		}
		else
		{
			return COLL_APPLYHALVEDAMAGE;
		};
		return COLL_DONOTHING;
	};
	if(spelltype == SPL_MASSDEATH)
	{
		if((self.guild != GIL_DRAGON) && (self.guild != GIL_DEMON) && (self.guild != GIL_SUMMONED_DEMON) && !c_npcisundead(self))
		{
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	};
	if(spelltype == SPL_MASTEROFDISASTER)
	{
		if(c_npcisdown(self) || c_bodystatecontains(self,BS_SWIM) || c_bodystatecontains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
	};
	if(spelltype == SPL_SHRINK)
	{
		if(c_npcisdown(self) || c_bodystatecontains(self,BS_SWIM) || c_bodystatecontains(self,BS_DIVE) || (self.guild == GIL_DRAGON))
		{
			return COLL_DONOTHING;
		};
	};
	if((spelltype == SPL_PALREPELEVIL) || (spelltype == SPL_PALDESTROYEVIL) || (spelltype == SPL_PALHOLYBOLT))
	{
		if(c_npcisevil(self) && (self.guild != GIL_BDT))
		{
			if(self.guild == GIL_DRAGON)
			{
				return COLL_APPLYHALVEDAMAGE;
			}
			else
			{
				return COLL_DOEVERYTHING;
			};
		};
		return COLL_DONOTHING;
	};
	return COLL_DOEVERYTHING;
};

