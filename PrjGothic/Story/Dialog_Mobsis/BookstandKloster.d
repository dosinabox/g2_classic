
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
		Doc_PrintLine(ndocid,0,"ПЕРВЫЙ КРУГ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Руны 1-го круга и ингредиенты, необходимые для их создания.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Свет");
		Doc_PrintLine(ndocid,0,"Золотая монета");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Огненная стрела");
		Doc_PrintLine(ndocid,0,"Сера");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Малая молния");
		Doc_PrintLine(ndocid,0,"Горный хрусталь");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Скелет гоблина");
		Doc_PrintLine(ndocid,0,"Кость гоблина");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Лечение легких ранений");
		Doc_PrintLine(ndocid,0,"Лечебная трава");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Чтобы создать руну, всегда необходим ОДИН из вышеперечисленных ингредиентов.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Маг должен знать формулу заклинания и должен иметь чистый рунный камень и свиток желаемого заклинания.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Только при выполнении этих условий он может приступить к работе за рунным столом.");
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
		Doc_PrintLine(ndocid,0,"ВТОРОЙ КРУГ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Руны 2-го круга и ингредиенты, необходимые для их создания.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Огненный шар");
		Doc_PrintLine(ndocid,0,"Смола");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ледяная стрела");
		Doc_PrintLine(ndocid,0,"Ледяной кварц");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Вызов волка");
		Doc_PrintLine(ndocid,0,"Шкура волка");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Кулак ветра");
		Doc_PrintLine(ndocid,0,"Уголь");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Сон");
		Doc_PrintLine(ndocid,0,"Болотная трава");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Чтобы создать руну, всегда необходим ОДИН из вышеперечисленных ингредиентов.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Маг должен знать формулу заклинания и должен иметь чистый рунный камень и свиток желаемого заклинания.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Только при выполнении этих условий он может приступить к работе за рунным столом.");
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
		Doc_PrintLine(ndocid,0,"ТРЕТИЙ КРУГ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Руны 3-го круга и ингредиенты, необходимые для их создания.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Лечение средних ранений");
		Doc_PrintLine(ndocid,0,"Лечебное растение");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Малая огненная буря");
		Doc_PrintLine(ndocid,0,"Смола");
		Doc_PrintLine(ndocid,0,"Сера");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Создание скелета");
		Doc_PrintLine(ndocid,0,"Кость скелета");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Страх");
		Doc_PrintLine(ndocid,0,"Черный жемчуг");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ледяной блок");
		Doc_PrintLine(ndocid,0,"Ледяной кварц");
		Doc_PrintLine(ndocid,0,"Аквамарин");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Шаровая молния");
		Doc_PrintLine(ndocid,0,"Горный хрусталь");
		Doc_PrintLine(ndocid,0,"Сера");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,0,"Огненный шар");
		Doc_PrintLine(ndocid,0,"Смола");
		Doc_PrintLine(ndocid,0,"Сера");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,1,"Чтобы создать руну, всегда необходим ОДИН из вышеперечисленных ингредиентов.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Маг должен знать формулу заклинания и должен иметь чистый рунный камень и свиток желаемого заклинания.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Только при выполнении этих условий он может приступить к работе за рунным столом.");
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
		Doc_PrintLine(ndocid,0,"ЧЕТВЕРТЫЙ КРУГ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Руны 4-го круга и ингредиенты, необходимые для их создания.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Большой огненный шар");
		Doc_PrintLine(ndocid,0,"Сера");
		Doc_PrintLine(ndocid,0,"Смола");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Молния");
		Doc_PrintLine(ndocid,0,"Горный хрусталь");
		Doc_PrintLine(ndocid,0,"Ледяной кварц");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Пробуждение голема");
		Doc_PrintLine(ndocid,0,"Сердце каменного голема");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Уничтожение нежити");
		Doc_PrintLine(ndocid,0,"Святая вода");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Чтобы создать руну, всегда необходим ОДИН из вышеперечисленных ингредиентов.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Маг должен знать формулу заклинания и должен иметь чистый рунный камень и свиток желаемого заклинания.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Только при выполнении этих условий он может приступить к работе за рунным столом.");
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
		Doc_PrintLine(ndocid,0,"ПЯТЫЙ КРУГ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Руны 5-го круга и ингредиенты, необходимые для их создания.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ледяная волна");
		Doc_PrintLine(ndocid,0,"Ледяной кварц");
		Doc_PrintLine(ndocid,0,"Аквамарин");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Большая огненная буря");
		Doc_PrintLine(ndocid,0,"Сера");
		Doc_PrintLine(ndocid,0,"Огненный язык");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Вызов демона");
		Doc_PrintLine(ndocid,0,"Сердце демона");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Лечение тяжелых ранений");
		Doc_PrintLine(ndocid,0,"Лечебный корень");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Чтобы создать руну, всегда необходим ОДИН из вышеперечисленных ингредиентов.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Маг должен знать формулу заклинания и должен иметь чистый рунный камень и свиток желаемого заклинания.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Только при выполнении этих условий он может приступить к работе за рунным столом.");
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
		Doc_PrintLine(ndocid,0,"ШЕСТОЙ КРУГ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Руны 6-го круга и ингредиенты, необходимые для их создания.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Огненный дождь");
		Doc_PrintLine(ndocid,0,"Смола");
		Doc_PrintLine(ndocid,0,"Сера");
		Doc_PrintLine(ndocid,0,"Огненный язык");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Дыхание смерти");
		Doc_PrintLine(ndocid,0,"Уголь");
		Doc_PrintLine(ndocid,0,"Черный жемчуг");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Волна смерти");
		Doc_PrintLine(ndocid,0,"Кость скелета");
		Doc_PrintLine(ndocid,0,"Черный жемчуг");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Армия тьмы");
		Doc_PrintLine(ndocid,0,"Кость скелета");
		Doc_PrintLine(ndocid,0,"Черный жемчуг");
		Doc_PrintLine(ndocid,0,"Сердце каменного голема");
		Doc_PrintLine(ndocid,0,"Сердце демона");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Уменьшение монстра");
		Doc_PrintLine(ndocid,1,"Кость гоблина");
		Doc_PrintLine(ndocid,1,"Клык тролля");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Чтобы создать руну, всегда необходим ОДИН из вышеперечисленных ингредиентов.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Маг должен знать формулу заклинания и должен иметь чистый рунный камень и свиток желаемого заклинания.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Только при выполнении этих условий он может приступить к работе за рунным столом.");
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

