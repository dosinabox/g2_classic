
var int animals_1_permanent;
var int animals_2_permanent;
var int animals_3_permanent;

func void use_bookstandanimals1_s1()
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
		Doc_PrintLine(ndocid,0,"Охота и трофеи");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"С каждого зверя или животного можно получить трофеи, преумножающие славу и богатство опытного охотника.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Опытный охотник знает все о трофеях жертвы и как получить их.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Изъятие зубов");
		Doc_PrintLines(ndocid,0,"Зубы - оружие многих зверей и животных. Если вы знаете, как изъять их у вашей жертвы, то волков, снепперов, мракорисов, болотных акул и троллей можно считать лучшими целями.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Снятие шкур");
		Doc_PrintLines(ndocid,1,"Талантливые и опытные охотники высоко ценятся, у них всегда много шкур - овец, волков и мракорисов, например.");
		Doc_PrintLines(ndocid,1,"Очень опытные охотники могут также снимать шкуры с болотных акул и луркеров.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Изъятие когтей");
		Doc_PrintLines(ndocid,1,"Это искусство применимо ко всем типам ящеров, снепперам, луркерам и мракорисам.");
		Doc_Show(ndocid);
		if(ANIMALS_1_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			ANIMALS_1_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandanimals2_s1()
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
		Doc_PrintLine(ndocid,0,"Охота и трофеи");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"С каждого зверя или животного можно получить трофеи, преумножающие славу и богатство опытного охотника.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Кровавые мухи");
		Doc_PrintLines(ndocid,0,"Чтобы выпотрошить этих летающих дьяволов, необходимо обладать двумя навыками.");
		Doc_PrintLines(ndocid,0,"У них можно вырезать крылья и жала.");
		Doc_PrintLines(ndocid,0,"Оба этих навыка используются опытными охотниками для добывания трофеев.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Полевые хищники и краулеры атакуют при помощи мандибул. Мандибулы краулеров");
		Doc_PrintLines(ndocid,1,"особенно ценятся, так как они содержат железы, повышающие магическую силу.");
		Doc_PrintLines(ndocid,1,"Однако, их следует использовать аккуратно, так как человеческий организм постепенно становится невосприимчив к ним.");
		Doc_PrintLines(ndocid,1,"Панцири краулеров также весьма популярны. Из них можно изготавливать доспехи.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
		if(ANIMALS_2_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			ANIMALS_2_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandanimals3_s1()
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
		Doc_PrintLine(ndocid,0,"Охота и трофеи");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"С каждого зверя или животного можно получить трофеи, преумножающие славу и богатство опытного охотника.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Огненный ящер");
		Doc_PrintLines(ndocid,0,"Этот зверь - ящер, изрыгающий огонь, который может убить любого в пределах нескольких шагов от этой твари.");
		Doc_PrintLines(ndocid,0,"Только те, кто обладает защитой от огня, могут охотиться на этих созданий и добывать их ценные языки.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Мракорис");
		Doc_PrintLines(ndocid,1,"Мракорис - это древний зверь, предпочитающий уединение и живущий под покровом леса.");
		Doc_PrintLines(ndocid,1,"Этих созданий осталось очень мало, и поэтому они не представляют особой опасности для людей, если только те не забредут на территорию их охоты.");
		Doc_PrintLines(ndocid,1,"Рог мракориса считается ценным охотничьим трофеем. Но чтобы заполучить его, охотник");
		Doc_PrintLines(ndocid,1,"должен уметь правильно вырезать рог.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_Show(ndocid);
		if(ANIMALS_3_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			ANIMALS_3_PERMANENT = TRUE;
		};
	};
};

