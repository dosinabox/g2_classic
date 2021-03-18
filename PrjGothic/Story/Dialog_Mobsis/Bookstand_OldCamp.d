
func void bookstand_milten_03_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Поздно.");
		Doc_PrintLines(ndocid,0,"Обрушение этой старой шахты вызвало сильное недовольство рудных баронов.");
		Doc_PrintLines(ndocid,0,"Гомеш похож на пороховую бочку, которая вот-вот взорвется.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Корристо");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Он думает, что в обрушении шахты виноват этот новый парень. Да, конечно, мне он тоже кажется странным. И лучше ему больше здесь не показываться.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Корристо");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Гомеш готов со злости разнести все вокруг, и мне кажется, я знаю, что он планирует. Мы должны предупредить Магов Воды, пока еще не слишком поздно.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Корристо");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Возможно, нам удастся избежать катастрофы. Невыносимо думать о том, что произойдет, если шахта ...");
		Doc_Show(ndocid);
	};
};

func void bookstand_milten_02_s1()
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
		Doc_PrintLines(ndocid,0,"Я позволил себе устроиться здесь немного комфортнее. Кто бы мог подумать, что однажды я останусь единственным магом в лагере?");
		Doc_PrintLines(ndocid,0,"Ну, не могу сказать, что я рад возвращению. На самом деле, мне очень хочется убраться отсюда.");
		Doc_PrintLines(ndocid,0,"Этой экспедиции не суждено увенчаться успехом.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Старатели ушли вчера. Они взяли с собой Диего - не удивлюсь, если он сбежит.");
		Doc_PrintLines(ndocid,1,"Не думаю, что ему понравится махать киркой.");
		Doc_PrintLines(ndocid,1,"Ну, а я использую свободное время для более углубленного изучения алхимии.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Милтен");
		Doc_Show(ndocid);
	};
};

func void bookstand_milten_01_s1()
{
	var C_NPC her;
	var int document;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		document = Doc_CreateMap();
		Doc_SetPages(document,1);
		Doc_SetPage(document,0,"Map_OldWorld.tga",TRUE);
		Doc_SetLevel(document,"OldWorld\OldWorld.zen");
		Doc_SetLevelCoords(document,-78500,47500,54000,-53000);
		Doc_Show(document);
	};
};

func void bookstand_engor_01_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Red_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Red_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Запасы");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Мы нашли кое-что - ничего полезного. Список прилагается:");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"3 ящика старья");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"8 ящиков ржавых железяк");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"4 ящика с разбитыми доспехами");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"5 ящиков (вонючих) кожи и шкур");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"2 ящика с кирками");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"3 ящика с инструментами");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"16 ящиков с камнями (руды там почти нет)");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"1 ящик с ржавыми лезвиями");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"4 ящика с разбитой посудой");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"56 бочек с водой");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"1 ящик с чем-то липким (что бы там ни было, оно сгнило)");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Энгор");
		Doc_Show(ndocid);
	};
};

