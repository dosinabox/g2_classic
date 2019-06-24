
func void b_givedeathinv(var C_NPC slf)
{
	if(slf.aivar[AIV_DEATHINVGIVEN] == TRUE)
	{
		return;
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == TRUE)
	{
		if(slf.aivar[AIV_MM_REAL_ID] == ID_WOLF)
		{
			CreateInvItems(slf,itat_teeth,2);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_WARG)
		{
			CreateInvItems(slf,itat_teeth,2);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_SNAPPER)
		{
			CreateInvItems(slf,itat_teeth,2);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER)
		{
			CreateInvItems(slf,itat_teeth,2);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST)
		{
			CreateInvItems(slf,itat_teeth,2);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_SWAMPSHARK)
		{
			CreateInvItems(slf,itat_sharkteeth,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_TROLL)
		{
			CreateInvItems(slf,itat_trolltooth,2);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_TROLL_BLACK)
		{
			CreateInvItems(slf,itat_trolltooth,4);
		};
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == TRUE)
	{
		if(slf.aivar[AIV_MM_REAL_ID] == ID_WARAN)
		{
			CreateInvItems(slf,itat_claw,2);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN)
		{
			CreateInvItems(slf,itat_claw,4);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_SNAPPER)
		{
			CreateInvItems(slf,itat_claw,2);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER)
		{
			CreateInvItems(slf,itat_claw,4);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST)
		{
			CreateInvItems(slf,itat_claw,4);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_LURKER)
		{
			CreateInvItems(slf,itat_lurkerclaw,1);
		};
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == TRUE)
	{
		if(slf.aivar[AIV_MM_REAL_ID] == ID_SHEEP)
		{
			CreateInvItems(slf,itat_sheepfur,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_WOLF)
		{
			CreateInvItems(slf,itat_wolffur,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_WARG)
		{
			CreateInvItems(slf,itat_wargfur,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST)
		{
			CreateInvItems(slf,itat_shadowfur,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_TROLL)
		{
			CreateInvItems(slf,itat_trollfur,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_TROLL_BLACK)
		{
			CreateInvItems(slf,itat_trollblackfur,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_LURKER)
		{
			CreateInvItems(slf,itat_lurkerskin,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_SWAMPSHARK)
		{
			CreateInvItems(slf,itat_sharkskin,1);
		};
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_HEART] == TRUE)
	{
		if(slf.aivar[AIV_MM_REAL_ID] == ID_STONEGOLEM)
		{
			CreateInvItems(slf,itat_stonegolemheart,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_FIREGOLEM)
		{
			CreateInvItems(slf,itat_firegolemheart,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_ICEGOLEM)
		{
			CreateInvItems(slf,itat_icegolemheart,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_DEMON)
		{
			CreateInvItems(slf,itat_demonheart,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_DEMON_LORD)
		{
			CreateInvItems(slf,itat_demonheart,1);
		};
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == TRUE)
	{
		if(slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST)
		{
			CreateInvItems(slf,itat_shadowhorn,1);
		};
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FIRETONGUE] == TRUE)
	{
		if(slf.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN)
		{
			CreateInvItems(slf,itat_waranfiretongue,1);
		};
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == TRUE)
	{
		if(slf.aivar[AIV_MM_REAL_ID] == ID_BLOODFLY)
		{
			CreateInvItems(slf,itat_wing,2);
		};
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == TRUE)
	{
		if(slf.aivar[AIV_MM_REAL_ID] == ID_BLOODFLY)
		{
			CreateInvItems(slf,itat_sting,1);
		};
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_MANDIBLES] == TRUE)
	{
		if(slf.aivar[AIV_MM_REAL_ID] == ID_GIANT_BUG)
		{
			CreateInvItems(slf,itat_bugmandibles,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLER)
		{
			CreateInvItems(slf,itat_crawlermandibles,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLERWARRIOR)
		{
			CreateInvItems(slf,itat_crawlermandibles,1);
		};
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CRAWLERPLATE] == TRUE)
	{
		if(slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLER)
		{
			CreateInvItems(slf,itat_crawlerplate,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLERWARRIOR)
		{
			CreateInvItems(slf,itat_crawlerplate,2);
		};
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRGSNAPPERHORN] == TRUE)
	{
		if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER)
		{
			CreateInvItems(slf,itat_drgsnapperhorn,2);
		};
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] == TRUE)
	{
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(firedragonisland))
		{
			CreateInvItems(slf,itat_dragonscale,12);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(undeaddragon))
		{
			CreateInvItems(slf,itat_dragonscale,12);
		};
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] == TRUE)
	{
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(firedragonisland))
		{
			CreateInvItems(slf,itat_dragonblood,2);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(undeaddragon))
		{
			CreateInvItems(slf,itat_dragonblood,2);
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_MEATBUG)
	{
		CreateInvItems(slf,itat_meatbugflesh,1);
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_SHEEP)
	{
		CreateInvItems(slf,itfomuttonraw,1);
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_SCAVENGER)
	{
		CreateInvItems(slf,itfomuttonraw,1);
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_GIANT_RAT)
	{
		CreateInvItems(slf,itfomuttonraw,1);
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_MOLERAT)
	{
		CreateInvItems(slf,itfomuttonraw,1);
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_WOLF)
	{
		CreateInvItems(slf,itfomuttonraw,1);
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_WARG)
	{
		CreateInvItems(slf,itfomuttonraw,1);
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST)
	{
		CreateInvItems(slf,itfomuttonraw,2);
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
	{
		CreateInvItems(slf,itat_undeaddragonsoulstone,1);
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE)
	{
		CreateInvItems(slf,itat_firedragonheart,1);
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE)
	{
		CreateInvItems(slf,itat_icedragonheart,1);
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ROCK)
	{
		CreateInvItems(slf,itat_rockdragonheart,1);
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_SWAMP)
	{
		CreateInvItems(slf,itat_swampdragonheart,1);
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_SKELETON)
	{
		CreateInvItems(slf,itat_goblinbone,1);
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_SKELETON)
	{
		CreateInvItems(slf,itat_skeletonbone,1);
	};
	GOBLINGREEN_RANDOMIZER = Hlp_Random(100);
	if((slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_GREEN) && (GOBLINGREEN_RANDOMIZER == 0))
	{
		CreateInvItems(slf,itmi_silverring,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_GREEN) && (GOBLINGREEN_RANDOMIZER <= 5))
	{
		CreateInvItems(slf,itpl_mushroom_01,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_GREEN) && (GOBLINGREEN_RANDOMIZER <= 15))
	{
		CreateInvItems(slf,itmi_gold,5);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_GREEN) && (GOBLINGREEN_RANDOMIZER <= 30))
	{
		CreateInvItems(slf,itfo_fish,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_GREEN) && (GOBLINGREEN_RANDOMIZER <= 50))
	{
		CreateInvItems(slf,itmi_gold,2);
	};
	GOBLINBLACK_RANDOMIZER = Hlp_Random(100);
	if((slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK) && (GOBLINBLACK_RANDOMIZER == 0))
	{
		CreateInvItems(slf,itmi_goldring,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK) && (GOBLINBLACK_RANDOMIZER <= 5))
	{
		CreateInvItems(slf,itpl_dex_herb_01,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK) && (GOBLINBLACK_RANDOMIZER <= 15))
	{
		CreateInvItems(slf,itmi_gold,10);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK) && (GOBLINBLACK_RANDOMIZER <= 30))
	{
		CreateInvItems(slf,itpl_mushroom_02,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK) && (GOBLINBLACK_RANDOMIZER <= 50))
	{
		CreateInvItems(slf,itmi_gold,5);
	};
	ORC_RANDOMIZER = Hlp_Random(10);
	if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR) && (ORC_RANDOMIZER == 0))
	{
		CreateInvItems(slf,itpo_health_02,1);
		CreateInvItems(slf,itmi_gold,2);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR) && (ORC_RANDOMIZER == 1))
	{
		CreateInvItems(slf,itpo_health_01,1);
		CreateInvItems(slf,itfomuttonraw,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR) && (ORC_RANDOMIZER == 2))
	{
		CreateInvItems(slf,itpo_health_01,2);
		CreateInvItems(slf,itmi_gold,18);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR) && (ORC_RANDOMIZER == 3))
	{
		CreateInvItems(slf,itfo_booze,1);
		CreateInvItems(slf,itmi_silverring,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR) && (ORC_RANDOMIZER == 4))
	{
		CreateInvItems(slf,itpl_health_herb_01,1);
		CreateInvItems(slf,itmi_gold,4);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR) && (ORC_RANDOMIZER <= 7))
	{
		CreateInvItems(slf,itmi_gold,9);
	};
	if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN) && (ORC_RANDOMIZER == 0))
	{
		CreateInvItems(slf,itpo_mana_03,1);
		CreateInvItems(slf,itmi_gold,5);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN) && (ORC_RANDOMIZER == 1))
	{
		CreateInvItems(slf,itpo_mana_02,2);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN) && (ORC_RANDOMIZER == 2))
	{
		CreateInvItems(slf,itpo_mana_02,1);
		CreateInvItems(slf,itmi_coal,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN) && (ORC_RANDOMIZER == 3))
	{
		CreateInvItems(slf,itpo_mana_01,2);
		CreateInvItems(slf,itmi_gold,12);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN) && (ORC_RANDOMIZER == 4))
	{
		CreateInvItems(slf,itpo_mana_01,1);
		CreateInvItems(slf,itmi_sulfur,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN) && (ORC_RANDOMIZER <= 8))
	{
		CreateInvItems(slf,itpl_mana_herb_02,2);
		CreateInvItems(slf,itmi_gold,8);
	};
	if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCELITE) && (ORC_RANDOMIZER == 0))
	{
		CreateInvItems(slf,itat_wolffur,1);
		CreateInvItems(slf,itpo_health_03,1);
		CreateInvItems(slf,itfomutton,2);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCELITE) && (ORC_RANDOMIZER == 1))
	{
		CreateInvItems(slf,itmi_goldring,1);
		CreateInvItems(slf,itpo_health_01,1);
		CreateInvItems(slf,itmi_gold,26);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCELITE) && (ORC_RANDOMIZER == 2))
	{
		CreateInvItems(slf,itsc_lightheal,1);
		CreateInvItems(slf,itlstorch,2);
		CreateInvItems(slf,itat_teeth,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCELITE) && (ORC_RANDOMIZER <= 5))
	{
		CreateInvItems(slf,itmi_gold,19);
		CreateInvItems(slf,itpo_health_02,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCELITE) && (ORC_RANDOMIZER == 6))
	{
		CreateInvItems(slf,itat_wargfur,1);
		CreateInvItems(slf,itpl_strength_herb_01,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCELITE) && (ORC_RANDOMIZER <= 9))
	{
		CreateInvItems(slf,itmi_gold,22);
		CreateInvItems(slf,itpo_health_01,1);
	};
	if((slf.aivar[AIV_MM_REAL_ID] == ID_DEMON) && (ORC_RANDOMIZER == 0))
	{
		CreateInvItems(slf,itpo_mana_03,2);
		CreateInvItems(slf,itmi_goldring,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_DEMON) && (ORC_RANDOMIZER <= 2))
	{
		CreateInvItems(slf,itpo_mana_03,1);
		CreateInvItems(slf,itpo_health_02,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_DEMON) && (ORC_RANDOMIZER <= 6))
	{
		CreateInvItems(slf,itpo_mana_02,2);
		CreateInvItems(slf,itmi_pitch,1);
	}
	else if(slf.aivar[AIV_MM_REAL_ID] == ID_DEMON)
	{
		CreateInvItems(slf,itpo_mana_02,1);
		CreateInvItems(slf,itpo_health_02,1);
	};
	if((slf.aivar[AIV_MM_REAL_ID] == ID_DEMON_LORD) && (ORC_RANDOMIZER <= 1))
	{
		CreateInvItems(slf,itpo_mana_03,2);
		CreateInvItems(slf,itpo_health_03,2);
		CreateInvItems(slf,itsc_sumdemon,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_DEMON_LORD) && (ORC_RANDOMIZER <= 5))
	{
		CreateInvItems(slf,itpo_mana_03,2);
		CreateInvItems(slf,itpo_health_03,2);
	}
	else if(slf.aivar[AIV_MM_REAL_ID] == ID_DEMON_LORD)
	{
		CreateInvItems(slf,itpo_mana_03,1);
		CreateInvItems(slf,itpo_health_03,1);
	};
	slf.aivar[AIV_DEATHINVGIVEN] = TRUE;
};

