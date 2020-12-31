
func void b_magichurtnpc(var C_NPC attacker,var int damage)
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,-damage);
	if(Npc_IsDead(self))
	{
		b_givedeathxp(other,self);
	};
};

