
func void use_bookstand_01_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(hero.guild == GIL_NOV)
		{
			KNOWS_FIRE_CONTEST = TRUE;
			Log_CreateTopic(TOPIC_FIRECONTEST,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_FIRECONTEST,LOG_RUNNING);
			b_logentry(TOPIC_FIRECONTEST,"Будучи послушником, я имею право требовать прохождения Испытания Огнем. Каждый из трех магов Высшего Совета должен дать мне задание. Если я пройду эти испытания, я буду принят в Круг Огня.");
		};
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Испытание Огнем");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Хотя послушник может чувствовать себя готовым пройти Испытание Магией, из этого не следует, что он обязательно будет выбран. Если, однако, он принял это решение после зрелого размышления и если он настаивает на своем решении, он наделен правом требовать прохождения этого Испытания, и ни один маг не может отказать ему в этом. Но послушник обязан не только пройти Испытание Магией, но также найти просвещение через огонь.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Это Испытание должно позволять дать оценку мудрости, силе и ловкости послушника. Следовательно, он должен пройти три испытания, каждое из которых дается ему одним из магов Высшего Совета, прежде чем ему будет позволено принять Клятву Огня и присоединиться к Соглашению Огня.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Такова воля Инноса и так тому и быть.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Высший совет");
		Doc_Show(ndocid);
	};
};


var int finaldragonequipment_once;

func void use_finaldragonequipment_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"... Я надеюсь, что этот купол защитит руду от коварства Белиара. Король настолько наивен, что верит, что мы строим этот купол для предотвращения побегов. Что ж, пока эта уловка позволяет нам следовать нашей высшей цели, пусть так и будет. Мне остается только надеяться, что у нас остается достаточно времени, чтобы подготовиться к битве. Как только купол вокруг Долины рудников будет воздвигнут, я соберу все силы, имеющиеся в моем распоряжении, чтобы принять участие в грядущей битве.");
		Doc_PrintLines(ndocid,0,"");
		if(hero.guild == GIL_KDF)
		{
			PLAYERGETSAMULETTOFDEATH = TRUE;
			PLAYER_TALENT_RUNES[SPL_MASTEROFDISASTER] = TRUE;
			b_logentry(TOPIC_TALENTRUNES,"Ингредиенты для руны 'Святой удар': 1 святая вода, свиток не нужен");
			Doc_SetMargins(ndocid,-1,30,20,275,20,1);
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"... Я следовал инструкциям и просто окропил святой водой Инноса чистый рунный камень, лежащий на рунном столе. Рунный камень был уничтожен. Я подозреваю, что это заклинание подвластно только Избранному.");
			Doc_PrintLines(ndocid,1,"Я оставил священную ауру Инноса под защитой монастыря. Настоятель монастыря позаботится о ней до тех пор, пока не объявится Избранный.");
			Doc_PrintLines(ndocid,1,"Слезы Инноса, вероятно, будут играть важную роль в грядущей битве. Но слишком опасно оставлять их у всех на виду. Я лучше спрячу их здесь, в библиотеке.");
			Doc_Show(ndocid);
		}
		else if(hero.guild == GIL_PAL)
		{
			PAL_KNOWSABOUT_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PALTELEPORTSECRET] = TRUE;
			PrintScreen(PRINT_LEARNPALTELEPORTSECRET,-1,-1,FONT_SCREEN,2);
			Log_CreateTopic(TOPIC_TALENTRUNES,LOG_NOTE);
			b_logentry(TOPIC_TALENTRUNES,"Для создания руны необходимы специфические ингредиенты. При помощи этих ингредиентов и чистого рунного камня, можно создать руну на рунном столе.");
			b_logentry(TOPIC_TALENTRUNES,"Ингредиенты для руны 'Секретный телепорт': 1 Слезы Инноса");
			Doc_SetMargins(ndocid,-1,30,20,275,20,1);
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"Чтобы достичь секретного места, необходимо создать руну телепортации. Для этого необходим чистый рунный камень и небольшая бутылочка святой воды. При помощи этой руны можно телепортироваться в комнату.");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"Теперь я вполне уверен, что слезы Инноса - именно то, что паладины древности использовали в давно забытом ритуале 'Освящение Меча'. Это означает, что при помощи этой бутылочки, что я нашел, я смогу придать дополнительную силу освящаемому оружию.");
			Doc_PrintLine(ndocid,1,"");
			Doc_Show(ndocid);
		}
		else
		{
			PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_04] = TRUE;
			PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_04] = TRUE;
			PrintScreen(PRINT_LEARNSMITH,-1,-1,FONT_SCREEN,2);
			Npc_SetTalentSkill(self,NPC_TALENT_SMITH,1);
			Log_CreateTopic(TOPIC_TALENTSMITH,LOG_NOTE);
			b_logentry(TOPIC_TALENTSMITH,"Чтобы выковать оружие, Чтобы выковать оружие, прежде всего мне нужна сырая сталь. Я должен докрасна нагреть ее в огне кузнечного горна, а затем придать форму на наковальне. Особое оружие зачастую требует особых материалов, придающих оружию особые свойства.");
			b_logentry(TOPIC_TALENTSMITH,"Если я добавлю 4 куска руды и 5 частей драконьей крови, я смогу выковать рудный клинок 'УБИЙЦА ДРАКОНОВ'.");
			b_logentry(TOPIC_TALENTSMITH,"Если я добавлю 5 кусков руды и 5 частей драконьей крови, я смогу выковать большой рудный клинок 'УБИЙЦА ДРАКОНОВ'.");
			PLAYERGETSFINALDJGARMOR = TRUE;
			Doc_SetMargins(ndocid,-1,30,20,275,20,1);
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"Оружие повелителя драконов.");
			Doc_PrintLines(ndocid,1,"Чтобы сделать доспехи из чешуи дракона максимально прочными, чешуйки можно покрыть рудой, добытой в долине на острове Каринис.");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"Чтобы изготовить меч, достойный повелителя драконов, этот меч должен быть закален в драконьей крови. 5 пиал крови могут придать стали непревзойденную остроту и прочность.");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"Примечание: 'Каринис' вероятно соответствует нынешнему названию 'Хоринис'.");
			Doc_Show(ndocid);
		};
		if(FINALDRAGONEQUIPMENT_ONCE == FALSE)
		{
			b_giveplayerxp(XP_FINALDRAGONEQUIPMENT);
			FINALDRAGONEQUIPMENT_ONCE = TRUE;
		};
	};
};

