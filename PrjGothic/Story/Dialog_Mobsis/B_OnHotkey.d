
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
	else if(CurrentLevel == OldWorld_Zen)
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
	if(CurrentLevel != OldWorld_Zen)
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
	}
	else
	{
		return oldinstance;
	};
};

func void B_LameSchlork()
{
	Snd_Play("DRINKBOTTLE");
};

func void player_hotkey_lame_potion()
{
	if(Npc_IsInState(hero,ZS_Dead) == FALSE)
	{
		if(Npc_HasItems(hero,ItPo_Mana_03) && ((hero.attribute[ATR_MANA_MAX] - hero.attribute[ATR_MANA]) >= Mana_Elixier))
		{
			Npc_ChangeAttribute(hero,ATR_MANA,Mana_Elixier);
			Npc_RemoveInvItem(hero,ItPo_Mana_03);
			B_LameSchlork();
		}
		else if(Npc_HasItems(hero,ItPo_Mana_02) && ((hero.attribute[ATR_MANA_MAX] - hero.attribute[ATR_MANA]) >= Mana_Extrakt))
		{
			Npc_ChangeAttribute(hero,ATR_MANA,Mana_Extrakt);
			Npc_RemoveInvItem(hero,ItPo_Mana_02);
			B_LameSchlork();
		}
		else if(Npc_HasItems(hero,ItPo_Mana_01) && ((hero.attribute[ATR_MANA_MAX] - hero.attribute[ATR_MANA]) >= Mana_Essenz))
		{
			Npc_ChangeAttribute(hero,ATR_MANA,Mana_Essenz);
			Npc_RemoveInvItem(hero,ItPo_Mana_01);
			B_LameSchlork();
		}
		else if(hero.attribute[ATR_MANA_MAX] != hero.attribute[ATR_MANA])
		{
			if(Npc_HasItems(hero,ItPo_Mana_01))
			{
				Npc_ChangeAttribute(hero,ATR_MANA,Mana_Essenz);
				Npc_RemoveInvItem(hero,ItPo_Mana_01);
				B_LameSchlork();
			}
			else if(Npc_HasItems(hero,ItPo_Mana_02))
			{
				Npc_ChangeAttribute(hero,ATR_MANA,Mana_Extrakt);
				Npc_RemoveInvItem(hero,ItPo_Mana_02);
				B_LameSchlork();
			}
			else if(Npc_HasItems(hero,ItPo_Mana_03))
			{
				Npc_ChangeAttribute(hero,ATR_MANA,Mana_Elixier);
				Npc_RemoveInvItem(hero,ItPo_Mana_03);
				B_LameSchlork();
			}
			else
			{
				Print("Keine Manatränke vorhanden!");
			};
		}
		else
		{
			Print("Bereits Maximales Mana!");
		};
	};
};

func void player_hotkey_lame_heal()
{
	if(Npc_IsInState(hero,ZS_Dead) == FALSE)
	{
		if(Npc_HasItems(hero,ItPo_Health_03) && ((hero.attribute[ATR_HITPOINTS_MAX] - hero.attribute[ATR_HITPOINTS]) >= HP_Elixier))
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Elixier);
			Npc_RemoveInvItem(hero,ItPo_Health_03);
			B_LameSchlork();
		}
		else if(Npc_HasItems(hero,ItPo_Health_02) && ((hero.attribute[ATR_HITPOINTS_MAX] - hero.attribute[ATR_HITPOINTS]) >= HP_Extrakt))
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Extrakt);
			Npc_RemoveInvItem(hero,ItPo_Health_02);
			B_LameSchlork();
		}
		else if(Npc_HasItems(hero,ItPo_Health_01) && ((hero.attribute[ATR_HITPOINTS_MAX] - hero.attribute[ATR_HITPOINTS]) >= HP_Essenz))
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Essenz);
			Npc_RemoveInvItem(hero,ItPo_Health_01);
			B_LameSchlork();
		}
		else if(hero.attribute[ATR_HITPOINTS_MAX] != hero.attribute[ATR_HITPOINTS])
		{
			if(Npc_HasItems(hero,ItPo_Health_01))
			{
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Essenz);
				Npc_RemoveInvItem(hero,ItPo_Health_01);
				B_LameSchlork();
			}
			else if(Npc_HasItems(hero,ItPo_Health_02))
			{
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Extrakt);
				Npc_RemoveInvItem(hero,ItPo_Health_02);
				B_LameSchlork();
			}
			else if(Npc_HasItems(hero,ItPo_Health_03))
			{
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Elixier);
				Npc_RemoveInvItem(hero,ItPo_Health_03);
				B_LameSchlork();
			}
			else
			{
				Print("Keine Heiltränke vorhanden!");
			};
		}
		else
		{
			Print("Bereits Maximale Lebensenergie!");
		};
	};
};

