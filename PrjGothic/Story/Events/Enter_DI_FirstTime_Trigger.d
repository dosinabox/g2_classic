
var int enterdi_kapitel6;

func void enter_di_firsttime_trigger()
{
/*	if(Npc_HasItems(hero,itke_ship_levelchange_mis))
	{
		Npc_RemoveInvItems(hero,itke_ship_levelchange_mis,1);
	};*/
	if(hero.attribute[ATR_DEXTERITY] < 15)
	{
		Wld_InsertItem(itpo_perm_dex,"FP_ITEM_DI_ENTER_05");
	};
	if(ENTERDI_KAPITEL6 == FALSE)
	{
		if(hero.guild == GIL_PAL)
		{
			CreateInvItems(archol,itru_paldestroyevil,1);
		};
		Wld_InsertItem(itmi_flask,"FP_ITEM_SHIP_12");
		if(Npc_HasItems(hero,itmi_innoseye_mis) == FALSE)
		{
			if(Npc_HasItems(hero,itmi_innoseye_discharged_mis) == FALSE)
			{
				Wld_InsertItem(itse_xardasnotfallbeutel_mis,"FP_ITEM_SHIP_12");
				SC_INNOSEYEVERGESSEN_DI = TRUE;
				b_logentry(TOPIC_HALLENVONIRDORATH,"������� ����� ��� ��������� ���. �� ���� ������� �������, �� �������� ���� ������� � ������������� ����� �� �������, ����� ������� ���-��� � ����. ��� ����� �������, �� � ������ �� ��� ����� �������.");
			};
			Wld_InsertItem(itmi_flask,"FP_ITEM_SHIP_06");
			if(!Npc_HasItems(hero,itat_icedragonheart) && !Npc_HasItems(hero,itat_rockdragonheart) && !Npc_HasItems(hero,itat_firedragonheart) && !Npc_HasItems(hero,itat_swampdragonheart))
			{
				CreateInvItems(orkelite_antipaladinorkoberst_di,itat_rockdragonheart,1);
			};
		};
		Log_CreateTopic(TOPIC_MYCREW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_MYCREW,LOG_RUNNING);
		if(JORGENISCAPTAIN == TRUE)
		{
			Log_AddEntry(TOPIC_MYCREW,"������, ��� �������, ����� ����� �� ������� ����� �����������.");
		};
		if(TORLOFISCAPTAIN == TRUE)
		{
			Log_AddEntry(TOPIC_MYCREW,"������, ��� �������, ����� ����� �� ������� � ��������� ��� �� ����� ����� ����������. �� ����� ����� ������ ��� �������� ��� ���� � ��������.");
		};
		if(JACKISCAPTAIN == TRUE)
		{
			Log_AddEntry(TOPIC_MYCREW,"����, ��� �������, ����� ����� �� ������� ����� �����������. ������, �� ������� �������. �������, �� ������� ���� � ����. �� ����� ���.");
		};
		if(LEE_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"�� ����� ����������� �������� � ��� ����������. �� ����� ����� ������ ��� ��������� ����� ������� ��������� � ���������� �������.");
		};
		if(MILTENNW_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"������ ����� ������ ��� �������� ��� ����.");
			if(hero.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MYCREW,"����� ����� ������ ����� ������� ���� ��������� ����.");
			};
		};
		if(LESTER_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"� ���� ����� �����������, ��� ��������� ������� ������ ���������� �� ���� �������� �������.");
		};
		if(MARIO_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"����� ����� ���� ������� �������. �� ������ ����� �� ����� � ��� ����� �� ���� ����� �� ������ �� �����.");
		};
		if(WOLF_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"����� ����� ������� ���� �������� �� �������� � ����.");
		};
		if(VATRAS_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"������ �������� � ����� �����. �� ����� ������ ���� � ����� ��������� �������� ������������� �����.");
			if(hero.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MYCREW,"������ ����� ����� �������� ��� ���������� ����.");
			};
		};
		if(BENNET_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"������ ������ ���� ���������� ����, ���� � ������.");
		};
		if(DIEGO_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"����� ������� ���, ���� � �� ����, ��� ������, ����� � ���� ���� �������� ��� ����. �� ����� ������� ���� ������������ ��������� � ����� �������� �� ���� � ��������.");
		};
		if(GORN_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"���� �� ���� �� ������ �� ����� ������ �����������. �� ����� ������������� �� ��������. � �����, ������� ����� � �������� �����. ����� ���� ����� ������ ��� ��������� ����� ������� ��������� �������.");
		};
		if(LARES_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"����� ������ ������� ���� �������� � ��������� ���������� �������. ����� ����� �� ����� �������� ��� ��������.");
		};
		if(BIFF_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"���� ������� ����� �� �����, ��� ��������. ��� ������ ��������������.");
		};
		if(ANGAR_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"����� ����� ���������. ��� �������, ��� ��� �������, � �� ������� ����-������ ��������� ��� �������.");
		};
		if(GIRION_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"������ ����������. ��� ����������� ��������. � �� ������������ ���������� ���. ��� ����� ����������� ���.");
		};
		IntroduceChapter(KAPWECHSEL_6,KAPWECHSEL_6_TEXT,"chapter6.tga","chapter_01.wav",6000);
		ENTERDI_KAPITEL6 = TRUE;
	};
};

