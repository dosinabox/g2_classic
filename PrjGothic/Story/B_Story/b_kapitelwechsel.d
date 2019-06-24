
func void b_kapitelwechsel(var int neues_kapitel,var int aktuelles_level_zen)
{
	KAPITEL = neues_kapitel;
	if(neues_kapitel == 1)
	{
		IntroduceChapter(KAPWECHSEL_1,KAPWECHSEL_1_TEXT,"chapter1.tga","chapter_01.wav",6000);
	}
	else if(neues_kapitel == 2)
	{
		sekob.flags = 0;
		bengar.flags = 0;
		IntroduceChapter(KAPWECHSEL_2,KAPWECHSEL_2_TEXT,"chapter2.tga","chapter_01.wav",6000);
	}
	else if(neues_kapitel == 3)
	{
	}
	else if(neues_kapitel == 4)
	{
		PLAYER_TALENT_ALCHEMY[CHARGE_INNOSEYE] = TRUE;
	}
	else if(neues_kapitel == 5)
	{
		PLAYER_TALENT_ALCHEMY[CHARGE_INNOSEYE] = TRUE;
	}
	else if(neues_kapitel == 6)
	{
		PLAYER_TALENT_ALCHEMY[CHARGE_INNOSEYE] = TRUE;
	};
	b_checklog();
	if(aktuelles_level_zen == OLDWORLD_ZEN)
	{
		b_enter_oldworld();
	};
	if(aktuelles_level_zen == NEWWORLD_ZEN)
	{
		b_enter_newworld();
	};
	if(KAPITEL == 1)
	{
		XP_AMBIENT = XP_AMBIENTKAP1;
	};
	if(KAPITEL == 2)
	{
		XP_AMBIENT = XP_AMBIENTKAP2;
	};
	if(KAPITEL == 3)
	{
		XP_AMBIENT = XP_AMBIENTKAP3;
	};
	if(KAPITEL == 4)
	{
		XP_AMBIENT = XP_AMBIENTKAP4;
	};
	if(KAPITEL == 5)
	{
		XP_AMBIENT = XP_AMBIENTKAP5;
	};
	if(KAPITEL == 6)
	{
		XP_AMBIENT = XP_AMBIENTKAP6;
	};
};

