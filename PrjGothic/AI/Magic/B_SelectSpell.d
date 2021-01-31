
func int b_selectspell(var C_NPC slf,var C_NPC oth)
{
	if((slf.npctype == NPCTYPE_FRIEND) && Npc_IsPlayer(oth) && (oth.guild < GIL_SEPERATOR_HUM))
	{
		if((slf.guild == GIL_KDF) || (slf.aivar[AIV_MAGICUSER] == MAGIC_ALWAYS))
		{
			if(Npc_HasItems(slf,itru_sleep) == 0)
			{
				CreateInvItems(slf,itru_sleep,1);
			};
			b_readyspell(slf,SPL_SLEEP,SPL_COST_SLEEP);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if((slf.guild == GIL_DMT) && (slf.aivar[AIV_MAGICUSER] == MAGIC_ALWAYS))
	{
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_1299_oberdementor_di))
		{
			if(Npc_HasItems(slf,itru_deathball) == 0)
			{
				CreateInvItems(slf,itru_deathball,1);
			};
			b_readyspell(slf,SPL_DEATHBALL,SPL_COST_DEATHBALL);
		}
		else if((MIS_READYFORCHAPTER4 == FALSE) && (KAPITEL < 4))
		{
			if(Npc_HasItems(slf,itru_firebolt) == 0)
			{
				CreateInvItems(slf,itru_firebolt,1);
			};
			b_readyspell(slf,SPL_FIREBOLT,SPL_COST_FIREBOLT);
		}
		else if(KAPITEL < 6)
		{
			if(Npc_HasItems(slf,itru_instantfireball) == 0)
			{
				CreateInvItems(slf,itru_instantfireball,1);
			};
			b_readyspell(slf,SPL_INSTANTFIREBALL,SPL_COST_INSTANTFIREBALL);
		}
		else
		{
			if(Npc_HasItems(slf,itru_deathbolt) == 0)
			{
				CreateInvItems(slf,itru_deathbolt,1);
			};
			b_readyspell(slf,SPL_DEATHBOLT,SPL_COST_DEATHBOLT);
		};
		return TRUE;
	};
	if((slf.guild == GIL_KDF) || (slf.aivar[AIV_MAGICUSER] == MAGIC_ALWAYS))
	{
		if(Npc_HasItems(slf,itru_concussionbolt) == 0)
		{
			CreateInvItems(slf,itru_concussionbolt,1);
		};
		if(Npc_HasItems(slf,itru_instantfireball) == 0)
		{
			CreateInvItems(slf,itru_instantfireball,1);
		};
		if(Npc_HasItems(slf,itru_deathball) == 0)
		{
			CreateInvItems(slf,itru_deathball,1);
		};
		if(Npc_HasItems(slf,itru_fullheal) == 0)
		{
			CreateInvItems(slf,itru_fullheal,1);
		};
		if(self.attribute[ATR_HITPOINTS] < 100)
		{
			b_readyspell(slf,SPL_FULLHEAL,SPL_COST_FULLHEAL);
			return TRUE;
		}
		else if(c_npchasattackreasontokill(self))
		{
			if(self.flags == NPC_FLAG_IMMORTAL)
			{
				b_readyspell(slf,SPL_DEATHBALL,SPL_COST_DEATHBALL);
			}
			else
			{
				b_readyspell(slf,SPL_INSTANTFIREBALL,SPL_COST_INSTANTFIREBALL);
			};
			return TRUE;
		}
		else
		{
			b_readyspell(slf,SPL_CONCUSSIONBOLT,SPL_COST_CONCUSSIONBOLT);
			return TRUE;
		};
	};
	if(slf.guild == GIL_PAL)
	{
		if(slf.fight_tactic == FAI_NAILED)
		{
			return FALSE;
		};
		if(Npc_HasItems(slf,itru_palholybolt) == 0)
		{
			CreateInvItems(slf,itru_palholybolt,1);
		};
		if((Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE) && c_npcisevil(oth))
		{
			b_readyspell(slf,SPL_PALHOLYBOLT,SPL_COST_PALHOLYBOLT);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(slf.guild == GIL_SKELETON_MAGE)
	{
		if(Npc_HasItems(slf,itru_sumskel) == 0)
		{
			CreateInvItems(slf,itru_sumskel,1);
		};
		if(Npc_HasItems(slf,itru_icecube) == 0)
		{
			CreateInvItems(slf,itru_icecube,1);
		};
		if(Npc_HasItems(slf,itru_icebolt) == 0)
		{
			CreateInvItems(slf,itru_icebolt,1);
		};
		if(slf.aivar[AIV_SELECTSPELL] >= 6)
		{
			slf.aivar[AIV_SELECTSPELL] = 1;
		};
		if(!Npc_IsInState(oth,zs_magicfreeze) && (slf.aivar[AIV_SELECTSPELL] == 0))
		{
			b_readyspell(slf,SPL_ICECUBE,SPL_COST_ICECUBE);
			return TRUE;
		}
		else if(slf.aivar[AIV_SELECTSPELL] == 1)
		{
			b_readyspell(slf,SPL_SUMMONSKELETON,SPL_COST_SUMMONSKELETON);
			return TRUE;
		}
		else
		{
			b_readyspell(slf,SPL_ICEBOLT,SPL_COST_ICEBOLT);
			return TRUE;
		};
	};
	if(slf.guild == GIL_ICEGOLEM)
	{
		if(Npc_HasItems(slf,itru_icecube) == 0)
		{
			CreateInvItems(slf,itru_icecube,1);
		};
		if((Npc_GetDistToNpc(slf,oth) < FIGHT_DIST_MELEE) || Npc_IsInState(oth,zs_magicfreeze))
		{
			return FALSE;
		}
		else
		{
			b_readyspell(slf,SPL_ICECUBE,SPL_COST_ICECUBE);
			return TRUE;
		};
	};
	if(slf.guild == GIL_FIREGOLEM)
	{
		if(Npc_HasItems(slf,itru_instantfireball) == 0)
		{
			CreateInvItems(slf,itru_instantfireball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			b_readyspell(slf,SPL_INSTANTFIREBALL,SPL_COST_INSTANTFIREBALL);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_SWAMP)
	{
		if(Npc_HasItems(slf,itru_instantfireball) == 0)
		{
			CreateInvItems(slf,itru_instantfireball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > 1000)
		{
			b_readyspell(slf,SPL_INSTANTFIREBALL,SPL_COST_INSTANTFIREBALL);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ROCK)
	{
		if(Npc_HasItems(slf,itru_instantfireball) == 0)
		{
			CreateInvItems(slf,itru_instantfireball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > 1000)
		{
			b_readyspell(slf,SPL_INSTANTFIREBALL,SPL_COST_INSTANTFIREBALL);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE)
	{
		if(Npc_HasItems(slf,itru_instantfireball) == 0)
		{
			CreateInvItems(slf,itru_instantfireball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > 1000)
		{
			b_readyspell(slf,SPL_INSTANTFIREBALL,SPL_COST_INSTANTFIREBALL);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE)
	{
		if(Npc_HasItems(slf,itru_instantfireball) == 0)
		{
			CreateInvItems(slf,itru_instantfireball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > 1000)
		{
			b_readyspell(slf,SPL_INSTANTFIREBALL,SPL_COST_INSTANTFIREBALL);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
	{
//		Npc_ClearAIQueue(self);
		if(Npc_HasItems(slf,itru_deathball) == 0)
		{
			CreateInvItems(slf,itru_deathball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > 800)
		{
			b_readyspell(slf,SPL_DEATHBALL,SPL_COST_DEATHBALL);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN)
	{
		if(Npc_HasItems(slf,itru_instantfireball) == 0)
		{
			CreateInvItems(slf,itru_instantfireball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			b_readyspell(slf,SPL_INSTANTFIREBALL,SPL_COST_INSTANTFIREBALL);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	return FALSE;
};

