
func void player_mob_missing_key_or_lockpick()
{
	Print(PRINT_PICKLOCK_OR_KEYMISSING);
	AI_PlayAni(self,"T_DONTKNOW");
	b_say_overlay(self,self,"$PICKLOCKORKEYMISSING");
};

func void player_mob_missing_key()
{
	Print(PRINT_KEYMISSING);
	AI_PlayAni(self,"T_DONTKNOW");
	b_say_overlay(self,self,"$KEYMISSING");
};

func void player_mob_missing_lockpick()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Print(PRINT_NOPICKLOCKTALENT);
		AI_PlayAni(self,"T_DONTKNOW");
		b_say_overlay(self,self,"$NOPICKLOCKTALENT");
	}
	else
	{
		Print(PRINT_PICKLOCKMISSING);
		AI_PlayAni(self,"T_DONTKNOW");
		b_say_overlay(self,self,"$PICKLOCKMISSING");
	};
};

func void player_mob_never_open()
{
	Print(PRINT_NEVEROPEN);
	AI_PlayAni(self,"T_DONTKNOW");
};

func void player_mob_missing_item()
{
	Print(PRINT_MISSINGITEM);
	AI_PlayAni(self,"T_DONTKNOW");
	b_say_overlay(self,self,"$MISSINGITEM");
};

func void player_mob_another_is_using()
{
	Print(PRINT_ANOTHERUSER);
	AI_PlayAni(self,"T_DONTKNOW");
};

func void player_mob_too_far_away()
{
	Print(PRINT_TOOFAR_AWAY);
	AI_PlayAni(self,"T_DONTKNOW");
};

func void player_mob_wrong_side()
{
	Print(PRINT_WRONGSIDE);
	AI_PlayAni(self,"T_DONTKNOW");
};

func void player_trade_not_enough_gold()
{
	Print(PRINT_TRADE_NOT_ENOUGH_GOLD);
};

