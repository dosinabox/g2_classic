
func string b_buildlearnstring(var string text,var int kosten)
{
	var string concattext;
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > Npc_GetTalentSkill(other,NPC_TALENT_2H))
	{
		if(Hlp_StrCmp(text,PRINT_LEARN1H1))
		{
			text = PRINT_LEARN1H2H1;
		}
		else if(Hlp_StrCmp(text,PRINT_LEARN1H5))
		{
			text = PRINT_LEARN1H2H5;
		}
		else if(Hlp_StrCmp(text,PRINT_LEARN1H10))
		{
			text = PRINT_LEARN1H2H10;
		}
		else if(Hlp_StrCmp(text,PRINT_LEARN1H20))
		{
			text = PRINT_LEARN1H2H20;
		};
	}
	else if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > Npc_GetTalentSkill(other,NPC_TALENT_1H))
	{
		if(Hlp_StrCmp(text,PRINT_LEARN2H1))
		{
			text = PRINT_LEARN1H2H1;
		}
		else if(Hlp_StrCmp(text,PRINT_LEARN2H5))
		{
			text = PRINT_LEARN1H2H5;
		}
		else if(Hlp_StrCmp(text,PRINT_LEARN2H10))
		{
			text = PRINT_LEARN1H2H10;
		}
		else if(Hlp_StrCmp(text,PRINT_LEARN2H20))
		{
			text = PRINT_LEARN1H2H20;
		};
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_BOW) > Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW))
	{
		if(Hlp_StrCmp(text,PRINT_LEARNBOW1))
		{
			text = PRINT_LEARNBOWCROSSBOW1;
		}
		else if(Hlp_StrCmp(text,PRINT_LEARNBOW5))
		{
			text = PRINT_LEARNBOWCROSSBOW5;
		}
		else if(Hlp_StrCmp(text,PRINT_LEARNBOW10))
		{
			text = PRINT_LEARNBOWCROSSBOW10;
		}
		else if(Hlp_StrCmp(text,PRINT_LEARNBOW20))
		{
			text = PRINT_LEARNBOWCROSSBOW20;
		};
	}
	else if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) > Npc_GetTalentSkill(other,NPC_TALENT_BOW))
	{
		if(Hlp_StrCmp(text,PRINT_LEARNCROSSBOW1))
		{
			text = PRINT_LEARNBOWCROSSBOW1;
		}
		else if(Hlp_StrCmp(text,PRINT_LEARNCROSSBOW5))
		{
			text = PRINT_LEARNBOWCROSSBOW5;
		}
		else if(Hlp_StrCmp(text,PRINT_LEARNCROSSBOW10))
		{
			text = PRINT_LEARNBOWCROSSBOW10;
		}
		else if(Hlp_StrCmp(text,PRINT_LEARNCROSSBOW20))
		{
			text = PRINT_LEARNBOWCROSSBOW20;
		};
	};
	concattext = ConcatStrings(text,PRINT_KOSTEN);
	concattext = ConcatStrings(concattext,IntToString(kosten));
	if(kosten >= 5)
	{
		return ConcatStrings(concattext,PRINT_LP);
	};
	if(kosten > 1)
	{
		return ConcatStrings(concattext,PRINT_2LP);
	};
	return ConcatStrings(concattext,PRINT_1LP);
};

