
var int history_1_permanent;
var int history_2_permanent;
var int history_3_permanent;

func void use_bookstandhistory1_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_RED_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_RED_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Путь воина");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Лучшая защита - это хорошее нападение, по крайней мере, когда дело касается зверей. Бесполезно парировать атаки зверей или монстров.");
		Doc_PrintLines(ndocid,0,"Лучше всего держать врага на расстоянии при помощи точных, выверенных ударов, а затем нанести неожиданную комбинационную атаку.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Конечно, только опытные бойцы могут пользоваться комбинациями. Если вы станете мастером боя, вы даже сможете использовать несколько комбинаций.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"");
		Doc_Show(ndocid);
		if(HISTORY_1_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			HISTORY_1_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandhistory2_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_RED_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_RED_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Остров");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Портовый город Хоринис находится на острове у побережья королевства Миртана.");
		Doc_PrintLines(ndocid,0,"Этот остров известен, прежде всего, своей Долиной рудников. О ней ходят разные слухи, много лет она была закрыта магическим барьером и служила тюрьмой для всех осужденных королевства.");
		Doc_PrintLines(ndocid,0,"Таким образом, эта долина стала тюремной колонией, где каторжники глубоко под землей добывали магическую руду.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Неподалеку от Хориниса находятся несколько ферм, где крестьяне на плодородной почве выращивают пшеницу и репу, а также разводят овец.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Уже многие поколения самая большая ферма принадлежит лендлорду, который сдает в аренду прилежащие земли другим фермерам.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"В центре острова находится древний монастырь Инноса, возглавляемый магами огня. Они проводят там исследования в области мании и алхимии, а также делают неплохое вино.");
		Doc_Show(ndocid);
		if(HISTORY_2_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			HISTORY_2_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandhistory3_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_RED_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_RED_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Закон на острове");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Когда люди живут вместе, приходится искать способы поддержания мира - будь это монастырь, город или ферма лендлорда.");
		Doc_PrintLines(ndocid,0,"Любое преступление против сообщества подлежит наказанию.");
		Doc_PrintLines(ndocid,0,"Сообщество запрещает нападать на других, а также ввязываться в уже идущую схватку.");
		Doc_PrintLines(ndocid,0,"Воровство также подлежит наказанию. Кроме того под защитой закона также находятся священные животные - овцы.");
		Doc_PrintLines(ndocid,0," ");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Если кто-либо ударит другого или убьет его, правосудие обычно вершится на месте. Чтобы избежать подобной судьбы, виновный должен заплатить высокий штраф.");
		Doc_PrintLines(ndocid,1,"Во всех местах большого скопления народа, спокойствие поддерживают судьи. До них доходят сведения обо всех преступлениях, и в их обязанность входит вынесение приговора и восстановление порядка.");
		Doc_PrintLines(ndocid,1,"Тот, кто стал жертвой преступления или был свидетелем такового, обязан сообщить об этом властям.");
		Doc_Show(ndocid);
		if(HISTORY_3_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			HISTORY_3_PERMANENT = TRUE;
		};
	};
};

