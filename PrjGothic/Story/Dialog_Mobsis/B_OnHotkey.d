
func int b_getbestplayermap()
{
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		if(Npc_HasItems(hero,ItWr_Map_NewWorld) >= 1)
		{
			return ItWr_Map_NewWorld;
		}
		else if(Npc_HasItems(hero,ItWr_Map_Shrine_MIS) >= 1)
		{
			return ItWr_Map_Shrine_MIS;
		}
		else if(Npc_HasItems(hero,ItWr_Map_Caves_MIS) >= 1)
		{
			return ItWr_Map_Caves_MIS;
		}
		else if(Npc_HasItems(hero,ItWr_ShatteredGolem_MIS) >= 1)
		{
			return ItWr_ShatteredGolem_MIS;
		}
		else if(Npc_HasItems(hero,ItWr_Map_Orcelite_MIS) >= 1)
		{
			return ItWr_Map_Orcelite_MIS;
		}
		else if(Npc_HasItems(hero,ItWr_Map_NewWorld_City) >= 1)
		{
			return ItWr_Map_NewWorld_City;
		};
	}
	else if(CurrentLevel == OLDWORLD_ZEN)
	{
		if(Npc_HasItems(hero,ItWr_Map_OldWorld) >= 1)
		{
			return ItWr_Map_OldWorld;
		}
		else if(Npc_HasItems(hero,ItWr_Map_OldWorld_Oremines_MIS) >= 1)
		{
			return ItWr_Map_OldWorld_Oremines_MIS;
		};
	}
	else if(CurrentLevel == DRAGONISLAND_ZEN)
	{
	};
	return 0;
};

func int b_getanyplayermap()
{
	if(Npc_HasItems(hero,ItWr_Map_NewWorld) >= 1)
	{
		return ItWr_Map_NewWorld;
	}
	else if(Npc_HasItems(hero,ItWr_Map_Shrine_MIS) >= 1)
	{
		return ItWr_Map_Shrine_MIS;
	}
	else if(Npc_HasItems(hero,ItWr_Map_Caves_MIS) >= 1)
	{
		return ItWr_Map_Caves_MIS;
	}
	else if(Npc_HasItems(hero,ItWr_ShatteredGolem_MIS) >= 1)
	{
		return ItWr_ShatteredGolem_MIS;
	}
	else if(Npc_HasItems(hero,ItWr_Map_Orcelite_MIS) >= 1)
	{
		return ItWr_Map_Orcelite_MIS;
	}
	else if(Npc_HasItems(hero,ItWr_Map_NewWorld_City) >= 1)
	{
		return ItWr_Map_NewWorld_City;
	}
	else if(Npc_HasItems(hero,ItWr_Map_OldWorld) >= 1)
	{
		return ItWr_Map_OldWorld;
	}
	else if(Npc_HasItems(hero,ItWr_Map_OldWorld_Oremines_MIS) >= 1)
	{
		return ItWr_Map_OldWorld_Oremines_MIS;
	};
	return 0;
};

func int player_hotkey_screen_map()
{
	var int oldinstance;
	var int newinstance;
	oldinstance = b_getplayermap();
	if((oldinstance > 0) && (Npc_HasItems(hero,oldinstance) < 1))
	{
		oldinstance = 0;
	};
	b_setplayermap(oldinstance);
	newinstance = oldinstance;
	if(CurrentLevel != NEWWORLD_ZEN)
	{
		if((oldinstance == ItWr_Map_Caves_MIS) || (oldinstance == ItWr_Map_NewWorld) || (oldinstance == ItWr_Map_NewWorld_City) || (oldinstance == ItWr_Map_Orcelite_MIS) || (oldinstance == ItWr_Map_Shrine_MIS) || (oldinstance == ItWr_ShatteredGolem_MIS))
		{
			newinstance = 0;
		};
	};
	if(CurrentLevel != OLDWORLD_ZEN)
	{
		if((oldinstance == ItWr_Map_OldWorld) || (oldinstance == ItWr_Map_OldWorld_Oremines_MIS))
		{
			newinstance = 0;
		};
	};
	if(CurrentLevel != DRAGONISLAND_ZEN)
	{
	};
	if(newinstance <= 0)
	{
		newinstance = b_getbestplayermap();
	};
	if((newinstance <= 0) && (oldinstance <= 0))
	{
		newinstance = b_getanyplayermap();
	};
	if(newinstance > 0)
	{
		b_setplayermap(newinstance);
		return newinstance;
	};
	return oldinstance;
};


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
			Print("Мана уже максимальная!");
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
			Print("Здоровье уже максимальное!");
		};
	};
};

