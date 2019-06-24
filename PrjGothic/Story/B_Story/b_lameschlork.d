
func void b_lameschlork()
{
	Snd_Play("DRINKBOTTLE");
};

func void player_hotkey_lame_potion()
{
	if(Npc_IsInState(hero,zs_dead) == FALSE)
	{
		if(Npc_HasItems(hero,itpo_mana_03) && ((hero.attribute[ATR_MANA_MAX] - hero.attribute[ATR_MANA]) >= MANA_ELIXIER))
		{
			Npc_ChangeAttribute(hero,ATR_MANA,MANA_ELIXIER);
			Npc_RemoveInvItem(hero,itpo_mana_03);
			b_lameschlork();
		}
		else if(Npc_HasItems(hero,itpo_mana_02) && ((hero.attribute[ATR_MANA_MAX] - hero.attribute[ATR_MANA]) >= MANA_EXTRAKT))
		{
			Npc_ChangeAttribute(hero,ATR_MANA,MANA_EXTRAKT);
			Npc_RemoveInvItem(hero,itpo_mana_02);
			b_lameschlork();
		}
		else if(Npc_HasItems(hero,itpo_mana_01) && ((hero.attribute[ATR_MANA_MAX] - hero.attribute[ATR_MANA]) >= MANA_ESSENZ))
		{
			Npc_ChangeAttribute(hero,ATR_MANA,MANA_ESSENZ);
			Npc_RemoveInvItem(hero,itpo_mana_01);
			b_lameschlork();
		}
		else if(hero.attribute[ATR_MANA_MAX] != hero.attribute[ATR_MANA])
		{
			if(Npc_HasItems(hero,itpo_mana_01))
			{
				Npc_ChangeAttribute(hero,ATR_MANA,MANA_ESSENZ);
				Npc_RemoveInvItem(hero,itpo_mana_01);
				b_lameschlork();
			}
			else if(Npc_HasItems(hero,itpo_mana_02))
			{
				Npc_ChangeAttribute(hero,ATR_MANA,MANA_EXTRAKT);
				Npc_RemoveInvItem(hero,itpo_mana_02);
				b_lameschlork();
			}
			else if(Npc_HasItems(hero,itpo_mana_03))
			{
				Npc_ChangeAttribute(hero,ATR_MANA,MANA_ELIXIER);
				Npc_RemoveInvItem(hero,itpo_mana_03);
				b_lameschlork();
			}
			else
			{
				Print("Нет зелий маны!");
			};
		}
		else
		{
			Print("Уже максимальная мана!");
		};
	};
};

func void player_hotkey_lame_heal()
{
	if(Npc_IsInState(hero,zs_dead) == FALSE)
	{
		if(Npc_HasItems(hero,itpo_health_03) && ((hero.attribute[ATR_HITPOINTS_MAX] - hero.attribute[ATR_HITPOINTS]) >= HP_ELIXIER))
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_ELIXIER);
			Npc_RemoveInvItem(hero,itpo_health_03);
			b_lameschlork();
		}
		else if(Npc_HasItems(hero,itpo_health_02) && ((hero.attribute[ATR_HITPOINTS_MAX] - hero.attribute[ATR_HITPOINTS]) >= HP_EXTRAKT))
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_EXTRAKT);
			Npc_RemoveInvItem(hero,itpo_health_02);
			b_lameschlork();
		}
		else if(Npc_HasItems(hero,itpo_health_01) && ((hero.attribute[ATR_HITPOINTS_MAX] - hero.attribute[ATR_HITPOINTS]) >= HP_ESSENZ))
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_ESSENZ);
			Npc_RemoveInvItem(hero,itpo_health_01);
			b_lameschlork();
		}
		else if(hero.attribute[ATR_HITPOINTS_MAX] != hero.attribute[ATR_HITPOINTS])
		{
			if(Npc_HasItems(hero,itpo_health_01))
			{
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_ESSENZ);
				Npc_RemoveInvItem(hero,itpo_health_01);
				b_lameschlork();
			}
			else if(Npc_HasItems(hero,itpo_health_02))
			{
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_EXTRAKT);
				Npc_RemoveInvItem(hero,itpo_health_02);
				b_lameschlork();
			}
			else if(Npc_HasItems(hero,itpo_health_03))
			{
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_ELIXIER);
				Npc_RemoveInvItem(hero,itpo_health_03);
				b_lameschlork();
			}
			else
			{
				Print("Нет лечебных зелий!");
			};
		}
		else
		{
			Print("Уже максимальное здоровье!");
		};
	};
};

