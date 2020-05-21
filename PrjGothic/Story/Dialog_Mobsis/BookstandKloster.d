
func void use_bookstand_rune_01_s1()
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
		Doc_PrintLine(ndocid,0,"Страница 1");
		Doc_PrintLine(ndocid,0,"Рунные камни");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Страница 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_rune_02_s1()
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
		Doc_PrintLine(ndocid,0,"Страница 1");
		Doc_PrintLine(ndocid,0,"Руны и ингредиенты");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Страница 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_innos_01_s1()
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
		Doc_PrintLine(ndocid,0,"Страница 1");
		Doc_PrintLine(ndocid,0,"Учение Инноса");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Страница 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_innos_02_s1()
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
		Doc_PrintLine(ndocid,0,"Страница 1");
		Doc_PrintLine(ndocid,0,"Заповеди Инноса");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Страница 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_01_s1()
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
		Doc_PrintLine(ndocid,0,"ПЕРВЫЙ КРУГ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Руны первого круга и ингредиенты для их создания.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Свет:");
		Doc_PrintLine(ndocid,0,"- золотая монета");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Огненная стрела:");
		Doc_PrintLine(ndocid,0,"- сера");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Малая молния:");
		Doc_PrintLine(ndocid,0,"- горный хрусталь");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Вызов скелета гоблина:");
		Doc_PrintLine(ndocid,0,"- кость гоблина");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Лечение легких ранений:");
		Doc_PrintLine(ndocid,0,"- лечебная трава");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES2);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES3);
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_02_s1()
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
		Doc_PrintLine(ndocid,0,"ВТОРОЙ КРУГ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Руны второго круга и ингредиенты для их создания.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Огненный шар:");
		Doc_PrintLine(ndocid,0,"- смола");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ледяная стрела:");
		Doc_PrintLine(ndocid,0,"- ледяной кварц");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Вызов волка:");
		Doc_PrintLine(ndocid,0,"- шкура волка");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Кулак ветра:");
		Doc_PrintLine(ndocid,0,"- уголь");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Сон:");
		Doc_PrintLine(ndocid,0,"- болотная трава");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES2);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES3);
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_03_s1()
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
		Doc_PrintLine(ndocid,0,"ТРЕТИЙ КРУГ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Руны третьего круга и ингредиенты для их создания.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Лечение средних ранений:");
		Doc_PrintLine(ndocid,0,"- лечебное растение");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Малая огненная буря:");
		Doc_PrintLine(ndocid,0,"- смола");
		Doc_PrintLine(ndocid,0,"- сера");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Вызов скелета:");
		Doc_PrintLine(ndocid,0,"- кость скелета");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Страх:");
		Doc_PrintLine(ndocid,0,"- черная жемчужина");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ледяной блок:");
		Doc_PrintLine(ndocid,0,"- ледяной кварц");
		Doc_PrintLine(ndocid,0,"- аквамарин");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Шаровая молния:");
		Doc_PrintLine(ndocid,0,"- горный хрусталь");
		Doc_PrintLine(ndocid,0,"- сера");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES2);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES3);
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_04_s1()
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
		Doc_PrintLine(ndocid,0,"ЧЕТВЕРТЫЙ КРУГ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Руны четвертого круга и ингредиенты для их создания.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Большой огненный шар:");
		Doc_PrintLine(ndocid,0,"- сера");
		Doc_PrintLine(ndocid,0,"- смола");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Молния:");
		Doc_PrintLine(ndocid,0,"- горный хрусталь");
		Doc_PrintLine(ndocid,0,"- ледяной кварц");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Вызов голема:");
		Doc_PrintLine(ndocid,0,"- сердце каменного голема");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Уничтожение нежити:");
		Doc_PrintLine(ndocid,0,"- святая вода");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES2);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES3);
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_05_s1()
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
		Doc_PrintLine(ndocid,0,"ПЯТЫЙ КРУГ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Руны пятого круга и ингредиенты для их создания.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ледяная волна:");
		Doc_PrintLine(ndocid,0,"- ледяной кварц");
		Doc_PrintLine(ndocid,0,"- аквамарин");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Большая огненная буря:");
		Doc_PrintLine(ndocid,0,"- сера");
		Doc_PrintLine(ndocid,0,"- огненный язык");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Вызов демона:");
		Doc_PrintLine(ndocid,0,"- сердце демона");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Лечение тяжелых ранений:");
		Doc_PrintLine(ndocid,0,"- лечебный корень");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES2);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES3);
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_06_s1()
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
		Doc_PrintLine(ndocid,0,"ШЕСТОЙ КРУГ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Руны шестого круга и ингредиенты для их создания.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Огненный дождь:");
		Doc_PrintLine(ndocid,0,"- смола");
		Doc_PrintLine(ndocid,0,"- сера");
		Doc_PrintLine(ndocid,0,"- огненный язык");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Дыхание смерти:");
		Doc_PrintLine(ndocid,0,"- уголь");
		Doc_PrintLine(ndocid,0,"- черная жемчужина");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Волна смерти:");
		Doc_PrintLine(ndocid,0,"- кость скелета");
		Doc_PrintLine(ndocid,0,"- черная жемчужина");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Армия тьмы:");
		Doc_PrintLine(ndocid,0,"- кость скелета");
		Doc_PrintLine(ndocid,0,"- черная жемчужина");
		Doc_PrintLine(ndocid,0,"- сердце каменного голема");
		Doc_PrintLine(ndocid,0,"- сердце демона");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Уменьшение монстра:");
		Doc_PrintLine(ndocid,1,"- кость гоблина");
		Doc_PrintLine(ndocid,1,"- клык тролля");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES2);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES3);
		Doc_Show(ndocid);
	};
};

func void use_bookstand_rules_01_s1()
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
		Doc_PrintLine(ndocid,0,"Страница 1");
		Doc_PrintLine(ndocid,0,"Правила");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Страница 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

