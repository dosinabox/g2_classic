
func int b_getlearncosttalent(var C_NPC oth,var int talent)
{
	var int kosten;
	if(talent == NPC_TALENT_MAGE)
	{
		kosten = 5;
	};
	if(talent == NPC_TALENT_1H)
	{
		if(Npc_GetTalentSkill(oth,NPC_TALENT_1H) > Npc_GetTalentSkill(oth,NPC_TALENT_2H))
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};
		if(oth.guild == GIL_KDF)
		{
			kosten = kosten * 2;
		};
	};
	if(talent == NPC_TALENT_2H)
	{
		if(Npc_GetTalentSkill(oth,NPC_TALENT_2H) > Npc_GetTalentSkill(oth,NPC_TALENT_1H))
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};
		if(oth.guild == GIL_KDF)
		{
			kosten = kosten * 2;
		};
	};
	if(talent == NPC_TALENT_BOW)
	{
		if(Npc_GetTalentSkill(oth,NPC_TALENT_BOW) > Npc_GetTalentSkill(oth,NPC_TALENT_CROSSBOW))
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};
		if(oth.guild == GIL_KDF)
		{
			kosten = kosten * 2;
		};
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
		if(Npc_GetTalentSkill(oth,NPC_TALENT_CROSSBOW) > Npc_GetTalentSkill(oth,NPC_TALENT_BOW))
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};
		if(oth.guild == GIL_KDF)
		{
			kosten = kosten * 2;
		};
	};
	if((talent == NPC_TALENT_PICKLOCK) || (talent == NPC_TALENT_SNEAK) || (talent == NPC_TALENT_ACROBAT) || (talent == NPC_TALENT_PICKPOCKET))
	{
		kosten = 5;
	};
	if((talent == NPC_TALENT_SMITH) || (talent == NPC_TALENT_RUNES) || (talent == NPC_TALENT_ALCHEMY) || (talent == NPC_TALENT_TAKEANIMALTROPHY))
	{
		kosten = 5;
	};
	return kosten;
};

