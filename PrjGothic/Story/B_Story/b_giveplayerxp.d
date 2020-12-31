
func void b_giveplayerxp(var int add_xp)
{
	var string concattext;
	if(hero.level == 0)
	{
		hero.exp_next = 500;
	};
	hero.exp = hero.exp + add_xp;
	concattext = PRINT_XPGAINED;
	concattext = ConcatStrings(concattext,IntToString(add_xp));
	PrintScreen(concattext,-1,YPOS_XPGAINED,FONT_SCREENSMALL,2);
	if(hero.exp >= hero.exp_next)
	{
		hero.level = hero.level + 1;
		hero.exp_next = hero.exp_next + ((hero.level + 1) * 500);
		hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + HP_PER_LEVEL;
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + HP_PER_LEVEL;
		hero.lp = hero.lp + LP_PER_LEVEL;
		PrintScreen(PRINT_LEVELUP,-1,YPOS_LEVELUP,FONT_SCREEN,2);
		Snd_Play("LEVELUP");
	};
	b_checklog();
};

func void b_givedeathxp(var C_Npc killer,var C_Npc target)
{
	if((Npc_IsPlayer(killer) || ((killer.aivar[AIV_PARTYMEMBER] == TRUE) && !Npc_IsPlayer(target))) && (target.aivar[AIV_VictoryXPGiven] == FALSE) && (target.level != 0))
	{
		b_giveplayerxp(target.level * XP_PER_VICTORY);
		target.aivar[AIV_VICTORYXPGIVEN] = TRUE;
		if(target.guild == GIL_DRACONIAN)
		{
			Stats_Killed_Draconian += 1;
		}
		else if(target.guild == GIL_DMT)
		{
			Stats_Killed_Dementor += 1;
		}
		else if(target.aivar[AIV_MM_REAL_ID] == ID_ORCELITE)
		{
			Stats_Killed_OrcElite += 1;
		}
		else if(target.aivar[AIV_MM_REAL_ID] == ID_ORCCOMMANDER)
		{
			Stats_Killed_OrcCommander += 1;
		};
	};
};

