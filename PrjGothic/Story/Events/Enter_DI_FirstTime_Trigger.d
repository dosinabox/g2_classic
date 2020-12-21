
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
				b_logentry(TOPIC_HALLENVONIRDORATH,"Прошлой ночью мне приснился сон. Со мной говорил Ксардас, он попросил меня подойти к алхимическому столу на корабле, чтобы забрать кое-что с него. Это очень странно, но я ничего не пил вчера вечером.");
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
			Log_AddEntry(TOPIC_MYCREW,"Йорген, мой капитан, будет ждать на корабле моего возвращения.");
		};
		if(TORLOFISCAPTAIN == TRUE)
		{
			Log_AddEntry(TOPIC_MYCREW,"Торлоф, мой капитан, будет ждать на корабле и оборонять его во время моего отсутствия. Он также может помочь мне повысить мою силу и ловкость.");
		};
		if(JACKISCAPTAIN == TRUE)
		{
			Log_AddEntry(TOPIC_MYCREW,"Джек, мой капитан, будет ждать на корабле моего возвращения. Похоже, он немного испуган. Надеюсь, он возьмет себя в руки. Он нужен мне.");
		};
		if(LEE_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Ли будет командовать кораблем в мое отсутствие. Он также может помочь мне научиться лучше владеть двуручным и одноручным оружием.");
		};
		if(MILTENNW_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Милтен может помочь мне повысить мою ману.");
			if(hero.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MYCREW,"Кроме этого Милтен может научить меня создавать руны.");
			};
		};
		if(LESTER_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"У меня такое впечатление, что состояние Лестера только ухудшилось на этом странном острове.");
		};
		if(MARIO_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Марио ведет себя немного странно. Он просто сидит на корме и уже давно от него никто не слышал ни слова.");
		};
		if(WOLF_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Вольф может обучить меня стрельбе из арбалета и лука.");
		};
		if(VATRAS_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Ватрас удалился в каюту магов. Он может лечить меня и знает множество рецептов приготовления зелий.");
			if(hero.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MYCREW,"Ватрас также может повысить мой магический круг.");
			};
		};
		if(BENNET_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Беннет обучит меня кузнечному делу, если я захочу.");
		};
		if(DIEGO_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Диего поможет мне, если я не знаю, что делать, также у него есть амуниция для меня. Он может научить меня пользоваться отмычками и метко стрелять из лука и арбалета.");
		};
		if(GORN_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Горн ни разу не прилег за время нашего путешествия. Он будет присматривать за кораблем. Я думаю, корабль будет в надежных руках. Также Горн может помочь мне научиться лучше владеть двуручным оружием.");
		};
		if(LARES_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Ларес обещал научить меня красться и сражаться одноручным оружием. Кроме этого он может повысить мою ловкость.");
		};
		if(BIFF_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Бифф слишком жаден до денег, это огорчает. Его тяжело контролировать.");
		};
		if(ANGAR_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Ангар очень беспокоен. Мне кажется, что еще немного, и он побежит куда-нибудь сражаться без приказа.");
		};
		if(GIRION_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Гирион невозмутим. Его спокойствие поражает. И он превосходный инструктор боя. Это может пригодиться мне.");
		};
		IntroduceChapter(KAPWECHSEL_6,KAPWECHSEL_6_TEXT,"chapter6.tga","chapter_01.wav",6000);
		ENTERDI_KAPITEL6 = TRUE;
	};
};

