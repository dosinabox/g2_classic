
instance ITSE_XARDASNOTFALLBEUTEL_MIS(C_ITEM)
{
	name = NAME_BAG;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_Bag.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = use_xardasnotfallbeutel;
	description = name;
	text[0] = "Очень странный мешок.";
	text[1] = "Похоже, что в нем находятся";
	text[2] = "твердый предмет и документ.";
};


func void use_xardasnotfallbeutel()
{
	var string concattext;
	CreateInvItems(hero,itwr_xardasermahnungfueridioten_mis,1);
	CreateInvItems(hero,itmi_innoseye_discharged_mis,1);
	concattext = ConcatStrings("2",PRINT_ITEMSERHALTEN);
	concatText = ConcatStrings(concatText," (Письмо и Глаз Инноса)");
	Print(concattext);
};


instance ITWR_XARDASERMAHNUNGFUERIDIOTEN_MIS(C_ITEM)
{
	name = "Письмо с предупреждениями Ксардаса";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_xardasermahnungfueridioten;
	scemename = "MAP";
	description = name;
};


func void use_xardasermahnungfueridioten()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Мой юный протеже, ты очень разочаровал меня. Как ты мог отплыть на корабле и не взять Глаз Инноса?");
	Doc_PrintLines(ndocid,0,"Мне остается только надеяться, что твоей халатности есть пределы. В противном случае, тебе никогда не удастся избавить мир от Зла и мне придется лично казнить тебя за твою тупость.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                      Ксардас");
	Doc_Show(ndocid);
};


instance ITWR_KRYPTA_GARON(C_ITEM)
{
	name = "Старое письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_krypta_garon;
	scemename = "MAP";
	description = name;
	text[3] = "написанное трясущейся рукой.";
};


func void use_krypta_garon()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Все пошло прахом. Я тщетно пытался удержать Инубиса на пути добра.");
	Doc_PrintLines(ndocid,0,"Сначала, мне показалось, что я уже мертв. Но кое-какая сила все еще осталась в старых костях Ивана.");
	Doc_PrintLines(ndocid,0,"Инубис восстал из мертвых. Изгнанный древним орденом паладинов, теперь он ищет отмщения за свое проклятие.");
	Doc_PrintLines(ndocid,0,"Вместе с ним многие из его последователей. Я не могу понять, как такой предводитель как Инубис мог стать таким злом.");
	Doc_PrintLines(ndocid,0,"Я нашел его могилу в этом склепе. Но я не уверен, удастся ли мне сообщить о своей находке. Поэтому, я пишу эти строки и надеюсь, что кто-нибудь найдет их.");
	Doc_PrintLines(ndocid,0,"Знайте. Грозный враг пытается дотянуться до праведных душ. Инубис будет не последним.");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"Да спасет Иннос ваши души.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                                 Иван");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITKE_ORKKNASTDI_MIS(C_ITEM)
{
	name = "Ключ полковника орков";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_EVT_UNDEAD_01(C_ITEM)
{
	name = "Ключ Архола";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_03;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = name;
};

instance ITKE_EVT_UNDEAD_02(C_ITEM)
{
	name = "Ключ ключника";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_03;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_LASTDOORTOUNDEADDRGDI_MIS(C_ITEM)
{
	name = "Ключ от комнаты черного мага";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_03;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_LASTDOORTOUNDEADDRGDI_MIS(C_ITEM)
{
	name = "Свиток черного мага";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_lastdoortoundeaddrgdi_mis;
	scemename = "MAP";
	description = name;
};


func void use_itwr_lastdoortoundeaddrgdi_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"КАДОШ ");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"ЭМЕМ КАДАР");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Глаз Силы освещает твой путь.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
	b_logentry(TOPIC_HALLENVONIRDORATH,"Свиток черного мага содержит слова КАДОШ ЭМЕМ КАДАР. Это похоже на какую-то магическую формулу, но для чего она используется - и что такое Глаз Силы?");
};


instance ITKE_CHESTMASTERDEMENTOR_MIS(C_ITEM)
{
	name = "Ключ от сундука черного мага";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_03;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_REZEPT_MEGADRINK_MIS(C_ITEM)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_rezeptfuermegatrank;
	scemename = "MAP";
	description = name;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void use_rezeptfuermegatrank()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Я вернул к жизни древнее искусство. Боюсь, правда, Феодарон не оценит мои достижения.");
	Doc_PrintLines(ndocid,0,"Это означает, попросту говоря, что я должен превратить весь его выводок в зелье. Если бы только он не сидел на своих яйцах все время как курица, я бы попытался.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Эмбарла фиргасто:");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"10 драконьих яиц, одна истертая в порошок черная жемчужина и щепотка серы.");
	Doc_PrintLines(ndocid,0,"Эту смесь нужно довести до кипения, постоянно помешивая, и пропустить через дистиллятор.");
	Doc_PrintLines(ndocid,0,"Получившийся эликсир нужно использовать с осторожностью. Он обладает сильными побочными эффектами и может отрицательно повлиять на ману.");
	Doc_Show(ndocid);
	PLAYER_TALENT_ALCHEMY[POTION_MEGADRINK] = TRUE;
};


instance ITWR_DIARY_BLACKNOVICE_MIS(C_ITEM)
{
	name = "Дневник";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_03_04.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	text[0] = "Дневник послушника черного мага.";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = use_diary_blacknovice;
};


func void use_diary_blacknovice()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"BOOK_RED_L.tga",0);
	Doc_SetPage(ndocid,1,"BOOK_RED_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Я жду посвящения вот уже 36 дней. Я начинаю сомневаться, что меня вообще посвятят. Но я сделал все, что они просили. Я прислуживал им как мальчик на побегушках.");
	Doc_PrintLines(ndocid,0,"Ключник приказал мне закрыть решетку. Я еще не сделал этого. Если все и дальше будет идти в том же духе, любой сможет запросто пройти через ворота.");
	Doc_PrintLines(ndocid,0,"Как жаль, что я не помню комбинацию.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Я проник в большой зал уже давным-давно. Я не могу дождаться, когда увижу Мастера. Интересно, позволят ли мне видеть его, когда я стану одним из них.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Вчера я попытал счастья. Но потерпел неудачу в двух камерах с рычагами еще до того, как смог нажать три переключателя в западном крыле в правильном порядке. Этот пес закрыл камеры! Завтра я попытаюсь стащить у него ключ ...");
	Doc_Show(ndocid);
	b_logentry(TOPIC_HALLENVONIRDORATH,"В дневнике черного мага-послушника упоминаются камеры с рычагами, ключник, комбинации переключателей и много чего еще. Я должен запомнить это, никогда не знаешь заранее, что пригодится, а что нет.");
};


instance ITWR_ZUGBRUECKE_MIS(C_ITEM)
{
	name = "Старое письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_zugbruecke;
	scemename = "MAP";
	description = name;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void use_zugbruecke()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"   Последнее предупреждение!");
	Doc_SetMargins(ndocid,-1,50,50,70,50,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Меня не интересует, сможете вы пересечь мост с другой стороны или нет. Если вас интересует мое мнение - вы все заслуживаете гореть в аду.");
	Doc_PrintLines(ndocid,0,"Я собираюсь оставить мост поднятым до тех пор, пока я нахожусь здесь. И если я замечу, что кто-то пытается нажать переключатели при помощи лука и стрелы, я лично вздерну этого идиота на ближайшем дереве!");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                      Архол");
	Doc_Show(ndocid);
};


instance ITMI_POWEREYE(C_ITEM)
{
	name = "Глаз Силы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StoneOfKnowlegde_MIS.3ds";
	material = MAT_METAL;
	description = name;
};

