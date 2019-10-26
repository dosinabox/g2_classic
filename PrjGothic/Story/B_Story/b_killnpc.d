
func void b_killnpc(var int npcinstance)
{
	var C_NPC npc;
	npc = Hlp_GetNpc(npcinstance);
	if(Hlp_IsValidNpc(npc) && !Npc_IsDead(npc))
	{
		npc.flags = 0;
		CreateInvItem(npc,itmi_oldcoin);
		Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
	};
};

func int c_saveiscompatible()
{
	if(Addon_zuerst == TRUE)
	{
		return FALSE;
	};
	return TRUE;
};

func void b_check_version()
{
	if(!c_saveiscompatible())
	{
		PrintScreen("Загруженное сохранение не поддерживается!",50,50,FONT_ScreenSmall,10);
		PrintScreen("Пожалуйста, начните новую игру.",50,53,FONT_ScreenSmall,10);
		AI_Wait(hero,10);
	};
};

func void b_check_armor()
{
	if((MILArmor_Equipped == TRUE) || (NOVArmor_Equipped == TRUE))
	{
		Mdl_SetVisualBody(hero,"hum_body_Naked0",1,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
	};
};

