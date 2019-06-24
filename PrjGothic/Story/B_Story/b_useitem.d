
func void b_useitem(var C_NPC slf,var int itminstance)
{
	var C_NPC target;
	if(c_bodystatecontains(slf,BS_SIT))
	{
		return;
	};
	target = Npc_GetLookAtTarget(slf);
	if(Hlp_IsValidNpc(target))
	{
		b_stoplookat(slf);
		AI_UseItem(slf,itminstance);
		b_lookatnpc(slf,target);
	}
	else
	{
		AI_UseItem(slf,itminstance);
	};
};

