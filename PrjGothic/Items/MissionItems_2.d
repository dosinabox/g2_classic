
instance ITMI_STONEOFKNOWLEGDE_MIS(C_ITEM)
{
	name = "Камень знаний";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_StoneOfKnowlegde_MIS.3DS";
	material = MAT_STONE;
	description = name;
};

instance ITWR_PALADINLETTER_MIS(C_ITEM)
{
	name = "Письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usepaladinletter;
	scemename = "MAP";
	description = "Письмо лорду Хагену";
};


func void usepaladinletter()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Лорд Хаген!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Экспедиция в Долину рудников завершилась провалом. Мы понесли огромные потери. Те, кому удалось выжить, заперты в замке, окруженном орками.");
	Doc_PrintLines(ndocid,0,"Мы неоднократно подвергались нападению драконов. Они опустошили земли вокруг замка. Надеюсь, с помощью Инноса мы сможем продержаться до прибытия подкрепления. Сами прорвать кольцо мы не сможем.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Да поможет нам Иннос.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Гаронд");
	Doc_Show(ndocid);
};


instance ITWR_LETTERFORGORN_MIS(C_ITEM)
{
	name = "Письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = useletterforgorn;
	scemename = "MAP";
	description = "Сообщение Милтена Горну";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void useletterforgorn()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"Горн!");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLines(ndocid,0,"Гаронд согласился освободить тебя - за 1000 золотых.");
	Doc_PrintLines(ndocid,0,"Так что если у тебя есть где-то припрятанное золотишко, самое время сказать об этом.");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"Милтен ");
	Doc_Show(ndocid);
};


instance ITKE_PRISONKEY_MIS(C_ITEM)
{
	name = "Ключ от темницы";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Это ключ от темницы";
	text[3] = "в замке.";
};

instance ITKE_OC_STORE(C_ITEM)
{
	name = "Ключ от кладовой";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Это ключ от кладовой";
	text[3] = "в замке.";
};

instance ITKE_ERZBARONFLUR(C_ITEM)
{
	name = "Ключ от двери";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "От первой двери.";
	text[3] = "На нем выгравировано имя Гомез";
};

instance ITKE_ERZBARONRAUM(C_ITEM)
{
	name = "Ключ от двери";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "От второй двери.";
	text[3] = "На нем выгравировано имя Гомез";
};

instance ITMI_GORNSTREASURE_MIS(C_ITEM)
{
	name = "Кожаный кошелек";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 250;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = usegornstreasure;
	description = "Кожаный кошелек Горна.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void usegornstreasure()
{
	CreateInvItems(self,itmi_gold,250);
	Print(PRINT_GOLDERHALTEN);
	GORNS_BEUTEL = TRUE;
	Snd_Play("Geldbeutel");
};


instance ITWR_SILVESTRO_MIS(C_ITEM)
{
	name = "Записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = useitwr_silvestro;
	scemename = "MAP";
	description = "Записка Сильвестро";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void useitwr_silvestro()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"От королевского паладина Сильвестро");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Нас ждет еще один день раскопок. Сегодня мы собираемся пробиться через стену и углубиться дальше в скалу.");
	Doc_PrintLines(ndocid,0,"У меня нехорошие предчувствия, поэтому я намереваюсь спрятать руду.");
	Doc_PrintLines(ndocid,0,"Диего единственный из нас, кто хорошо ориентируется здесь. Я вынужден доверять ему. Он перенесет сундуки в безопасное место - но я не позволю ему пойти одному.");
	Doc_PrintLines(ndocid,0,"Эту руду нужно сохранить во что бы то ни стало, поэтому я отправляю с Диего двух рыцарей.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Да здравствует король.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Сильвестро");
	Doc_Show(ndocid);
};


instance ITAT_CLAWLEADER(C_ITEM)
{
	name = "Когти снеппера";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ItAt_Claw.3DS";
	material = MAT_LEATHER;
	description = "Когти вожака стаи";
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSE_OLAV(C_ITEM)
{
	name = "Кожаный кошелек";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 25;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = useolav;
	description = "Кошелек Олава";
	text[0] = "";
	text[1] = "";
	text[2] = "Внутри позванивает несколько монет.";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useolav()
{
	CreateInvItems(hero,itmi_gold,25);
	Print(PRINT_FOUNDGOLD25);
	Snd_Play("Geldbeutel");
};


instance ITMI_GOLDPLATE_MIS(C_ITEM)
{
	name = "Золотая тарелка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_GOLDPLATE;
	visual = "ItMi_GoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_PASS_MIS(C_ITEM)
{
	name = "Ключ от Прохода";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Маленький ключик";
	text[1] = "Открывает ворота Прохода.";
};

instance ITKE_BROMOR(C_ITEM)
{
	name = "Ключ Бромора";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[1] = "Ключ от комнаты";
	text[2] = "владельца борделя.";
};

instance ITKE_RUNE_MIS(C_ITEM)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[1] = "Сундук, к которому подходит";
	text[2] = "этот ключ, находится под мостом.";
	text[3] = "В нем лежит рунный камень.";
};

instance ITWR_BLOODY_MIS(C_ITEM)
{
	name = "Записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usebloodmis;
	scemename = "MAP";
	description = "Яд кровавых мух";
};


func void usebloodmis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Жало кровавых мух содержит смертельный яд, и ни один человек в здравом уме не возьмет его в руки.");
	Doc_PrintLines(ndocid,0,"Если только он не владеет искусством извлечения жала и его обработки.");
	Doc_PrintLines(ndocid,0,"Жало необходимо аккуратно разрезать острым ножом от кончика до основания.");
	Doc_PrintLines(ndocid,0,"Верхний слой удаляется. Затем разрезается ткань вокруг желез.");
	Doc_PrintLines(ndocid,0,"Выделяющийся при разрезе сок обладает лечебными свойствами.");
	Doc_PrintLines(ndocid,0,"Однако, со временем человеческий становится невосприимчивым к этому лечебному зелью.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Дамарок");
	Doc_Show(ndocid);
	if(KNOWS_BLOODFLY == FALSE)
	{
		KNOWS_BLOODFLY = TRUE;
		Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
		b_logentry(TOPIC_BONUS,"Теперь я знаю, что необходимо сделать, чтобы добыть целебный сок из жала кровавой мухи.");
		b_giveplayerxp(XP_AMBIENT);
	};
};


instance ITWR_PFANDBRIEF_MIS(C_ITEM)
{
	name = "Закладная";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usepfandbrief;
	scemename = "MAP";
	description = name;
};


func void usepfandbrief()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"В качестве гарантии погашения долга");
	Doc_PrintLine(ndocid,0,"принимается залог, стоимость которого");
	Doc_PrintLine(ndocid,0,"равна сумме долга.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Залог: Орнаментированный золотой кубок");
	Doc_PrintLines(ndocid,0,"из коллекции кровавых кубков");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"подпись");
	Doc_PrintLine(ndocid,0,"Лютеро, торговец");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"Лемар, ростовщик");
	Doc_Show(ndocid);
};


instance ITWR_MAP_OLDWORLD_OREMINES_MIS(C_ITEM)
{
	name = "Карта рудников Гаронда";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 50;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_oldworld_oremines;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_map_oldworld_oremines()
{
	var int document;
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_OldWorld_Oremines.tga",TRUE);
	Doc_SetLevel(document,"OldWorld\OldWorld.zen");
	Doc_SetLevelCoords(document,-78500,47500,54000,-53000);
	Doc_Show(document);
};


instance ITWR_MANOWAR(C_ITEM)
{
	name = "Текст";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usemanowar;
	scemename = "MAP";
	description = "Текст песни.";
};


func void usemanowar()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Клич Доминика");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Мы заслужим Его уважение.");
	Doc_PrintLines(ndocid,0,"Иннос всегда со мной и моими братьями.");
	Doc_PrintLines(ndocid,0,"Я убью любого, кто попытается остановить меня");
	Doc_PrintLines(ndocid,0,"в моем сердце горит Его огонь.");
	Doc_PrintLines(ndocid,0,"Мой меч служит только Ему.");
	Doc_PrintLines(ndocid,0,"Его имя всегда у меня на устах.");
	Doc_PrintLines(ndocid,0,"Любой, кто противостоит мне,");
	Doc_PrintLines(ndocid,0,"падет от рук моих,");
	Doc_PrintLines(ndocid,0,"ведь я воин Инноса.");
	Doc_Show(ndocid);
};


instance ITWR_KDWLETTER(C_ITEM)
{
	name = "Сообщение";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usekdwletter;
	scemename = "MAP";
	description = "Сообщение.";
};


func void usekdwletter()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Мы покинули лагерь. Теперь, когда Барьер пал, мы отправимся на поиски центра разрушения. Возможно, там мы найдем ответы на вопросы, которые мы задавали столько долгих лет. Одному Аданосу ведомо, куда приведет нас наш путь.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Да пребудет с нами Аданос.");
	Doc_PrintLine(ndocid,0,"Сатурас");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_GILBERTLETTER(C_ITEM)
{
	name = "Записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usegilbertletter;
	scemename = "MAP";
	description = "Сообщение.";
};


func void usegilbertletter()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"С меня хватит. Я устал прятаться здесь. И если слухи верны - Барьер, наконец, пал.");
	Doc_PrintLines(ndocid,0,"Вряд ли кто-то будет искать меня сейчас. Меня уже достала эта пещера и вся эта чертова долина. Пришло время возвращаться домой.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Гильберт");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};

