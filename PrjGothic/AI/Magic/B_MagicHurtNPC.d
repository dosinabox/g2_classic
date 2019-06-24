
func void b_magichurtnpc(var C_NPC attacker,var int damage)
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,-damage);
	if(Npc_IsDead(self))
	{
		if((Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)) && (self.aivar[AIV_VICTORYXPGIVEN] == FALSE))
		{
			b_giveplayerxp(self.level * XP_PER_VICTORY);
			self.aivar[AIV_VICTORYXPGIVEN] = TRUE;
		};
	};
};

