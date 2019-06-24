
var int alchemy_1_permanent;
var int alchemy_2_permanent;
var int alchemy_3_permanent;

func void use_bookstandalchemy1_s1()
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
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Зелья магической силы");
		Doc_PrintLine(ndocid,0,"и ингредиенты");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Эссенция маны");
		Doc_PrintLine(ndocid,0,"2 огненные крапивы");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Экстракт маны");
		Doc_PrintLine(ndocid,0,"2 огненные травы");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Эликсир маны");
		Doc_PrintLine(ndocid,0,"2 огненных корня");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Для работы на алхимическом столе необходима мензурка.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Чтобы сварить любое лечебное зелье или зелье, усиливающее магическую силу, необходим особый ингредиент и растение:");
		Doc_PrintLine(ndocid,1,"Луговой горец");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Чтобы сварить зелье, оказывающее перманентное воздействие на тело или дух, необходимо определенное растение:");
		Doc_PrintLines(ndocid,1,"Царский щавель");
		Doc_Show(ndocid);
		if(ALCHEMY_1_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			ALCHEMY_1_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandalchemy2_s1()
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
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Лечебные зелья");
		Doc_PrintLine(ndocid,0,"и ингредиенты");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Лечебная эссенция");
		Doc_PrintLine(ndocid,0,"2 лечебные травы");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Лечебный экстракт");
		Doc_PrintLine(ndocid,0,"2 лечебных растения");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Лечебный эликсир");
		Doc_PrintLine(ndocid,0,"2 лечебных корня");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Для работы на алхимическом столе необходима мензурка.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Чтобы сварить любое лечебное зелье или зелье, усиливающее магическую силу, необходим особый ингредиент и растение:");
		Doc_PrintLine(ndocid,1,"Луговой горец");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Чтобы сварить зелье, имеющее перманентное действие на тело или дух, необходимо определенное растение:");
		Doc_PrintLines(ndocid,1,"Царский щавель");
		Doc_Show(ndocid);
		if(ALCHEMY_2_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			ALCHEMY_2_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandalchemy3_s1()
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
		Doc_PrintLines(ndocid,0,"Зелья, дающие перманентные изменения");
		Doc_PrintLine(ndocid,0,"и ингредиенты");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Эликсир ловкости");
		Doc_PrintLine(ndocid,0,"1 гоблинская ягода");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Зелье скорости");
		Doc_PrintLines(ndocid,0,"1 снеппер-трава - для этого зелья необходим не царский щавель, а луговой горец.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Эликсир силы");
		Doc_PrintLine(ndocid,0,"1 драконий корень");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Эликсир жизни");
		Doc_PrintLine(ndocid,0,"1 лечебный корень");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Эликсир духа");
		Doc_PrintLine(ndocid,0,"1 огненный корень");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Применение этих рецептов - высшее алхимическое искусство. Они требуют большого опыта. В общем, можно сказать, что только у того, кто знает, как обращаться с лечебным или огненным корнем может быть достаточно опыта, чтобы попробовать сварить эти зелья. Все они требуют царского щавеля.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Зелье скорости варить значительно легче, частично потому, что для него не требуется царского щавеля. Базовые познания в алхимии позволят вам воспроизвести этот рецепт.");
		Doc_PrintLine(ndocid,1,"");
		Doc_Show(ndocid);
		if(ALCHEMY_3_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			ALCHEMY_3_PERMANENT = TRUE;
		};
	};
};

